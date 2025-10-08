Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB66ACAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 17:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50B5E60ECA;
	Wed,  8 Oct 2025 17:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5UNbbWxO_wUY; Wed,  8 Oct 2025 17:41:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B578460EC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B578460EC1;
	Wed,  8 Oct 2025 17:41:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 509DE119
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 17:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36D9A814D6
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 17:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llDw09HPmjOP for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 17:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F67481361
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F67481361
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 17:41:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1FD686B08; Wed,  8 Oct 2025 17:41:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Oct 2025 19:11:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: acab6d38a23ab6e173eca802e1f32a93e3abe607
X-Git-Newrev: f710640be5869bb3716e254916ae614f79002f2f
X-Patchwork-Hint: ignore
Message-Id: <20251008174114.F1FD686B08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: bump version to 3.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f710640be5869bb3716e254916ae614f79002f2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://openssl-library.org/post/2025-10-01-3.6-release-announcement/

Removed patch 0004 which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...nstall-process-to-avoid-multiple-make-dep.patch | 44 ----------------------
 package/libopenssl/libopenssl.hash                 |  4 +-
 package/libopenssl/libopenssl.mk                   |  2 +-
 3 files changed, 3 insertions(+), 47 deletions(-)

diff --git a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
deleted file mode 100644
index 344b8d07b7..0000000000
--- a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 4562b002366535b3d387fae7fa1dbd8e315ae142 Mon Sep 17 00:00:00 2001
-From: Neil Horman <nhorman@openssl.org>
-Date: Mon, 14 Apr 2025 12:23:15 -0400
-Subject: [PATCH] Serialize install process to avoid multiple make depend
- operations
-
-If make install is run with a large -j value (make install -j N , where
-N > 1)
-
-We can run into a situation in which the install fails because multiple
-make depend operations are running in parallel, which will fail due to
-makefile rewriting.
-
-Serialize the install process to guarantee that those operations don't
-step on one another
-
-Fixes # 27074
-
-Upstream: https://github.com/openssl/openssl/pull/27388
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Configurations/unix-Makefile.tmpl | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index e85763ccf8..b671723813 100644
---- a/Configurations/unix-Makefile.tmpl
-+++ b/Configurations/unix-Makefile.tmpl
-@@ -661,7 +661,11 @@ depend: Makefile
- # Install helper targets #############################################
- ##@ Installation
- 
--install: install_sw install_ssldirs {- "install_docs" if !$disabled{docs}; -} {- $disabled{fips} ? "" : "install_fips" -} ## Install software and documentation, create OpenSSL directories
-+install: Makefile ## Install software and documentation, create OpenSSL directories
-+	$(MAKE) install_sw
-+	$(MAKE) install_ssldirs
-+	{- "\$(MAKE) install_docs" if !$disabled{docs} -}
-+	{- "\$(MAKE) install_fips" if !$disabled{fips} -}
- 
- uninstall: {- "uninstall_docs" if !$disabled{docs}; -} uninstall_sw {- $disabled{fips} ? "" : "uninstall_fips" -} ## Uninstall software and documentation
- 
--- 
-2.39.5
-
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index e78b664aa5..9322a56e76 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.4/openssl-3.5.4.tar.gz.sha256
-sha256  967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99  openssl-3.5.4.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.6.0/openssl-3.6.0.tar.gz.sha256
+sha256  b6a5f44b7eb69e3fa35dbf15524405b44837a481d43d81daddde3ff21fcbb8e9  openssl-3.6.0.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 2f844fd44a..28dcb9dfc2 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.4
+LIBOPENSSL_VERSION = 3.6.0
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
