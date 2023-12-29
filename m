Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F718C46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 13:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D310A83419;
	Fri, 29 Dec 2023 13:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D310A83419
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOhL5eIJV8Us; Fri, 29 Dec 2023 13:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2595C8341E;
	Fri, 29 Dec 2023 13:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2595C8341E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A6381BF995
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 13:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 639FB60AC9
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 13:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 639FB60AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kGbI3o4O89uT for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 13:27:35 +0000 (UTC)
X-Greylist: delayed 473 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 29 Dec 2023 13:27:34 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED7CF60AA7
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.155])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED7CF60AA7
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 13:27:34 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id EF15C20C81FF;
 Fri, 29 Dec 2023 14:19:38 +0100 (CET)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id aitV3MguGlQ9; Fri, 29 Dec 2023 14:19:35 +0100 (CET)
Received: from int-mx011.mykolab.com (unknown [10.9.13.11])
 by mx.kolabnow.com (Postfix) with ESMTPS id B018F20C81EA;
 Fri, 29 Dec 2023 14:19:33 +0100 (CET)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
 by int-mx011.mykolab.com (Postfix) with ESMTPS id B4EAB30AAD80;
 Fri, 29 Dec 2023 14:19:33 +0100 (CET)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 14:19:31 +0100
Message-Id: <20231229131931.1103804-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received:received:received; s=
 dkim20160331; t=1703855975; x=1705670376; bh=QelIKAwupTTEzFyBla2
 Y/51UojJ9RrqdHlDSF+qNHNM=; b=HWspN0xdy2naEQMRSM4GabQhk4FQbq+kENS
 hwkHEd0PFgA7QN9UdlIELpwyJbQxUO0kyaF4fBmrUUM/Dw5nydJbAK9jNI1bt1cm
 EInY81UBGCFTOHeLWh6JZyLNJQDLWzC7sGNZ5nK9mujs02n8jfImHpEB4ONgGdlT
 zQJZkv/CxU+6S2oLhoBDYuCifoG4iaX3O7f/hafyIX4gfKhXfDE011V1bJVimQor
 XEq20G46PNsGx3wg/mWJXZAZYymN/FZWbMN3nwT0ftkH3P0bnM24BKdjcyLl8orP
 CXqTpBVedwE+BeoO8F6rpRKXiT3cr62V0U9/onfHf+HZmilUgaQsn5lURX5f3TjU
 wo6bWXKDPCFPMp38o0Jy1wDmv2cI+bP4Xs75uYn/ANKvAMHzYr7ypPvJ4wSLo4Sl
 gMJxLat3d6Tn1KGIjSb+lQyZ3E/GiawLvMpyDRyCgXEu/33ppXKxNH0uJ0mXkLxg
 Y4V+mY4ZZfchn/9gIqPaY1kSBAhMajOpbfwLabS6wir3gVg2aFwFjcZiKQ3kvw8S
 YtqIp9IxSJHujih3Zx6OttayGCsFRwZ6pYtXADVLA9TPFCv+sIox9OjfgBmoh3os
 6Zi83GVTa5Q7KdaLGRPoqI7v+tm9ulakhw+xl3dxHhsirak2BtgHpQMlZW7MMLAi
 +DBr+01o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com
 header.a=rsa-sha256 header.s=dkim20160331 header.b=HWspN0xd
X-Mailman-Original-Authentication-Results: ext-mx-out011.mykolab.com (amavis); 
 dkim=pass (4096-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH] package/shapelib: bump to version 1.6.0
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

- Drop patch (already in version)
- Update hash of web/license.html because SPDX identifier is used since
  https://github.com/OSGeo/shapelib/commit/6bf68d3086f49245470fc24b121afbbeb8e9c4f2
- COPYING has been replaced by LICENSE-LGPL and LICENSE-MIT since
  https://github.com/OSGeo/shapelib/commit/1638416feefcee4a1eeef9aab573a5ce44be1f3e

