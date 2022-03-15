Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFA7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 013FC40578;
	Tue, 15 Mar 2022 21:52:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1pL_X-01Xjw; Tue, 15 Mar 2022 21:52:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D99EB40154;
	Tue, 15 Mar 2022 21:52:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27D4E1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1A1240571
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Onq1ioJyPnpD for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:50:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD2734056D
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C0E5C8412D; Tue, 15 Mar 2022 21:41:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:28:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06bb3640c13191f7515f2140c2207f5b7a2cb7ab
X-Git-Newrev: d96b9ed0738bae270c479bdaf21eebd4c1f9930d
X-Patchwork-Hint: ignore
Message-Id: <20220315214147.C0E5C8412D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgcrypt: bump to version 1.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d96b9ed0738bae270c479bdaf21eebd4c1f9930d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-configure.ac-add-an-option-to-disable-tests.patch          | 2 +-
 package/libgcrypt/libgcrypt.hash                                    | 6 ++----
 package/libgcrypt/libgcrypt.mk                                      | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
index 4ef02fba65..e32f938634 100644
--- a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
+++ b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
@@ -44,7 +44,7 @@ diff --git a/configure.ac b/configure.ac
 index e8c8cd39..1a6b61e5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3198,6 +3198,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
+@@ -3230,6 +3230,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
  AM_CONDITIONAL([BUILD_DOC], [test "x$build_doc" != xno])
  
  
diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 23562d0ed3..2ea4d74c2e 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,7 +1,5 @@
-# From https://www.gnupg.org/download/integrity_check.html
-sha1  1bccc8393482fa1953323ff429c6b5ba5676eb1a  libgcrypt-1.9.4.tar.bz2
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.9.4.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.0.tar.bz2.sig
 # using key 6DAA6E64A76D2840571B4902528897B826403ADA
-sha256  ea849c83a72454e3ed4267697e8ca03390aee972ab421e7df69dfe42b65caaf7  libgcrypt-1.9.4.tar.bz2
+sha256  6a00f5c05caa4c4acc120c46b63857da0d4ff61dc4b4b03933fa8d46013fae81  libgcrypt-1.10.0.tar.bz2
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index e5fdfcfc8e..c6c88f6076 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.9.4
+LIBGCRYPT_VERSION = 1.10.0
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
