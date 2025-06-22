Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FACC77B7C
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 10:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDECA40576;
	Sun, 22 Jun 2025 10:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UrZxMD2RNbZ; Sun, 22 Jun 2025 10:10:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2D4B40596
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2D4B40596;
	Sun, 22 Jun 2025 10:10:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B693CC8
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CEAA60BA7
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0OEnv7zOBcp for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 10:10:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B794060B26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B794060B26
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:10:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A584D840C2; Sun, 22 Jun 2025 10:10:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Jun 2025 11:47:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3142a7cf31c08e14c0c5bbf5167ee8f26a7c3b32
X-Git-Newrev: 0e1d85930f8376683d64331f5ca96a394b9adef2
X-Patchwork-Hint: ignore
Message-Id: <20250622101002.A584D840C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: bump version to 0.5.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0e1d85930f8376683d64331f5ca96a394b9adef2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches which are included in this release.

Release notes: https://git.linuxtv.org/libcamera.git/tag/?h=v0.5.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...t-automatically-build-documentation-if-sp.patch |  51 ----------
 ...amera-rkisp1-Eliminate-hard-coded-resizer.patch | 113 ---------------------
 package/libcamera/libcamera.hash                   |   3 +-
 package/libcamera/libcamera.mk                     |   2 +-
 4 files changed, 3 insertions(+), 166 deletions(-)