https://github.com/OSGeo/shapelib/releases/tag/v1.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 .checkpackageignore                           |  1 -
 ...Remove-double-free-in-contrib-shpsrt.patch | 26 -------------------
 package/shapelib/shapelib.hash                |  7 ++---
 package/shapelib/shapelib.mk                  |  7 ++---
 4 files changed, 6 insertions(+), 35 deletions(-)
 delete mode 100644 package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 0868593a92..dd5d2735fe 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1259,7 +1259,6 @@ package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch Upstream
 package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch Upstream
 package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch Upstream
 package/shairport-sync/S99shairport-sync Indent Shellcheck Variables
-package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch Upstream
 package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch Upstream
 package/shellinabox/0001-Makefile-disable-always-building-statically.patch Upstream
 package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch Upstream
diff --git a/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch b/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
deleted file mode 100644
index a565874b8c..0000000000
--- a/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c75b9281a5b9452d92e1682bdfe6019a13ed819f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Albin=20Eldst=C3=A5l-Ahrens?= <laeder.keps@gmail.com>
-Date: Mon, 3 Jan 2022 12:34:41 +0100
-Subject: [PATCH] Remove double free() in contrib/shpsrt, issue #39
-
-This fixes issue #39
-
-[Retrieved from:
-https://github.com/OSGeo/shapelib/commit/c75b9281a5b9452d92e1682bdfe6019a13ed819f]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- contrib/shpsort.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/contrib/shpsort.c b/contrib/shpsort.c
-index e21e9e0..920cd8c 100644
---- a/contrib/shpsort.c
-+++ b/contrib/shpsort.c
-@@ -113,7 +113,6 @@ static char ** split(const char *arg, const char *delim) {
- 	free(result[--i]);
-       }
-       free(result);
--      free(copy);
-       return NULL;
-     }
-     result = tmp;
diff --git a/package/shapelib/shapelib.hash b/package/shapelib/shapelib.hash
index b016fef5cf..f542ee79ac 100644
--- a/package/shapelib/shapelib.hash
+++ b/package/shapelib/shapelib.hash
@@ -1,4 +1,5 @@
 # Locally computed
-sha256  1fc0a480982caef9e7b9423070b47750ba34cd0ba82668f2e638fab1d07adae1  shapelib-1.5.0.tar.gz
-sha256  7eb803a70990017a1c4e38a8342d7413c5dfeec3ed1ac407e15ae2c274e560ff  COPYING
-sha256  a638278f7f1cb7d0cdc73b47a6c87261b882e356a8e79922e90d44d7ef1dd2c7  web/license.html
+sha256  19528b24377241705637320c367943031ad5088665d1fb0e1eaa52a71264a6c4  shapelib-1.6.0.tar.gz
+sha256  681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  LICENSE-LGPL
+sha256  67f1348ec73ef6343f0dbb3fa0612c321da4073e1ee68ffc99fcd3f2d2a65813  LICENSE-MIT
+sha256  15e1205bb007d4d7821f7b1cc461ba8d051647e86dbc9baf1bb6f68b10588eeb  web/license.html
diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index 37d2d9ae64..a36a65f80e 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################

-SHAPELIB_VERSION = 1.5.0
+SHAPELIB_VERSION = 1.6.0
 SHAPELIB_SITE = http://download.osgeo.org/shapelib
 SHAPELIB_LICENSE = MIT or LGPL-2.0
-SHAPELIB_LICENSE_FILES = web/license.html COPYING
+SHAPELIB_LICENSE_FILES = LICENSE-LGPL LICENSE-MIT web/license.html
 SHAPELIB_CPE_ID_VENDOR = osgeo
 SHAPELIB_INSTALL_STAGING = YES

-# 0001-Remove-double-free-in-contrib-shpsrt.patch
-SHAPELIB_IGNORE_CVES += CVE-2022-0699
-
 $(eval $(autotools-package))
--
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
