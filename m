Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C38AEC8733
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16A7B82B75;
	Thu,  7 Sep 2023 15:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16A7B82B75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id neyNiZOk08WH; Thu,  7 Sep 2023 15:12:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAD5783AAE;
	Thu,  7 Sep 2023 15:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAD5783AAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A95881BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E43961232
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E43961232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tu2bhtzDGdz2 for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 526B96128D
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 526B96128D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42BA386A21; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 00:09:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9e36f73a76a079b6dde2eb4da776d7a3ddba677
X-Git-Newrev: 0e19425c774fdcc46c6e3ee4bcf13e88f637e5c4
X-Patchwork-Hint: ignore
Message-Id: <20230907145131.42BA386A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libassuan: bump to version 2.5.6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0e19425c774fdcc46c6e3ee4bcf13e88f637e5c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see [1] and [2].

This commit also moves the archive SHA256 hash to the section of hashes
published upstream.

libassuan 2.5.6 updated its gpg-error.m4 macro files to detect
gpgrt-config. Its path needs to be forced in _CONF_ENV to make sure it
will work in all host environments. See the log entry of commit
d7f2d8403e "package/gnupg2: fix build failure when host provides an
old gpgrt-config" [3] for a complete explanation.

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libassuan.git;a=log;h=libassuan-2.5.6
[2] https://dev.gnupg.org/T6542
[3] https://git.buildroot.org/buildroot/commit/?id=d7f2d8403ec82f3b1772ec17bf1df8c42987a1f8

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libassuan/libassuan.hash | 6 +++---
 package/libassuan/libassuan.mk   | 6 +++++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index c817a3af63..89e3fea956 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,8 +1,8 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  ec4f67c0117ccd17007c748a392ded96dc1b1ae9  libassuan-2.5.5.tar.bz2
+sha1  b1e8754dbf89b3a3eb175f5df75048dbca1fce57  libassuan-2.5.6.tar.bz2
+sha256  e9fd27218d5394904e4e39788f9b1742711c3e6b41689a31aa3380bd5aa4f426  libassuan-2.5.6.tar.bz2
 # Locally calculated after checking signature
-# https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.5.tar.bz2.sig
+# https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.6.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  8e8c2fcc982f9ca67dcbb1d95e2dc746b1739a4668bc20b3a3c5be632edb34e4  libassuan-2.5.5.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 0f69d1ba6b..fb95a6fd67 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.5.5
+LIBASSUAN_VERSION = 2.5.6
 LIBASSUAN_SITE = https://gnupg.org/ftp/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPL-2.1+ (library), GPL-3.0 (tests, doc)
@@ -15,4 +15,8 @@ LIBASSUAN_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 LIBASSUAN_CONFIG_SCRIPTS = libassuan-config
 
+# Force the path to "gpgrt-config" (from the libgpg-error package) to
+# avoid using the one on host, if present.
+LIBASSUAN_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
