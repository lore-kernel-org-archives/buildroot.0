Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CF2C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 09:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 530D3417F6;
	Fri, 12 Jul 2024 09:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXQ_qbz8hZRh; Fri, 12 Jul 2024 09:47:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D9DE417F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D9DE417F7;
	Fri, 12 Jul 2024 09:47:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64C411BF5A9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FB74417ED
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBAr5PV_5WaC for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 09:47:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C5F8240B5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5F8240B5B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5F8240B5B
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 09:47:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.126]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzFx-1sk0iA45Q1-00SO0v; Fri, 12
 Jul 2024 11:47:48 +0200
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 11:47:12 +0200
Message-ID: <20240712094717.2539892-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712094717.2539892-1-fiona.klute@gmx.de>
References: <20240712094717.2539892-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:0eZj5TXNk9Blt6YUIlx91wcjuhOzb/DRZRGNBXSZFtEgO/xoJyI
 pp1c9xLlNH+a0CINy6PRjGI7wEZIApbNctJQcMcLthvUFVrp+ZccXejLg1SfHlhHRJ6VAnw
 K2X0TmqPcxWG++1yPYBGk7S51jqhja2Wl4OyrcI5rs8TF5mgS012yFqAsnngPCw8yljLgSC
 f88L+YOaA8o9g1CJVPw+A==
UI-OutboundReport: notjunk:1;M01:P0:ZIa3tJW6ZVo=;D25rOf1BPFnlBRtXiRCXVOXIOOM
 +JR92Mk0bmBz8mVy8Oe4tgpJKkFnMLJr9BMdK1B6pKvN7tcQDFWsvrrlvUiRZwvSOxP0yUs5Z
 HJ0omsWTSby/vDVnJsvKwyTUPBB3oQhphSi5/aIldzwCUEcA54clIrL8rokYCAxfKsrJP/Egg
 7O/1z5LO8rg62rio6pLy0LGnwj4lHc3isMBhYOTSXwTUuGZW6w9UveMF8QT5gE4WUvK1tKWSn
 BXrzXFJIcCt/u8BZfUiQHZRJMS0sT666/6ClBk9Dum3wFJDPXlCiLX2/hitpMh9WY5gVByuzn
 Bl5ylDub08pnSI3uP70n+7b96xjMCBbb2SuJ3oQOC5EQ+I8TYkX6RQDdwHlcVYobVQf7jsNOs
 1sYCXC0kB3R/4Ja1qU5lYMIzpjESqmpNGA+EskttZ/uv5xLxSnIQQ69CE6E8lHbzQNOu5gQ77
 FIO45SLAwJ9rJllKlJgF5tjx1pwFFUwYQhQNEBgDYTjw5aB4y9FB9/8MI4uj/PlBkyg+XTaZn
 B2m7McYOw+a9CiMHvusc1sjSj9VziU6ZCNcSP1fwz9p5IfQeJNwCrf15gqtmKrl1JrpU9kLsM
 jRAj49g6O0e6t13HmYLH4VN3GLjD0jUD/caBGtiSPDXz1ZdyxWip90bmKYNoqKQrUh+GIiX51
 WrcsnAbFrik+am+/iKsnRaIawLCvUwS/rJpfYDbVhWQWXLEtiAnghGVOqtc/SbjAwDvhQK5pq
 HbNLvZ/e/Uk51grA42en7ayB5CVSESkJ9WhW/gTLSD26DcfZjMMocEvKdAJX0YjpXSfcrJvYi
 nrdrnC10lxcGfQM7uHUYU3lg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720777668; x=1721382468; i=fiona.klute@gmx.de;
 bh=Vj2Pc6FHVT9St7te4uTA77+UXKpjdiBERC1tBbb2VrA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=qBN0yBaP3cd8BDtUvrHIn+IfMUMwZ48I9z6BHAbL0tAwBPJJcWDCkjlAFXliKtxk
 /W7oGocyrRbAeA3XybOjwx63VNSKd1REcewaGT/QBOls26jBJJunBgGHkDDoS3Nzv
 OHICSsw37t9BMdRX9E1UGnJFwW9T8raAhcPOSOogTo8eyUuPCnP77weEigfYZJ4gV
 1hAW/CfRu/1aINd6v7ZCmHK2G49v/kIuQWYCj93S3hf++Qcm8+C45980YU3wBDk/2
 dHHGSksOfQaXxg+I2IHtkrknXx0rwPp9PdWGjty6SHb6RQfcEi3/+5bRfrhbY89Ug
 iwjGqWUwNezeGgkbjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=qBN0yBaP
Subject: [Buildroot] [PATCH 1/6] docs/manual: describe relying on default
 options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Bernd Kuhls <bernd@kuhls.net>, "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

People can assume that e.g. Busybox options enabled in the package are
enabled when writing code for Buildroot. Anyone who uses custom
configurations that disable default options needs to make sure
relevant scripts etc. still work for themselves.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 docs/manual/integration-principles.adoc | 20 ++++++++++++++++++++
 docs/manual/integration.adoc            |  2 ++
 2 files changed, 22 insertions(+)
 create mode 100644 docs/manual/integration-principles.adoc

diff --git a/docs/manual/integration-principles.adoc b/docs/manual/integration-principles.adoc
new file mode 100644
index 0000000000..40c049f0d3
--- /dev/null
+++ b/docs/manual/integration-principles.adoc
@@ -0,0 +1,20 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[integration-principles]]
+=== Integration Principles
+
+Some foundational packages like Busybox and uClibc can be configured
+with or without certain features. When writing Buildroot code that
+uses such packages, contributors may assume that the options enabled
+in the Buildroot-provided configurations are enabled. For example,
++package/busybox/busybox.config+ sets
++CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y+, so init scripts
+meant for use with Busybox init may use +start-stop-daemon+ with long
+form options.
+
+People who use custom configurations that disable such default options
+are responsible for making sure that any relevant scripts/packages
+still work, and if not, adapting them accordingly. To follow the
+Busybox example above, disabling long form options will require
+replacing init scripts that use them (in an overlay).
diff --git a/docs/manual/integration.adoc b/docs/manual/integration.adoc
index 1626dd75dd..5f408dca29 100644
--- a/docs/manual/integration.adoc
+++ b/docs/manual/integration.adoc
@@ -9,6 +9,8 @@ level. Buildroot is highly configurable, almost everything discussed
 here can be changed or overridden by xref:rootfs-custom[rootfs overlay
 or custom skeleton] configuration.

+include::integration-principles.adoc[]
+
 include::integration-systemd.adoc[]

 include::integration-selinux-support.adoc[]
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
