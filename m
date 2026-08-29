Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9929C61DCB
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 19:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AAD26062C;
	Sat, 29 Aug 2026 19:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZO8_qrMLbVnf; Sat, 29 Aug 2026 19:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788031448;
	bh=9ua7bHVXXOpMDhRxd5ekLBnpQB2UKRIKMWnq/Bh/sNs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QTPHT1oOgaG6dZG12SacYOGmvg9uSkkEaHpa2QQSPtyEYcDl1j69ipG702BDI2Urs
	 IFKKdeLJ3nnIdO84+aR66kykcX1JQnCxmN5ba2lPDdYKxxKdTSxfM1p7+wUEXBzIxJ
	 L2qH1fRrtc4TRGcnLza+Nb4ydtV7dTkYBbqhuCQXZuig4OBPROCPs4S2HwmAuM5kqR
	 ckKGJPn23t6tYghC/6IwyzKzdgis72QvAIDn4r5pgVkdadUOigX+BD9ehnpH8/tVgg
	 I+iil00MO7E8xSZESLfXk3y+wKF7fM9pIxX86XcwPQmoV/zG8a4VZpF1Nleq+wSyCd
	 UjPc8Ine1IH7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18F6160615;
	Sat, 29 Aug 2026 19:24:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E11D9D4
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FDB780E5B
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSrS0V754G_a for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 19:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C05A280E59
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:24:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1716F8DBE4; Sat, 29 Aug 2026 19:23:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 21:08:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dea4bf0eca70b32d2e7ba3d2f5cb4767efe6a6c7
X-Git-Newrev: e6b06b8d9cb899a226eba62f6ec902115efbf27a
X-Patchwork-Hint: ignore
Message-Id: <20260829192308.1716F8DBE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2026.08-rc3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e6b06b8d9cb899a226eba62f6ec902115efbf27a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 11 +++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 14 +++++++-------
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index fa8671dad7..4c60984b14 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,14 @@
+2026.08-rc3, released August 29th, 2026
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: avro-c, bind, bpftrace, collectd,
+	dahdi-linux, expat, fetchmail, flex, fluidsynth, gdb, glibc,
+	haproxy, jpeg-turbo, libbpf, libheif, libopenssl,
+	libxml-parser-perl, localedef, mesa3d, nodejs, olsr, perl,
+	php, python-avro, python-gobject, qt6, qt6declarative, redis,
+	rsyslog, taglib, uclibc, unbound, weston
+
 2026.08-rc2, released August 23th, 2026
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 4e59c7b87f..71f6acac41 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.08-rc2
+export BR2_VERSION := 2026.08-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1787519000
+BR2_VERSION_EPOCH = 1788030000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 62783633ae..dade5d2441 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -21,25 +21,25 @@
           <th>2026.08.x</th>
           <td>December 2026</td>
           <td>
-            2026.08-rc2<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08-rc2/CHANGES">
+            2026.08-rc3<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08-rc3/CHANGES">
               Changelog
             </a>
           </td>
           <td>2026-08-23</td>
           <td>
-            <a href="/downloads/buildroot-2026.08-rc2.tar.gz">
+            <a href="/downloads/buildroot-2026.08-rc3.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.08-rc2.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.08-rc3.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.08-rc2.tar.xz">
+            <a href="/downloads/buildroot-2026.08-rc3.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.08-rc2.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.08-rc3.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
@@ -52,7 +52,7 @@
               Changelog
             </a>
           </td>
-          <td>2026-08-23</td>
+          <td>2026-08-29</td>
           <td>
             <a href="/downloads/buildroot-2026.05.2.tar.gz">
               <img src="images/zip.png" width="24" alt="">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
