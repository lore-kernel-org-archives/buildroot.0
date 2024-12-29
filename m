Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4E8C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D69B4FE17;
	Fri, 28 Feb 2025 16:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmwVz4m6ltFV; Fri, 28 Feb 2025 16:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 083F8487DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 083F8487DC;
	Fri, 28 Feb 2025 16:48:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B248711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7707C42E47
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxznIra4J1z7 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE6F842585
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE6F842585
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D539F84C4E; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 21:28:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 47f70b194e4e29408dd874a0fff61022f4d77c92
X-Git-Newrev: a12a9a8e5c0664dd8e37d1e673b8e4ca4bde61b9
X-Patchwork-Hint: ignore
Message-Id: <20250228162952.D539F84C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mpd: update version to
 0.23.16
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a12a9a8e5c0664dd8e37d1e673b8e4ca4bde61b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Version 0.23.16 change log:

* database
  - fix integer overflows with 64-bit inode numbers
* filter
  - ffmpeg: fix for filters producing no output
* support libfmt 11
* support ICU 76

Adapt 0001-src-event-meson.build-add-atomic-dependency-for-spar.patch to
silence check-package warnings
Remove 0002-lib-fmt-support-build-with-libfmt-11.0.0.patch, changes were
applied upstream

$ utils/check-package package/mpd/*
916 lines processed
0 warnings generated

$ echo "BR2_PACKAGE_MPD=y" > ~/output/mpd.config
$ utils/test-pkg -c ~/output/mpd.config -d ~/output -p mpd
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...eson.build-add-atomic-dependency-for-spar.patch |  6 +-
 ...-lib-fmt-support-build-with-libfmt-11.0.0.patch | 93 ----------------------
 package/mpd/mpd.hash                               |  2 +-
 package/mpd/mpd.mk                                 |  2 +-
 5 files changed, 6 insertions(+), 98 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9b7b25c10c..4ae853c91f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -841,7 +841,6 @@ package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch l
 package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
 package/mosquitto/S50mosquitto Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch lib_patch.Upstream
 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
 package/mpv/0001-fix-powerpc64-altivec.patch lib_patch.Upstream
 package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch lib_patch.Upstream
diff --git a/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch b/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
index 390cf12583..28a82da30a 100644
--- a/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
+++ b/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
@@ -9,9 +9,11 @@ Linking with libatomic is needed on sparc otherwise build fails on:
 Fixes:
  - http://autobuild.buildroot.org/results/7a9fdb7e323892fb6ed85a2441054303e889c089
 
+Upstream: not sent (the same kind of patch for ncmpc was
+refused: https://github.com/MusicPlayerDaemon/ncmpc/pull/45)
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent (the same kind of patch for ncmpc was
-refused: https://github.com/MusicPlayerDaemon/ncmpc/pull/45)]
+[Andreas: adapt upstream formatting]
+Signed-off-by: Andreas Ziegler <br015@umbiko.net>
 ---
  src/event/meson.build | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/package/mpd/0002-lib-fmt-support-build-with-libfmt-11.0.0.patch b/package/mpd/0002-lib-fmt-support-build-with-libfmt-11.0.0.patch
deleted file mode 100644
index e0a361fee2..0000000000
--- a/package/mpd/0002-lib-fmt-support-build-with-libfmt-11.0.0.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 1402869715e3efca87942d79c3173a6b21a6925d Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Fri, 5 Jul 2024 14:27:45 +0000
-Subject: [PATCH] lib/fmt: support build with libfmt-11.0.0
-
-Upstream libfmt commit fmtlib/fmt@d707292
-now requires the format function to be const.
-
-Adjust the function prototype so it is const and can compile.
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-
-Context: https://github.com/MusicPlayerDaemon/MPD/issues/2071
-Pull request: https://github.com/MusicPlayerDaemon/MPD/pull/2069
-
-Fixes: http://autobuild.buildroot.net/results/73514ea76a5960f59b4c50e2074571b10e4682d4
-Fixes: http://autobuild.buildroot.net/results/a58ddbdfe35bd19021e65db0b8b8cc4c1c884d51
-
-Rebase for mpd-0.23.15
-
-Upstream: https://github.com/MusicPlayerDaemon/MPD/commit/3648475f871c33daa9e598c102a16e5a1a4d4dfc
-Signed-off-by: Andreas Ziegler <br015@umbiko.net>
----
- src/lib/ffmpeg/LibFmt.hxx            | 2 +-
- src/lib/fmt/AudioFormatFormatter.hxx | 4 ++--
- src/lib/fmt/ExceptionFormatter.hxx   | 2 +-
- src/lib/fmt/PathFormatter.hxx        | 2 +-
- 4 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/lib/ffmpeg/LibFmt.hxx b/src/lib/ffmpeg/LibFmt.hxx
-index aa068711f..dee83ed2d 100644
---- a/src/lib/ffmpeg/LibFmt.hxx
-+++ b/src/lib/ffmpeg/LibFmt.hxx
-@@ -29,7 +29,7 @@
- struct fmt::formatter<AVSampleFormat> : formatter<string_view>
- {
- 	template<typename FormatContext>
--	auto format(const AVSampleFormat format, FormatContext &ctx) {
-+	auto format(const AVSampleFormat format, FormatContext &ctx) const {
- 		const char *name = av_get_sample_fmt_name(format);
- 		if (name == nullptr)
- 			name = "?";
-diff --git a/src/lib/fmt/AudioFormatFormatter.hxx b/src/lib/fmt/AudioFormatFormatter.hxx
-index e0ffb6216..8da98efd4 100644
---- a/src/lib/fmt/AudioFormatFormatter.hxx
-+++ b/src/lib/fmt/AudioFormatFormatter.hxx
-@@ -39,7 +39,7 @@
- struct fmt::formatter<SampleFormat> : formatter<string_view>
- {
- 	template<typename FormatContext>
--	auto format(const SampleFormat format, FormatContext &ctx) {
-+	auto format(const SampleFormat format, FormatContext &ctx) const {
- 		return formatter<string_view>::format(sample_format_to_string(format),
- 						      ctx);
- 	}
-@@ -49,7 +49,7 @@
- struct fmt::formatter<AudioFormat> : formatter<string_view>
- {
- 	template<typename FormatContext>
--	auto format(const AudioFormat &af, FormatContext &ctx) {
-+	auto format(const AudioFormat &af, FormatContext &ctx) const {
- 		return formatter<string_view>::format(ToString(af).c_str(),
- 						      ctx);
- 	}
-diff --git a/src/lib/fmt/ExceptionFormatter.hxx b/src/lib/fmt/ExceptionFormatter.hxx
-index 3f342df67..f08b3bb22 100644
---- a/src/lib/fmt/ExceptionFormatter.hxx
-+++ b/src/lib/fmt/ExceptionFormatter.hxx
-@@ -38,7 +38,7 @@
- struct fmt::formatter<std::exception_ptr> : formatter<string_view>
- {
- 	template<typename FormatContext>
--	auto format(std::exception_ptr e, FormatContext &ctx) {
-+	auto format(std::exception_ptr e, FormatContext &ctx) const {
- 		return formatter<string_view>::format(GetFullMessage(e), ctx);
- 	}
- };
-diff --git a/src/lib/fmt/PathFormatter.hxx b/src/lib/fmt/PathFormatter.hxx
-index e5ae89dec..add06df81 100644
---- a/src/lib/fmt/PathFormatter.hxx
-+++ b/src/lib/fmt/PathFormatter.hxx
-@@ -29,7 +29,7 @@
- struct fmt::formatter<Path> : formatter<string_view>
- {
- 	template<typename FormatContext>
--	auto format(Path path, FormatContext &ctx) {
-+	auto format(Path path, FormatContext &ctx) const {
- 		return formatter<string_view>::format(path.ToUTF8(), ctx);
- 	}
- };
--- 
-2.43.0
-
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index fe3d449cc5..c18a80a9d0 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  550132239ad1acf82ccf8905b56cc13dc2c81a4489b96fba7731b3049907661a  mpd-0.23.15.tar.xz
+sha256  9668e36df80de485683c962d02845bf314d8a08e6141af7afeff76401e32b2c1  mpd-0.23.16.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index e320ad9dec..fd528aaa87 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.23
-MPD_VERSION = $(MPD_VERSION_MAJOR).15
+MPD_VERSION = $(MPD_VERSION_MAJOR).16
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
