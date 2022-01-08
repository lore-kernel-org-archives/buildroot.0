Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F460C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B820D403CA;
	Sat,  8 Jan 2022 22:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IlyUe5MbT6gF; Sat,  8 Jan 2022 22:01:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F1F3405D6;
	Sat,  8 Jan 2022 22:01:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 30C841BF283
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EA7E60A4F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H6-p2acO63ww for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:01:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26DE760767
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0919383455; Sat,  8 Jan 2022 21:55:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 22:48:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1025766c8a2c9d0a5956ca0d720bb07b9a47076d
X-Git-Newrev: 99adfe6750fbe7485a90473cccae0f37cbe14d83
X-Patchwork-Hint: ignore
Message-Id: <20220108215501.0919383455@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/file: reorganise variables in a
 more logical fashion
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

commit: https://git.buildroot.net/buildroot/commit/?id=99adfe6750fbe7485a90473cccae0f37cbe14d83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/file/file.mk | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/file/file.mk b/package/file/file.mk
index 62cec4b2c9..b7e833e834 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -6,15 +6,17 @@
 
 FILE_VERSION = 5.41
 FILE_SITE = ftp://ftp.astron.com/pub/file
-FILE_DEPENDENCIES = host-file
-HOST_FILE_DEPENDENCIES = host-zlib
-FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-HOST_FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-FILE_INSTALL_STAGING = YES
 FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
 FILE_CPE_ID_VENDOR = file_project
+
+FILE_DEPENDENCIES = host-file
+FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+FILE_INSTALL_STAGING = YES
+
+HOST_FILE_DEPENDENCIES = host-zlib
 HOST_FILE_CONF_OPTS = --disable-libseccomp
+HOST_FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 FILE_CONF_OPTS += --enable-bzlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
