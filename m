Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB832E63F06
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 17:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51F3E408E0;
	Sun, 15 Feb 2026 17:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kEhwT0BfdgO; Sun, 15 Feb 2026 17:50:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62346408E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771177855;
	bh=utGacH8hJkL59dvNpAwhqjOmnQXz8ZW866bTrlKESvA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dpeF1vd+xnmaibEOvuj1dR9LLViW9JGqkTevi1cb2DOS6Lm6ei2qEU16B/hWDbgzt
	 6fa4m4sAmZGx7hGYuV+idGZ5J/G2hVbPHASPXantl/z54gDowCBQY4rYQ9rfhWqjyb
	 OO0emIkrcDqEbrvBn1hlqHzc3Jo0MhiC6zznNIEQOVUyXnhIDOonpUqydLrtyF7CAr
	 faMmh0OnDCymmtLrc02vg6rxB7vvM7bo/xKKct4lZJ5W9NDPambraz72HNPfirzwUU
	 PK2SRDj8zS9o0aaTIMi/48ptEc3/xbPE/LgLCdEKtWltFHAa/xXRNi4SU2CyJVUjOO
	 tqcBv51MNIm9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62346408E4;
	Sun, 15 Feb 2026 17:50:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A704270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 984B1608A9
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUAPmhR0-9J9 for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 17:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8032605DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8032605DE
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:50:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C94FC86E6B; Sun, 15 Feb 2026 17:50:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 18:15:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d94d4ff0a6e39f3ac024069134d0ab9209027686
X-Git-Newrev: 6dcf28eaa89c4dc5514e2c5cd303dffcd56214cf
X-Patchwork-Hint: ignore
Message-Id: <20260215175053.C94FC86E6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coreutils: bump version to 9.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6dcf28eaa89c4dc5514e2c5cd303dffcd56214cf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream does not provide hashes in sha1/sha256 format anymore.

https://lists.gnu.org/archive/html/coreutils-announce/2025-11/msg00000.html

https://lists.gnu.org/archive/html/coreutils-announce/2026-02/msg00000.html
"'kill' and 'uptime' are no longer built by default.  These programs
 can be built with the --enable-install-program=kill,uptime configure
 option."

Adjust coreutils.mk to install 'kill' and 'uptime'.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/coreutils/coreutils.hash | 4 +---
 package/coreutils/coreutils.mk   | 5 +++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index d01955d927..ce507a3015 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,5 +1,3 @@
-# From https://lists.gnu.org/archive/html/coreutils-announce/2025-09/msg00000.html
-sha1  a6a58e00688fe0705a7051b36592f1e43e89a9ef  coreutils-9.8.tar.xz
-sha256  e6d4fd2d852c9141a1c2a18a13d146a0cd7e45195f72293a4e4c044ec6ccca15  coreutils-9.8.tar.xz
 # Locally computed
+sha256  16535a9adf0b10037364e2d612aad3d9f4eca3a344949ced74d12faf4bd51d25  coreutils-9.10.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index b764cb5843..01c0cc72f1 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 9.8
+COREUTILS_VERSION = 9.10
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
@@ -16,6 +16,7 @@ COREUTILS_CPE_ID_VENDOR = gnu
 # if the system is compliant even with this option passed
 COREUTILS_CONF_OPTS = --disable-rpath \
 	--disable-year2038 \
+	--enable-install-program=kill,uptime \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 
 ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
@@ -57,7 +58,7 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 
 COREUTILS_BIN_PROGS = base64 cat chgrp chmod chown cp date dd df dir echo false \
 	kill link ln ls mkdir mknod mktemp mv nice printenv pwd rm rmdir \
-	vdir sleep stty sync touch true uname join
+	vdir sleep stty sync touch true uname uptime join
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 COREUTILS_DEPENDENCIES += acl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
