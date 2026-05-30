Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67ADCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1A0D42ED3;
	Sat, 30 May 2026 13:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3polEfAn3hx; Sat, 30 May 2026 13:52:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F17642EE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149168;
	bh=YYx5R7hDl/64/24QJ33PqZewbzDxrfCOwo24Gziwyxk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qvtXl1KgnOkir8NtIcEc2i99Nl5TFrEc8GCUvM/9yofO4XfIeSEHgixjp0uElkkGD
	 TU87vuMzq80/aVGQaFD6MMAkqyb+iuYwgsG5t9gjAJHWbRZcXt1HtGyeNoRvDhmzi1
	 r5eYjYboy4+1wQVqsVzlIhrCqx0yZo8xXiXBGANhR1Jv0es6LDv7Grbw8/M74gwFTT
	 CNjyzu+mlZVCqakBsQbmR4TmXo2BE16Q7pM9yTjlM7n0qJsGIHofCEuyHV2U0OxEsT
	 kOwUD7aSjJHYL9PwSfL87UJ4fPBy6zfLLcC7GHHZam8mds6BCSHXguF0iesWXGO3u+
	 cWnYXmqTX7gPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F17642EE3;
	Sat, 30 May 2026 13:52:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B770F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 750B942DF6
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDgfatqyRboN for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60C5742DC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60C5742DC7
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 643228750A; Sat, 30 May 2026 13:52:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c35794d2f3628a11b4a5e4722e05f5a8682d555e
X-Git-Newrev: 045c5270cfdff50d975a2007b1555519afc9b46f
X-Patchwork-Hint: ignore
Message-Id: <20260530135221.643228750A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cups-filters: fix
 build against qpdf 12
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
Content-Type: multipart/mixed; boundary="===============4089058538622173043=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4089058538622173043==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/045c5270cfdff50d975a2007b1555519afc9b46f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

This patch adds fixes for cups-filters so it can be build with newer
versions of qpdf that made changes to PointerHolder:
https://github.com/qpdf/qpdf/blob/v12.3.2/manual/design.rst#smart-pointers

Build-tested using this defconfig:

BR2_PACKAGE_CUPS=y
BR2_PACKAGE_CUPS_FILTERS=y

                             arm-aarch64 [ 1/32]: OK
                   bootlin-aarch64-glibc [ 2/32]: OK
               bootlin-aarch64-glibc-old [ 3/32]: SKIPPED
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                   bootlin-armv7m-uclibc [ 7/32]: SKIPPED
                      bootlin-armv7-musl [ 8/32]: OK
                bootlin-m68k-5208-uclibc [ 9/32]: SKIPPED
               bootlin-m68k-68040-uclibc [10/32]: OK
             bootlin-microblazeel-uclibc [11/32]: OK
                  bootlin-mips64el-glibc [12/32]: OK
                bootlin-mipsel32r6-glibc [13/32]: OK
                   bootlin-mipsel-uclibc [14/32]: OK
                 bootlin-openrisc-uclibc [15/32]: OK
        bootlin-powerpc64le-power8-glibc [16/32]: OK
           bootlin-powerpc-e500mc-uclibc [17/32]: OK
                   bootlin-riscv32-glibc [18/32]: OK
                   bootlin-riscv64-glibc [19/32]: OK
                    bootlin-riscv64-musl [20/32]: OK
                 bootlin-s390x-z13-glibc [21/32]: OK
                      bootlin-sh4-uclibc [22/32]: OK
                   bootlin-sparc64-glibc [23/32]: OK
                    bootlin-sparc-uclibc [24/32]: OK
                    bootlin-x86-64-glibc [25/32]: OK
                     bootlin-x86-64-musl [26/32]: OK
                   bootlin-x86-64-uclibc [27/32]: OK
                   bootlin-x86-i686-musl [28/32]: OK
                   bootlin-xtensa-uclibc [29/32]: OK
                            br-arm-basic [30/32]: SKIPPED
                    br-arm-full-nothread [31/32]: SKIPPED
                      br-arm-full-static [32/32]: SKIPPED

32 builds, 6 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

This solution avoids[1] a version bump of this package while keeping
compatibility with the newest version of qpdf. The bump of qpdf is
needed to fix build errors with gcc 16.x.

