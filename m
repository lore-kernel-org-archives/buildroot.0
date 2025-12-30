Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449FEEE4990
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D52E60BD5;
	Tue, 30 Dec 2025 18:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lg9Fw-sYG7QV; Tue, 30 Dec 2025 18:12:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7432A60C29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118379;
	bh=CiE5ZS2vrtK8Qi/cbCvOjIbgg3UMvi4B3tWiyJZo8Ms=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OURbMqf74zglvgOwOoeQDMF9zW5AXizn5QoG31zJ8pIbywMxfJ9QJYk7VYfIaQy1L
	 74NrmcOgxNvBQV4+hBMGWkNpqVP7S0hMKP4SxE9o08vCVpqSdngvFuimTTKAQXva/l
	 SMQlIjG97sdX2rLgfp88siuEJ9B4S/3l80EbMFavXdS5xK1nzRYwLnXiFuWl4K3yzz
	 MT7Tl/rlnC0kqGQpoA+y8jLkiy9rC9oklZhnUoQeXTAZqWfTSQPXnMDlVNjQS2A7Oo
	 z0kzin/SyREpaG7K2ZnwFOOvRIKtwaHfgR7f8FMO01q3Y0xj66xuUNwQdhJl2Cz5YQ
	 pDAi/31bbhzlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7432A60C29;
	Tue, 30 Dec 2025 18:12:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 017DB277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C69F8407E8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2tljyPio1YS for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 994CE406E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 994CE406E7
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9710587C40; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 19:12:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e644b58f51e09a5227146a7b394bff607e69cd7c
X-Git-Newrev: 2577977e751bb8a5b36d31f87440d59e82537608
X-Patchwork-Hint: ignore
Message-Id: <20251230181235.9710587C40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfreeimage: remove package
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
Content-Type: multipart/mixed; boundary="===============1893354430549028422=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1893354430549028422==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2577977e751bb8a5b36d31f87440d59e82537608
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The last release dates back to 2018 and security issues remain unfixed
upstream so we remove this package for security reasons:
https://lists.buildroot.org/pipermail/buildroot/2025-December/793070.html

Cc: Rémi Rérolle <remi.rerolle@gmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |   4 -
 Config.in.legacy                                   |   6 +
 DEVELOPERS                                         |   3 -
 package/Config.in                                  |   1 -
 package/libfreeimage/0001-no-root-install.patch    |  20 ---
 package/libfreeimage/0002-fix-cpuid-x86.patch      |  67 --------
 package/libfreeimage/0003-fix-big-endian-os.patch  |  64 -------
 .../libfreeimage/0004-fixed-C-11-warnings.patch    |  94 -----------
 .../0005-jxrlib-ftbfs-with-GCC-14.patch            |  40 -----
 ...06-FTBFS-fix-for-function-prototype-error.patch |  29 ----
 .../0007-CVE-2019-12211_2019-12213.patch           | 188 ---------------------
 package/libfreeimage/0008-CVE-2020-24292.patch     |  17 --
 package/libfreeimage/0009-CVE-2020-24293.patch     |  18 --
 package/libfreeimage/0010-CVE-2020-24295.patch     |  25 ---
 package/libfreeimage/0011-CVE-2021-33367.patch     |  23 ---
 package/libfreeimage/0012-CVE-2021-40263.patch     |  18 --
 package/libfreeimage/0013-CVE-2021-40266.patch     |  18 --
 package/libfreeimage/0014-CVE-2023-47995.patch     |  18 --
 package/libfreeimage/0015-CVE-2023-47997.patch     |  20 ---
 package/libfreeimage/Config.in                     |  18 --
 package/libfreeimage/libfreeimage.hash             |   9 -
 package/libfreeimage/libfreeimage.mk               |  62 -------
 22 files changed, 6 insertions(+), 756 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 99b6841b39..7b08791dcb 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -531,10 +531,6 @@ package/libedit/0001-check-bsd-functions-in-libbsd.patch lib_patch.Upstream
 package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch lib_patch.Upstream
 package/libffi/0001-Fix-use-of-compact-eh-frames-on-MIPS.patch lib_patch.Upstream
 package/libfm/0001-modules-fix-cross-compilation.patch lib_patch.Upstream
-package/libfreeimage/0001-no-root-install.patch lib_patch.Upstream
-package/libfreeimage/0002-fix-cpuid-x86.patch lib_patch.Upstream
-package/libfreeimage/0003-fix-big-endian-os.patch lib_patch.Upstream
-package/libfreeimage/0004-fixed-C-11-warnings.patch lib_patch.Upstream
 package/libftdi/0001-pkgconfig_libusb.patch lib_patch.Sob lib_patch.Upstream
 package/libftdi/0002-libftdi.pc-requires-libusb-fix-static-build.patch lib_patch.Sob lib_patch.Upstream
 package/libfuse/0001-fix-aarch64-build.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index a1ec2033a2..258fc30968 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LIBFREEIMAGE
+	bool "libfreeimage"
+	select BR2_LEGACY
+	help
+	  libfreeimage is unmaintained and has been removed
+
 config BR2_PACKAGE_OPENCV3
 	bool "opencv3"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 477fb5a72d..85453ae16e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2847,9 +2847,6 @@ N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
 F:	package/paho-mqtt-cpp/
 
-N:	Rémi Rérolle <remi.rerolle@gmail.com>
-F:	package/libfreeimage/
-
 N:	Renaud Aubin <root@renaud.io>
 F:	package/libhttpparser/
 
diff --git a/package/Config.in b/package/Config.in
index 77667a41a0..0e36923bf3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1746,7 +1746,6 @@ menu "Graphics"
 	source "package/libfm/Config.in"
 	source "package/libfm-extra/Config.in"
 	source "package/libfreeglut/Config.in"
-	source "package/libfreeimage/Config.in"
 	source "package/libgdiplus/Config.in"
 	source "package/libgeotiff/Config.in"
 	source "package/libglew/Config.in"
