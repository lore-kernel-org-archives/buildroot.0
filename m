Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8551CC4706F
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 342CD435BE;
	Fri, 29 Dec 2023 21:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 342CD435BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gIsozktpV2oJ; Fri, 29 Dec 2023 21:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C296436D3;
	Fri, 29 Dec 2023 21:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C296436D3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 154D11BF997
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A86734006E
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A86734006E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7VS_8WRr_tfp for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 414DC40077
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 414DC40077
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E8C783911; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 22:14:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08c1ed5b6e9b475949bc087a783bceff58fbac7a
X-Git-Newrev: 0a8d669f8ea35a4c486834b49cca112e57125c93
X-Patchwork-Hint: ignore
Message-Id: <20231229211749.3E8C783911@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shapelib: bump to version 1.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a8d669f8ea35a4c486834b49cca112e57125c93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update hash of web/license.html because SPDX identifier is used since
  https://github.com/OSGeo/shapelib/commit/6bf68d3086f49245470fc24b121afbbeb8e9c4f2
- COPYING has been replaced by LICENSE-LGPL and LICENSE-MIT since
  https://github.com/OSGeo/shapelib/commit/1638416feefcee4a1eeef9aab573a5ce44be1f3e

https://github.com/OSGeo/shapelib/releases/tag/v1.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 ...0001-Remove-double-free-in-contrib-shpsrt.patch | 26 ----------------------
 package/shapelib/shapelib.hash                     |  7 +++---
 package/shapelib/shapelib.mk                       |  7 ++----
 4 files changed, 6 insertions(+), 35 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0bad49c223..7c14305284 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1256,7 +1256,6 @@ package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch Upstream
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
