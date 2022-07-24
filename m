Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CCFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 14:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 230D340C3D;
	Sun, 24 Jul 2022 14:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 230D340C3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QTDwH2XriMFF; Sun, 24 Jul 2022 14:56:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E569F40443;
	Sun, 24 Jul 2022 14:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E569F40443
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30DBA1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 052FD424CD
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 052FD424CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ylP5cZuQ9Q1K for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 14:56:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCF4F41864
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCF4F41864
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5FA2F85C72; Sun, 24 Jul 2022 14:42:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 16:55:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8aaa7ecbce1d10cbcd880c3da5e429988f96176a
X-Git-Newrev: daec24cfb8fcbcca42371bc4077880b478d28472
X-Patchwork-Hint: ignore
Message-Id: <20220724144249.5FA2F85C72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtalloc: bump version to 2.3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=daec24cfb8fcbcca42371bc4077880b478d28472
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 2.3.4 of libtalloc needs to define PYTHONHASHSEED, as a check has been added
to the configure script, and build will fail if it is not defined.

This is originately a workaround by samba developpers meant to avoid rebuilding talloc
with each call to make. Defining PYTHONHASHSEED would not be required in the context
of builroot, if not for the check in the configure script.

Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libtalloc/libtalloc.hash | 2 +-
 package/libtalloc/libtalloc.mk   | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/libtalloc/libtalloc.hash b/package/libtalloc/libtalloc.hash
index cbfd11e63b..0bc8edb695 100644
--- a/package/libtalloc/libtalloc.hash
+++ b/package/libtalloc/libtalloc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330bf6262b40d1d8aaa  talloc-2.3.3.tar.gz
+sha256  179f9ebe265e67e4ab2c26cad2b7de4b6a77c6c212f966903382869f06be6505  talloc-2.3.4.tar.gz
 sha256  f8340c449dd64a55c6605b02fcad2aec6f473612ac6026739a22995380a8043c  talloc.h
diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
index 8cba699ea1..75d3da263b 100644
--- a/package/libtalloc/libtalloc.mk
+++ b/package/libtalloc/libtalloc.mk
@@ -4,13 +4,19 @@
 #
 ################################################################################
 
-LIBTALLOC_VERSION = 2.3.3
+LIBTALLOC_VERSION = 2.3.4
 LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
 LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
 LIBTALLOC_LICENSE = LGPL-3.0+
 LIBTALLOC_LICENSE_FILES = talloc.h
 LIBTALLOC_INSTALL_STAGING = YES
 
+# libtalloc is extracted from the samba source tree, and that has a workaround
+# that requires PYTHONHASHSEED to be set, and to be set to 1.
+# See https://gitlab.com/samba-team/samba/-/commit/420bbb1d92fd2a28725b53f425ba3d214831b660
+LIBTALLOC_CONF_ENV = PYTHONHASHSEED=1
+LIBTALLOC_MAKE_ENV = PYTHONHASHSEED=1
+
 # --with-libiconv= is unconditionally passed, even if libiconv is not
 # present. Indeed, waf will search for libiconv by default in
 # /usr/local. Because of a bug in some waf python script, /usr/local
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
