Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67309C7EE29
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 19:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFCF741808;
	Mon,  1 May 2023 19:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFCF741808
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IdnCfcVsDYSd; Mon,  1 May 2023 19:56:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B33C04180B;
	Mon,  1 May 2023 19:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B33C04180B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74A311BF4E7
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 19:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BBD581FAF
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 19:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BBD581FAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbHDfV-tuTA7 for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 19:56:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8627681FAD
 for <buildroot@buildroot.org>; Mon,  1 May 2023 19:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8627681FAD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73072852A6; Mon,  1 May 2023 19:56:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 21:51:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b6814f149cccfb4ae7f34fbfd317560b6cd98ca
X-Git-Newrev: 66d3e74d94f8ac2f8f20302275ee944d24cbc074
X-Patchwork-Hint: ignore
Message-Id: <20230501195651.73072852A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: regenerate list
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

commit: https://git.buildroot.net/buildroot/commit/?id=66d3e74d94f8ac2f8f20302275ee944d24cbc074
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some patches were removed in recent version bumps:
  - 492c803117c1  package/tbb: bump to version 2021.8.0.
  - a1e0e7276ca2  package/libmodsecurity: bump to version 3.0.9
  - e4fb09f95f8d  package/gstreamer1-editing-services: bump version to 1.22.2
  - 460c9fa33880  package/pciutils: bump to version 3.9.0
  - 0f1d33b6c866  package/crun: bump to version 1.8.4

And some were renamed with a version bump:
  - 60d8e5257608  package/lua: bump to version 5.4.5

But the ignore list was not updated in any of those commits, the latter
causing issues because the patches are no longer ignored;

    package/lua/5.4.5/0001-root-path.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
    package/lua/5.4.5/0002-shared-libs-for-lua.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
    package/lua/5.4.5/0011-linenoise.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
    384140 lines processed
    3 warnings generated

Update the ignore list accordingly.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 5f6538ea74..d1626326a8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -328,7 +328,6 @@ package/cpulimit/0004-Remove-procfs.h-inclusion.patch Upstream
 package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch Upstream
 package/crda/0002-drop-ldconfig-call.patch Upstream
 package/crda/0003-drop-werror.patch Upstream
-package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch Upstream
 package/ctorrent/0001-fix-musl-build.patch Upstream
 package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch Upstream
 package/cups/0002-Do-not-use-genstrings.patch Upstream
@@ -640,7 +639,6 @@ package/grpc/0003-host-grpc-only-cpp-plugin.patch Upstream
 package/grpc/0004-disable-unconditionally-downloading-api-repos.patch Upstream
 package/gsl/0001-configure.ac-fix-build-on-powerpc.patch Upstream
 package/gstreamer1/gstd/0001-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch Upstream
-package/gstreamer1/gstreamer1-editing-services/0001-Fix-gstreamer-validate-1.0-dependency-name.patch Upstream
 package/guile/0001-calculate-csqrt_manually.patch Upstream
 package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch Upstream
 package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch Upstream
@@ -842,8 +840,6 @@ package/libmemcached/0005-fix-pointer-comparaison.patch Upstream
 package/libmng/0001-jpeg-9a.patch Upstream
 package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch Upstream
 package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch Upstream
-package/libmodsecurity/0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch Upstream
-package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch Upstream
 package/libmpd/0001-Fix-build-on-archlinux-missing-include.patch Upstream
 package/libmpeg2/0001-altivec.patch Upstream
 package/libmpeg2/0002-armv4l.patch Upstream
@@ -993,9 +989,9 @@ package/lua/5.1.5/0012-fix-reader-at-eoz.patch Upstream
 package/lua/5.3.6/0001-root-path.patch Upstream
 package/lua/5.3.6/0002-shared-libs-for-lua.patch Upstream
 package/lua/5.3.6/0003-linenoise.patch Upstream
-package/lua/5.4.4/0001-root-path.patch Upstream
-package/lua/5.4.4/0002-shared-libs-for-lua.patch Upstream
-package/lua/5.4.4/0011-linenoise.patch Upstream
+package/lua/5.4.5/0001-root-path.patch Upstream
+package/lua/5.4.5/0002-shared-libs-for-lua.patch Upstream
+package/lua/5.4.5/0011-linenoise.patch Upstream
 package/luajit/0001-no-bin-symlink.patch Upstream
 package/luajit/0002-install-inc.patch Upstream
 package/luasyslog/0001-remove-AX_LUA_LIBS.patch Upstream
@@ -1249,7 +1245,6 @@ package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
 package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch Upstream
 package/paxtest/0001-genpaxtest-move-log-location.patch Upstream
 package/paxtest/0002-paxtest-page-alignment-ARM-and-NIOS2-arch.patch Upstream
-package/pciutils/0001-Workaround-build-failure-with-older-binutils.patch Upstream
 package/pcm-tools/0001-pmu-query.py-fix-python3-errors-add-linux-platform-s.patch Upstream
 package/pcmanfm/0001-po-de-po-fix-build-with-gettext-tiny.patch Upstream
 package/pcre/0001-Kill-compatibility-bits.patch Upstream
@@ -1573,9 +1568,6 @@ package/targetcli-fb/S50target Shellcheck Variables
 package/taskd/0001-Fix-missing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch Upstream
 package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch Upstream
 package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch Upstream
-package/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch Upstream
-package/tbb/0002-mallinfo-is-only-defined-on-glibc-and-android.patch Upstream
-package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch Upstream
 package/tcf-agent/S55tcf-agent Shellcheck Variables
 package/tcl/0001-dont-build-compat.patch Upstream
 package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
