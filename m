Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA27D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C144560DC0;
	Tue, 13 Jan 2026 21:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6UbAXN9VB7a; Tue, 13 Jan 2026 21:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4BAB6104D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338031;
	bh=v7OIN6IvbHS/rgyN8YA0NODhraCniJiBPQ3Kxf1U8CU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XEfUN2KbAKkYs0yrYg3AdfKPLFvJmiPFYz/4vAQEoPjyp23KACVXtfhM2KHnd9o+q
	 IIS4HSdwIj8elgFpQBIsd1vNXAywCfO3rMSfmjVrvPkNGjY7PXJ7vloUwv/20dhCPY
	 JLHYRCtMbHgq8ql3pkJ7fOSyLx/YX7sDHgu6A49/tck+xwkb0WeR21J4PNxtaqxRk5
	 Qgy9CL96tjGkdfL2XmrE4tOYGwHTaHmhGbVtnMRJPMIgeV2XKlmU1wm30ZaQdncWWK
	 nwakg2Ud2hw57Tpq8moflN1aOw14ICIMNAUqiGXWrJkei8bTGLpnlXX7nYeWmWzSoO
	 TXViylXVArjsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4BAB6104D;
	Tue, 13 Jan 2026 21:00:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 59F7A1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 21:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 883C640798
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVOmFqQxe58r for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40E2E407D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40E2E407D2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F33E868C5; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 025a32d63b7927da9c2098d1b3a0f0a3704bbbdb
X-Git-Newrev: e3619e4cfa53f0314ec9c4f734bc29b00f29a916
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.3F33E868C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xditview: bump version
 to 1.0.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e3619e4cfa53f0314ec9c4f734bc29b00f29a916
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-February/003449.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xditview/xapp_xditview.hash | 6 +++---
 package/x11r7/xapp_xditview/xapp_xditview.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xditview/xapp_xditview.hash b/package/x11r7/xapp_xditview/xapp_xditview.hash
index dbaf5e42b7..93ddc10e0f 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.hash
+++ b/package/x11r7/xapp_xditview/xapp_xditview.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003220.html
-sha256  517700df205d4fdf65db182698157c959f1e7c10597670a7f45b1fcb2319819f  xditview-1.0.6.tar.xz
-sha512  249769d27980e9a69ac8f056f329dfa514f3ab6267d6ed69814c5695f315d2a7021c560a0e26fdd2568290a071793d7f2eafdd92f9981ed556047deb244ebf5a  xditview-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003449.html
+sha256  039e2d447fa409d4bb25c4e87cf09b4d4b3eff2d3af5aee8e7e52165a3259fd7  xditview-1.0.7.tar.xz
+sha512  da7e80cd9fbb5da0ec4949c6fed0bad135a2490767f030e60f1c51a9f5a62379572bf8b4dd6dec2fe824152d090470e62fce12c9144aaa1be1b48ddbc3b2910b  xditview-1.0.7.tar.xz
 # Locally computed
 sha256  023d879308a49249181f78bbb567e93c45138ad847fe969d191e4802e7a1a005  COPYING
diff --git a/package/x11r7/xapp_xditview/xapp_xditview.mk b/package/x11r7/xapp_xditview/xapp_xditview.mk
index 8655bd3e92..5459853ef7 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.mk
+++ b/package/x11r7/xapp_xditview/xapp_xditview.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDITVIEW_VERSION = 1.0.6
+XAPP_XDITVIEW_VERSION = 1.0.7
 XAPP_XDITVIEW_SOURCE = xditview-$(XAPP_XDITVIEW_VERSION).tar.xz
 XAPP_XDITVIEW_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDITVIEW_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
