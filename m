Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4679C30658
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 09:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F8A94078C;
	Fri,  5 Jul 2024 09:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKq1XvBoW8DP; Fri,  5 Jul 2024 09:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 101D8408FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 101D8408FA;
	Fri,  5 Jul 2024 09:45:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14B781BF2A1
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01FA9810BE
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Kk-SjLOgxXs for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 09:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE5A280FB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE5A280FB7
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE5A280FB7
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 09:45:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.231]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacSe-1rrze21Xnm-00ma5C; Fri, 05
 Jul 2024 11:45:08 +0200
To: buildroot@buildroot.org
Date: Fri,  5 Jul 2024 11:44:48 +0200
Message-ID: <20240705094449.8550-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705094449.8550-1-fiona.klute@gmx.de>
References: <20240705094449.8550-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:KSEpTKdR04timnpMZsyOT0pC4YD8pwboWJUyvkTCsDGJtAMeDCR
 7cec4zBCpNHRt8KF+DGJL4ZZxvl/tzSI3BDdch5KBzf8yEDRUiB/USBLmwc2uluw6wXtUtM
 ATRvH/CXrM+gKnVHbO3OYB70Ut/iA5uXIqNgReSdzcxfvRByTatc1ltoIQXTTJoeANWOWJG
 1yV7jYGyJAHHTB0A1LRdA==
UI-OutboundReport: notjunk:1;M01:P0:IpqwJAc7ojU=;t+PbmD5DhuoX6uheY38WuoCwiuT
 DOL4Hf6iE30jQKaUrBszAMoGjrfuO9fD9kkE/dTxLab7FQpaSXrF3WjYin3WULphVDRKf7UIi
 c017pX8icSknRl5YticsPiDI3QQWVqq51GN+K0QerfhvtOJLiqrKCYvzAiwbs/SOi/yj/wQZH
 Zu6IukTwU68Ye5OZcsWWa6KeZvMQFJUfAPDPSSB1YkJbt3OhIUh6MIHMhYKahre/dxtEG8Cmr
 5BahPgxM3GksLRCRjWd89ga9+NrGuKSNaQlCw+f3Lsp1kCJ/ZQosdPS8CIoroUyawsj43CLgx
 j1Bt61CD1C49OOqElOJLzz9ClQXRKrrZOFPM46iFgI0zAkBaS/WPLTsoRV39nXRPXXJdBuGG2
 Oe7IF3NYzmE6vPpxbFhWLbKgGZX47ENWABu5bscvdmR+MrHuoh08s8sDLa28m7vOow7i0jU4W
 f+FAg5NvDWfZUq1QSvOoW95b6098kdwtuPnDIRZl6TX+x2+eKuOyTer5H+oWBzicgvcDwJ4F9
 ryk3Z6i260j3MCA5MhVjmnzWetu6w45aqsWkAetGHsSkKrRpdTDgi3+IQMMNiFV00D9sgBvsq
 7I1wZgEKq0e2kL5C20kZdRb+89DKgI2zIw18GEze4UWAaycpZrwIasIlibTqHZGU9R+RdXVSj
 pE7e6KPkxZ7cgUyucvuomCJ5jXd9dAYkoLUW2wAgFfhAftFQY+7WvsPRq4m81T4HqUZLXlCLk
 /D0Xsno7ktTHaiMugV2JuHEL+wOtAC4jn1tZ5lHDefzZ9pllKSmS32YcZ979EEGQtB5Bn57kq
 5EouYLfmG2LpnHPxv9RTaDdm/xRCvz4gavMfBSFmb0AKo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720172708; x=1720777508; i=fiona.klute@gmx.de;
 bh=hVMdfYdk7phcEGM69OLesfezEJabc3IJEaBFBqeDq58=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=keW9bY2zgsw7mxEvZsSUCP/O5BUB1J2ILg06lZu4dty4awD0QVORN8CfCuOSshXO
 434kz+7A1W0rvug/lI1QEWHVV5FGc98RdUY2AI+gJr9VRz4e9HT7W2GpwzsDpXoEc
 ODFZFPeytk70rUTo/MoG6pnn7iwTE9LcXmU3Ltlwxd4Cer7u6bVitrGO1JR7xdM34
 OfIvND8ntx4Q7ZtffiQwKP+4w0gN9afzfkOICJfc8c47dHNC/B9KL+jtT9iQ86SIy
 lMVtFq3nbfUslY+LmVZTx+xH9eQmPRB3O3qPcPkMS2dPF4Jy3dZevmzcQi2wlFAqp
 /6dm25CZRBfqdeFaeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=keW9bY2z
Subject: [Buildroot] [PATCH 1/2] docs/manual: describe relying on default
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
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
 docs/manual/integration-principles.adoc | 18 ++++++++++++++++++
 docs/manual/integration.adoc            |  2 ++
 2 files changed, 20 insertions(+)
 create mode 100644 docs/manual/integration-principles.adoc

diff --git a/docs/manual/integration-principles.adoc b/docs/manual/integration-principles.adoc
new file mode 100644
index 0000000000..9e2f43a18a
--- /dev/null
+++ b/docs/manual/integration-principles.adoc
@@ -0,0 +1,18 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[integration-principles]]
+=== Integration Principles
+
+Some foundational packages like Busybox can be configured with or
+without certain features. When writing Buildroot code that uses such
+packages, contributors may assume that the options enabled in the
+Buildroot-provided configurations are enabled. For example,
++package/busybox/busybox.config+ sets
++CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y+, so init scripts
+meant for use with Busybox init may use +start-stop-daemon+ with long
+form options.
+
+People who use custom configurations that disable such default options
+are responsible for making sure that all relevant scripts still work,
+and if not, adapting them accordingly (in an overlay).
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