[1] https://lists.buildroot.org/pipermail/buildroot/2025-August/784931.html
Thomas: "which means duplicating all the crazy dependencies of
libcupsfilters yes :/"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...cupsfilters-Fixed-building-with-QPDF-11.x.patch |  57 +++++++
 ...4-Updated-code-to-be-built-with-QPDF-12.x.patch | 165 +++++++++++++++++++++
 package/cups-filters/cups-filters.mk               |   4 +
 3 files changed, 226 insertions(+)

diff --git a/package/cups-filters/0003-libcupsfilters-Fixed-building-with-QPDF-11.x.patch b/package/cups-filters/0003-libcupsfilters-Fixed-building-with-QPDF-11.x.patch
new file mode 100644
index 0000000000..f4dc04d3cf
--- /dev/null
+++ b/package/cups-filters/0003-libcupsfilters-Fixed-building-with-QPDF-11.x.patch
@@ -0,0 +1,57 @@
+From 0cce0968980e8fdd9053cba436a66246b2303a84 Mon Sep 17 00:00:00 2001
+From: Till Kamppeter <till.kamppeter@gmail.com>
+Date: Wed, 6 Dec 2023 22:56:41 +0100
+Subject: [PATCH] libcupsfilters: Fixed building with QPDF 11.x
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Set CXXFLAGS="-DPOINTERHOLDER_TRANSITION=0" to silence QPDF warnings
+
+QPDF 11 issues warnings about deprecated "PointerHolder", even if the
+code does not use "PointerHolder" any more. This compiler macro
+suppresses the warnings.
+
+See /usr/include/qpdf/PointerHolder.hh of QPDF 11.
+
+Backported from libcupsfilters (2.x), commit 076a994fce
+
+Added "-std=c++17" C++ compiler flag (PR#18)
+
+Needed as otherwise the QPDF.hh file of QPDF 11 causes the error
+
+    ‘std::string_view’ has not been declared
+
+Adding the "-std=c++17" to CXXFLAGS fixes this. See also
+
+    https://stackoverflow.com/questions/58295334/error-stdstring-view-has-no
+t-been-declared
+
+Backported from libcupsfilters (2.x), commit e1daf27c59
+
+Upstream: https://github.com/OpenPrinting/cups-filters/commit/0cce0968980e8fdd9053cba436a66246b2303a84
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 083aecb83..f293e803b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -837,7 +837,10 @@ AS_IF([test x"$GCC" = "xyes"], [
+ 	CXXFLAGS="$CXXFLAGS -Wall " # -Weffc++" # TODO: enable when it does not print 1MB of warnings
+ ])
+ CFLAGS="$CFLAGS -D_GNU_SOURCE"
+-CXXFLAGS="$CXXFLAGS -D_GNU_SOURCE"
++CXXFLAGS="$CXXFLAGS -D_GNU_SOURCE -DPOINTERHOLDER_TRANSITION=0"
++#                                   ^^ Silence deprecation warnings of QPDF 11
++#                                      See /usr/include/qpdf/PointerHolder.hh
++CXXFLAGS="$CXXFLAGS -std=c++17" # Needed to build with current QPDF (11.x)
+ 
+ # ==========================
+ # Braille embossing/liblouis
+-- 
+2.47.3
+
diff --git a/package/cups-filters/0004-Updated-code-to-be-built-with-QPDF-12.x.patch b/package/cups-filters/0004-Updated-code-to-be-built-with-QPDF-12.x.patch
new file mode 100644
index 0000000000..8996a6afce
--- /dev/null
+++ b/package/cups-filters/0004-Updated-code-to-be-built-with-QPDF-12.x.patch
@@ -0,0 +1,165 @@
+From 7b6e46ea6237763104bf2a22eca66ba92a6b71a4 Mon Sep 17 00:00:00 2001
+From: Till Kamppeter <till.kamppeter@gmail.com>
+Date: Wed, 12 Nov 2025 16:10:51 +0100
+Subject: [PATCH] Updated code to be built with QPDF 12.x
+
+- Set `#define POINTERHOLDER_TRANSITION 3`
+- Explicitly `#include <qpdf/PointerHolder.hh>`
+- `ph = (PointerHolder<Buffer>) new Buffer(buff, profile_size);` in `rastertopdf.cpp`
+- Removed `-DPOINTERHOLDER_TRANSITION=0` from `CXXFLAGS` in `configure.ac`
+- Replaced all `replaceOrRemoveKey()` by `replaceKey()`
+
+Upstream: https://github.com/OpenPrinting/cups-filters/commit/7b6e46ea6237763104bf2a22eca66ba92a6b71a4
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac                               |  3 ---
+ filter/pdf.cxx                             |  2 ++
+ filter/pdftopdf/qpdf_pdftopdf_processor.cc | 18 +++++++++---------
+ filter/pdftopdf/qpdf_xobject.cc            |  2 ++
+ filter/rastertopdf.cpp                     |  4 +++-
+ filter/urftopdf.cpp                        |  2 ++
+ 6 files changed, 18 insertions(+), 13 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 32180d0da..702b58a0a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -793,9 +793,6 @@ AS_IF([test x"$GCC" = "xyes"], [
+ 	CXXFLAGS="$CXXFLAGS -Wall " # -Weffc++" # TODO: enable when it does not print 1MB of warnings
+ ])
+ CFLAGS="$CFLAGS -D_GNU_SOURCE"
+-CXXFLAGS="$CXXFLAGS -D_GNU_SOURCE -DPOINTERHOLDER_TRANSITION=0"
+-#                                   ^^ Silence deprecation warnings of QPDF 11
+-#                                      See /usr/include/qpdf/PointerHolder.hh
+ CXXFLAGS="$CXXFLAGS -std=c++17" # Needed to build with current QPDF (11.x)
+ 
+ # ==========================
+diff --git a/filter/pdf.cxx b/filter/pdf.cxx
+index 68b1af912..7d592dc95 100644
+--- a/filter/pdf.cxx
++++ b/filter/pdf.cxx
+@@ -21,6 +21,8 @@
+ #include <vector>
+ #include <string>
+ #include <cstring>
++#define POINTERHOLDER_TRANSITION 3
++#include <qpdf/PointerHolder.hh>
+ #include <qpdf/QPDF.hh>
+ #include <qpdf/QPDFObjectHandle.hh>
+ #include <qpdf/QPDFWriter.hh>
+diff --git a/filter/pdftopdf/qpdf_pdftopdf_processor.cc b/filter/pdftopdf/qpdf_pdftopdf_processor.cc
+index beffc2423..3c21a6512 100644
+--- a/filter/pdftopdf/qpdf_pdftopdf_processor.cc
++++ b/filter/pdftopdf/qpdf_pdftopdf_processor.cc
+@@ -83,10 +83,10 @@ QPDFObjectHandle QPDF_PDFTOPDF_PageHandle::get() // {{{
+     page.getKey("/Resources").replaceKey("/XObject",QPDFObjectHandle::newDictionary(xobjs));
+     content.append("Q\n");
+     page.getKey("/Contents").replaceStreamData(content,QPDFObjectHandle::newNull(),QPDFObjectHandle::newNull());
+-    page.replaceOrRemoveKey("/Rotate",makeRotate(rotation));
++    page.replaceKey("/Rotate",makeRotate(rotation));
+   } else {
+     Rotation rot=getRotate(page)+rotation;
+-    page.replaceOrRemoveKey("/Rotate",makeRotate(rot));
++    page.replaceKey("/Rotate",makeRotate(rot));
+   }
+   page=QPDFObjectHandle(); // i.e. uninitialized
+   return ret;
+@@ -181,9 +181,9 @@ Rotation QPDF_PDFTOPDF_PageHandle::crop(const PageRect &cropRect,Rotation orient
+   page.assertInitialized();
+   Rotation save_rotate = getRotate(page);
+   if(orientation==ROT_0||orientation==ROT_180)
+-    page.replaceOrRemoveKey("/Rotate",makeRotate(ROT_90));
++    page.replaceKey("/Rotate",makeRotate(ROT_90));
+   else
+-    page.replaceOrRemoveKey("/Rotate",makeRotate(ROT_0));
++    page.replaceKey("/Rotate",makeRotate(ROT_0));
+ 
+   PageRect currpage= getBoxAsRect(getTrimBox(page));
+   double width = currpage.right-currpage.left;
+@@ -242,7 +242,7 @@ Rotation QPDF_PDFTOPDF_PageHandle::crop(const PageRect &cropRect,Rotation orient
+   //Cropping.
+   // TODO: Borders are covered by the image. buffer space?
+   page.replaceKey("/TrimBox",makeBox(currpage.left,currpage.bottom,currpage.right,currpage.top));
+-  page.replaceOrRemoveKey("/Rotate",makeRotate(save_rotate));
++  page.replaceKey("/Rotate",makeRotate(save_rotate));
+   return getRotate(page);
+ }
+ 
+@@ -251,14 +251,14 @@ bool QPDF_PDFTOPDF_PageHandle::is_landscape(Rotation orientation)
+   page.assertInitialized();
+   Rotation save_rotate = getRotate(page);
+   if(orientation==ROT_0||orientation==ROT_180)
+-    page.replaceOrRemoveKey("/Rotate",makeRotate(ROT_90));
++    page.replaceKey("/Rotate",makeRotate(ROT_90));
+   else
+-    page.replaceOrRemoveKey("/Rotate",makeRotate(ROT_0));
++    page.replaceKey("/Rotate",makeRotate(ROT_0));
+ 
+   PageRect currpage= getBoxAsRect(getTrimBox(page));
+   double width = currpage.right-currpage.left;
+   double height = currpage.top-currpage.bottom;
+-  page.replaceOrRemoveKey("/Rotate",makeRotate(save_rotate));
++  page.replaceKey("/Rotate",makeRotate(save_rotate));
+   if(width>height)
+     return true;
+   return false;
+@@ -665,7 +665,7 @@ void QPDF_PDFTOPDF_Processor::autoRotateAll(bool dst_lscape,Rotation normal_land
+       // TODO? other rotation direction, e.g. if (src_rot==ROT_0)&&(param.orientation==ROT_270) ... etc.
+       // rotation=ROT_270;
+ 
+-      page.replaceOrRemoveKey("/Rotate",makeRotate(src_rot+rotation));
++      page.replaceKey("/Rotate",makeRotate(src_rot+rotation));
+     }
+   }
+ }
+diff --git a/filter/pdftopdf/qpdf_xobject.cc b/filter/pdftopdf/qpdf_xobject.cc
+index 12732f1e9..2550bdd4f 100644
+--- a/filter/pdftopdf/qpdf_xobject.cc
++++ b/filter/pdftopdf/qpdf_xobject.cc
+@@ -1,5 +1,7 @@
+ #include "qpdf_xobject.h"
+ //#include <qpdf/Types.h>
++#define POINTERHOLDER_TRANSITION 3
++#include <qpdf/PointerHolder.hh>
+ #include <qpdf/QPDF.hh>
+ #include <qpdf/Pl_Discard.hh>
+ #include <qpdf/Pl_Count.hh>
+diff --git a/filter/rastertopdf.cpp b/filter/rastertopdf.cpp
+index ad5dd34c5..6a1aa218f 100644
+--- a/filter/rastertopdf.cpp
++++ b/filter/rastertopdf.cpp
+@@ -39,6 +39,8 @@
+ #include <arpa/inet.h>   // ntohl
+ 
+ #include <vector>
++#define POINTERHOLDER_TRANSITION 3
++#include <qpdf/PointerHolder.hh>
+ #include <qpdf/QPDF.hh>
+ #include <qpdf/QPDFWriter.hh>
+ #include <qpdf/QUtil.hh>
+@@ -481,7 +483,7 @@ QPDFObjectHandle embedIccProfile(QPDF &pdf)
+     cmsSaveProfileToMem(colorProfile, buff, &profile_size);
+ 
+     // Write ICC profile buffer into PDF
+-    ph = new Buffer(buff, profile_size);  
++    ph = (PointerHolder<Buffer>) new Buffer(buff, profile_size);
+     iccstream = QPDFObjectHandle::newStream(&pdf, ph);
+     iccstream.replaceDict(QPDFObjectHandle::newDictionary(streamdict));
+ 
+diff --git a/filter/urftopdf.cpp b/filter/urftopdf.cpp
+index 4e7f6535a..e5c9f1f33 100644
+--- a/filter/urftopdf.cpp
++++ b/filter/urftopdf.cpp
+@@ -32,6 +32,8 @@
+ #include <arpa/inet.h>   // ntohl
+ 
+ #include <vector>
++#define POINTERHOLDER_TRANSITION 3
++#include <qpdf/PointerHolder.hh>
+ #include <qpdf/QPDF.hh>
+ #include <qpdf/QPDFWriter.hh>
+ #include <qpdf/QUtil.hh>
+-- 
+2.47.3
+
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 6bc4610376..eaad301c6d 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -10,6 +10,10 @@ CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+,
 CUPS_FILTERS_LICENSE_FILES = COPYING
 CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
 
+# 0003-libcupsfilters-Fixed-building-with-QPDF-11.x.patch
+# 0004-Updated-code-to-be-built-with-QPDF-12.x.patch
+CUPS_FILTERS_AUTORECONF = YES
+
 # 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
 CUPS_FILTERS_IGNORE_CVES += CVE-2023-24805
 

--===============4089058538622173043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4089058538622173043==--
