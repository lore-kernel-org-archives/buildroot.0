Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C91C7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 13:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26DD9817A1;
	Sun, 14 May 2023 13:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26DD9817A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6mUjyKBZH_tK; Sun, 14 May 2023 13:22:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5851C81ED5;
	Sun, 14 May 2023 13:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5851C81ED5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CBF701BF5A4
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F2FE60B28
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F2FE60B28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oZMWKWBdMtqi for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 13:22:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D277460AC4
 for <buildroot@buildroot.org>; Sun, 14 May 2023 13:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D277460AC4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC6A6866A2; Sun, 14 May 2023 13:22:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 May 2023 15:21:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5f209effc06c656e5eab05043af2c8bb851a5ea
X-Git-Newrev: 4c17985880be412ebfa386fac2b63f45044a5782
X-Patchwork-Hint: ignore
Message-Id: <20230514132212.BC6A6866A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: bump version to 3.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c17985880be412ebfa386fac2b63f45044a5782
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/OSGeo/gdal/blob/v3.6.2/NEWS.md
License changes: https://github.com/OSGeo/gdal/commit/a394f9cb299b2c3c2159098483d1fece3a464fda

ISC License is added for FlatGeobuf and Flatbush
Apache-2.0 is added for flatbuffers

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gdal/gdal.hash | 8 ++++----
 package/gdal/gdal.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gdal/gdal.hash b/package/gdal/gdal.hash
index ab77d7840d..d0b08b4535 100644
--- a/package/gdal/gdal.hash
+++ b/package/gdal/gdal.hash
@@ -1,6 +1,6 @@
-# md5 from: https://download.osgeo.org/gdal/3.5.2/gdal-3.5.2.tar.xz.md5, sha256 locally computed:
-md5  821b3b0637ebada5d20dbefb2e3ec964  gdal-3.5.2.tar.xz
-sha256  0874dfdeb9ac42e53c37be4184b19350be76f0530e1f4fa8004361635b9030c2  gdal-3.5.2.tar.xz
+# md5 from: https://download.osgeo.org/gdal/3.6.2/gdal-3.6.2.tar.gz.md5, sha256 locally computed:
+md5  6f22ffdbd8e00059ddb2b825c5920c4c  gdal-3.6.2.tar.xz
+sha256  35f40d2e08061b342513cdcddc2b997b3814ef8254514f0ef1e8bc7aa56cf681  gdal-3.6.2.tar.xz
 
 # Hashes of license files:
-sha256  fac0116e799ca4de79b076ee04863b5e2b69541ea3664b9bb108c81a5355f16a  LICENSE.TXT
+sha256  1dae3468e81d00da56e2936f74d33b8b3ad09d726437f19ce209a5dabea41f77  LICENSE.TXT
diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index a3b11c53af..ce67399c32 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GDAL_VERSION = 3.5.2
+GDAL_VERSION = 3.6.2
 GDAL_SITE = https://download.osgeo.org/gdal/$(GDAL_VERSION)
 GDAL_SOURCE = gdal-$(GDAL_VERSION).tar.xz
-GDAL_LICENSE = MIT, many others
+GDAL_LICENSE = Apache-2.0, ISC, MIT, many others
 GDAL_LICENSE_FILES = LICENSE.TXT
 GDAL_CPE_ID_VENDOR = osgeo
 GDAL_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