diff --git a/package/libfreeimage/0001-no-root-install.patch b/package/libfreeimage/0001-no-root-install.patch
deleted file mode 100644
index 54756d8e9e..0000000000
--- a/package/libfreeimage/0001-no-root-install.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Makefile.gnu: allow non-root install by not enforcing root ownserhip
-
-Signed-off-by: Rémi Rérolle <remi.rerolle@gmail.com>
-
-diff -ruN a/Makefile.gnu b/Makefile.gnu
---- a/Makefile.gnu	2015-04-09 16:34:02.315316841 +0200
-+++ b/Makefile.gnu	2015-04-09 16:34:28.875483201 +0200
-@@ -71,9 +71,9 @@
- 
- install:
- 	install -d $(INCDIR) $(INSTALLDIR)
--	install -m 644 -o root -g root $(HEADER) $(INCDIR)
--	install -m 644 -o root -g root $(STATICLIB) $(INSTALLDIR)
--	install -m 755 -o root -g root $(SHAREDLIB) $(INSTALLDIR)
-+	install -m 644 $(HEADER) $(INCDIR)
-+	install -m 644 $(STATICLIB) $(INSTALLDIR)
-+	install -m 755 $(SHAREDLIB) $(INSTALLDIR)
- 	ln -sf $(SHAREDLIB) $(INSTALLDIR)/$(VERLIBNAME)
- 	ln -sf $(VERLIBNAME) $(INSTALLDIR)/$(LIBNAME)	
- #	ldconfig
diff --git a/package/libfreeimage/0002-fix-cpuid-x86.patch b/package/libfreeimage/0002-fix-cpuid-x86.patch
deleted file mode 100644
index 98b0e9c6e3..0000000000
--- a/package/libfreeimage/0002-fix-cpuid-x86.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-Fix build issue caused by invalid register usage on x86
-
-Patch taken from https://github.com/openexr/openexr/issues/128.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Source/OpenEXR/IlmImf/ImfSystemSpecific.cpp
-===================================================================
---- a/Source/OpenEXR/IlmImf/ImfSystemSpecific.cpp
-+++ b/Source/OpenEXR/IlmImf/ImfSystemSpecific.cpp
-@@ -40,21 +40,19 @@
- 
- namespace {
- #if defined(IMF_HAVE_SSE2) &&  defined(__GNUC__)
--
-+#include <cpuid.h>
-     // Helper functions for gcc + SSE enabled
--    void cpuid(int n, int &eax, int &ebx, int &ecx, int &edx)
-+    void cpuid(unsigned int n, unsigned int &eax, unsigned int &ebx,
-+					unsigned int &ecx, unsigned int &edx)
-     {
--        __asm__ __volatile__ (
--            "cpuid"
--            : /* Output  */ "=a"(eax), "=b"(ebx), "=c"(ecx), "=d"(edx) 
--            : /* Input   */ "a"(n)
--            : /* Clobber */);
-+		__get_cpuid(n, &eax, &ebx, &ecx, &edx);
-     }
- 
- #else // IMF_HAVE_SSE2 && __GNUC__
- 
-     // Helper functions for generic compiler - all disabled
--    void cpuid(int n, int &eax, int &ebx, int &ecx, int &edx)
-+    void cpuid(unsigned int n, unsigned int &eax, unsigned int &ebx,
-+					unsigned int &ecx, unsigned int &edx)
-     {
-         eax = ebx = ecx = edx = 0;
-     }
-@@ -64,7 +62,7 @@
- 
- #ifdef OPENEXR_IMF_HAVE_GCC_INLINE_ASM_AVX
- 
--    void xgetbv(int n, int &eax, int &edx)
-+    void xgetbv(unsigned int n, unsigned int &eax, unsigned int &edx)
-     {
-         __asm__ __volatile__ (
-             "xgetbv"
-@@ -75,7 +73,7 @@
- 
- #else //  OPENEXR_IMF_HAVE_GCC_INLINE_ASM_AVX
- 
--    void xgetbv(int n, int &eax, int &edx)
-+    void xgetbv(unsigned int n, unsigned int &eax, unsigned int &edx)
-     {
-         eax = edx = 0;
-     }
-@@ -94,8 +92,8 @@
-     f16c(false)
- {
-     bool osxsave = false;
--    int  max     = 0;
--    int  eax, ebx, ecx, edx;
-+    unsigned int  max     = 0;
-+    unsigned int  eax, ebx, ecx, edx;
- 
-     cpuid(0, max, ebx, ecx, edx);
-     if (max > 0)
diff --git a/package/libfreeimage/0003-fix-big-endian-os.patch b/package/libfreeimage/0003-fix-big-endian-os.patch
deleted file mode 100644
index e0d4e921ca..0000000000
--- a/package/libfreeimage/0003-fix-big-endian-os.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-fixed PluginBMP, PluginDDS for compilation under Big Endian OS
-
-Downloaded from upstream commit:
-https://sourceforge.net/p/freeimage/svn/1809/
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr FreeImage.orig/Source/FreeImage/PluginBMP.cpp FreeImage/Source/FreeImage/PluginBMP.cpp
---- FreeImage.orig/Source/FreeImage/PluginBMP.cpp	2016-06-15 12:35:30.000000000 +0200
-+++ FreeImage/Source/FreeImage/PluginBMP.cpp	2019-08-31 16:00:27.813378612 +0200
-@@ -518,7 +518,7 @@
- 				io->read_proc(FreeImage_GetPalette(dib), used_colors * sizeof(RGBQUAD), 1, handle);
- #if FREEIMAGE_COLORORDER == FREEIMAGE_COLORORDER_RGB
- 				RGBQUAD *pal = FreeImage_GetPalette(dib);
--				for(int i = 0; i < used_colors; i++) {
-+				for(unsigned int i = 0; i < used_colors; i++) {
- 					INPLACESWAP(pal[i].rgbRed, pal[i].rgbBlue);
- 				}
- #endif
-@@ -1419,7 +1419,7 @@
- 
- 			free(buffer);
- #ifdef FREEIMAGE_BIGENDIAN
--		} else if (bpp == 16) {
-+		} else if (dst_bpp == 16) {
- 			int padding = dst_pitch - dst_width * sizeof(WORD);
- 			WORD pad = 0;
- 			WORD pixel;
-@@ -1440,7 +1440,7 @@
- 			}
- #endif
- #if FREEIMAGE_COLORORDER == FREEIMAGE_COLORORDER_RGB
--		} else if (bpp == 24) {
-+		} else if (dst_bpp == 24) {
- 			int padding = dst_pitch - dst_width * sizeof(FILE_BGR);
- 			DWORD pad = 0;
- 			FILE_BGR bgr;
-@@ -1461,7 +1461,7 @@
- 					}
- 				}
- 			}
--		} else if (bpp == 32) {
-+		} else if (dst_bpp == 32) {
- 			FILE_BGRA bgra;
- 			for(unsigned y = 0; y < dst_height; y++) {
- 				BYTE *line = FreeImage_GetScanLine(dib, y);
-diff -uNr FreeImage.orig/Source/FreeImage/PluginDDS.cpp FreeImage/Source/FreeImage/PluginDDS.cpp
---- FreeImage.orig/Source/FreeImage/PluginDDS.cpp	2018-07-31 17:04:58.000000000 +0200
-+++ FreeImage/Source/FreeImage/PluginDDS.cpp	2019-08-31 16:00:39.213465120 +0200
-@@ -356,14 +356,6 @@
- 	for(int i=0; i<11; i++) {
- 		SwapLong(&header->surfaceDesc.dwReserved1[i]);
- 	}
--	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwSize);
--	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwFlags);
--	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwFourCC);
--	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwRGBBitCount);
--	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwRBitMask);
--	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwGBitMask);
--	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwBBitMask);
--	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwRGBAlphaBitMask);
- 	SwapLong(&header->surfaceDesc.ddsCaps.dwCaps1);
- 	SwapLong(&header->surfaceDesc.ddsCaps.dwCaps2);
- 	SwapLong(&header->surfaceDesc.ddsCaps.dwReserved[0]);
diff --git a/package/libfreeimage/0004-fixed-C-11-warnings.patch b/package/libfreeimage/0004-fixed-C-11-warnings.patch
deleted file mode 100644
index cf9c47303a..0000000000
--- a/package/libfreeimage/0004-fixed-C-11-warnings.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-fixed C++11 warnings
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from: https://sourceforge.net/p/freeimage/svn/1896]
-
-Index: trunk/Source/FreeImage/CacheFile.cpp
-===================================================================
---- trunk/Source/FreeImage/CacheFile.cpp	(révision 1895)
-+++ trunk/Source/FreeImage/CacheFile.cpp	(révision 1896)
-@@ -147,10 +147,14 @@
- 				m_current_block->data = new BYTE[BLOCK_SIZE];
- 
- 				fseek(m_file, m_current_block->nr * BLOCK_SIZE, SEEK_SET);
--				fread(m_current_block->data, BLOCK_SIZE, 1, m_file);
--
--				m_page_cache_mem.splice(m_page_cache_mem.begin(), m_page_cache_disk, it->second);
--				m_page_map[nr] = m_page_cache_mem.begin();
-+				if (fread(m_current_block->data, BLOCK_SIZE, 1, m_file) == 1) {
-+					m_page_cache_mem.splice(m_page_cache_mem.begin(), m_page_cache_disk, it->second);
-+					m_page_map[nr] = m_page_cache_mem.begin();
-+				}
-+				else {
-+					FreeImage_OutputMessageProc(FIF_UNKNOWN, "Failed to lock a block in CacheFile");
-+					return NULL;
-+				}
- 			}
- 
- 			// if the memory cache size is too large, swap an item to disc
-Index: trunk/Source/FreeImage/MultiPage.cpp
-===================================================================
---- trunk/Source/FreeImage/MultiPage.cpp	(révision 1895)
-+++ trunk/Source/FreeImage/MultiPage.cpp	(révision 1896)
-@@ -271,8 +271,8 @@
- 					}
- 				}
- 
--				std::auto_ptr<FIMULTIBITMAP> bitmap (new FIMULTIBITMAP);
--				std::auto_ptr<MULTIBITMAPHEADER> header (new MULTIBITMAPHEADER);
-+				std::unique_ptr<FIMULTIBITMAP> bitmap (new FIMULTIBITMAP);
-+				std::unique_ptr<MULTIBITMAPHEADER> header (new MULTIBITMAPHEADER);
- 				header->m_filename = filename;
- 				// io is default
- 				header->node = node;
-@@ -339,8 +339,8 @@
- 				PluginNode *node = list->FindNodeFromFIF(fif);
- 			
- 				if (node) {
--					std::auto_ptr<FIMULTIBITMAP> bitmap (new FIMULTIBITMAP);
--					std::auto_ptr<MULTIBITMAPHEADER> header (new MULTIBITMAPHEADER);
-+					std::unique_ptr<FIMULTIBITMAP> bitmap (new FIMULTIBITMAP);
-+					std::unique_ptr<MULTIBITMAPHEADER> header (new MULTIBITMAPHEADER);
- 					header->io = *io;
- 					header->node = node;
- 					header->fif = fif;
-Index: trunk/Source/FreeImage/PSDParser.cpp
-===================================================================
---- trunk/Source/FreeImage/PSDParser.cpp	(révision 1895)
-+++ trunk/Source/FreeImage/PSDParser.cpp	(révision 1896)
-@@ -97,7 +97,7 @@
- template <int N>
- class PSDGetValue {
- public:
--	static inline int get(const BYTE * iprBuffer) {} // error
-+	static inline int get(const BYTE * iprBuffer) { return -1; } // error
- };
- 
- template <>
-Index: trunk/Source/FreeImage/PluginPSD.cpp
-===================================================================
---- trunk/Source/FreeImage/PluginPSD.cpp	(révision 1895)
-+++ trunk/Source/FreeImage/PluginPSD.cpp	(révision 1896)
-@@ -127,7 +127,7 @@
- static BOOL DLL_CALLCONV
- Save(FreeImageIO *io, FIBITMAP *dib, fi_handle handle, int page, int flags, void *data) {
- 	if(!handle) {
--		return NULL;
-+		return FALSE;
- 	}
- 	try {
- 		psdParser parser;
-Index: trunk/Source/FreeImage/PluginHDR.cpp
-===================================================================
---- trunk/Source/FreeImage/PluginHDR.cpp	(révision 1895)
-+++ trunk/Source/FreeImage/PluginHDR.cpp	(révision 1896)
-@@ -244,7 +244,8 @@
- 		}
- 		else if((buf[0] == '#') && (buf[1] == 0x20)) {
- 			header_info->valid |= RGBE_VALID_COMMENT;
--			strcpy(header_info->comment, buf);
-+			strncpy(header_info->comment, buf, HDR_MAXLINE - 1);
-+			header_info->comment[HDR_MAXLINE - 1] = '\0';
- 		}
- 	}
- 	if(!bHeaderFound || !bFormatFound) {
diff --git a/package/libfreeimage/0005-jxrlib-ftbfs-with-GCC-14.patch b/package/libfreeimage/0005-jxrlib-ftbfs-with-GCC-14.patch
deleted file mode 100644
index c13a8dc26f..0000000000
--- a/package/libfreeimage/0005-jxrlib-ftbfs-with-GCC-14.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 11383a017e8d040f1376c964d2b8769108204f0b Mon Sep 17 00:00:00 2001
-From: YOKOTA Hiroshi <yokota.hgml@gmail.com>
-Date: Thu, 25 Jul 2024 15:03:31 +0900
-Subject: [PATCH] jxrlib: ftbfs with GCC-14
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Bug-Debian: https://bugs.debian.org/1075105
-
-_byteswap_ulong() is defined in image/sys/strcodec.c
-
-Upstream: Bug submitted at https://sourceforge.net/p/freeimage/bugs/389/
-[Thomas: patch taken from https://sources.debian.org/patches/jxrlib/1.2~git20170615.f752187-5.3/0013-jxrlib-ftbfs-with-GCC-14.patch/]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-----
-/usr/bin/cc -DDISABLE_PERF_MEASUREMENT -D__ANSI__ -Djpegxr_EXPORTS -I"/<<PKGBUILDDIR>>/common/include" -I"/<<PKGBUILDDIR>>/image/sys" -I"/<<PKGBUILDDIR>>/jxrgluelib" -I"/<<PKGBUILDDIR>>/jxrtestlib" -g -O2 -Werror=implicit-function-declaration -ffile-prefix-map=/<<PKGBUILDDIR>>=. -fstack-protector-strong -fstack-clash-protection -Wformat -Werror=format-security -fcf-protection -Wall -Wextra -Wdate-time -D_FORTIFY_SOURCE=2 -fPIC -w -MD -MT CMakeFiles/jpegxr.dir/image/encode/strenc.c.o -MF CMakeFiles/jpegxr.dir/image/encode/strenc.c.o.d -o CMakeFiles/jpegxr.dir/image/encode/strenc.c.o -c "/<<PKGBUILDDIR>>/image/encode/strenc.c"
-/<<PKGBUILDDIR>>/image/decode/segdec.c: In function ‘_load4’:
-/<<PKGBUILDDIR>>/image/decode/segdec.c:68:12: error: implicit declaration of function ‘_byteswap_ulong’ [-Wimplicit-function-declaration]
-   68 |     return _byteswap_ulong(v);
-      |            ^~~~~~~~~~~~~~~
----
- Source/LibJXR/image/decode/segdec.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/LibJXR/image/decode/segdec.c b/Source/LibJXR/image/decode/segdec.c
-index 1299458..8050355 100644
---- a/Source/LibJXR/image/decode/segdec.c
-+++ b/Source/LibJXR/image/decode/segdec.c
-@@ -63,6 +63,7 @@ static U32 _FORCEINLINE _load4(void* pv)
-     v |= ((U32)((U16 *) pv)[1]) << 16;
-     return _byteswap_ulong(v);
- #else // _M_IA64
-+    U32 _byteswap_ulong(U32 bits); // from image/sys/strcodec.c
-     return _byteswap_ulong(*(U32*)pv);
- #endif // _M_IA64
- #endif // _BIG__ENDIAN_
--- 
-2.51.0
-
diff --git a/package/libfreeimage/0006-FTBFS-fix-for-function-prototype-error.patch b/package/libfreeimage/0006-FTBFS-fix-for-function-prototype-error.patch
deleted file mode 100644
index bdda376467..0000000000
--- a/package/libfreeimage/0006-FTBFS-fix-for-function-prototype-error.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 7b59b3757521d82406771cc47127aa70ffb26f3f Mon Sep 17 00:00:00 2001
-From: YOKOTA Hiroshi <yokota.hgml@gmail.com>
-Date: Thu, 25 Jul 2024 16:01:01 +0900
-Subject: [PATCH] FTBFS fix for function prototype error
-
-Bug-Debian: https://bugs.debian.org/1075105
-
-Upstream: Bug submitted at https://sourceforge.net/p/freeimage/bugs/389/
-[Thomas: patch taken from https://sources.debian.org/patches/jxrlib/1.2~git20170615.f752187-5.3/0015-FTBFS-fix-for-function-prototype-error.patch/]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- Source/LibJXR/jxrgluelib/JXRGlueJxr.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/LibJXR/jxrgluelib/JXRGlueJxr.c b/Source/LibJXR/jxrgluelib/JXRGlueJxr.c
-index 2bf085a..182fc7f 100644
---- a/Source/LibJXR/jxrgluelib/JXRGlueJxr.c
-+++ b/Source/LibJXR/jxrgluelib/JXRGlueJxr.c
-@@ -28,6 +28,7 @@
- //*@@@---@@@@******************************************************************
- #include <limits.h>
- #include <JXRGlue.h>
-+#include <wchar.h>
- 
- 
- static const char szHDPhotoFormat[] = "<dc:format>image/vnd.ms-photo</dc:format>";
--- 
-2.51.0
-
diff --git a/package/libfreeimage/0007-CVE-2019-12211_2019-12213.patch b/package/libfreeimage/0007-CVE-2019-12211_2019-12213.patch
deleted file mode 100644
index de1419b546..0000000000
--- a/package/libfreeimage/0007-CVE-2019-12211_2019-12213.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-CVE: CVE-2019-12211
-CVE: CVE-2019-12213
-Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/78980acf39f02b88e70f27e37e5a191c9a9ead47/f/CVE-2019-12211_2019-12213.patch
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
-diff -rupN a/Source/FreeImage/PluginTIFF.cpp b/Source/FreeImage/PluginTIFF.cpp
---- a/Source/FreeImage/PluginTIFF.cpp
-+++ b/Source/FreeImage/PluginTIFF.cpp
-@@ -122,9 +122,14 @@ static void ReadThumbnail(FreeImageIO *i
- static int s_format_id;
- 
- typedef struct {
-+	//! FreeImage IO functions
-     FreeImageIO *io;
-+	//! FreeImage handle
- 	fi_handle handle;
-+	//! LibTIFF handle
- 	TIFF *tif;
-+	//! Count the number of thumbnails already read (used to avoid recursion on loading)
-+	unsigned thumbnailCount;
- } fi_TIFFIO;
- 
- // ----------------------------------------------------------
-@@ -184,10 +189,8 @@ Open a TIFF file descriptor for reading
- */
- TIFF *
- TIFFFdOpen(thandle_t handle, const char *name, const char *mode) {
--	TIFF *tif;
--	
- 	// Open the file; the callback will set everything up
--	tif = TIFFClientOpen(name, mode, handle,
-+	TIFF *tif = TIFFClientOpen(name, mode, handle,
- 	    _tiffReadProc, _tiffWriteProc, _tiffSeekProc, _tiffCloseProc,
- 	    _tiffSizeProc, _tiffMapProc, _tiffUnmapProc);
- 
-@@ -460,12 +463,10 @@ CreateImageType(BOOL header_only, FREE_I
- 			}
- 			
- 		}
--		else {
--
--			dib = FreeImage_AllocateHeader(header_only, width, height, MIN(bpp, 32), FI_RGBA_RED_MASK, FI_RGBA_GREEN_MASK, FI_RGBA_BLUE_MASK);
-+		else if (bpp <= 32) {
-+			dib = FreeImage_AllocateHeader(header_only, width, height, bpp, FI_RGBA_RED_MASK, FI_RGBA_GREEN_MASK, FI_RGBA_BLUE_MASK);
- 		}
- 
--
- 	} else {
- 		// other bitmap types
- 		
-@@ -1050,9 +1051,12 @@ static void * DLL_CALLCONV
- Open(FreeImageIO *io, fi_handle handle, BOOL read) {
- 	// wrapper for TIFF I/O
- 	fi_TIFFIO *fio = (fi_TIFFIO*)malloc(sizeof(fi_TIFFIO));
--	if(!fio) return NULL;
-+	if (!fio) {
-+		return NULL;
-+	}
- 	fio->io = io;
- 	fio->handle = handle;
-+	fio->thumbnailCount = 0;
- 
- 	if (read) {
- 		fio->tif = TIFFFdOpen((thandle_t)fio, "", "r");
-@@ -1108,6 +1112,27 @@ check for uncommon bitspersample values
- */
- static BOOL 
- IsValidBitsPerSample(uint16 photometric, uint16 bitspersample, uint16 samplesperpixel) {
-+	// get the pixel depth in bits
-+	const uint16 pixel_depth = bitspersample * samplesperpixel;
-+
-+	// check for a supported pixel depth
-+	switch (pixel_depth) {
-+		case 1:
-+		case 4:
-+		case 8:
-+		case 16:
-+		case 24:
-+		case 32:
-+		case 48:
-+		case 64:
-+		case 96:
-+		case 128:
-+			// OK, go on
-+			break;
-+		default:
-+			// unsupported pixel depth
-+			return FALSE;
-+	}
- 
- 	switch(bitspersample) {
- 		case 1:
-@@ -1148,6 +1173,8 @@ IsValidBitsPerSample(uint16 photometric,
- 		default:
- 			return FALSE;
- 	}
-+
-+	return FALSE;
- }
- 
- static TIFFLoadMethod  
-@@ -1237,15 +1264,30 @@ Read embedded thumbnail
- static void 
- ReadThumbnail(FreeImageIO *io, fi_handle handle, void *data, TIFF *tiff, FIBITMAP *dib) {
- 	FIBITMAP* thumbnail = NULL;
--	
-+
-+	fi_TIFFIO *fio = (fi_TIFFIO*)data;
-+
-+	/*
-+	Thumbnail loading can cause recursions because of the way
-+	functions TIFFLastDirectory and TIFFSetSubDirectory are working.
-+	We use here a hack to count the number of times the ReadThumbnail function was called.
-+	We only allow one call, check for this
-+	*/
-+	if (fio->thumbnailCount > 0) {
-+		return;
-+	}
-+	else {
-+		// update the thumbnail count (used to avoid recursion)
-+		fio->thumbnailCount++;
-+	}
-+
- 	// read exif thumbnail (IFD 1) ...
- 	
--	/*
--	// this code can cause unwanted recursion causing an overflow, it is thus disabled until we have a better solution
--	// do we really need to read a thumbnail from the Exif segment ? knowing that TIFF store the thumbnail in the subIFD ...
--	// 
- 	toff_t exif_offset = 0;
- 	if(TIFFGetField(tiff, TIFFTAG_EXIFIFD, &exif_offset)) {
-+
-+		// this code can cause unwanted recursion causing an overflow, because of the way TIFFLastDirectory work
-+		// => this is checked using
- 		
- 		if(!TIFFLastDirectory(tiff)) {
- 			// save current position
-@@ -1256,15 +1298,15 @@ ReadThumbnail(FreeImageIO *io, fi_handle
- 			int page = 1;
- 			int flags = TIFF_DEFAULT;
- 			thumbnail = Load(io, handle, page, flags, data);
-+
- 			// store the thumbnail (remember to release it before return)
- 			FreeImage_SetThumbnail(dib, thumbnail);
--			
-+
- 			// restore current position
- 			io->seek_proc(handle, tell_pos, SEEK_SET);
- 			TIFFSetDirectory(tiff, cur_dir);
- 		}
- 	}
--	*/
- 	
- 	// ... or read the first subIFD
- 	
-@@ -1281,11 +1323,14 @@ ReadThumbnail(FreeImageIO *io, fi_handle
- 				const long tell_pos = io->tell_proc(handle);
- 				const uint16 cur_dir = TIFFCurrentDirectory(tiff);
- 				
-+                // this code can cause unwanted recursion causing an overflow, because of the way TIFFSetSubDirectory work
-+
- 				if(TIFFSetSubDirectory(tiff, subIFD_offsets[0])) {
- 					// load the thumbnail
- 					int page = -1; 
- 					int flags = TIFF_DEFAULT;
- 					thumbnail = Load(io, handle, page, flags, data);
-+
- 					// store the thumbnail (remember to release it before return)
- 					FreeImage_SetThumbnail(dib, thumbnail);
- 				}
-@@ -2041,7 +2086,7 @@ Load(FreeImageIO *io, fi_handle handle,
- 				}
- 
- 				// calculate src line and dst pitch
--				int dst_pitch = FreeImage_GetPitch(dib);
-+				unsigned dst_pitch = FreeImage_GetPitch(dib);
- 				uint32 tileRowSize = (uint32)TIFFTileRowSize(tif);
- 				uint32 imageRowSize = (uint32)TIFFScanlineSize(tif);
- 
-@@ -2071,7 +2116,7 @@ Load(FreeImageIO *io, fi_handle handle,
- 						BYTE *src_bits = tileBuffer;
- 						BYTE *dst_bits = bits + rowSize;
- 						for(int k = 0; k < nrows; k++) {
--							memcpy(dst_bits, src_bits, src_line);
-+							memcpy(dst_bits, src_bits, MIN(dst_pitch, src_line));
- 							src_bits += tileRowSize;
- 							dst_bits -= dst_pitch;
- 						}
diff --git a/package/libfreeimage/0008-CVE-2020-24292.patch b/package/libfreeimage/0008-CVE-2020-24292.patch
deleted file mode 100644
index 780f93640e..0000000000
--- a/package/libfreeimage/0008-CVE-2020-24292.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-CVE: CVE-2020-24292
-Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2020-24292.patch
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
-diff -rupN a/Source/FreeImage/PluginICO.cpp b/Source/FreeImage/PluginICO.cpp
---- a/Source/FreeImage/PluginICO.cpp
-+++ b/Source/FreeImage/PluginICO.cpp
-@@ -301,6 +301,9 @@ LoadStandardIcon(FreeImageIO *io, fi_han
- 	int width  = bmih.biWidth;
- 	int height = bmih.biHeight / 2; // height == xor + and mask
- 	unsigned bit_count = bmih.biBitCount;
-+	if (bit_count != 1 && bit_count != 2 && bit_count != 4 && bit_count != 8 && bit_count != 16 && bit_count != 24 && bit_count != 32) {
-+	  return NULL;
-+	}
- 	unsigned line   = CalculateLine(width, bit_count);
- 	unsigned pitch  = CalculatePitch(line);
- 
diff --git a/package/libfreeimage/0009-CVE-2020-24293.patch b/package/libfreeimage/0009-CVE-2020-24293.patch
deleted file mode 100644
index 16466e881a..0000000000
--- a/package/libfreeimage/0009-CVE-2020-24293.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-CVE: CVE-2020-24293
-Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2020-24293.patch
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
-diff -rupN a/Source/FreeImage/PSDParser.cpp b/Source/FreeImage/PSDParser.cpp
---- a/Source/FreeImage/PSDParser.cpp
-+++ b/Source/FreeImage/PSDParser.cpp
-@@ -780,6 +780,10 @@ int psdThumbnail::Read(FreeImageIO *io,
- 		FreeImage_Unload(_dib);
- 	}
- 
-+	if (_WidthBytes != _Width * _BitPerPixel / 8) {
-+	  throw "Invalid PSD image";
-+	}
-+
- 	if(_Format == 1) {
- 		// kJpegRGB thumbnail image
- 		_dib = FreeImage_LoadFromHandle(FIF_JPEG, io, handle);
diff --git a/package/libfreeimage/0010-CVE-2020-24295.patch b/package/libfreeimage/0010-CVE-2020-24295.patch
deleted file mode 100644
index 295791a26e..0000000000
--- a/package/libfreeimage/0010-CVE-2020-24295.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-CVE: CVE-2020-24295
-Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2020-24295.patch
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
-diff -rupN a/Source/FreeImage/PSDParser.cpp b/Source/FreeImage/PSDParser.cpp
---- a/Source/FreeImage/PSDParser.cpp
-+++ b/Source/FreeImage/PSDParser.cpp
-@@ -1466,6 +1466,7 @@ FIBITMAP* psdParser::ReadImageData(FreeI
- 	const unsigned dstBpp =  (depth == 1) ? 1 : FreeImage_GetBPP(bitmap)/8;
- 	const unsigned dstLineSize = FreeImage_GetPitch(bitmap);
- 	BYTE* const dst_first_line = FreeImage_GetScanLine(bitmap, nHeight - 1);//<*** flipped
-+	const unsigned dst_buffer_size = dstLineSize * nHeight;
- 
- 	BYTE* line_start = new BYTE[lineSize]; //< fileline cache
- 
-@@ -1481,6 +1482,9 @@ FIBITMAP* psdParser::ReadImageData(FreeI
- 				const unsigned channelOffset = GetChannelOffset(bitmap, c) * bytes;
- 
- 				BYTE* dst_line_start = dst_first_line + channelOffset;
-+				if (channelOffset + lineSize > dst_buffer_size) {
-+					throw "Invalid PSD image";
-+				}
- 				for(unsigned h = 0; h < nHeight; ++h, dst_line_start -= dstLineSize) {//<*** flipped
- 					io->read_proc(line_start, lineSize, 1, handle);
- 					ReadImageLine(dst_line_start, line_start, lineSize, dstBpp, bytes);
diff --git a/package/libfreeimage/0011-CVE-2021-33367.patch b/package/libfreeimage/0011-CVE-2021-33367.patch
deleted file mode 100644
index 2c77766b8a..0000000000
--- a/package/libfreeimage/0011-CVE-2021-33367.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-CVE: CVE-2021-33367
-Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2021-33367.patch
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
-diff -rupN a/Source/Metadata/Exif.cpp b/Source/Metadata/Exif.cpp
---- a/Source/Metadata/Exif.cpp
-+++ b/Source/Metadata/Exif.cpp
-@@ -719,8 +719,13 @@ jpeg_read_exif_dir(FIBITMAP *dib, const
- 	//
- 
- 	const WORD entriesCount0th = ReadUint16(msb_order, ifd0th);
--	
--	DWORD next_offset = ReadUint32(msb_order, DIR_ENTRY_ADDR(ifd0th, entriesCount0th));
-+
-+	const BYTE* de_addr = DIR_ENTRY_ADDR(ifd0th, entriesCount0th);
-+	if(de_addr+4 >= (BYTE*)(dwLength + ifd0th - tiffp)) {
-+		return TRUE; //< no thumbnail
-+	}
-+
-+	DWORD next_offset = ReadUint32(msb_order, de_addr);
- 	if((next_offset == 0) || (next_offset >= dwLength)) {
- 		return TRUE; //< no thumbnail
- 	}
diff --git a/package/libfreeimage/0012-CVE-2021-40263.patch b/package/libfreeimage/0012-CVE-2021-40263.patch
deleted file mode 100644
index e5b6e68c8a..0000000000
--- a/package/libfreeimage/0012-CVE-2021-40263.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-CVE: CVE-2021-40263
-Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2021-40263.patch
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
-diff -rupN a/Source/FreeImage/PluginTIFF.cpp b/Source/FreeImage/PluginTIFF.cpp
---- a/Source/FreeImage/PluginTIFF.cpp
-+++ b/Source/FreeImage/PluginTIFF.cpp
-@@ -2090,6 +2090,10 @@ Load(FreeImageIO *io, fi_handle handle,
- 				uint32 tileRowSize = (uint32)TIFFTileRowSize(tif);
- 				uint32 imageRowSize = (uint32)TIFFScanlineSize(tif);
- 
-+				if (width / tileWidth * tileRowSize * 8 > bitspersample * samplesperpixel * width) {
-+				  free(tileBuffer);
-+				  throw "Corrupted tiled TIFF file";
-+				}
- 
- 				// In the tiff file the lines are saved from up to down 
- 				// In a DIB the lines must be saved from down to up
diff --git a/package/libfreeimage/0013-CVE-2021-40266.patch b/package/libfreeimage/0013-CVE-2021-40266.patch
deleted file mode 100644
index 0bd49ba3f8..0000000000
--- a/package/libfreeimage/0013-CVE-2021-40266.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-CVE: CVE-2021-40266
-Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2021-40266.patch
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
-diff -rupN a/Source/FreeImage/PluginTIFF.cpp b/Source/FreeImage/PluginTIFF.cpp
---- a/Source/FreeImage/PluginTIFF.cpp
-+++ b/Source/FreeImage/PluginTIFF.cpp
-@@ -366,6 +366,10 @@ static void
- ReadPalette(TIFF *tiff, uint16 photometric, uint16 bitspersample, FIBITMAP *dib) {
- 	RGBQUAD *pal = FreeImage_GetPalette(dib);
- 
-+	if (!pal) {
-+	  return;
-+	}
-+
- 	switch(photometric) {
- 		case PHOTOMETRIC_MINISBLACK:	// bitmap and greyscale image types
- 		case PHOTOMETRIC_MINISWHITE:
diff --git a/package/libfreeimage/0014-CVE-2023-47995.patch b/package/libfreeimage/0014-CVE-2023-47995.patch
deleted file mode 100644
index 48456c3650..0000000000
--- a/package/libfreeimage/0014-CVE-2023-47995.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-CVE: CVE-2023-47995
-Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2023-47995.patch
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
-diff -rupN a/Source/FreeImage/PluginJPEG.cpp b/Source/FreeImage/PluginJPEG.cpp
---- a/Source/FreeImage/PluginJPEG.cpp
-+++ b/Source/FreeImage/PluginJPEG.cpp
-@@ -1196,6 +1196,10 @@ Load(FreeImageIO *io, fi_handle handle,
- 
- 			jpeg_read_header(&cinfo, TRUE);
- 
-+			if (cinfo.image_width > JPEG_MAX_DIMENSION || cinfo.image_height > JPEG_MAX_DIMENSION) {
-+				throw FI_MSG_ERROR_DIB_MEMORY;
-+			}
-+
- 			// step 4: set parameters for decompression
- 
- 			unsigned int scale_denom = 1;		// fraction by which to scale image
diff --git a/package/libfreeimage/0015-CVE-2023-47997.patch b/package/libfreeimage/0015-CVE-2023-47997.patch
deleted file mode 100644
index 05278d39b8..0000000000
--- a/package/libfreeimage/0015-CVE-2023-47997.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-CVE: CVE-2023-47997
-Upstream: https://src.fedoraproject.org/rpms/freeimage/raw/rawhide/f/CVE-2023-47997.patch
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
-diff -rupN a/Source/FreeImage/PluginTIFF.cpp b/Source/FreeImage/PluginTIFF.cpp
---- a/Source/FreeImage/PluginTIFF.cpp
-+++ b/Source/FreeImage/PluginTIFF.cpp
-@@ -1444,6 +1444,12 @@ Load(FreeImageIO *io, fi_handle handle,
- 				(int)bitspersample, (int)samplesperpixel, (int)photometric);
- 			throw (char*)NULL;
- 		}
-+		if (planar_config == PLANARCONFIG_SEPARATE && bitspersample < 8) {
-+			FreeImage_OutputMessageProc(s_format_id,
-+				"Unable to handle this format: bitspersample = 8, TIFFTAG_PLANARCONFIG = PLANARCONFIG_SEPARATE"
-+			);
-+			throw (char*)NULL;
-+		}
- 
- 		// ---------------------------------------------------------------------------------
- 
diff --git a/package/libfreeimage/Config.in b/package/libfreeimage/Config.in
deleted file mode 100644
index 9bffd035b7..0000000000
--- a/package/libfreeimage/Config.in
+++ /dev/null
@@ -1,18 +0,0 @@
-config BR2_PACKAGE_LIBFREEIMAGE
-	bool "libfreeimage"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_WCHAR
-	# compiler issue: "Error: invalid register number `63'"
-	depends on !BR2_arc
-	help
-	  FreeImage is an Open Source library project for developers who
-	  would like to support popular graphics image formats like PNG,
-	  BMP, JPEG, TIFF and others as needed by today's multimedia
-	  applications.
-
-	  http://freeimage.sourceforge.net
-
-comment "libfreeimage needs a toolchain w/ C++, dynamic library, wchar"
-	depends on !BR2_arc
-	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/libfreeimage/libfreeimage.hash b/package/libfreeimage/libfreeimage.hash
deleted file mode 100644
index 388f3bb52d..0000000000
--- a/package/libfreeimage/libfreeimage.hash
+++ /dev/null
@@ -1,9 +0,0 @@
-# From https://sourceforge.net/projects/freeimage/files/Source%20Distribution/3.18.0/
-md5  f8ba138a3be233a3eed9c456e42e2578  FreeImage3180.zip
-sha1  38daa9d8f1bca2330a2eaa42ec66fbe6ede7dce9  FreeImage3180.zip
-
-# Locally computed
-sha256  f41379682f9ada94ea7b34fe86bf9ee00935a3147be41b6569c9605a53e438fd  FreeImage3180.zip
-sha256  d51615a1a47f1ddbb027920d60d3fc30a00e1284c795a47857883e641349fadf  license-gplv2.txt
-sha256  084be110e3e8757d8e6945cda1fbc7e5073bbe688dc19b92c0d8440155d8e282  license-gplv3.txt
-sha256  0bb9a3123297c73ae6e19c70459fb0e58f313f67ca63176fd43f8e77668b8243  license-fi.txt
diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
deleted file mode 100644
index 86362bc1c4..0000000000
--- a/package/libfreeimage/libfreeimage.mk
+++ /dev/null
@@ -1,62 +0,0 @@
-################################################################################
-#
-# libfreeimage
-#
-################################################################################
-
-LIBFREEIMAGE_VERSION = 3.18.0
-LIBFREEIMAGE_SITE = http://downloads.sourceforge.net/freeimage
-LIBFREEIMAGE_SOURCE = FreeImage$(subst .,,$(LIBFREEIMAGE_VERSION)).zip
-LIBFREEIMAGE_LICENSE = GPL-2.0 or GPL-3.0 or FreeImage Public License
-LIBFREEIMAGE_LICENSE_FILES = license-gplv2.txt license-gplv3.txt license-fi.txt
-LIBFREEIMAGE_CPE_ID_VENDOR = freeimage_project
-LIBFREEIMAGE_CPE_ID_PRODUCT = freeimage
-LIBFREEIMAGE_INSTALL_STAGING = YES
-
-# 0007-CVE-2019-12211_2019-12213.patch
-LIBFREEIMAGE_IGNORE_CVES += CVE-2019-12211 CVE-2019-12213
-
-# 0008-CVE-2020-24292.patch
-LIBFREEIMAGE_IGNORE_CVES += CVE-2020-24292
-
-# 0009-CVE-2020-24293.patch
-LIBFREEIMAGE_IGNORE_CVES += CVE-2020-24293
-
-# 0010-CVE-2020-24295.patch
-LIBFREEIMAGE_IGNORE_CVES += CVE-2020-24295
-
-# 0011-CVE-2021-33367.patch
-LIBFREEIMAGE_IGNORE_CVES += CVE-2021-33367
-
-# 0012-CVE-2021-40263.patch
-LIBFREEIMAGE_IGNORE_CVES += CVE-2021-40263
-
-# 0013-CVE-2021-40266.patch
-LIBFREEIMAGE_IGNORE_CVES += CVE-2021-40266
-
-# 0014-CVE-2023-47995.patch
-LIBFREEIMAGE_IGNORE_CVES += CVE-2023-47995
-
-# 0016-CVE-2023-47997.patch
-LIBFREEIMAGE_IGNORE_CVES += CVE-2023-47997
-
-define LIBFREEIMAGE_EXTRACT_CMDS
-	$(UNZIP) $(LIBFREEIMAGE_DL_DIR)/$(LIBFREEIMAGE_SOURCE) -d $(@D)
-	mv $(@D)/FreeImage/* $(@D)
-	rmdir $(@D)/FreeImage
-endef
-
-define LIBFREEIMAGE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
-		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" $(MAKE) -C $(@D)
-endef
-
-define LIBFREEIMAGE_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
-endef
-
-define LIBFREEIMAGE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))

--===============1893354430549028422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1893354430549028422==--
