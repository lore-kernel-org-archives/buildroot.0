Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE01C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED65E81516;
	Sat,  8 Jan 2022 17:49:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WpXks8WrZubr; Sat,  8 Jan 2022 17:49:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34460814BA;
	Sat,  8 Jan 2022 17:49:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83D291BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E79F400BA
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rfjxRdUiEt9x for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:49:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6355E400E3
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:49:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A04838324A; Sat,  8 Jan 2022 17:43:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 18:49:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e9479aa0a734791c20a44d133e31828a807baa7
X-Git-Newrev: ebe808ac4071395b4d1e90d617c33a5e6e514af1
X-Patchwork-Hint: ignore
Message-Id: <20220108174338.A04838324A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/safeclib: bump to version 02092020
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebe808ac4071395b4d1e90d617c33a5e6e514af1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update indentation in hash file (two spaces)
- This bump will fix the following build failure with libest which was
  added with commit f6f0e1e58168dfa9194db2e073efd20a98c15728:

In file included from /home/buildroot/autobuild/instance-0/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/usr/include/libsafec/safe_lib.h:43:0,
                 from est_server_http.c:39:
/home/buildroot/autobuild/instance-0/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/usr/include/libsafec/safe_types.h:42:9: error: unknown type name 'size_t'
 typedef size_t  rsize_t;
         ^~~~~~

https://github.com/rurban/safeclib/blob/v02092020/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/5a12f1cb4153834078522b6068ff24ac0300d51d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/safeclib/safeclib.hash | 6 +++---
 package/safeclib/safeclib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/safeclib/safeclib.hash b/package/safeclib/safeclib.hash
index 7e1c6794e4..af732f93fd 100644
--- a/package/safeclib/safeclib.hash
+++ b/package/safeclib/safeclib.hash
@@ -1,5 +1,5 @@
-# From https://github.com/rurban/safeclib/releases/tag/v08112019
-sha256	bc2f25875522c50a3a5901981020d906db0b6a7d365619b8d72412c126be3923	libsafec-08112019.0-gad76c7.tar.bz2
+# From https://github.com/rurban/safeclib/releases/tag/v02092020
+sha256  d374bdcbfcdc4c9a76abed3707667372ca212fd87a369e7bcaaa54e716d27c0a  libsafec-02092020.tar.xz
 
 # Hash for license file
-sha256	c33e77efd5781e3d59a2bb648c82d2a615035ef0d24cf58880380e3af906510b	COPYING
+sha256  c33e77efd5781e3d59a2bb648c82d2a615035ef0d24cf58880380e3af906510b  COPYING
diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index 3af8fbb167..032a73bf67 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SAFECLIB_VERSION = 08112019
+SAFECLIB_VERSION = 02092020
 SAFECLIB_SITE = \
 	https://github.com/rurban/safeclib/releases/download/v$(SAFECLIB_VERSION)
-SAFECLIB_SOURCE = libsafec-$(SAFECLIB_VERSION).0-gad76c7.tar.bz2
+SAFECLIB_SOURCE = libsafec-$(SAFECLIB_VERSION).tar.xz
 SAFECLIB_LICENSE = MIT
 SAFECLIB_LICENSE_FILES = COPYING
 SAFECLIB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
