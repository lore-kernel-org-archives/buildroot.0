Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5EFCD5BA4
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBA9C4064F;
	Wed, 20 May 2026 19:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0tANldRrrqJ; Wed, 20 May 2026 19:29:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1110F40629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779305360;
	bh=UOsbr3L5QChpvxThD1/HfB+INPvbwUny7vu7JQXokZo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pWXMZpGGqsVx4q5nkgptbfx6SG+wNWfrLFxNJyyQLD9NRBG1Fn8GxObaNIN5nXZXU
	 KjGdM6Lhj64UyUB24k5Fh0fxGwGlS2iEbicdmoExS2DAOIcW/pk/iKD7u++IMK1oah
	 YNs1A8fTRB0x6wxvMMb8QInmveMjeJloVQq/maiR40KeGvlOzzjB5hu1FASVXaYn2u
	 iQsqXHY0tlH/nULIaseOhANiEPfOUunHs0f+0GHeH+tE77Exf5bNAE/U0fXSVR4Sex
	 +KzI/kvOmAhyCOK4CBOqaETVCBq7ZlGh2FELay2QdzGlDnUGvhGZ9/NmgBM/bx+RH3
	 mNjsxCZgZEMeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1110F40629;
	Wed, 20 May 2026 19:29:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ABBB265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E493E613A2
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtFr3YljMFQd for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E4D961398
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E4D961398
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:29:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C27C1868FA; Wed, 20 May 2026 19:29:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 21:25:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1c393bfa6374a378550305ad70d096d4c16cf88b
X-Git-Newrev: 29ffdc0dda39e19ccf01874511326b50c039a105
X-Patchwork-Hint: ignore
Message-Id: <20260520192908.C27C1868FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libargon2: support
 static build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/29ffdc0dda39e19ccf01874511326b50c039a105
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

There are options to build only static or only shared libs. The default
is to build both.

Also update reverse dependencies. Note that lua-argon2 doesn't have the
"# libargon2" comment so presumably it needs shared libs itself.

Signed-off-by: Andreas Mohr <and@gmx.li>
[Arnout: also update reverse dependencies]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/cryptsetup/Config.in                  | 2 +-
 package/libargon2/Config.in                   | 5 -----
 package/libargon2/libargon2.mk                | 6 ++++++
 package/python-argon2-cffi-bindings/Config.in | 1 -
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index f36883ea47..2773a93dd3 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	bool "cryptsetup"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2, libargon2
-	depends on !BR2_STATIC_LIBS # lvm2, libargon2
+	depends on !BR2_STATIC_LIBS # lvm2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_PACKAGE_LIBSSH && \
 		(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/libargon2/Config.in b/package/libargon2/Config.in
index 6bba74cfb2..73c1e0d777 100644
--- a/package/libargon2/Config.in
+++ b/package/libargon2/Config.in
@@ -1,12 +1,7 @@
 config BR2_PACKAGE_LIBARGON2
 	bool "libargon2"
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	help
 	  A modern password hashing algorithm
 
 	  https://password-hashing.net/#argon2
-
-comment "libargon needs a toolchain w/ dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
index b3f6e1b216..8ca0071a15 100644
--- a/package/libargon2/libargon2.mk
+++ b/package/libargon2/libargon2.mk
@@ -23,6 +23,12 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 LIBARGON2_OPTS += NO_THREADS=1
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBARGON2_OPTS += LIB_SH= LINKED_LIB_SH=
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBARGON2_OPTS += LIB_ST=
+endif
+
 define LIBARGON2_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		$(LIBARGON2_OPTS)
diff --git a/package/python-argon2-cffi-bindings/Config.in b/package/python-argon2-cffi-bindings/Config.in
index 2e6a4a6c96..3ac283c833 100644
--- a/package/python-argon2-cffi-bindings/Config.in
+++ b/package/python-argon2-cffi-bindings/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_ARGON2_CFFI_BINDINGS
 	bool "python-argon2-cffi-bindings"
 	depends on BR2_USE_MMU # libargon2
-	depends on !BR2_STATIC_LIBS # libargon2
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_LIBARGON2
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