diff --git a/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch b/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
deleted file mode 100644
index c75ff1ce9d..0000000000
--- a/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From ae2b6cb3cac6a38a6c96625915cea4b9cf3fc180 Mon Sep 17 00:00:00 2001
-From: Quentin Schulz <quentin.schulz@cherry.de>
-Date: Fri, 4 Apr 2025 18:12:35 +0200
-Subject: [PATCH] meson: Do not automatically build documentation if
- sphinx-build-3 is found
-
-Commit aba567338b25 ("Documentation: Move all dependencies into
-features") did an incomplete migration of the documentation boolean
-option into a documentation feature.
-
-If sphinx-build-3 binary is found on the host system, the documentation
-is built, regardless of the value of the feature option.
-
-This makes sure that sphinx-build-3 presence is only checked if the
-documentation feature is not disabled (which is the default, as it's
-"auto" by default).
-
-This is essential for reproducibility for build systems where
-sphinx-build-3 may or may not be present when libcamera is built, and
-also to declutter the generated package if documentation isn't desired.
-
-Fixes: aba567338b25 ("Documentation: Move all dependencies into features")
-Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
-Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
-Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
-Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
-Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-Upstream: https://git.libcamera.org/libcamera/libcamera.git/commit/?id=ae2b6cb3cac6a38a6c96625915cea4b9cf3fc180
-Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
----
- Documentation/meson.build | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/Documentation/meson.build b/Documentation/meson.build
-index 6158320e..0fc5909d 100644
---- a/Documentation/meson.build
-+++ b/Documentation/meson.build
-@@ -116,10 +116,8 @@ endif
- # Sphinx
- #
- 
--sphinx = find_program('sphinx-build-3', required : false)
--if not sphinx.found()
--    sphinx = find_program('sphinx-build', required : get_option('documentation'))
--endif
-+sphinx = find_program('sphinx-build-3', 'sphinx-build',
-+                      required : get_option('documentation'))
- 
- if sphinx.found()
-     docs_sources = [
diff --git a/package/libcamera/0002-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch b/package/libcamera/0002-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch
deleted file mode 100644
index 062736be77..0000000000
--- a/package/libcamera/0002-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 6e24360d3fc91cbeecb4f5cf432cd194bc098618 Mon Sep 17 00:00:00 2001
-From: Quentin Schulz <quentin.schulz@cherry.de>
-Date: Thu, 3 Apr 2025 20:09:00 +0200
-Subject: [PATCH] Revert "libcamera: rkisp1: Eliminate hard-coded resizer
- limits"
-
-This reverts commit e85c7ddd38ce8456ab01c2a73baf9e788f6a462e.
-
-Linux kernel predating 6.4 (specifically commit 7cfb35d3a800 ("media:
-rkisp1: Implement ENUM_FRAMESIZES") do not have the ioctl in rkisp1
-driver required to dynamically query the resizer limits.
-
-Because of that, maxResolution and minResolution are both {0, 0}
-(default value for Size objects) which means filterSensorResolution()
-will create an entry for the sensor in sensorSizesMap_ but because the
-sensor resolution cannot fit inside the min and max resolution of the
-rkisp1, no size is put into this entry in sensorSizesMap_.
-On the next call to filterSensorResolution(),
-sensorSizesMap_.find(sensor) will return the entry but when attempting
-to call back() on iter->second, it'll trigger an assert because the size
-array is empty.
-
-Linux kernel 6.1 is supported until December 2027, so it seems premature
-to get rid of those hard-coded resizer limits before this happens.
-
-Let's restore the hard-coded resizer limits as fallbacks, actual limits
-are still queried from the driver on recent enough kernels.
-
-Fixes: 761545407c76 ("pipeline: rkisp1: Filter out sensor sizes not supported by the pipeline")
-Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
-Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
-Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-Upstream: https://git.libcamera.org/libcamera/libcamera.git/commit/?id=6e24360d3fc91cbeecb4f5cf432cd194bc098618
-Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
----
- src/libcamera/pipeline/rkisp1/rkisp1_path.cpp | 21 +++++++++++++------
- src/libcamera/pipeline/rkisp1/rkisp1_path.h   |  3 ++-
- 2 files changed, 17 insertions(+), 7 deletions(-)
-
-diff --git a/src/libcamera/pipeline/rkisp1/rkisp1_path.cpp b/src/libcamera/pipeline/rkisp1/rkisp1_path.cpp
-index eee5b09e..64018dc5 100644
---- a/src/libcamera/pipeline/rkisp1/rkisp1_path.cpp
-+++ b/src/libcamera/pipeline/rkisp1/rkisp1_path.cpp
-@@ -54,8 +54,11 @@ const std::map<PixelFormat, uint32_t> formatToMediaBus = {
- 
- } /* namespace */
- 
--RkISP1Path::RkISP1Path(const char *name, const Span<const PixelFormat> &formats)
--	: name_(name), running_(false), formats_(formats), link_(nullptr)
-+RkISP1Path::RkISP1Path(const char *name, const Span<const PixelFormat> &formats,
-+		       const Size &minResolution, const Size &maxResolution)
-+	: name_(name), running_(false), formats_(formats),
-+	  minResolution_(minResolution), maxResolution_(maxResolution),
-+	  link_(nullptr)
- {
- }
- 
-@@ -517,10 +520,12 @@ void RkISP1Path::stop()
- }
- 
- /*
-- * \todo Remove the hardcoded formats once all users will have migrated to a
-- * recent enough kernel.
-+ * \todo Remove the hardcoded resolutions and formats once kernels older than
-+ * v6.4 will stop receiving LTS support (scheduled for December 2027 for v6.1).
-  */
- namespace {
-+constexpr Size RKISP1_RSZ_MP_SRC_MIN{ 32, 16 };
-+constexpr Size RKISP1_RSZ_MP_SRC_MAX{ 4416, 3312 };
- constexpr std::array<PixelFormat, 18> RKISP1_RSZ_MP_FORMATS{
- 	formats::YUYV,
- 	formats::NV16,
-@@ -542,6 +547,8 @@ constexpr std::array<PixelFormat, 18> RKISP1_RSZ_MP_FORMATS{
- 	formats::SRGGB12,
- };
- 
-+constexpr Size RKISP1_RSZ_SP_SRC_MIN{ 32, 16 };
-+constexpr Size RKISP1_RSZ_SP_SRC_MAX{ 1920, 1920 };
- constexpr std::array<PixelFormat, 8> RKISP1_RSZ_SP_FORMATS{
- 	formats::YUYV,
- 	formats::NV16,
-@@ -555,12 +562,14 @@ constexpr std::array<PixelFormat, 8> RKISP1_RSZ_SP_FORMATS{
- } /* namespace */
- 
- RkISP1MainPath::RkISP1MainPath()
--	: RkISP1Path("main", RKISP1_RSZ_MP_FORMATS)
-+	: RkISP1Path("main", RKISP1_RSZ_MP_FORMATS,
-+		     RKISP1_RSZ_MP_SRC_MIN, RKISP1_RSZ_MP_SRC_MAX)
- {
- }
- 
- RkISP1SelfPath::RkISP1SelfPath()
--	: RkISP1Path("self", RKISP1_RSZ_SP_FORMATS)
-+	: RkISP1Path("self", RKISP1_RSZ_SP_FORMATS,
-+		     RKISP1_RSZ_SP_SRC_MIN, RKISP1_RSZ_SP_SRC_MAX)
- {
- }
- 
-diff --git a/src/libcamera/pipeline/rkisp1/rkisp1_path.h b/src/libcamera/pipeline/rkisp1/rkisp1_path.h
-index 2a1ef0ab..430181d3 100644
---- a/src/libcamera/pipeline/rkisp1/rkisp1_path.h
-+++ b/src/libcamera/pipeline/rkisp1/rkisp1_path.h
-@@ -34,7 +34,8 @@ struct V4L2SubdeviceFormat;
- class RkISP1Path
- {
- public:
--	RkISP1Path(const char *name, const Span<const PixelFormat> &formats);
-+	RkISP1Path(const char *name, const Span<const PixelFormat> &formats,
-+		   const Size &minResolution, const Size &maxResolution);
- 
- 	bool init(MediaDevice *media);
- 
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 9f897e023f..bbec9c517d 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,5 @@
-sha256  cea3b5eebc01aa97930ae64989447ca00bad42ff1e0ce71d90d337650dd9e374  libcamera-v0.5.0-git4.tar.gz
+# Locally computed
+sha256  ee2c7086b3c08133bba44856fb9b2ffd1132532150d14da7daecd99ab8a566c2  libcamera-v0.5.1-git4.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 1cd7a22952..a2ff3284d7 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.5.0
+LIBCAMERA_VERSION = v0.5.1
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
