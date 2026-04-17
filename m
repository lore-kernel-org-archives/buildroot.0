Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA20F436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A576D81815;
	Fri, 17 Apr 2026 15:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9w1NInMhe5W; Fri, 17 Apr 2026 15:22:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24EE381819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439377;
	bh=FefKmr/PYIhMmWG+IrlQJC8A0VZNPt6bZfvLCjohpBg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i7FSyHscbV/Vz95dWqgjkvfZHDt332vQTezPdZ1qlB0VLkB84D1p+jY6NcPstxTa8
	 K/mQNkIygjQrAMgjO8bKovCLquqRyAWIScUsAsM2dEoi6UPp+Sp0+ZALF69r/A0lUE
	 RR11Rf780A8tNQOwBiG8KRvptLO27Ejt221d15HqUxFGX4aoY8VOpMGqdID9JGn7zX
	 Yze6ZdW7VfFfwew83SEDxorn6jbMpMT/+B53haSOBpCUYP3mV8QgZn1ckbunvDYLT6
	 DIm3wxpFbEmz6hMKsQu1X4DjBGWQyiwxvBUyOlELiRZrRt+WVgYNz+qrlAOXplBdAW
	 gINWghMoidxrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24EE381819;
	Fri, 17 Apr 2026 15:22:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 195574E0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABEE960E26
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1o1sRvpiTcq for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1BFD60E2A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1BFD60E2A
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A286F81DD9; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:21:13 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: e96084eb6192f34f278057c6f732a193d3214cf0
X-Git-Newrev: f7ea0c8aa063e8b679dec884f5defc950e38f6aa
X-Patchwork-Hint: ignore
Message-Id: <20260417152246.A286F81DD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libcap: security
 bump version to 2.78
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f7ea0c8aa063e8b679dec884f5defc950e38f6aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Release notes:
https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.x4zn8j3lss6r

Removed patch which is included in this release.

Fixes CVE-2026-4878.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 76e4d8e3dfb2e5353f1473f72860e62b61a953d1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...bcap-Add-build-ldflags-to-_makenames-rule.patch | 34 ----------------------
 package/libcap/libcap.hash                         |  2 +-
 package/libcap/libcap.mk                           |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch b/package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch
deleted file mode 100644
index ae9655fd57..0000000000
--- a/package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 542d7d86ecd2129dd5fe7e5b31ba307304f5b319 Mon Sep 17 00:00:00 2001
-From: "Andrew G. Morgan" <morgan@kernel.org>
-Date: Mon, 10 Nov 2025 18:26:34 -0800
-Subject: [PATCH] Revert "libcap: Add build ldflags to _makenames rule"
-
-This reverts commit c3ddf45d9afaab85d3b7db0dc7bfd1aafb8fde50.
-
-The details of what this broke are here:
-
-  https://bugzilla.kernel.org/show_bug.cgi?id=220691#c2
-
-Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
-Upstream: 542d7d86ecd2129dd5fe7e5b31ba307304f5b319
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- libcap/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libcap/Makefile b/libcap/Makefile
-index f0eb87e..e90a950 100644
---- a/libcap/Makefile
-+++ b/libcap/Makefile
-@@ -80,7 +80,7 @@ $(PSXTITLE).pc: $(PSXTITLE).pc.in
- 		$< >$@
- 
- _makenames: _makenames.c cap_names.list.h
--	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@ $(BUILD_LDFLAGS)
-+	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@
- 
- cap_names.h: _makenames
- 	./_makenames > cap_names.h
--- 
-2.51.1
-
diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 1925060235..735481f33c 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  897bc18b44afc26c70e78cead3dbb31e154acc24bee085a5a09079a88dbf6f52  libcap-2.77.tar.xz
+sha256  0d621e562fd932ccf67b9660fb018e468a683d7b827541df27813228c996bb11  libcap-2.78.tar.xz
 
 # Hash for license file:
 sha256  68467e731f4744bd6e0bb69e8df9c3a994e09cd6b203d0c41327ac6d079c581d  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 37ccdc22b4..f3cd49ff0f 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.77
+LIBCAP_VERSION = 2.78
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
