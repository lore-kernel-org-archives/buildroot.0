From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Jun 2020 22:01:41 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/lcms2: bump to version 2.10
Message-ID: <20200601200141.1127530-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version)
- Update indentation in hash file (two spaces)
- Update hash of COPYING (update in year:
  https://github.com/mm2/Little-CMS/commit/4ba97f4b686c9988b7632638f915ead64fb6cd69)
- Add GPL-3.0+ for fast floating point plug-in added with
  https://github.com/mm2/Little-CMS/commit/aa64fa73c26bfb61b087ac1dab5cf44b53f57b24

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-Upgrade-Visual-studio-2017-15.8.patch | 174 ------------------
 package/lcms2/lcms2.hash                      |   9 +-
 package/lcms2/lcms2.mk                        |   6 +-
 3 files changed, 8 insertions(+), 181 deletions(-)
 delete mode 100644 package/lcms2/0001-Upgrade-Visual-studio-2017-15.8.patch

diff --git a/package/lcms2/0001-Upgrade-Visual-studio-2017-15.8.patch b/package/lcms2/0001-Upgrade-Visual-studio-2017-15.8.patch
deleted file mode 100644
index c43d934342..0000000000
--- a/package/lcms2/0001-Upgrade-Visual-studio-2017-15.8.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-From 768f70ca405cd3159d990e962d54456773bb8cf8 Mon Sep 17 00:00:00 2001
-From: Marti Maria <info@littlecms.com>
-Date: Wed, 15 Aug 2018 20:07:56 +0200
-Subject: [PATCH] Upgrade Visual studio 2017 15.8
-
-- Upgrade to 15.8
-- Add check on CGATS memory allocation (thanks to Quang Nguyen for
-pointing out this)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Projects/VC2017/jpegicc/jpegicc.vcxproj           |  1 +
- Projects/VC2017/lcms2_DLL/lcms2_DLL.vcxproj       |  2 +-
- Projects/VC2017/lcms2_static/lcms2_static.vcxproj |  2 +-
- Projects/VC2017/linkicc/linkicc.vcxproj           |  2 +-
- Projects/VC2017/psicc/psicc.vcxproj               |  2 +-
- Projects/VC2017/testbed/testbed.vcxproj           |  2 +-
- Projects/VC2017/tiffdiff/tiffdiff.vcxproj         |  2 +-
- Projects/VC2017/tifficc/tifficc.vcxproj           |  2 +-
- Projects/VC2017/transicc/transicc.vcxproj         |  1 +
- src/cmscgats.c                                    | 14 ++++++++++----
- 10 files changed, 19 insertions(+), 11 deletions(-)
-
-diff --git a/Projects/VC2017/jpegicc/jpegicc.vcxproj b/Projects/VC2017/jpegicc/jpegicc.vcxproj
-index ab26a53..39cfd00 100644
---- a/Projects/VC2017/jpegicc/jpegicc.vcxproj
-+++ b/Projects/VC2017/jpegicc/jpegicc.vcxproj
-@@ -22,6 +22,7 @@
-     <ProjectGuid>{62812507-F926-4968-96A9-17678460AD90}</ProjectGuid>
-     <RootNamespace>jpegicc</RootNamespace>
-     <Keyword>Win32Proj</Keyword>
-+    <WindowsTargetPlatformVersion>10.0.17134.0</WindowsTargetPlatformVersion>
-   </PropertyGroup>
-   <Import Project="$(VCTargetsPath)\Microsoft.Cpp.Default.props" />
-   <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'" Label="Configuration">
-diff --git a/Projects/VC2017/lcms2_DLL/lcms2_DLL.vcxproj b/Projects/VC2017/lcms2_DLL/lcms2_DLL.vcxproj
-index 4c8aa3f..d1bf3eb 100644
---- a/Projects/VC2017/lcms2_DLL/lcms2_DLL.vcxproj
-+++ b/Projects/VC2017/lcms2_DLL/lcms2_DLL.vcxproj
-@@ -22,7 +22,7 @@
-     <ProjectGuid>{8C51BE48-ADB8-4089-A9EC-F6BF993A0548}</ProjectGuid>
-     <RootNamespace>lcms2_DLL</RootNamespace>
-     <Keyword>Win32Proj</Keyword>
--    <WindowsTargetPlatformVersion>8.1</WindowsTargetPlatformVersion>
-+    <WindowsTargetPlatformVersion>10.0.17134.0</WindowsTargetPlatformVersion>
-   </PropertyGroup>
-   <Import Project="$(VCTargetsPath)\Microsoft.Cpp.Default.props" />
-   <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'" Label="Configuration">
-diff --git a/Projects/VC2017/lcms2_static/lcms2_static.vcxproj b/Projects/VC2017/lcms2_static/lcms2_static.vcxproj
-index 2a9988a..9fc05ce 100644
---- a/Projects/VC2017/lcms2_static/lcms2_static.vcxproj
-+++ b/Projects/VC2017/lcms2_static/lcms2_static.vcxproj
-@@ -22,7 +22,7 @@
-     <ProjectGuid>{71DEDE59-3F1E-486B-A899-4283000F76B5}</ProjectGuid>
-     <RootNamespace>lcms2_static</RootNamespace>
-     <Keyword>Win32Proj</Keyword>
--    <WindowsTargetPlatformVersion>8.1</WindowsTargetPlatformVersion>
-+    <WindowsTargetPlatformVersion>10.0.17134.0</WindowsTargetPlatformVersion>
-   </PropertyGroup>
-   <Import Project="$(VCTargetsPath)\Microsoft.Cpp.Default.props" />
-   <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'" Label="Configuration">
-diff --git a/Projects/VC2017/linkicc/linkicc.vcxproj b/Projects/VC2017/linkicc/linkicc.vcxproj
-index 30c2b4e..51586dd 100644
---- a/Projects/VC2017/linkicc/linkicc.vcxproj
-+++ b/Projects/VC2017/linkicc/linkicc.vcxproj
-@@ -22,7 +22,7 @@
-     <ProjectGuid>{FBFBE1DC-DB84-4BA1-9552-B4780F457849}</ProjectGuid>
-     <RootNamespace>linkicc</RootNamespace>
-     <Keyword>Win32Proj</Keyword>
--    <WindowsTargetPlatformVersion>8.1</WindowsTargetPlatformVersion>
-+    <WindowsTargetPlatformVersion>10.0.17134.0</WindowsTargetPlatformVersion>
-   </PropertyGroup>
-   <Import Project="$(VCTargetsPath)\Microsoft.Cpp.Default.props" />
-   <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'" Label="Configuration">
-diff --git a/Projects/VC2017/psicc/psicc.vcxproj b/Projects/VC2017/psicc/psicc.vcxproj
-index 9dcf89a..8f26e12 100644
---- a/Projects/VC2017/psicc/psicc.vcxproj
-+++ b/Projects/VC2017/psicc/psicc.vcxproj
-@@ -22,7 +22,7 @@
-     <ProjectGuid>{EF6A8851-65FE-46F5-B9EF-14F0B671F693}</ProjectGuid>
-     <RootNamespace>psicc</RootNamespace>
-     <Keyword>Win32Proj</Keyword>
--    <WindowsTargetPlatformVersion>8.1</WindowsTargetPlatformVersion>
-+    <WindowsTargetPlatformVersion>10.0.17134.0</WindowsTargetPlatformVersion>
-   </PropertyGroup>
-   <Import Project="$(VCTargetsPath)\Microsoft.Cpp.Default.props" />
-   <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'" Label="Configuration">
-diff --git a/Projects/VC2017/testbed/testbed.vcxproj b/Projects/VC2017/testbed/testbed.vcxproj
-index 0af3762..3f6aea3 100644
---- a/Projects/VC2017/testbed/testbed.vcxproj
-+++ b/Projects/VC2017/testbed/testbed.vcxproj
-@@ -22,7 +22,7 @@
-     <ProjectGuid>{928A3A2B-46EF-4279-959C-513B3652FF0E}</ProjectGuid>
-     <RootNamespace>testbed</RootNamespace>
-     <Keyword>Win32Proj</Keyword>
--    <WindowsTargetPlatformVersion>8.1</WindowsTargetPlatformVersion>
-+    <WindowsTargetPlatformVersion>10.0.17134.0</WindowsTargetPlatformVersion>
-   </PropertyGroup>
-   <Import Project="$(VCTargetsPath)\Microsoft.Cpp.Default.props" />
-   <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'" Label="Configuration">
-diff --git a/Projects/VC2017/tiffdiff/tiffdiff.vcxproj b/Projects/VC2017/tiffdiff/tiffdiff.vcxproj
-index 7edfe28..3a6d837 100644
---- a/Projects/VC2017/tiffdiff/tiffdiff.vcxproj
-+++ b/Projects/VC2017/tiffdiff/tiffdiff.vcxproj
-@@ -22,7 +22,7 @@
-     <ProjectGuid>{75B91835-CCD7-48BE-A606-A9C997D5DBEE}</ProjectGuid>
-     <RootNamespace>tiffdiff</RootNamespace>
-     <Keyword>Win32Proj</Keyword>
--    <WindowsTargetPlatformVersion>8.1</WindowsTargetPlatformVersion>
-+    <WindowsTargetPlatformVersion>10.0.17134.0</WindowsTargetPlatformVersion>
-   </PropertyGroup>
-   <Import Project="$(VCTargetsPath)\Microsoft.Cpp.Default.props" />
-   <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'" Label="Configuration">
-diff --git a/Projects/VC2017/tifficc/tifficc.vcxproj b/Projects/VC2017/tifficc/tifficc.vcxproj
-index cd9f04c..5ef954f 100644
---- a/Projects/VC2017/tifficc/tifficc.vcxproj
-+++ b/Projects/VC2017/tifficc/tifficc.vcxproj
-@@ -22,7 +22,7 @@
-     <ProjectGuid>{2256DE16-ED92-4A6F-9C54-F65BB61E64A2}</ProjectGuid>
-     <RootNamespace>tifficc</RootNamespace>
-     <Keyword>Win32Proj</Keyword>
--    <WindowsTargetPlatformVersion>8.1</WindowsTargetPlatformVersion>
-+    <WindowsTargetPlatformVersion>10.0.17134.0</WindowsTargetPlatformVersion>
-   </PropertyGroup>
-   <Import Project="$(VCTargetsPath)\Microsoft.Cpp.Default.props" />
-   <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'" Label="Configuration">
-diff --git a/Projects/VC2017/transicc/transicc.vcxproj b/Projects/VC2017/transicc/transicc.vcxproj
-index d9b77c6..b3173d8 100644
---- a/Projects/VC2017/transicc/transicc.vcxproj
-+++ b/Projects/VC2017/transicc/transicc.vcxproj
-@@ -22,6 +22,7 @@
-     <ProjectGuid>{9EE22D66-C849-474C-9ED5-C3E141DAB160}</ProjectGuid>
-     <RootNamespace>transicc</RootNamespace>
-     <Keyword>Win32Proj</Keyword>
-+    <WindowsTargetPlatformVersion>10.0.17134.0</WindowsTargetPlatformVersion>
-   </PropertyGroup>
-   <Import Project="$(VCTargetsPath)\Microsoft.Cpp.Default.props" />
-   <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'" Label="Configuration">
-diff --git a/src/cmscgats.c b/src/cmscgats.c
-index 1a87613..8c3e96d 100644
---- a/src/cmscgats.c
-+++ b/src/cmscgats.c
-@@ -1,7 +1,7 @@
- //---------------------------------------------------------------------------------
- //
- //  Little Color Management System
--//  Copyright (c) 1998-2017 Marti Maria Saguer
-+//  Copyright (c) 1998-2018 Marti Maria Saguer
- //
- // Permission is hereby granted, free of charge, to any person obtaining
- // a copy of this software and associated documentation files (the "Software"),
-@@ -1506,10 +1506,16 @@ void AllocateDataSet(cmsIT8* it8)
-     t-> nSamples   = atoi(cmsIT8GetProperty(it8, "NUMBER_OF_FIELDS"));
-     t-> nPatches   = atoi(cmsIT8GetProperty(it8, "NUMBER_OF_SETS"));
- 
--    t-> Data = (char**)AllocChunk (it8, ((cmsUInt32Number) t->nSamples + 1) * ((cmsUInt32Number) t->nPatches + 1) *sizeof (char*));
--    if (t->Data == NULL) {
-+    if (t -> nSamples < 0 || t->nSamples > 0x7ffe || t->nPatches < 0 || t->nPatches > 0x7ffe)
-+    {
-+        SynError(it8, "AllocateDataSet: too much data");
-+    }
-+    else {
-+        t->Data = (char**)AllocChunk(it8, ((cmsUInt32Number)t->nSamples + 1) * ((cmsUInt32Number)t->nPatches + 1) * sizeof(char*));
-+        if (t->Data == NULL) {
- 
--        SynError(it8, "AllocateDataSet: Unable to allocate data array");
-+            SynError(it8, "AllocateDataSet: Unable to allocate data array");
-+        }
-     }
- 
- }
--- 
-2.11.0
-
diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index 248a08cf87..1fdfc40df1 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,6 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.9
-sha1 60bea9875e017dd1c466e988c2ad98f8766e4e55 lcms2-2.9.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.10
+sha1  59bcebaf15c1c4b21815708cb68498b9b5d40db3  lcms2-2.10.tar.gz
 # Locally computed:
-sha256 48c6fdf98396fa245ed86e622028caf49b96fa22f3e5734f853f806fbc8e7d20 lcms2-2.9.tar.gz
-sha256 c725daac91a9259ce5e195683c0eeb797d345035c36ac5ba114c9fa80e11639a COPYING
+sha256  e11bc4e538587ec1530f9fef25f77261b94d5886c5ea81d8bb171a802df970ad  lcms2-2.10.tar.gz
+sha256  53ad5ca11b8f4079e9c9bfa61575927a33f53526d6d414287149ec3ab61e8e4d  COPYING
+sha256  c53a65c2fd561c87eaabf1072ef5dcab8653042bc15308465f52413585eb6271  plugins/fast_float/COPYING.GPL3
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index b6c292b762..c7bdd500dd 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.9
+LCMS2_VERSION = 2.10
 LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
-LCMS2_LICENSE = MIT
-LCMS2_LICENSE_FILES = COPYING
+LCMS2_LICENSE = MIT (core), GPL-3.0+ (fast_float plugin)
+LCMS2_LICENSE_FILES = COPYING plugins/fast_float/COPYING.GPL3 
 LCMS2_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-- 
2.26.2
