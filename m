Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02159CD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 20:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22EF56F989;
	Tue,  9 Jun 2026 20:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3-4vsJOlzBi; Tue,  9 Jun 2026 20:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62F8E6F975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781038235;
	bh=dj+nPt43D19IcCnmXuV2hU+K7zNJ0BbUjepRAoRJFFY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=csp25I2u7FK9o2bGvVqLyGoul7Ag1yUHd8W7Q/uIghfGhGV2tzfunWmS8+YA8AMkD
	 l6kFWJ8XyKrn5snmop9+d72JPYl5NAShJoQndAV219JI8gCC6PLzVHBWQgbnv706Oc
	 hWUkDWpy4e9b6aL0DxK67vbYhWabmwueSpU+e21RkmVidw6rt9EyanWGD4nnkO2nLn
	 G+ro2/9KopqGlabO97z49SKssYMtkvdPn5iiJ4ylucqVPy9TQz9zZu9uMgIjjpK031
	 iTAsDlxy33XFggIvohQsm4uZydX/GyMyFJF4n2xeoBdozl3mylPRQL109BqjSBRPns
	 PfvBqoT7VFR6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62F8E6F975;
	Tue,  9 Jun 2026 20:50:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E10D5190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 20:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6E126F8AE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 20:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTmWQKn1ef5I for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 20:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C906D6F916
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C906D6F916
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 20:50:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCA3987EBE; Tue,  9 Jun 2026 20:50:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Jun 2026 22:47:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be7b7821c665db35beea8763c50a49da76bef1f5
X-Git-Newrev: 4184a1f082a645d7ee34f3f09c7e301b5dc4de6f
X-Patchwork-Hint: ignore
Message-Id: <20260609205014.CCA3987EBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtool: bump version to 2.5.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4184a1f082a645d7ee34f3f09c7e301b5dc4de6f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Updated license hashes due to address changes.

Disable help2man to fix build error which would be introduced by this
bump.

For change list since version 2.4.6, see:
https://gitweb.git.savannah.gnu.org/gitweb/?p=libtool.git;a=blob;f=NEWS;h=07333e0cb35654dbb4ad930ba556aa6fde3d04f4;hb=v2.5.4

Release announce:
https://lists.gnu.org/archive/html/info-gnu/2024-11/msg00002.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add links to NEWS and release announce in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libtool/libtool.hash | 6 +++---
 package/libtool/libtool.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libtool/libtool.hash b/package/libtool/libtool.hash
index 8deaf4fbf6..72281eb465 100644
--- a/package/libtool/libtool.hash
+++ b/package/libtool/libtool.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  7c87a8c2c8c0fc9cd5019e402bed4292462d00a718a7cd5f11218153bf28b26f  libtool-2.4.6.tar.xz
+sha256  f81f5860666b0bc7d84baddefa60d1cb9fa6fceb2398cc3baca6afaa60266675  libtool-2.5.4.tar.xz
 # License files, locally calculated
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libltdl/COPYING.LIB
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  libltdl/COPYING.LIB
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 6342e70a39..ecadc3e696 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTOOL_VERSION = 2.4.6
+LIBTOOL_VERSION = 2.5.4
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_CPE_ID_VENDOR = gnu
@@ -25,7 +25,7 @@ LIBTOOL_LICENSE_FILES = $(LIBTOOL_SUBDIR)/COPYING.LIB
 HOST_LIBTOOL_LICENSE = GPL-2.0+ (libtool), LGPL-2.1+ (libltdl)
 HOST_LIBTOOL_LICENSE_FILES = COPYING $(LIBTOOL_SUBDIR)/COPYING.LIB
 
-HOST_LIBTOOL_CONF_ENV = MAKEINFO=true
+HOST_LIBTOOL_CONF_ENV = HELP2MAN=true MAKEINFO=true
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
 # We have a patch that affects libtool.m4, which triggers an autoreconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
