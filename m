Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F61C3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 12:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1956C606F8;
	Fri, 12 Jul 2024 12:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JtYNIyUQ26Sz; Fri, 12 Jul 2024 12:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A734D61324
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A734D61324;
	Fri, 12 Jul 2024 12:50:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EB431BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5464741705
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pMfAQBOFu6U for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 12:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CBD4E417CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBD4E417CF
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBD4E417CF
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:50:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsPy-1sb1AQ15fc-000Wp0; Fri, 12
 Jul 2024 14:50:10 +0200
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 14:49:51 +0200
Message-ID: <20240712124956.3925574-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712124956.3925574-1-fiona.klute@gmx.de>
References: <20240712124956.3925574-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:NJRM2oeVLB3cv6rAO42nxIl48YM0q4Kirx4GxNSzuDe3rO/rukp
 IxylaRmFCfeySiB+EbcqlpIQX3aHbwY24gPON+sFI7CibpUJ/6EuVcu2boqViXBvooV5LpR
 p8Y9tL3XT9zgkznH6Bcf7j/ZP1HPm81Bng0/1S6Ji2rsQnSLKxBdfXKCmfKMfX2OYcSjz78
 JkrdR8KFNGaheF0GwYfQw==
UI-OutboundReport: notjunk:1;M01:P0:lyiUMQWbl1U=;9pXui3u00y1wqZmcFVCOqqP8mfZ
 WeJqIlYU7WgCrKzAnQpem7OV+F7skScKJbbegg3ve4+jJ7pHl7bBWnwqvcATe18+6EY4vchTg
 aSWVQ4ncmItogfmMIwKPorgCRxALIu5hq0pgfebMB9kFfNYk8H/EmxBzG3EWwpAjP9+JptREe
 ChXBX3cnAikTbDEgi85mklFcJpkVH74Z61T7Y0wnDGHZ5Fv7mOf4h9qd7s0DIL3Xq+0yJyHvX
 Zr19Ghf9/YGprf0t7nBb47IMuhbOnKuD7qEKH+p1A3fybYEh65T4sVtwtRZc1/sg4kx37YDa7
 cXlMkYdFM9ezqmIrG/cfBjEpZGjhqC4yvofiZCPjAW9kVWzk6mInUxyJ+quFy/yQpBRaU2V+7
 suLriWyVUPltSpthgzauid8hzaWxoCaXAgQzG1vSPMwmDEiExsZ722UU9/okS9E/Z8OQqaCoY
 LhYdYt6m/J6C36didyOXanyxV7/0QHjXDc0U5ahTu5Pk+5UPJRMdSAiFq5pfXWh1mu8SaxP6n
 aqlOPxC0ui+H9hr/ymfRrioWheLf4z6/tdMXkVXV7rFb4SmjyzxDmLpH5EIBEIUl9svpL6xg4
 7/dAzfKpDVnodvdC1ETqeCe4VBlL2v8cue574cagMb9t7GuUdKcNVYzVr5YgTGydbsFgZgw9z
 8VMCm6mf7kwBKDoGF+39q9tobSwcpF3EH9GPjyoVfkzMoHPuFcEkmrNLIgGLg+jJoSjvx7b27
 AoFxlYoXf5WPswxNaLEyJoFf20xTmEE8RbSX9BnkBZAgIQJ6N6pxUPj2/FgU6hu7UVeUyG8lm
 ViPGyNQxkJ9UTiF/wNuwZonQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720788610; x=1721393410; i=fiona.klute@gmx.de;
 bh=Vj2Pc6FHVT9St7te4uTA77+UXKpjdiBERC1tBbb2VrA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=HMlME6EFwFigplaSkYJOtFUVsV10QUWRNjHRQUf76UmJJKxtN4UP9hbFM+4Dzw2u
 i6mdVzd/SaUfwRM7Vy/+w+3VxClHOzfNWei85alHgM/WwAGBorBywlBhzGFwMLxVc
 4yekl0po7of+OGZCh0QQzy6RZFfkvL4m3dqPHSn6bjSoBQBXvln0mrMVdQBCM6o7N
 fmWSTB3mYX6wNTzo45AlSYhnEsnI+2imLn4/MeDvD61J/NhQQ/mJsuZj9BmxopPE5
 TWwJPLQmnJvUXOdq3UPmJ3ZwIqfyJAiRFjADBcI2UXQ7ZdHzkssE1grb65aFNhmmK
 4FF6VcUr9HlY7XzGrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=HMlME6EF
Subject: [Buildroot] [PATCH v2 1/6] docs/manual: describe relying on default
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
