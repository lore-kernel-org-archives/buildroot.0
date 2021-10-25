Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7E1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:57:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11BB260F70
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11BB260F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D62984041F;
	Mon, 25 Oct 2021 18:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W_n0L4v1ojst; Mon, 25 Oct 2021 18:57:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BE0A4025D;
	Mon, 25 Oct 2021 18:57:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 098B71BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C035360737
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NoFpsYOj_T36 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16DB860847
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8AE31887AB; Mon, 25 Oct 2021 18:53:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 20:53:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0692fb12f8c0bcfa16b0b71cb3d7827d05f48ba4
X-Git-Newrev: a2380c4ea3d4d22de0d7fe01e42260e43b688275
X-Patchwork-Hint: ignore
Message-Id: <20211025185305.8AE31887AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brltty: bump to version 6.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a2380c4ea3d4d22de0d7fe01e42260e43b688275
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop second patch (already in version)
- Update hash of README (changes not related to license)

https://brltty.app/doc/ChangeLog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ams-pgmprivs_linux.c-fix-build-with-gcc-5.patch | 55 ----------------------
 package/brltty/brltty.hash                         |  4 +-
 package/brltty/brltty.mk                           |  2 +-
 3 files changed, 3 insertions(+), 58 deletions(-)

diff --git a/package/brltty/0002-Programs-pgmprivs_linux.c-fix-build-with-gcc-5.patch b/package/brltty/0002-Programs-pgmprivs_linux.c-fix-build-with-gcc-5.patch
deleted file mode 100644
index 92b5aea21e..0000000000
--- a/package/brltty/0002-Programs-pgmprivs_linux.c-fix-build-with-gcc-5.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 92b3fca2d55757680398b55869214fc2d19e9b71 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 21 Feb 2021 20:47:06 +0100
-Subject: [PATCH] Programs/pgmprivs_linux.c: fix build with gcc < 5
-
-Build with gcc < 5 is broken since version 6.2 and
-https://github.com/brltty/brltty/commit/8ce262f2c15f10a40d9cbae0b3c88b466970a055:
-
-./pgmprivs_linux.c: In function 'getPrivilegeParameterNames':
-./pgmprivs_linux.c:2220:3: error: array initialized from non-constant array expression
-   static const char *const names[] = NULL_TERMINATED_STRING_ARRAY(
-   ^
-
-Build was partially fixed since
-https://github.com/brltty/brltty/commit/8ae78dd560d00c5074158f90be5ac8dac80183db
-but it forgot to update pgmprivs_linux.c
-
-Fixes:
- - http://autobuild.buildroot.org/results/58afeb50a0ecdb8b527d7c9946bcae290b79b055
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[yann.morin.1998@free.fr: use an actual backport after upstream merge]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- Programs/pgmprivs_linux.c | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/Programs/pgmprivs_linux.c b/Programs/pgmprivs_linux.c
-index 56e464a82..7dfabaf9b 100644
---- a/Programs/pgmprivs_linux.c
-+++ b/Programs/pgmprivs_linux.c
-@@ -2215,13 +2215,15 @@ typedef enum {
-   PARM_USER,
- } Parameters;
- 
-+
-+static const char *const *const pgmprivs_names =
-+  NULL_TERMINATED_STRING_ARRAY(
-+    "path", "scfmode", "shell", "user"
-+  );
-+
- const char *const *
- getPrivilegeParameterNames (void) {
--  static const char *const names[] = NULL_TERMINATED_STRING_ARRAY(
--    "path", "scfmode", "shell", "user"
--  );
--
--  return names;
-+  return pgmprivs_names;
- }
- 
- const char *
--- 
-2.25.1
-
diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
index 504b0d802a..cec074d8ce 100644
--- a/package/brltty/brltty.hash
+++ b/package/brltty/brltty.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b256df8f86b4d6a597cfe982cc5a7c831915de37cfece683ddb02b2329256a8a  brltty-6.3.tar.xz
+sha256  bc7573b0d0ab865c36607945b64c209312405571788f3b409397726f6143eaa6  brltty-6.4.tar.xz
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  LICENSE-LGPL
-sha256  da78e60359a86eeefb6d6e02bc47d386ece10ae45309d998981157c3746724ab  README
+sha256  429be921e6bf783303a1f94cbb7f29dc4f0839e47efe38150b808f886028f4df  README
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 602750c9b8..9e21018c0a 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRLTTY_VERSION = 6.3
+BRLTTY_VERSION = 6.4
 BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
 BRLTTY_SITE = http://brltty.com/archive
 BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
