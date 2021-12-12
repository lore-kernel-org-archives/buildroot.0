Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB68C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 13:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F28878502B;
	Sun, 12 Dec 2021 13:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hidQ6ZllDwQ8; Sun, 12 Dec 2021 13:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A184E85017;
	Sun, 12 Dec 2021 13:50:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B83C81BF36C
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 13:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C7774092D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 13:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LbhLDY9jhJrl for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 13:50:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AF7440918
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 13:50:07 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout06.t-online.de (Postfix) with SMTP id 5EC4C10B1D;
 Sun, 12 Dec 2021 14:50:00 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.123]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mwPEi-27c6KH0; Sun, 12 Dec 2021 14:49:56 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:49424)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mwPEh-00029p-C5;
 Sun, 12 Dec 2021 14:49:56 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 14:49:55 +0100
Message-Id: <20211212134955.3178311-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1639316996-00001467-D26E7BAB/0/0 CLEAN NORMAL
X-TOI-MSGID: ea9a623a-6fb9-4522-a70a-828ad9651fd3
Subject: [Buildroot] [PATCH 1/1] package/bento4: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for the upcoming Nexus version of kodi-inputstream-adaptive,
the bundled version of bento4 was removed upstream:
https://github.com/xbmc/inputstream.adaptive/commit/70625e76702186c73ddb43440f44262c48e14755

Backported upstream commit to fix cmake install as patch 0001.

Added feature- and bugfix-patches from kodi, they were sent upstream:
https://github.com/axiomatic-systems/Bento4/issues/648

Build-tested using this defconfig:

BR2_PACKAGE_BENTO4=y

                             andes-nds32 [ 1/45]: SKIPPED
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: OK
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: OK
                      bootlin-armv7-musl [ 8/45]: OK
                bootlin-m68k-5208-uclibc [ 9/45]: OK
               bootlin-m68k-68040-uclibc [10/45]: OK
             bootlin-microblazeel-uclibc [11/45]: OK
                bootlin-mipsel32r6-glibc [12/45]: OK
                   bootlin-mipsel-uclibc [13/45]: OK
                     bootlin-nios2-glibc [14/45]: OK
                 bootlin-openrisc-uclibc [15/45]: OK
        bootlin-powerpc64le-power8-glibc [16/45]: OK
           bootlin-powerpc-e500mc-uclibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                   bootlin-sparc64-glibc [22/45]: OK
                    bootlin-sparc-uclibc [23/45]: OK
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: OK
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: OK
                      br-arm-full-static [30/45]: OK
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: OK
                           sourcery-mips [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 2 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 .../0001-Add-support-for-cmake-install.patch  | 130 ++++
 ...-methods-funtions-and-passing-poolid.patch | 634 ++++++++++++++++++
 .../0003-Backport-Smmothstream-changes.patch  |  99 +++
 package/bento4/0004-more-SPS-parameters.patch | 219 ++++++
 ...0005-AVC-extract-VUI-values-from-SPS.patch |  96 +++
 .../0006-Implement-SPS-Frame-parser.patch     |  67 ++
 ...-Fix-segfault-when-AP4_Sample-s-seek.patch |  25 +
 package/bento4/0008-Hack-HBO.patch            | 214 ++++++
 .../bento4/0009-Android-32-ftello-fix.patch   |  31 +
 ...0010-Dazn-sample-duration-workaround.patch |  30 +
 ...ent-to-reuse-single-sample-decrypter.patch | 179 +++++
 .../0012-Static-ReadGolomb-SignedGolomb.patch |  54 ++
 .../bento4/0013-Add-GetChannels-method.patch  |  40 ++
 ...ampleIndexForTimeStamp-GetNearestSyn.patch |  59 ++
 ...015-Avoid-set-next-fragment-position.patch |  43 ++
 package/bento4/Config.in                      |  11 +
 package/bento4/bento4.hash                    |   3 +
 package/bento4/bento4.mk                      |  24 +
 20 files changed, 1960 insertions(+)
 create mode 100644 package/bento4/0001-Add-support-for-cmake-install.patch
 create mode 100644 package/bento4/0002-Add-additional-methods-funtions-and-passing-poolid.patch
 create mode 100644 package/bento4/0003-Backport-Smmothstream-changes.patch
 create mode 100644 package/bento4/0004-more-SPS-parameters.patch
 create mode 100644 package/bento4/0005-AVC-extract-VUI-values-from-SPS.patch
 create mode 100644 package/bento4/0006-Implement-SPS-Frame-parser.patch
 create mode 100644 package/bento4/0007-Fix-segfault-when-AP4_Sample-s-seek.patch
 create mode 100644 package/bento4/0008-Hack-HBO.patch
 create mode 100644 package/bento4/0009-Android-32-ftello-fix.patch
 create mode 100644 package/bento4/0010-Dazn-sample-duration-workaround.patch
 create mode 100644 package/bento4/0011-Add-argument-to-reuse-single-sample-decrypter.patch
 create mode 100644 package/bento4/0012-Static-ReadGolomb-SignedGolomb.patch
 create mode 100644 package/bento4/0013-Add-GetChannels-method.patch
 create mode 100644 package/bento4/0014-Implemented-GetSampleIndexForTimeStamp-GetNearestSyn.patch
 create mode 100644 package/bento4/0015-Avoid-set-next-fragment-position.patch
 create mode 100644 package/bento4/Config.in
 create mode 100644 package/bento4/bento4.hash
 create mode 100644 package/bento4/bento4.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d8bbb11310..bd7944ee88 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -310,6 +310,7 @@ F:	package/apg/
 F:	package/apr/
 F:	package/apr-util/
 F:	package/bcg729/
+F:	package/bento4/
 F:	package/bitcoin/
 F:	package/bluez-tools/
 F:	package/boinc/
diff --git a/package/Config.in b/package/Config.in
index a5bb4fdb14..a741ee5d08 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1721,6 +1721,7 @@ menu "Logging"
 endmenu
 
 menu "Multimedia"
+	source "package/bento4/Config.in"
 	source "package/bitstream/Config.in"
 	source "package/dav1d/Config.in"
 	source "package/kvazaar/Config.in"
diff --git a/package/bento4/0001-Add-support-for-cmake-install.patch b/package/bento4/0001-Add-support-for-cmake-install.patch
new file mode 100644
index 0000000000..cec0cb18b9
--- /dev/null
+++ b/package/bento4/0001-Add-support-for-cmake-install.patch
@@ -0,0 +1,130 @@
+From ba95f55c495c4c34c75a95de843acfa00f6afe24 Mon Sep 17 00:00:00 2001
+From: Harry Mallon <harry.mallon@codex.online>
+Date: Fri, 9 Jul 2021 15:50:26 +0100
+Subject: [PATCH] Add support for cmake install
+
+Downloaded from upstream commit
+https://github.com/axiomatic-systems/Bento4/commit/ba95f55c495c4c34c75a95de843acfa00f6afe24
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Build/cmake/Config.cmake.in |  4 ++
+ CMakeLists.txt              | 73 ++++++++++++++++++++++++++++++++++---
+ 2 files changed, 71 insertions(+), 6 deletions(-)
+ create mode 100644 Build/cmake/Config.cmake.in
+
+diff --git a/Build/cmake/Config.cmake.in b/Build/cmake/Config.cmake.in
+new file mode 100644
+index 00000000..38bbde7b
+--- /dev/null
++++ b/Build/cmake/Config.cmake.in
+@@ -0,0 +1,4 @@
++@PACKAGE_INIT@
++
++include("${CMAKE_CURRENT_LIST_DIR}/@TARGETS_EXPORT_NAME@.cmake")
++check_required_components("@PROJECT_NAME@")
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6de3bfe1..6ebf127f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,7 +7,14 @@ else()
+   cmake_minimum_required(VERSION 3.10)
+ endif()
+ 
+-project(bento4)
++function(get_bento4_version)
++  file(STRINGS "Source/C++/Core/Ap4Version.h" _temp REGEX "AP4_VERSION_STRING")
++  string(REGEX MATCH "\"([^\"]+)\"" _temp "${_temp}")
++  set(BENTO4_VERSION "${CMAKE_MATCH_1}" PARENT_SCOPE)
++endfunction()
++
++get_bento4_version()
++project(bento4 VERSION "${BENTO4_VERSION}")
+ 
+ # Variables
+ set(SOURCE_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/Source/C++)
+@@ -51,14 +58,22 @@ endif()
+ 
+ # Includes
+ set(AP4_INCLUDE_DIRS
+-  ${SOURCE_CORE}
+-  ${SOURCE_CODECS}
+-  ${SOURCE_CRYPTO}
+-  ${SOURCE_METADATA}
++  $<BUILD_INTERFACE:${SOURCE_CORE}>
++  $<BUILD_INTERFACE:${SOURCE_CODECS}>
++  $<BUILD_INTERFACE:${SOURCE_CRYPTO}>
++  $<BUILD_INTERFACE:${SOURCE_METADATA}>
++)
++file(GLOB AP4_HEADERS
++  ${SOURCE_CORE}/*.h
++  ${SOURCE_CODECS}/*.h
++  ${SOURCE_CRYPTO}/*.h
++  ${SOURCE_METADATA}/*.h
+ )
+ 
+ add_library(ap4 STATIC ${AP4_SOURCES})
+-target_include_directories(ap4 PUBLIC ${AP4_INCLUDE_DIRS})
++target_include_directories(ap4 PUBLIC
++  ${AP4_INCLUDE_DIRS}
++)
+ 
+ # Use the statically linked C runtime library
+ if(MSVC)
+@@ -72,6 +87,7 @@ if(BUILD_APPS)
+ file(GLOB BENTO4_APPS RELATIVE ${SOURCE_ROOT}/Apps ${SOURCE_ROOT}/Apps/*)
+ foreach(app ${BENTO4_APPS})
+   string(TOLOWER ${app} binary_name)
++  list(APPEND BENTO4_APPS_LOWERCASE ${binary_name})
+   add_executable(${binary_name} ${SOURCE_ROOT}/Apps/${app}/${app}.cpp)
+   target_link_libraries(${binary_name} ap4)
+ 
+@@ -81,3 +97,48 @@ foreach(app ${BENTO4_APPS})
+   endif()
+ endforeach()
+ endif(BUILD_APPS)
++
++# Install
++include(GNUInstallDirs)
++set(config_install_dir "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
++set(generated_dir "${CMAKE_CURRENT_BINARY_DIR}/generated")
++set(version_config "${generated_dir}/${PROJECT_NAME}ConfigVersion.cmake")
++set(project_config "${generated_dir}/${PROJECT_NAME}Config.cmake")
++set(TARGETS_EXPORT_NAME "${PROJECT_NAME}Targets")
++set(namespace "${PROJECT_NAME}::")
++
++include(CMakePackageConfigHelpers)
++write_basic_package_version_file(
++    "${version_config}" COMPATIBILITY SameMajorVersion
++)
++
++configure_package_config_file(
++    "Build/cmake/Config.cmake.in"
++    "${project_config}"
++    INSTALL_DESTINATION "${config_install_dir}"
++)
++
++install(
++    TARGETS ap4 ${BENTO4_APPS_LOWERCASE}
++    EXPORT "${TARGETS_EXPORT_NAME}"
++    LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++    RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
++    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
++)
++
++install(
++    FILES ${AP4_HEADERS}
++    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/bento4"
++)
++
++install(
++    FILES "${project_config}" "${version_config}"
++    DESTINATION "${config_install_dir}"
++)
++
++install(
++    EXPORT "${TARGETS_EXPORT_NAME}"
++    NAMESPACE "${namespace}"
++    DESTINATION "${config_install_dir}"
++)
diff --git a/package/bento4/0002-Add-additional-methods-funtions-and-passing-poolid.patch b/package/bento4/0002-Add-additional-methods-funtions-and-passing-poolid.patch
new file mode 100644
index 0000000000..22ac657a3f
--- /dev/null
+++ b/package/bento4/0002-Add-additional-methods-funtions-and-passing-poolid.patch
@@ -0,0 +1,634 @@
+From b2027d354ef5d52efd525730fa5e6beccb88d33f Mon Sep 17 00:00:00 2001
+From: Glenn Guy <glennguy83@gmail.com>
+Date: Thu, 22 Jul 2021 10:00:44 +0200
+Subject: [PATCH] Add additional methods/funtions and passing poolid
+
+Added back:
+* SSD - > ParentIsOwner functionality
+* LinearReader: GetSample, SeekSample, Reset
+* Ap4Movie -> GetPsshAtoms
+* Uuid/VppC -> GetData
+* Ap4Protection -> WVTT atom type
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Core/Ap4ByteStream.h         |  1 -
+ Source/C++/Core/Ap4CommonEncryption.cpp | 15 ++--
+ Source/C++/Core/Ap4CommonEncryption.h   | 24 +++++--
+ Source/C++/Core/Ap4IsmaCryp.cpp         |  5 +-
+ Source/C++/Core/Ap4IsmaCryp.h           |  3 +-
+ Source/C++/Core/Ap4LinearReader.cpp     | 94 ++++++++++++++++++++++++-
+ Source/C++/Core/Ap4LinearReader.h       |  4 ++
+ Source/C++/Core/Ap4Marlin.cpp           |  5 +-
+ Source/C++/Core/Ap4Marlin.h             |  3 +-
+ Source/C++/Core/Ap4MoovAtom.cpp         | 28 +++++++-
+ Source/C++/Core/Ap4MoovAtom.h           |  5 ++
+ Source/C++/Core/Ap4Movie.cpp            | 10 +++
+ Source/C++/Core/Ap4Movie.h              |  4 ++
+ Source/C++/Core/Ap4OmaDcf.cpp           |  8 ++-
+ Source/C++/Core/Ap4OmaDcf.h             |  6 +-
+ Source/C++/Core/Ap4Protection.h         |  3 +-
+ Source/C++/Core/Ap4SampleDescription.h  |  1 +
+ Source/C++/Core/Ap4UuidAtom.h           |  1 +
+ Source/C++/Core/Ap4VpccAtom.h           |  3 +
+ 19 files changed, 197 insertions(+), 26 deletions(-)
+
+diff --git a/Source/C++/Core/Ap4ByteStream.h b/Source/C++/Core/Ap4ByteStream.h
+index 0a59e63..93ac80f 100644
+--- a/Source/C++/Core/Ap4ByteStream.h
++++ b/Source/C++/Core/Ap4ByteStream.h
+@@ -195,7 +195,6 @@ public:
+     AP4_UI08*       UseData()     { return m_Buffer->UseData(); }
+     AP4_Size        GetDataSize() { return m_Buffer->GetDataSize(); }
+ 
+-protected:
+     virtual ~AP4_MemoryByteStream();
+ 
+ private:
+diff --git a/Source/C++/Core/Ap4CommonEncryption.cpp b/Source/C++/Core/Ap4CommonEncryption.cpp
+index acd6361..5308200 100644
+--- a/Source/C++/Core/Ap4CommonEncryption.cpp
++++ b/Source/C++/Core/Ap4CommonEncryption.cpp
+@@ -1859,7 +1859,8 @@ AP4_CencSingleSampleDecrypter::~AP4_CencSingleSampleDecrypter() {
+ |   AP4_CencSingleSampleDecrypter::DecryptSampleData
+ +---------------------------------------------------------------------*/
+ AP4_Result 
+-AP4_CencSingleSampleDecrypter::DecryptSampleData(AP4_DataBuffer& data_in,
++AP4_CencSingleSampleDecrypter::DecryptSampleData(AP4_UI32 poolid,
++                                                 AP4_DataBuffer& data_in,
+                                                  AP4_DataBuffer& data_out,
+                                                  const AP4_UI08* iv,
+                                                  unsigned int    subsample_count,
+@@ -2094,8 +2095,9 @@ AP4_CencSampleDecrypter::Create(AP4_CencSampleInfoTable*  sample_info_table,
+ +---------------------------------------------------------------------*/
+ AP4_CencSampleDecrypter::~AP4_CencSampleDecrypter()
+ {
+-	delete m_SampleInfoTable;
+-	delete m_SingleSampleDecrypter;
++  delete m_SampleInfoTable;
++  if (m_SingleSampleDecrypter->GetParentIsOwner())
++    delete m_SingleSampleDecrypter;
+ }
+ 
+ /*----------------------------------------------------------------------
+@@ -2112,7 +2114,8 @@ AP4_CencSampleDecrypter::SetSampleIndex(AP4_Ordinal sample_index)
+ |   AP4_CencSampleDecrypter::DecryptSampleData
+ +---------------------------------------------------------------------*/
+ AP4_Result 
+-AP4_CencSampleDecrypter::DecryptSampleData(AP4_DataBuffer& data_in,
++AP4_CencSampleDecrypter::DecryptSampleData(AP4_UI32 poolid,
++                                           AP4_DataBuffer& data_in,
+                                            AP4_DataBuffer& data_out,
+                                            const AP4_UI08* iv)
+ {
+@@ -2139,7 +2142,7 @@ AP4_CencSampleDecrypter::DecryptSampleData(AP4_DataBuffer& data_in,
+     }
+     
+     // decrypt the sample
+-    return m_SingleSampleDecrypter->DecryptSampleData(data_in, data_out, iv_block, subsample_count, bytes_of_cleartext_data, bytes_of_encrypted_data);
++    return m_SingleSampleDecrypter->DecryptSampleData(poolid, data_in, data_out, iv_block, subsample_count, bytes_of_cleartext_data, bytes_of_encrypted_data);
+ }
+ 
+ /*----------------------------------------------------------------------
+@@ -2323,7 +2326,7 @@ AP4_CencFragmentDecrypter::ProcessSample(AP4_DataBuffer& data_in,
+                                          AP4_DataBuffer& data_out)
+ {
+     // decrypt the sample
+-    return m_SampleDecrypter->DecryptSampleData(data_in, data_out, NULL);
++    return m_SampleDecrypter->DecryptSampleData(0, data_in, data_out, NULL);
+ }
+ 
+ /*----------------------------------------------------------------------
+diff --git a/Source/C++/Core/Ap4CommonEncryption.h b/Source/C++/Core/Ap4CommonEncryption.h
+index 80db456..580de66 100644
+--- a/Source/C++/Core/Ap4CommonEncryption.h
++++ b/Source/C++/Core/Ap4CommonEncryption.h
+@@ -691,9 +691,18 @@ public:
+     // methods
+     AP4_CencSingleSampleDecrypter(AP4_StreamCipher* cipher) :
+         m_Cipher(cipher),
+-        m_FullBlocksOnly(false) {}
++        m_FullBlocksOnly(false),
++        m_ParentIsOwner(true) {}
+     virtual ~AP4_CencSingleSampleDecrypter();
+-    virtual AP4_Result DecryptSampleData(AP4_DataBuffer& data_in,
++    virtual AP4_Result SetFragmentInfo(AP4_UI32 poolid, const AP4_UI08* keyid, const AP4_UI08 nalu_length_size,
++      AP4_DataBuffer &annexb_sps_pps, AP4_UI32 flags) {
++      return AP4_ERROR_NOT_SUPPORTED;
++    };
++    virtual AP4_UI32 AddPool() { return 0; };
++    virtual void RemovePool(AP4_UI32 poolid) {};
++    virtual const char* GetSessionId() { return nullptr; };
++    virtual AP4_Result DecryptSampleData(AP4_UI32 poolid, 
++                                         AP4_DataBuffer& data_in,
+                                          AP4_DataBuffer& data_out,
+                                          
+                                          // always 16 bytes
+@@ -706,7 +715,9 @@ public:
+                                          const AP4_UI16* bytes_of_cleartext_data,
+                                          
+                                          // array of <subsample_count> integers. NULL if subsample_count is 0
+-                                         const AP4_UI32* bytes_of_encrypted_data);  
++                                         const AP4_UI32* bytes_of_encrypted_data);
++    bool GetParentIsOwner()const { return m_ParentIsOwner; };
++    void SetParentIsOwner(bool parent_is_owner) { m_ParentIsOwner = parent_is_owner; };
+     
+ private:
+     // constructor
+@@ -715,12 +726,14 @@ private:
+                                   bool              reset_iv_at_each_subsample) :
+         m_Cipher(cipher),
+         m_FullBlocksOnly(full_blocks_only),
+-        m_ResetIvAtEachSubsample(reset_iv_at_each_subsample) {}
++        m_ResetIvAtEachSubsample(reset_iv_at_each_subsample),
++        m_ParentIsOwner(true) {}
+ 
+     // members
+     AP4_StreamCipher* m_Cipher;
+     bool              m_FullBlocksOnly;
+     bool              m_ResetIvAtEachSubsample;
++    bool              m_ParentIsOwner;
+ };
+ 
+ /*----------------------------------------------------------------------
+@@ -766,7 +779,8 @@ public:
+         m_SampleCursor(0) {}
+     virtual ~AP4_CencSampleDecrypter();
+     virtual AP4_Result SetSampleIndex(AP4_Ordinal sample_index);
+-    virtual AP4_Result DecryptSampleData(AP4_DataBuffer& data_in,
++    virtual AP4_Result DecryptSampleData(AP4_UI32 poolid, 
++                                         AP4_DataBuffer& data_in,
+                                          AP4_DataBuffer& data_out,
+                                          const AP4_UI08* iv);
+     
+diff --git a/Source/C++/Core/Ap4IsmaCryp.cpp b/Source/C++/Core/Ap4IsmaCryp.cpp
+index dfb59a4..442ad49 100644
+--- a/Source/C++/Core/Ap4IsmaCryp.cpp
++++ b/Source/C++/Core/Ap4IsmaCryp.cpp
+@@ -142,7 +142,8 @@ AP4_IsmaCipher::GetDecryptedSampleSize(AP4_Sample& sample)
+ |   AP4_IsmaCipher::DecryptSampleData
+ +---------------------------------------------------------------------*/
+ AP4_Result 
+-AP4_IsmaCipher::DecryptSampleData(AP4_DataBuffer& data_in,
++AP4_IsmaCipher::DecryptSampleData(AP4_UI32 poolid,
++                                  AP4_DataBuffer& data_in,
+                                   AP4_DataBuffer& data_out,
+                                   const AP4_UI08* /*iv*/)
+ {
+@@ -333,7 +334,7 @@ AP4_Result
+ AP4_IsmaTrackDecrypter::ProcessSample(AP4_DataBuffer& data_in,
+                                       AP4_DataBuffer& data_out)
+ {
+-    return m_Cipher->DecryptSampleData(data_in, data_out);
++    return m_Cipher->DecryptSampleData(0, data_in, data_out);
+ }
+ 
+ /*----------------------------------------------------------------------
+diff --git a/Source/C++/Core/Ap4IsmaCryp.h b/Source/C++/Core/Ap4IsmaCryp.h
+index 4b9c60e..970dac8 100644
+--- a/Source/C++/Core/Ap4IsmaCryp.h
++++ b/Source/C++/Core/Ap4IsmaCryp.h
+@@ -74,7 +74,8 @@ public:
+     AP4_Result EncryptSampleData(AP4_DataBuffer& data_in,
+                                  AP4_DataBuffer& data_out,
+                                  AP4_UI32        block_counter);
+-    AP4_Result DecryptSampleData(AP4_DataBuffer& data_in,
++    AP4_Result DecryptSampleData(AP4_UI32 poolid,
++                                 AP4_DataBuffer& data_in,
+                                  AP4_DataBuffer& data_out,
+                                  const AP4_UI08* iv = NULL);
+     AP4_Size   GetDecryptedSampleSize(AP4_Sample& sample);
+diff --git a/Source/C++/Core/Ap4LinearReader.cpp b/Source/C++/Core/Ap4LinearReader.cpp
+index 08b55ee..7cc3ebd 100644
+--- a/Source/C++/Core/Ap4LinearReader.cpp
++++ b/Source/C++/Core/Ap4LinearReader.cpp
+@@ -117,6 +117,29 @@ AP4_LinearReader::FlushQueues()
+     }
+ }
+ 
++/*----------------------------------------------------------------------
++|   AP4_LinearReader::Reset
+++---------------------------------------------------------------------*/
++void
++AP4_LinearReader::Reset()
++{
++  // flush any queued samples
++  FlushQueues();
++
++  // reset tracker states
++  for (unsigned int i = 0; i < m_Trackers.ItemCount(); i++) {
++    if (m_Trackers[i]->m_SampleTableIsOwned) {
++      delete m_Trackers[i]->m_SampleTable;
++    }
++    delete m_Trackers[i]->m_NextSample;
++    m_Trackers[i]->m_SampleTable = NULL;
++    m_Trackers[i]->m_NextSample = NULL;
++    m_Trackers[i]->m_NextSampleIndex = 0;
++    m_Trackers[i]->m_Eos = false;
++  }
++  m_NextFragmentPosition = 0;
++}
++
+ /*----------------------------------------------------------------------
+ |   AP4_LinearReader::SetSampleIndex
+ +---------------------------------------------------------------------*/
+@@ -591,6 +614,75 @@ AP4_LinearReader::ReadNextSample(AP4_Sample&     sample,
+     return ReadNextSample(sample, &sample_data, track_id);
+ }
+ 
++/*----------------------------------------------------------------------
++|   AP4_LinearReader::GetSample
+++---------------------------------------------------------------------*/
++AP4_Result AP4_LinearReader::GetSample(AP4_UI32 track_id, AP4_Sample &sample, AP4_Ordinal sample_index)
++{
++    // look for a sample from a specific track
++    Tracker* tracker = FindTracker(track_id);
++    if (tracker == NULL)
++        return AP4_ERROR_INVALID_PARAMETERS;
++
++    // don't continue if we've reached the end of that tracker
++    if (tracker->m_Eos)
++        return AP4_ERROR_EOS;
++
++    return tracker->m_SampleTable->GetSample(sample_index, sample);
++}
++
++/*----------------------------------------------------------------------
++|   AP4_LinearReader::SeekSample
+++---------------------------------------------------------------------*/
++AP4_Result
++AP4_LinearReader::SeekSample(AP4_UI32 track_id, AP4_UI64 ts, AP4_Ordinal &sample_index, bool preceedingSync)
++{
++    // we only support fragmented sources for now
++    if (!m_HasFragments)
++        return AP4_ERROR_NOT_SUPPORTED;
++
++    if (m_Trackers.ItemCount() == 0) {
++        return AP4_ERROR_NO_SUCH_ITEM;
++    }
++
++    // look for a sample from a specific track
++    Tracker* tracker = FindTracker(track_id);
++    if (tracker == NULL)
++        return AP4_ERROR_INVALID_PARAMETERS;
++
++    // don't continue if we've reached the end of that tracker
++    if (tracker->m_Eos)
++        return AP4_ERROR_EOS;
++
++    AP4_Result result;
++
++    if (!tracker->m_SampleTable && AP4_FAILED(result = Advance()))
++        return result;
++
++    while (AP4_FAILED(result = tracker->m_SampleTable->GetSampleIndexForTimeStamp(ts, sample_index)))
++    {
++        if (result == AP4_ERROR_NOT_ENOUGH_DATA)
++        {
++            tracker->m_NextSampleIndex = tracker->m_SampleTable->GetSampleCount();
++            if (AP4_FAILED(result = Advance()))
++                return result;
++            continue;
++        }
++        return result;
++    }
++
++    sample_index = tracker->m_SampleTable->GetNearestSyncSampleIndex(sample_index, preceedingSync);
++    //we have reached the end -> go for the first sample of the next segment
++    if (sample_index == tracker->m_SampleTable->GetSampleCount())
++    {
++        tracker->m_NextSampleIndex = tracker->m_SampleTable->GetSampleCount();
++        if (AP4_FAILED(result = Advance()))
++            return result;
++        sample_index = 0;
++    }
++    return SetSampleIndex(tracker->m_Track->GetId(), sample_index);
++}
++
+ /*----------------------------------------------------------------------
+ |   AP4_LinearReader::GetNextSample
+ +---------------------------------------------------------------------*/
+@@ -633,5 +725,5 @@ AP4_DecryptingSampleReader::ReadSampleData(AP4_Sample&     sample,
+     AP4_Result result = sample.ReadData(m_DataBuffer);
+     if (AP4_FAILED(result)) return result;
+ 
+-    return m_Decrypter->DecryptSampleData(m_DataBuffer, sample_data);
++    return m_Decrypter->DecryptSampleData(0, m_DataBuffer, sample_data);
+ }
+diff --git a/Source/C++/Core/Ap4LinearReader.h b/Source/C++/Core/Ap4LinearReader.h
+index 549cb5f..21f4871 100644
+--- a/Source/C++/Core/Ap4LinearReader.h
++++ b/Source/C++/Core/Ap4LinearReader.h
+@@ -85,6 +85,8 @@ public:
+     AP4_Result SetSampleIndex(AP4_UI32 track_id, AP4_UI32 sample_index);
+     
+     AP4_Result SeekTo(AP4_UI32 time_ms, AP4_UI32* actual_time_ms = 0);
++
++    AP4_Result SeekSample(AP4_UI32 track_id, AP4_UI64 ts, AP4_Ordinal &sample_index, bool preceedingSync);
+     
+     // accessors
+     AP4_Size GetBufferFullness() { return m_BufferFullness; }
+@@ -169,8 +171,10 @@ protected:
+     AP4_Result ReadNextSample(AP4_Sample&     sample, 
+                               AP4_DataBuffer* sample_data,
+                               AP4_UI32&       track_id);
++    AP4_Result GetSample(AP4_UI32 track_id, AP4_Sample &sample, AP4_Ordinal sample_index);
+     void       FlushQueue(Tracker* tracker);
+     void       FlushQueues();
++    void       Reset();
+     
+     // members
+     AP4_Movie&          m_Movie;
+diff --git a/Source/C++/Core/Ap4Marlin.cpp b/Source/C++/Core/Ap4Marlin.cpp
+index d0ddd3f..c1aa8b6 100644
+--- a/Source/C++/Core/Ap4Marlin.cpp
++++ b/Source/C++/Core/Ap4Marlin.cpp
+@@ -431,7 +431,8 @@ AP4_MarlinIpmpSampleDecrypter::GetDecryptedSampleSize(AP4_Sample& sample)
+ |   AP4_MarlinIpmpSampleDecrypter::DecryptSampleData
+ +---------------------------------------------------------------------*/
+ AP4_Result 
+-AP4_MarlinIpmpSampleDecrypter::DecryptSampleData(AP4_DataBuffer&    data_in,
++AP4_MarlinIpmpSampleDecrypter::DecryptSampleData(AP4_UI32 poolid,
++                                                 AP4_DataBuffer&    data_in,
+                                                  AP4_DataBuffer&    data_out,
+                                                  const AP4_UI08*    /*iv*/)
+ {
+@@ -630,7 +631,7 @@ AP4_Result
+ AP4_MarlinIpmpTrackDecrypter::ProcessSample(AP4_DataBuffer& data_in,
+                                             AP4_DataBuffer& data_out)
+ {
+-    return m_SampleDecrypter->DecryptSampleData(data_in, data_out);
++    return m_SampleDecrypter->DecryptSampleData(0, data_in, data_out);
+ }
+ 
+ /*----------------------------------------------------------------------
+diff --git a/Source/C++/Core/Ap4Marlin.h b/Source/C++/Core/Ap4Marlin.h
+index 774e04f..9280ad6 100644
+--- a/Source/C++/Core/Ap4Marlin.h
++++ b/Source/C++/Core/Ap4Marlin.h
+@@ -118,7 +118,8 @@ public:
+     
+     // AP4_SampleDecrypter methods
+     AP4_Size   GetDecryptedSampleSize(AP4_Sample& sample);
+-    AP4_Result DecryptSampleData(AP4_DataBuffer&    data_in,
++    AP4_Result DecryptSampleData(AP4_UI32 poolid,
++                                 AP4_DataBuffer&    data_in,
+                                  AP4_DataBuffer&    data_out,
+                                  const AP4_UI08*    iv = NULL);
+                                  
+diff --git a/Source/C++/Core/Ap4MoovAtom.cpp b/Source/C++/Core/Ap4MoovAtom.cpp
+index 1ceab49..fbeee4f 100644
+--- a/Source/C++/Core/Ap4MoovAtom.cpp
++++ b/Source/C++/Core/Ap4MoovAtom.cpp
+@@ -31,6 +31,7 @@
+ +---------------------------------------------------------------------*/
+ #include "Ap4MoovAtom.h"
+ #include "Ap4TrakAtom.h"
++#include "Ap4PsshAtom.h"
+ #include "Ap4AtomFactory.h"
+ 
+ /*----------------------------------------------------------------------
+@@ -61,6 +62,29 @@ private:
+     AP4_List<AP4_TrakAtom>* m_TrakAtoms;
+ };
+ 
++/*----------------------------------------------------------------------
++|   AP4_PsshAtomCollector
+++---------------------------------------------------------------------*/
++class AP4_PsshAtomCollector : public AP4_List<AP4_Atom>::Item::Operator
++{
++public:
++  AP4_PsshAtomCollector(AP4_List<AP4_PsshAtom>* pssh_atoms) :
++    m_PsshAtoms(pssh_atoms) {}
++
++  AP4_Result Action(AP4_Atom* atom) const {
++    if (atom->GetType() == AP4_ATOM_TYPE_PSSH) {
++      AP4_PsshAtom* pssh = AP4_DYNAMIC_CAST(AP4_PsshAtom, atom);
++      if (pssh) {
++        m_PsshAtoms->Add(pssh);
++      }
++    }
++    return AP4_SUCCESS;
++  }
++
++private:
++  AP4_List<AP4_PsshAtom>* m_PsshAtoms;
++};
++
+ /*----------------------------------------------------------------------
+ |   AP4_MoovAtom::AP4_MoovAtom
+ +---------------------------------------------------------------------*/
+@@ -80,7 +104,9 @@ AP4_MoovAtom::AP4_MoovAtom(AP4_UI32         size,
+     m_TimeScale(0)
+ {
+     // collect all trak atoms
+-    m_Children.Apply(AP4_TrakAtomCollector(&m_TrakAtoms));    
++    m_Children.Apply(AP4_TrakAtomCollector(&m_TrakAtoms));
++    // collect all pssh atoms
++    m_Children.Apply(AP4_PsshAtomCollector(&m_PsshAtoms));
+ }
+ 
+ /*----------------------------------------------------------------------
+diff --git a/Source/C++/Core/Ap4MoovAtom.h b/Source/C++/Core/Ap4MoovAtom.h
+index f06b2a1..d1a0147 100644
+--- a/Source/C++/Core/Ap4MoovAtom.h
++++ b/Source/C++/Core/Ap4MoovAtom.h
+@@ -40,6 +40,7 @@
+ +---------------------------------------------------------------------*/
+ class AP4_AtomFactory;
+ class AP4_TrakAtom;
++class AP4_PsshAtom;
+ 
+ /*----------------------------------------------------------------------
+ |   AP4_MoovAtom
+@@ -61,6 +62,9 @@ public:
+     AP4_List<AP4_TrakAtom>& GetTrakAtoms() {
+         return m_TrakAtoms;
+     }
++    AP4_List<AP4_PsshAtom>& GetPsshAtoms() {
++      return m_PsshAtoms;
++    }
+     AP4_UI32 GetTimeScale() {
+         return m_TimeScale;
+     }
+@@ -77,6 +81,7 @@ private:
+                  AP4_AtomFactory& atom_factory);
+ 
+     // members
++    AP4_List<AP4_PsshAtom> m_PsshAtoms;
+     AP4_List<AP4_TrakAtom> m_TrakAtoms;
+     AP4_UI32               m_TimeScale;
+ };
+diff --git a/Source/C++/Core/Ap4Movie.cpp b/Source/C++/Core/Ap4Movie.cpp
+index b080b53..9617494 100644
+--- a/Source/C++/Core/Ap4Movie.cpp
++++ b/Source/C++/Core/Ap4Movie.cpp
+@@ -32,6 +32,7 @@
+ #include "Ap4File.h"
+ #include "Ap4Atom.h"
+ #include "Ap4TrakAtom.h"
++#include "Ap4PsshAtom.h"
+ #include "Ap4MoovAtom.h"
+ #include "Ap4MvhdAtom.h"
+ #include "Ap4AtomFactory.h"
+@@ -110,6 +111,15 @@ AP4_Movie::AP4_Movie(AP4_MoovAtom* moov, AP4_ByteStream& sample_stream, bool tra
+         time_scale = 0;
+     }
+ 
++    // get the pssh atoms
++    AP4_List<AP4_PsshAtom>* pssh_atoms;
++    pssh_atoms = &moov->GetPsshAtoms();
++    AP4_List<AP4_PsshAtom>::Item* pssh_item = pssh_atoms->FirstItem();
++    while (pssh_item) {
++        m_PsshAtoms.Append(*pssh_item->GetData());
++        pssh_item = pssh_item->GetNext();
++    }
++
+     // get all tracks
+     AP4_List<AP4_TrakAtom>* trak_atoms;
+     trak_atoms = &moov->GetTrakAtoms();
+diff --git a/Source/C++/Core/Ap4Movie.h b/Source/C++/Core/Ap4Movie.h
+index 21ef173..04992a4 100644
+--- a/Source/C++/Core/Ap4Movie.h
++++ b/Source/C++/Core/Ap4Movie.h
+@@ -37,6 +37,7 @@
+ #include "Ap4MvhdAtom.h"
+ #include "Ap4Track.h"
+ #include "Ap4List.h"
++#include "Ap4PsshAtom.h"
+ 
+ /*----------------------------------------------------------------------
+ |   class references
+@@ -60,6 +61,8 @@ public:
+     AP4_Result Inspect(AP4_AtomInspector& inspector);
+ 
+     AP4_MoovAtom* GetMoovAtom() { return m_MoovAtom;}
++    void SetMoovAtom(AP4_MoovAtom* atom) { m_MoovAtom = atom; }
++    AP4_Array<AP4_PsshAtom>& GetPsshAtoms() { return m_PsshAtoms; }
+     AP4_MvhdAtom* GetMvhdAtom() { return m_MvhdAtom;}
+     AP4_List<AP4_Track>& GetTracks() { return m_Tracks; }
+     AP4_Track*   GetTrack(AP4_UI32 track_id);
+@@ -75,6 +78,7 @@ private:
+     AP4_MoovAtom*       m_MoovAtom;
+     bool                m_MoovAtomIsOwned;
+     AP4_MvhdAtom*       m_MvhdAtom;
++    AP4_Array<AP4_PsshAtom> m_PsshAtoms;
+     AP4_List<AP4_Track> m_Tracks;
+ };
+ 
+diff --git a/Source/C++/Core/Ap4OmaDcf.cpp b/Source/C++/Core/Ap4OmaDcf.cpp
+index 17099a1..4eefbaf 100644
+--- a/Source/C++/Core/Ap4OmaDcf.cpp
++++ b/Source/C++/Core/Ap4OmaDcf.cpp
+@@ -436,7 +436,8 @@ AP4_OmaDcfCtrSampleDecrypter::~AP4_OmaDcfCtrSampleDecrypter()
+ |   AP4_OmaDcfCtrSampleDecrypter::DecryptSampleData
+ +---------------------------------------------------------------------*/
+ AP4_Result 
+-AP4_OmaDcfCtrSampleDecrypter::DecryptSampleData(AP4_DataBuffer& data_in,
++AP4_OmaDcfCtrSampleDecrypter::DecryptSampleData(AP4_UI32 poolid,
++                                                AP4_DataBuffer& data_in,
+                                                 AP4_DataBuffer& data_out,
+                                                 const AP4_UI08* /*iv*/)
+ {   
+@@ -531,7 +532,8 @@ AP4_OmaDcfCbcSampleDecrypter::~AP4_OmaDcfCbcSampleDecrypter()
+ |   AP4_OmaDbcCbcSampleDecrypter::DecryptSampleData
+ +---------------------------------------------------------------------*/
+ AP4_Result 
+-AP4_OmaDcfCbcSampleDecrypter::DecryptSampleData(AP4_DataBuffer& data_in,
++AP4_OmaDcfCbcSampleDecrypter::DecryptSampleData(AP4_UI32 poolid,
++                                                AP4_DataBuffer& data_in,
+                                                 AP4_DataBuffer& data_out,
+                                                 const AP4_UI08* /*iv*/)
+ {   
+@@ -853,7 +855,7 @@ AP4_Result
+ AP4_OmaDcfTrackDecrypter::ProcessSample(AP4_DataBuffer& data_in,
+                                         AP4_DataBuffer& data_out)
+ {
+-    return m_Cipher->DecryptSampleData(data_in, data_out);
++    return m_Cipher->DecryptSampleData(0, data_in, data_out);
+ }
+ 
+ /*----------------------------------------------------------------------
+diff --git a/Source/C++/Core/Ap4OmaDcf.h b/Source/C++/Core/Ap4OmaDcf.h
+index 23f10ed..bb7b3d6 100644
+--- a/Source/C++/Core/Ap4OmaDcf.h
++++ b/Source/C++/Core/Ap4OmaDcf.h
+@@ -133,7 +133,8 @@ public:
+     ~AP4_OmaDcfCtrSampleDecrypter();
+ 
+     // methods
+-    virtual AP4_Result DecryptSampleData(AP4_DataBuffer& data_in,
++    virtual AP4_Result DecryptSampleData(AP4_UI32 poolid,
++                                         AP4_DataBuffer& data_in,
+                                          AP4_DataBuffer& data_out,
+                                          const AP4_UI08* iv = NULL);
+     virtual AP4_Size   GetDecryptedSampleSize(AP4_Sample& sample);
+@@ -155,7 +156,8 @@ public:
+     ~AP4_OmaDcfCbcSampleDecrypter();
+ 
+     // methods
+-    virtual AP4_Result DecryptSampleData(AP4_DataBuffer& data_in,
++    virtual AP4_Result DecryptSampleData(AP4_UI32 poolid,
++                                         AP4_DataBuffer& data_in,
+                                          AP4_DataBuffer& data_out,
+                                          const AP4_UI08* iv = NULL);
+     virtual AP4_Size   GetDecryptedSampleSize(AP4_Sample& sample);
+diff --git a/Source/C++/Core/Ap4Protection.h b/Source/C++/Core/Ap4Protection.h
+index 856f1f3..4080584 100644
+--- a/Source/C++/Core/Ap4Protection.h
++++ b/Source/C++/Core/Ap4Protection.h
+@@ -393,7 +393,8 @@ public:
+     // methods
+     virtual AP4_Size   GetDecryptedSampleSize(AP4_Sample& sample) { return sample.GetSize(); }
+     virtual AP4_Result SetSampleIndex(AP4_Ordinal /*index*/)      { return AP4_SUCCESS;      }
+-    virtual AP4_Result DecryptSampleData(AP4_DataBuffer&    data_in,
++    virtual AP4_Result DecryptSampleData(AP4_UI32 poolid,
++                                         AP4_DataBuffer&    data_in,
+                                          AP4_DataBuffer&    data_out,
+                                          const AP4_UI08*    iv = NULL) = 0;
+ };
+diff --git a/Source/C++/Core/Ap4SampleDescription.h b/Source/C++/Core/Ap4SampleDescription.h
+index 27f3136..d493f96 100644
+--- a/Source/C++/Core/Ap4SampleDescription.h
++++ b/Source/C++/Core/Ap4SampleDescription.h
+@@ -101,6 +101,7 @@ const AP4_UI32 AP4_SAMPLE_FORMAT_TX3G = AP4_ATOM_TYPE('t','x','3','g');
+ const AP4_UI32 AP4_SAMPLE_FORMAT_VC_1 = AP4_ATOM_TYPE('v','c','-','1');
+ const AP4_UI32 AP4_SAMPLE_FORMAT_XML_ = AP4_ATOM_TYPE('x','m','l',' ');
+ const AP4_UI32 AP4_SAMPLE_FORMAT_STPP = AP4_ATOM_TYPE('s','t','p','p');
++const AP4_UI32 AP4_SAMPLE_FORMAT_WVTT = AP4_ATOM_TYPE('w','v','t','t');
+ const AP4_UI32 AP4_SAMPLE_FORMAT_FLAC = AP4_ATOM_TYPE('f','L','a','C');
+ const AP4_UI32 AP4_SAMPLE_FORMAT_OPUS = AP4_ATOM_TYPE('O','p','u','s');
+ const AP4_UI32 AP4_SAMPLE_FORMAT_VP8  = AP4_ATOM_TYPE('v','p','0','8');
+diff --git a/Source/C++/Core/Ap4UuidAtom.h b/Source/C++/Core/Ap4UuidAtom.h
+index b9771bd..0ec3b08 100644
+--- a/Source/C++/Core/Ap4UuidAtom.h
++++ b/Source/C++/Core/Ap4UuidAtom.h
+@@ -90,6 +90,7 @@ public:
+ 
+     // methods
+     virtual AP4_Result WriteFields(AP4_ByteStream& stream);
++    const AP4_DataBuffer &GetData() { return m_Data; };
+ 
+ protected:
+     // members
+diff --git a/Source/C++/Core/Ap4VpccAtom.h b/Source/C++/Core/Ap4VpccAtom.h
+index 9fb60bc..929048a 100644
+--- a/Source/C++/Core/Ap4VpccAtom.h
++++ b/Source/C++/Core/Ap4VpccAtom.h
+@@ -79,10 +79,13 @@ public:
+     AP4_UI08              GetTransferCharacteristics() { return m_TransferCharacteristics; }
+     AP4_UI08              GetMatrixCoefficients()      { return m_MatrixCoefficients;      }
+     const AP4_DataBuffer& GetCodecInitializationData() { return m_CodecIntializationData;  }
++    const AP4_DataBuffer& GetData() { return m_Data; }
+ 
+     // helpers
+     AP4_Result GetCodecString(AP4_UI32 container_type, AP4_String& codec);
+ 
++protected:
++  AP4_DataBuffer m_Data;
+ private:
+     // methods
+     AP4_VpccAtom(AP4_UI32 size, const AP4_UI08* payload);
+-- 
+2.30.2
+
diff --git a/package/bento4/0003-Backport-Smmothstream-changes.patch b/package/bento4/0003-Backport-Smmothstream-changes.patch
new file mode 100644
index 0000000000..a9a577a2d9
--- /dev/null
+++ b/package/bento4/0003-Backport-Smmothstream-changes.patch
@@ -0,0 +1,99 @@
+From 97088e7bd7e84a493bea7e5fe4e808c8ac3e00ff Mon Sep 17 00:00:00 2001
+From: CastagnaIT <gottardo.stefano.83@gmail.com>
+Date: Thu, 22 Jul 2021 10:09:24 +0200
+Subject: [PATCH] Backport Smmothstream changes
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Core/Ap4File.cpp                | 14 ++++++++------
+ Source/C++/Core/Ap4File.h                  |  6 ++++--
+ Source/C++/Core/Ap4FragmentSampleTable.cpp |  2 +-
+ 3 files changed, 13 insertions(+), 9 deletions(-)
+
+diff --git a/Source/C++/Core/Ap4File.cpp b/Source/C++/Core/Ap4File.cpp
+index cb20c3e..f1d2727 100644
+--- a/Source/C++/Core/Ap4File.cpp
++++ b/Source/C++/Core/Ap4File.cpp
+@@ -55,13 +55,14 @@ AP4_File::AP4_File(AP4_Movie* movie) :
+ +---------------------------------------------------------------------*/
+ AP4_File::AP4_File(AP4_ByteStream&  stream, 
+                    AP4_AtomFactory& atom_factory,
+-                   bool             moov_only) :
+-    m_Movie(NULL),
++                   bool             moov_only,
++                   AP4_Movie*       movie) :
++    m_Movie(movie),
+     m_FileType(NULL),
+     m_MetaData(NULL),
+     m_MoovIsBeforeMdat(true)
+ {
+-    ParseStream(stream, atom_factory, moov_only);
++    ParseStream(stream, atom_factory, moov_only, movie);
+ }
+ 
+ /*----------------------------------------------------------------------
+@@ -75,7 +76,7 @@ AP4_File::AP4_File(AP4_ByteStream&  stream,
+     m_MoovIsBeforeMdat(true)
+ {
+     AP4_DefaultAtomFactory atom_factory;
+-    ParseStream(stream, atom_factory, moov_only);
++    ParseStream(stream, atom_factory, moov_only, m_Movie);
+ }
+ 
+ /*----------------------------------------------------------------------
+@@ -93,12 +94,13 @@ AP4_File::~AP4_File()
+ void
+ AP4_File::ParseStream(AP4_ByteStream&  stream,
+                       AP4_AtomFactory& atom_factory,
+-                      bool             moov_only)
++                      bool             moov_only,
++                      AP4_Movie*       movie)
+ {
+     // parse top-level atoms
+     AP4_Atom*    atom;
+     AP4_Position stream_position;
+-    bool         keep_parsing = true;
++    bool         keep_parsing = movie == 0;
+     while (keep_parsing &&
+            AP4_SUCCEEDED(stream.Tell(stream_position)) && 
+            AP4_SUCCEEDED(atom_factory.CreateAtomFromStream(stream, atom))) {
+diff --git a/Source/C++/Core/Ap4File.h b/Source/C++/Core/Ap4File.h
+index 9375258..2f00187 100644
+--- a/Source/C++/Core/Ap4File.h
++++ b/Source/C++/Core/Ap4File.h
+@@ -101,7 +101,8 @@ public:
+      */
+     AP4_File(AP4_ByteStream&  stream, 
+              AP4_AtomFactory& atom_factory,
+-             bool             moov_only);
++             bool             moov_only,
++             AP4_Movie*       movie = NULL);
+ 
+     /**
+      * Constructs an AP4_File from a stream using the default atom factory
+@@ -161,7 +162,8 @@ private:
+     // methods
+     void ParseStream(AP4_ByteStream&  stream,
+                      AP4_AtomFactory& atom_factory,
+-                     bool             moov_only);
++                     bool             moov_only,
++                     AP4_Movie*       movie);
+     
+     // members
+     AP4_Movie*    m_Movie;
+diff --git a/Source/C++/Core/Ap4FragmentSampleTable.cpp b/Source/C++/Core/Ap4FragmentSampleTable.cpp
+index 84e5ded..3fbb53e 100644
+--- a/Source/C++/Core/Ap4FragmentSampleTable.cpp
++++ b/Source/C++/Core/Ap4FragmentSampleTable.cpp
+@@ -130,7 +130,7 @@ AP4_FragmentSampleTable::AddTrun(AP4_TrunAtom*   trun,
+         data_offset += trun->GetDataOffset();
+     }         
+     // MS hack
+-    if (data_offset == moof_offset) {
++    if (data_offset < payload_offset) {
+         data_offset = payload_offset;
+     } else {
+         payload_offset = data_offset;
+-- 
+2.30.2
+
diff --git a/package/bento4/0004-more-SPS-parameters.patch b/package/bento4/0004-more-SPS-parameters.patch
new file mode 100644
index 0000000000..7034739815
--- /dev/null
+++ b/package/bento4/0004-more-SPS-parameters.patch
@@ -0,0 +1,219 @@
+From 25df596f009514b213c5eaf5d5eb94072391c1be Mon Sep 17 00:00:00 2001
+From: peak3d <pfau@peak3d.de>
+Date: Thu, 22 Jul 2021 10:22:39 +0200
+Subject: [PATCH] more SPS parameters
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Codecs/Ap4AvcParser.cpp | 100 ++++++++++++++++++++++++++++-
+ Source/C++/Codecs/Ap4AvcParser.h   |  22 +++++++
+ Source/C++/Core/Ap4Utils.cpp       |   8 +++
+ Source/C++/Core/Ap4Utils.h         |   2 +-
+ 4 files changed, 129 insertions(+), 3 deletions(-)
+
+diff --git a/Source/C++/Codecs/Ap4AvcParser.cpp b/Source/C++/Codecs/Ap4AvcParser.cpp
+index b95398b..7efb5c9 100644
+--- a/Source/C++/Codecs/Ap4AvcParser.cpp
++++ b/Source/C++/Codecs/Ap4AvcParser.cpp
+@@ -30,7 +30,6 @@
+ |   includes
+ +---------------------------------------------------------------------*/
+ #include "Ap4AvcParser.h"
+-#include "Ap4Utils.h"
+ 
+ /*----------------------------------------------------------------------
+ |   debugging
+@@ -123,6 +122,25 @@ AP4_AvcNalParser::SliceTypeName(unsigned int slice_type)
+     }
+ }
+ 
++const int SAR[17][2] = {
++  { 0,  1 },
++  { 1,  1 },
++  { 12, 11 },
++  { 10, 11 },
++  { 16, 11 },
++  { 40, 33 },
++  { 24, 11 },
++  { 20, 11 },
++  { 32, 11 },
++  { 80, 33 },
++  { 18, 11 },
++  { 15, 11 },
++  { 64, 33 },
++  { 160, 99 },
++  { 4,  3 },
++  { 3,  2 },
++  { 2,  1 },
++};
+ /*----------------------------------------------------------------------
+ |   AP4_AvcNalParser::AP4_AvcNalParser
+ +---------------------------------------------------------------------*/
+@@ -236,7 +254,28 @@ AP4_AvcSequenceParameterSet::AP4_AvcSequenceParameterSet() :
+     frame_crop_left_offset(0),
+     frame_crop_right_offset(0),
+     frame_crop_top_offset(0),
+-    frame_crop_bottom_offset(0)
++    frame_crop_bottom_offset(0),
++    vui_parameters_present_flag(0),
++    aspect_ratio_info_present_flag(0),
++    aspect_ratio_idc(0),
++    sar_width(0),
++    sar_height(0),
++    overscan_info_present_flag(0),
++    overscan_appropriate_flag(0),
++    video_signal_type_present_flag(0),
++    video_format(0),
++    video_full_range_flag(0),
++    colour_description_present_flag(0),
++    colour_primaries(0),
++    transfer_characteristics(0),
++    matrix_coefficients(0),
++    chroma_loc_info_present_flag(0),
++    chroma_sample_loc_type_top_field(0),
++    chroma_sample_loc_type_bottom_field(0),
++    timing_info_present_flag(0),
++    num_units_in_tick(0),
++    time_scale(0),
++    fixed_frame_rate_flag(0)
+ {
+     AP4_SetMemory(scaling_list_4x4, 0, sizeof(scaling_list_4x4));
+     AP4_SetMemory(use_default_scaling_matrix_4x4, 0, sizeof(use_default_scaling_matrix_4x4));
+@@ -372,7 +411,64 @@ AP4_AvcFrameParser::ParseSPS(const unsigned char*         data,
+         sps.frame_crop_top_offset    = ReadGolomb(bits);
+         sps.frame_crop_bottom_offset = ReadGolomb(bits);
+     }
++    sps.vui_parameters_present_flag = bits.ReadBit();
++    if (sps.vui_parameters_present_flag) {
++      sps.aspect_ratio_info_present_flag = bits.ReadBit();
++      if (sps.aspect_ratio_info_present_flag) {
++        sps.aspect_ratio_idc = bits.ReadBits(8);
++        if (sps.aspect_ratio_idc == 0xFF)
++        {
++          sps.sar_width = bits.ReadBits(16);
++          sps.sar_height = bits.ReadBits(16);
++        }
++        else if (sps.aspect_ratio_idc < 17)
++        {
++          sps.sar_width = SAR[sps.aspect_ratio_idc][0];
++          sps.sar_height = SAR[sps.aspect_ratio_idc][1];
++        }
++      }
++      sps.overscan_info_present_flag = bits.ReadBit();
++      if (sps.overscan_info_present_flag)
++        sps.overscan_appropriate_flag = bits.ReadBit();
++
++      sps.video_signal_type_present_flag = bits.ReadBit();
++      if (sps.video_signal_type_present_flag) {
++        sps.video_format = bits.ReadBits(3);
++        sps.video_full_range_flag = bits.ReadBit();
++        sps.colour_description_present_flag = bits.ReadBit();
++        if (sps.colour_description_present_flag) {
++          sps.colour_primaries = bits.ReadBits(8);
++          sps.transfer_characteristics = bits.ReadBits(8);
++          sps.matrix_coefficients = bits.ReadBits(8);
++        }
++      }
++
+ 
++      sps.chroma_loc_info_present_flag = bits.ReadBit();
++      if (sps.chroma_loc_info_present_flag) {
++        sps.chroma_sample_loc_type_top_field = ReadGolomb(bits);
++        sps.chroma_sample_loc_type_bottom_field = ReadGolomb(bits);
++      }
++
++      if (bits.PeekBit() && bits.BitsLeft() < 10)
++        return AP4_SUCCESS;
++
++      sps.timing_info_present_flag = bits.ReadBit();
++      if (sps.timing_info_present_flag) {
++#if AP4_PLATFORM_BYTE_ORDER == AP4_PLATFORM_BYTE_ORDER_BIG_ENDIAN
++        sps.num_units_in_tick = bits.ReadBits(32);
++        sps.time_scale = bits.ReadBits(32);
++#else
++        sps.num_units_in_tick = bits.ReadBits(16) << 16;
++        sps.num_units_in_tick |= bits.ReadBits(16);
++        sps.time_scale = bits.ReadBits(16) << 16;
++        sps.time_scale |= bits.ReadBits(16);
++#endif
++        if (!sps.num_units_in_tick || !sps.time_scale)
++          sps.timing_info_present_flag = 0;
++        sps.fixed_frame_rate_flag = bits.ReadBit();
++      }
++    }
+     return AP4_SUCCESS;
+ }
+ 
+diff --git a/Source/C++/Codecs/Ap4AvcParser.h b/Source/C++/Codecs/Ap4AvcParser.h
+index 8f9cd6c..9f97892 100644
+--- a/Source/C++/Codecs/Ap4AvcParser.h
++++ b/Source/C++/Codecs/Ap4AvcParser.h
+@@ -37,6 +37,7 @@
+ #include "Ap4DataBuffer.h"
+ #include "Ap4NalParser.h"
+ #include "Ap4Array.h"
++#include "Ap4Utils.h"
+ 
+ /*----------------------------------------------------------------------
+ |   constants
+@@ -131,6 +132,27 @@ struct AP4_AvcSequenceParameterSet {
+     unsigned int frame_crop_right_offset;
+     unsigned int frame_crop_top_offset;
+     unsigned int frame_crop_bottom_offset;
++    unsigned int vui_parameters_present_flag;
++    unsigned int aspect_ratio_info_present_flag;
++    unsigned int aspect_ratio_idc;
++    unsigned int sar_width;
++    unsigned int sar_height;
++    unsigned int overscan_info_present_flag;
++    unsigned int overscan_appropriate_flag;
++    unsigned int video_signal_type_present_flag;
++    unsigned int video_format;
++    unsigned int video_full_range_flag;
++    unsigned int colour_description_present_flag;
++    unsigned int colour_primaries;
++    unsigned int transfer_characteristics;
++    unsigned int matrix_coefficients;
++    unsigned int chroma_loc_info_present_flag;
++    unsigned int chroma_sample_loc_type_top_field;
++    unsigned int chroma_sample_loc_type_bottom_field;
++    unsigned int timing_info_present_flag;
++    unsigned int num_units_in_tick;
++    unsigned int time_scale;
++    unsigned int fixed_frame_rate_flag;
+ };
+ 
+ struct AP4_AvcPictureParameterSet {
+diff --git a/Source/C++/Core/Ap4Utils.cpp b/Source/C++/Core/Ap4Utils.cpp
+index 96def27..6de4dba 100644
+--- a/Source/C++/Core/Ap4Utils.cpp
++++ b/Source/C++/Core/Ap4Utils.cpp
+@@ -581,4 +581,12 @@ AP4_BitReader::SkipBit()
+    }
+ }
+ 
++/*----------------------------------------------------------------------
++|   AP4_BitReader::BitsLeft
+++---------------------------------------------------------------------*/
++AP4_UI32
++AP4_BitReader::BitsLeft()
++{
++    return (m_Buffer.GetDataSize() - m_Position) * 8 + m_BitsCached;
++}
+ 
+diff --git a/Source/C++/Core/Ap4Utils.h b/Source/C++/Core/Ap4Utils.h
+index 475bff3..e66bafa 100644
+--- a/Source/C++/Core/Ap4Utils.h
++++ b/Source/C++/Core/Ap4Utils.h
+@@ -262,7 +262,7 @@ public:
+     AP4_Result   SkipBytes(AP4_Size byte_count);
+     void         SkipBit();
+     void         SkipBits(unsigned int bit_count);
+-
++    AP4_UI32     BitsLeft();
+     unsigned int GetBitsRead();
+ 
+ private:
+-- 
+2.30.2
+
diff --git a/package/bento4/0005-AVC-extract-VUI-values-from-SPS.patch b/package/bento4/0005-AVC-extract-VUI-values-from-SPS.patch
new file mode 100644
index 0000000000..27b9572269
--- /dev/null
+++ b/package/bento4/0005-AVC-extract-VUI-values-from-SPS.patch
@@ -0,0 +1,96 @@
+From 56e0acde44adbc5503da20dd96c31db33f744bd7 Mon Sep 17 00:00:00 2001
+From: peak3d <pfau@peak3d.de>
+Date: Thu, 22 Jul 2021 10:27:50 +0200
+Subject: [PATCH] AVC extract VUI values from SPS
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Codecs/Ap4AvcParser.cpp | 54 +++++++++++++++++++++++++-----
+ Source/C++/Codecs/Ap4AvcParser.h   |  3 +-
+ 2 files changed, 47 insertions(+), 10 deletions(-)
+
+diff --git a/Source/C++/Codecs/Ap4AvcParser.cpp b/Source/C++/Codecs/Ap4AvcParser.cpp
+index 7efb5c9..7f4fc34 100644
+--- a/Source/C++/Codecs/Ap4AvcParser.cpp
++++ b/Source/C++/Codecs/Ap4AvcParser.cpp
+@@ -287,18 +287,54 @@ AP4_AvcSequenceParameterSet::AP4_AvcSequenceParameterSet() :
+ /*----------------------------------------------------------------------
+ |   AP4_AvcSequenceParameterSet::GetInfo
+ +---------------------------------------------------------------------*/
+-void
++bool
+ AP4_AvcSequenceParameterSet::GetInfo(unsigned int& width, unsigned int& height)
+ {
+-    width = (pic_width_in_mbs_minus1+1) * 16;
+-	height = (2-frame_mbs_only_flag) * (pic_height_in_map_units_minus1+1) * 16;
++  unsigned int nwidth = (pic_width_in_mbs_minus1+1) * 16;
++  unsigned int nheight = (2-frame_mbs_only_flag) * (pic_height_in_map_units_minus1+1) * 16;
+ 
+-    if (frame_cropping_flag) {
+-        unsigned int crop_h = 2*(frame_crop_left_offset+frame_crop_right_offset);
+-        unsigned int crop_v = 2*(frame_crop_top_offset+frame_crop_bottom_offset)*(2-frame_mbs_only_flag);
+-		if (crop_h < width) width   -= crop_h;
+-		if (crop_v < height) height -= crop_v;
+-	}
++  if (frame_cropping_flag) {
++      unsigned int crop_h = 2*(frame_crop_left_offset+frame_crop_right_offset);
++      unsigned int crop_v = 2*(frame_crop_top_offset+frame_crop_bottom_offset)*(2-frame_mbs_only_flag);
++      if (crop_h < nwidth) nwidth   -= crop_h;
++      if (crop_v < nheight) nheight -= crop_v;
++  }
++  if (nwidth != width || nheight != height)
++  {
++      width = nwidth;
++      height = nheight;
++      return true;
++  }
++  return false;
++}
++
++/*----------------------------------------------------------------------
++|   AP4_AvcSequenceParameterSet::GetVUIInfo
+++---------------------------------------------------------------------*/
++bool
++AP4_AvcSequenceParameterSet::GetVUIInfo(unsigned int& fps_ticks, unsigned int& fps_scale, float &aspect)
++{
++  bool ret(false);
++  if (timing_info_present_flag && fixed_frame_rate_flag)
++  {
++    if (fps_scale != (num_units_in_tick << 1) || fps_ticks != time_scale)
++    {
++      fps_scale = num_units_in_tick << 1;
++      fps_ticks = time_scale;
++      ret = true;
++    }
++  }
++  unsigned int w, h;
++  if (aspect_ratio_info_present_flag && GetInfo(w, h))
++  {
++    float a((float)(sar_width * w) / (sar_height * h));
++    if (a != aspect)
++    {
++      aspect = a;
++      ret = true;
++    }
++  }
++  return ret;
+ }
+ 
+ /*----------------------------------------------------------------------
+diff --git a/Source/C++/Codecs/Ap4AvcParser.h b/Source/C++/Codecs/Ap4AvcParser.h
+index 9f97892..431a294 100644
+--- a/Source/C++/Codecs/Ap4AvcParser.h
++++ b/Source/C++/Codecs/Ap4AvcParser.h
+@@ -91,7 +91,8 @@ typedef struct {
+ struct AP4_AvcSequenceParameterSet {
+     AP4_AvcSequenceParameterSet();
+     
+-    void GetInfo(unsigned int& width, unsigned int& height);
++    bool GetInfo(unsigned int& width, unsigned int& height);
++    bool GetVUIInfo(unsigned int& fps_ticks, unsigned int& fps_scale, float &aspect);
+     
+     AP4_DataBuffer raw_bytes;
+ 
+-- 
+2.30.2
+
diff --git a/package/bento4/0006-Implement-SPS-Frame-parser.patch b/package/bento4/0006-Implement-SPS-Frame-parser.patch
new file mode 100644
index 0000000000..d2c224ccf9
--- /dev/null
+++ b/package/bento4/0006-Implement-SPS-Frame-parser.patch
@@ -0,0 +1,67 @@
+From 441247d84e8493a49d234fe062100b049956de90 Mon Sep 17 00:00:00 2001
+From: peak3d <pfau@peak3d.de>
+Date: Thu, 22 Jul 2021 10:34:42 +0200
+Subject: [PATCH] Implement SPS Frame parser
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Codecs/Ap4AvcParser.cpp | 26 ++++++++++++++++++++++++++
+ Source/C++/Codecs/Ap4AvcParser.h   |  5 +++++
+ 2 files changed, 31 insertions(+)
+
+diff --git a/Source/C++/Codecs/Ap4AvcParser.cpp b/Source/C++/Codecs/Ap4AvcParser.cpp
+index 7f4fc34..cfa841d 100644
+--- a/Source/C++/Codecs/Ap4AvcParser.cpp
++++ b/Source/C++/Codecs/Ap4AvcParser.cpp
+@@ -1112,6 +1112,32 @@ AP4_AvcFrameParser::AppendNalUnitData(const unsigned char* data, unsigned int da
+     m_AccessUnitData.Append(new AP4_DataBuffer(data, data_size));
+ }
+ 
++/*----------------------------------------------------------------------
++|   AP4_AvcFrameParser::Feed
+++---------------------------------------------------------------------*/
++AP4_Result AP4_AvcFrameParser::ParseFrameForSPS(const AP4_Byte* data, AP4_Size data_size, AP4_UI08 naluLengthSize, AP4_AvcSequenceParameterSet &sps)
++{
++  if (data_size < naluLengthSize)
++    return AP4_ERROR_EOS;
++
++  while (data_size > naluLengthSize)
++  {
++    AP4_Size nalSize(0);
++    for (unsigned int i(0); i < naluLengthSize; ++i) { nalSize = (nalSize << 8) + *data++; };
++    data_size -= naluLengthSize;
++    if (nalSize > data_size)
++      return AP4_ERROR_INVALID_PARAMETERS;
++
++    if ((*data & 0x1F) == AP4_AVC_NAL_UNIT_TYPE_SPS)
++    {
++      AP4_AvcFrameParser fp;
++      return fp.ParseSPS(data, data_size, sps);
++    }
++    data_size -= nalSize;
++  }
++  return AP4_SUCCESS;
++}
++
+ /*----------------------------------------------------------------------
+ |   AP4_AvcFrameParser::Feed
+ +---------------------------------------------------------------------*/
+diff --git a/Source/C++/Codecs/Ap4AvcParser.h b/Source/C++/Codecs/Ap4AvcParser.h
+index 431a294..99c5320 100644
+--- a/Source/C++/Codecs/Ap4AvcParser.h
++++ b/Source/C++/Codecs/Ap4AvcParser.h
+@@ -258,6 +258,11 @@ public:
+     AP4_AvcFrameParser();
+    ~AP4_AvcFrameParser();
+     
++   static AP4_Result ParseFrameForSPS(const AP4_Byte* data,
++     AP4_Size data_size,
++     AP4_UI08 naluLengthSize,
++     AP4_AvcSequenceParameterSet &sps);
++
+     /**
+      * Feed some data to the parser and look for the next NAL Unit.
+      *
+-- 
+2.30.2
+
diff --git a/package/bento4/0007-Fix-segfault-when-AP4_Sample-s-seek.patch b/package/bento4/0007-Fix-segfault-when-AP4_Sample-s-seek.patch
new file mode 100644
index 0000000000..bd7f434652
--- /dev/null
+++ b/package/bento4/0007-Fix-segfault-when-AP4_Sample-s-seek.patch
@@ -0,0 +1,25 @@
+From b36f3c02a93029308654f77c01c3c04259449c5c Mon Sep 17 00:00:00 2001
+From: peak3d <pfau@peak3d.de>
+Date: Thu, 22 Jul 2021 10:35:48 +0200
+Subject: [PATCH] Fix segfault when AP4_Sample's seek
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Core/Ap4LinearReader.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/C++/Core/Ap4LinearReader.cpp b/Source/C++/Core/Ap4LinearReader.cpp
+index 7cc3ebd..61dd60e 100644
+--- a/Source/C++/Core/Ap4LinearReader.cpp
++++ b/Source/C++/Core/Ap4LinearReader.cpp
+@@ -482,6 +482,7 @@ AP4_LinearReader::Advance(bool read_data)
+                 result = buffer->m_Sample->ReadData(buffer->m_Data);
+             }
+             if (AP4_FAILED(result)) {
++                buffer->m_Sample = nullptr;
+                 delete buffer;
+                 return result;
+             }
+-- 
+2.30.2
+
diff --git a/package/bento4/0008-Hack-HBO.patch b/package/bento4/0008-Hack-HBO.patch
new file mode 100644
index 0000000000..ed297574a8
--- /dev/null
+++ b/package/bento4/0008-Hack-HBO.patch
@@ -0,0 +1,214 @@
+From 37e54320f2822bdc7eab50eb54b1fc4a452c7f60 Mon Sep 17 00:00:00 2001
+From: peak3d <pfau@peak3d.de>
+Date: Thu, 22 Jul 2021 11:18:14 +0200
+Subject: [PATCH] Hack HBO
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Core/Ap4FragmentSampleTable.cpp |  8 +++++++-
+ Source/C++/Core/Ap4FragmentSampleTable.h   |  1 +
+ Source/C++/Core/Ap4LinearReader.cpp        | 20 +++++++++++++-------
+ Source/C++/Core/Ap4LinearReader.h          |  3 ++-
+ Source/C++/Core/Ap4MovieFragment.cpp       |  5 ++++-
+ Source/C++/Core/Ap4MovieFragment.h         |  2 ++
+ Source/C++/Core/Ap4Processor.cpp           |  3 ++-
+ 7 files changed, 31 insertions(+), 11 deletions(-)
+
+diff --git a/Source/C++/Core/Ap4FragmentSampleTable.cpp b/Source/C++/Core/Ap4FragmentSampleTable.cpp
+index 3fbb53e..cea5c7d 100644
+--- a/Source/C++/Core/Ap4FragmentSampleTable.cpp
++++ b/Source/C++/Core/Ap4FragmentSampleTable.cpp
+@@ -47,6 +47,7 @@ AP4_FragmentSampleTable::AP4_FragmentSampleTable(AP4_ContainerAtom* traf,
+                                                  AP4_ByteStream*    sample_stream,
+                                                  AP4_Position       moof_offset,
+                                                  AP4_Position       mdat_payload_offset,
++                                                 AP4_UI64           mdat_payload_size,
+                                                  AP4_UI64           dts_origin) :
+     m_Duration(0)
+ {
+@@ -73,6 +74,7 @@ AP4_FragmentSampleTable::AP4_FragmentSampleTable(AP4_ContainerAtom* traf,
+     }
+     
+     // process all the trun atoms
++    AP4_UI32 trun_flags(0);
+     for (AP4_List<AP4_Atom>::Item* item = traf->GetChildren().FirstItem();
+                                    item;
+                                    item = item->GetNext()) {
+@@ -88,9 +90,13 @@ AP4_FragmentSampleTable::AP4_FragmentSampleTable(AP4_ContainerAtom* traf,
+                                             mdat_payload_offset,
+                                             dts_origin);
+                 if (AP4_FAILED(result)) return;
++                trun_flags |= trun->GetFlags();
+             }
+         }
+-    }    
++    }
++    // Hack if we have a single sample and default sample size is wrong (hbo ttml)
++    if (m_Samples.ItemCount() == 1 && (trun_flags & AP4_TRUN_FLAG_SAMPLE_SIZE_PRESENT) == 0)
++        m_Samples[0].SetSize(mdat_payload_size);
+ }
+ 
+ /*----------------------------------------------------------------------
+diff --git a/Source/C++/Core/Ap4FragmentSampleTable.h b/Source/C++/Core/Ap4FragmentSampleTable.h
+index 67192de..29fa4a9 100644
+--- a/Source/C++/Core/Ap4FragmentSampleTable.h
++++ b/Source/C++/Core/Ap4FragmentSampleTable.h
+@@ -57,6 +57,7 @@ class AP4_FragmentSampleTable : public AP4_SampleTable
+                                      AP4_ByteStream*    sample_stream,
+                                      AP4_Position       moof_offset,
+                                      AP4_Position       mdat_payload_offset, // hack because MS doesn't implement the spec correctly
++                                     AP4_UI64           mdat_payload_size,
+                                      AP4_UI64           dts_origin=0);
+     virtual ~AP4_FragmentSampleTable();
+ 
+diff --git a/Source/C++/Core/Ap4LinearReader.cpp b/Source/C++/Core/Ap4LinearReader.cpp
+index 61dd60e..eabeacf 100644
+--- a/Source/C++/Core/Ap4LinearReader.cpp
++++ b/Source/C++/Core/Ap4LinearReader.cpp
+@@ -309,7 +309,8 @@ AP4_LinearReader::ProcessTrack(AP4_Track* track)
+ AP4_Result
+ AP4_LinearReader::ProcessMoof(AP4_ContainerAtom* moof, 
+                               AP4_Position       moof_offset, 
+-                              AP4_Position       mdat_payload_offset)
++                              AP4_Position       mdat_payload_offset,
++                              AP4_UI64 mdat_payload_size)
+ {
+     AP4_Result result;
+    
+@@ -334,7 +335,8 @@ AP4_LinearReader::ProcessMoof(AP4_ContainerAtom* moof,
+                                                        ids[j], 
+                                                        m_FragmentStream, 
+                                                        moof_offset, 
+-                                                       mdat_payload_offset, 
++                                                       mdat_payload_offset,
++                                                       mdat_payload_size,
+                                                        tracker->m_NextDts,
+                                                        sample_table);
+                 if (AP4_FAILED(result)) return result;
+@@ -382,13 +384,11 @@ AP4_LinearReader::AdvanceFragment()
+                     AP4_Position position = 0;
+                     m_FragmentStream->Tell(position);
+         
+-                    // process the movie fragment
+-                    result = ProcessMoof(moof, position-atom->GetSize(), position+8);
+-                    if (AP4_FAILED(result)) return result;
+-
+                     // compute where the next fragment will be
+                     AP4_UI32 size;
+                     AP4_UI32 type;
++                    AP4_UI64 size_64 = 0;
++
+                     m_FragmentStream->Tell(position);
+                     result = m_FragmentStream->ReadUI32(size);
+                     if (AP4_FAILED(result)) return AP4_SUCCESS; // can't read more
+@@ -397,13 +397,19 @@ AP4_LinearReader::AdvanceFragment()
+                     if (size == 0) {
+                         m_NextFragmentPosition = 0;
+                     } else if (size == 1) {
+-                        AP4_UI64 size_64 = 0;
+                         result = m_FragmentStream->ReadUI64(size_64);
+                         if (AP4_FAILED(result)) return AP4_SUCCESS; // can't read more
+                         m_NextFragmentPosition = position+size_64;
++                        size_64 -= 8;
+                     } else {
+                         m_NextFragmentPosition = position+size;
++                        size_64 = size;
+                     }
++
++                    // process the movie fragment
++                    result = ProcessMoof(moof, position - atom->GetSize(), position + 8, size_64 - 8);
++                    if (AP4_FAILED(result)) return result;
++
+                     return AP4_SUCCESS;
+                 } else {
+                     delete atom;
+diff --git a/Source/C++/Core/Ap4LinearReader.h b/Source/C++/Core/Ap4LinearReader.h
+index 21f4871..929b4e1 100644
+--- a/Source/C++/Core/Ap4LinearReader.h
++++ b/Source/C++/Core/Ap4LinearReader.h
+@@ -161,7 +161,8 @@ protected:
+     virtual AP4_Result ProcessTrack(AP4_Track* track);
+     virtual AP4_Result ProcessMoof(AP4_ContainerAtom* moof, 
+                                    AP4_Position       moof_offset, 
+-                                   AP4_Position       mdat_payload_offset);
++                                   AP4_Position       mdat_payload_offset,
++                                   AP4_UI64           mdat_payload_size);
+     
+     // methods
+     Tracker*   FindTracker(AP4_UI32 track_id);
+diff --git a/Source/C++/Core/Ap4MovieFragment.cpp b/Source/C++/Core/Ap4MovieFragment.cpp
+index 028d42d..c2ead25 100644
+--- a/Source/C++/Core/Ap4MovieFragment.cpp
++++ b/Source/C++/Core/Ap4MovieFragment.cpp
+@@ -127,6 +127,7 @@ AP4_MovieFragment::CreateSampleTable(AP4_MoovAtom*             moov,
+                                      AP4_ByteStream*           sample_stream,
+                                      AP4_Position              moof_offset,
+                                      AP4_Position              mdat_payload_offset,
++                                     AP4_UI64                  mdat_payload_size,
+                                      AP4_UI64                  dts_origin,
+                                      AP4_FragmentSampleTable*& sample_table)
+ {
+@@ -158,6 +159,7 @@ AP4_MovieFragment::CreateSampleTable(AP4_MoovAtom*             moov,
+                                                    sample_stream,
+                                                    moof_offset,
+                                                    mdat_payload_offset,
++                                                   mdat_payload_size,
+                                                    dts_origin);
+         return AP4_SUCCESS;
+     }
+@@ -174,9 +176,10 @@ AP4_MovieFragment::CreateSampleTable(AP4_Movie*                movie,
+                                      AP4_ByteStream*           sample_stream,
+                                      AP4_Position              moof_offset,
+                                      AP4_Position              mdat_payload_offset,
++                                     AP4_UI64                  mdat_payload_size,
+                                      AP4_UI64                  dts_origin,
+                                      AP4_FragmentSampleTable*& sample_table)
+ {
+     AP4_MoovAtom* moov = movie?movie->GetMoovAtom():NULL;
+-    return CreateSampleTable(moov, track_id, sample_stream, moof_offset, mdat_payload_offset, dts_origin, sample_table);
++    return CreateSampleTable(moov, track_id, sample_stream, moof_offset, mdat_payload_offset, mdat_payload_size, dts_origin, sample_table);
+ }
+diff --git a/Source/C++/Core/Ap4MovieFragment.h b/Source/C++/Core/Ap4MovieFragment.h
+index f829411..de59c42 100644
+--- a/Source/C++/Core/Ap4MovieFragment.h
++++ b/Source/C++/Core/Ap4MovieFragment.h
+@@ -70,6 +70,7 @@ public:
+                                          AP4_ByteStream*           sample_stream,
+                                          AP4_Position              moof_offset,
+                                          AP4_Position              mdat_payload_offset, // hack because MS doesn't implement the spec properly
++                                         AP4_UI64                  mdat_payload_size,
+                                          AP4_UI64                  dts_origin,
+                                          AP4_FragmentSampleTable*& sample_table);
+     AP4_Result         CreateSampleTable(AP4_Movie*                movie,
+@@ -77,6 +78,7 @@ public:
+                                          AP4_ByteStream*           sample_stream,
+                                          AP4_Position              moof_offset,
+                                          AP4_Position              mdat_payload_offset, // hack because MS doesn't implement the spec properly
++                                         AP4_UI64                  mdat_payload_size,
+                                          AP4_UI64                  dts_origin,
+                                          AP4_FragmentSampleTable*& sample_table);
+     
+diff --git a/Source/C++/Core/Ap4Processor.cpp b/Source/C++/Core/Ap4Processor.cpp
+index c4e1d78..365d955 100644
+--- a/Source/C++/Core/Ap4Processor.cpp
++++ b/Source/C++/Core/Ap4Processor.cpp
+@@ -156,6 +156,7 @@ AP4_Processor::ProcessFragments(AP4_MoovAtom*              moov,
+         AP4_Atom*          atom        = locator->m_Atom;
+         AP4_UI64           atom_offset = locator->m_Offset;
+         AP4_UI64           mdat_payload_offset = atom_offset+atom->GetSize()+AP4_ATOM_HEADER_SIZE;
++        AP4_UI64           mdat_payload_size = atom->GetSize();
+         AP4_Sample         sample;
+         AP4_DataBuffer     sample_data_in;
+         AP4_DataBuffer     sample_data_out;
+@@ -226,7 +227,7 @@ AP4_Processor::ProcessFragments(AP4_MoovAtom*              moov,
+             
+             // create a sample table object so we can read the sample data
+             AP4_FragmentSampleTable* sample_table = NULL;
+-            result = fragment->CreateSampleTable(moov, tfhd->GetTrackId(), &input, atom_offset, mdat_payload_offset, 0, sample_table);
++            result = fragment->CreateSampleTable(moov, tfhd->GetTrackId(), &input, atom_offset, mdat_payload_offset, mdat_payload_size, 0, sample_table);
+             if (AP4_FAILED(result)) return result;
+             sample_tables.Append(sample_table);
+             
+-- 
+2.30.2
+
diff --git a/package/bento4/0009-Android-32-ftello-fix.patch b/package/bento4/0009-Android-32-ftello-fix.patch
new file mode 100644
index 0000000000..0adca20ed0
--- /dev/null
+++ b/package/bento4/0009-Android-32-ftello-fix.patch
@@ -0,0 +1,31 @@
+From f12fbb6f54b8302db2ab7c926a26f9189cf86532 Mon Sep 17 00:00:00 2001
+From: peak3d <pfau@peak3d.de>
+Date: Thu, 22 Jul 2021 10:41:35 +0200
+Subject: [PATCH] Android 32 ftello fix
+
+ref: https://android.googlesource.com/platform/bionic/+/master/docs/32-bit-abi.md
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Core/Ap4Config.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Source/C++/Core/Ap4Config.h b/Source/C++/Core/Ap4Config.h
+index 422069e..c859a03 100644
+--- a/Source/C++/Core/Ap4Config.h
++++ b/Source/C++/Core/Ap4Config.h
+@@ -141,10 +141,10 @@
+ #endif
+ 
+ #if !defined(AP4_fseek)
+-#define AP4_fseek fseeko
++#define AP4_fseek fseek
+ #endif
+ #if !defined(AP4_ftell)
+-#define AP4_ftell ftello
++#define AP4_ftell ftell
+ #endif
+ 
+ /* some compilers (ex: MSVC 8) deprecate those, so we rename them */
+-- 
+2.30.2
+
diff --git a/package/bento4/0010-Dazn-sample-duration-workaround.patch b/package/bento4/0010-Dazn-sample-duration-workaround.patch
new file mode 100644
index 0000000000..5c64210324
--- /dev/null
+++ b/package/bento4/0010-Dazn-sample-duration-workaround.patch
@@ -0,0 +1,30 @@
+From 10f931c703c68b4fc856e09788dfe64579252bb8 Mon Sep 17 00:00:00 2001
+From: peak3d <pfau@peak3d.de>
+Date: Thu, 22 Jul 2021 10:48:36 +0200
+Subject: [PATCH] Dazn sample duration workaround
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Core/Ap4TrunAtom.cpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/Source/C++/Core/Ap4TrunAtom.cpp b/Source/C++/Core/Ap4TrunAtom.cpp
+index c51f21d..77b7c6d 100644
+--- a/Source/C++/Core/Ap4TrunAtom.cpp
++++ b/Source/C++/Core/Ap4TrunAtom.cpp
+@@ -128,6 +128,12 @@ AP4_TrunAtom::AP4_TrunAtom(AP4_UI32        size,
+     for (unsigned int i=0; i<sample_count; i++) {
+         if (flags & AP4_TRUN_FLAG_SAMPLE_DURATION_PRESENT) {
+             stream.ReadUI32(m_Entries[i].sample_duration);
++            // Workaround for dazn streams, which provide 24 -> 1 sequences
++            if (i && m_Entries[i].sample_duration == 1 && m_Entries[i - 1].sample_duration > 1)
++            {
++                m_Entries[i].sample_duration = m_Entries[i - 1].sample_duration >> 1;
++                m_Entries[i - 1].sample_duration -= m_Entries[i].sample_duration;
++            }
+             --record_fields_count;
+         }
+         if (flags & AP4_TRUN_FLAG_SAMPLE_SIZE_PRESENT) {
+-- 
+2.30.2
+
diff --git a/package/bento4/0011-Add-argument-to-reuse-single-sample-decrypter.patch b/package/bento4/0011-Add-argument-to-reuse-single-sample-decrypter.patch
new file mode 100644
index 0000000000..15159af892
--- /dev/null
+++ b/package/bento4/0011-Add-argument-to-reuse-single-sample-decrypter.patch
@@ -0,0 +1,179 @@
+From 7bb5120b52814e4471a165e295acdc6b6155259e Mon Sep 17 00:00:00 2001
+From: peak3d <pfau@peak3d.de>
+Date: Thu, 22 Jul 2021 11:01:12 +0200
+Subject: [PATCH] Add argument to reuse single sample decrypter
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Core/Ap4CommonEncryption.cpp | 36 ++++++++++++++++++-------
+ Source/C++/Core/Ap4CommonEncryption.h   |  8 +++++-
+ Source/C++/Core/Ap4Protection.cpp       |  3 ++-
+ 3 files changed, 35 insertions(+), 12 deletions(-)
+
+diff --git a/Source/C++/Core/Ap4CommonEncryption.cpp b/Source/C++/Core/Ap4CommonEncryption.cpp
+index 5308200..cb5c328 100644
+--- a/Source/C++/Core/Ap4CommonEncryption.cpp
++++ b/Source/C++/Core/Ap4CommonEncryption.cpp
+@@ -1967,6 +1967,7 @@ AP4_CencSampleDecrypter::Create(AP4_ProtectedSampleDescription* sample_descripti
+                                 const AP4_UI08*                 key, 
+                                 AP4_Size                        key_size,
+                                 AP4_BlockCipherFactory*         block_cipher_factory,
++                                AP4_CencSingleSampleDecrypter*  singlesample_decrypter,
+                                 AP4_CencSampleDecrypter*&       decrypter)
+ {
+     AP4_SaioAtom* saio = NULL;
+@@ -1982,6 +1983,7 @@ AP4_CencSampleDecrypter::Create(AP4_ProtectedSampleDescription* sample_descripti
+                   saio,
+                   saiz,
+                   sample_encryption_atom,
++                  singlesample_decrypter,
+                   decrypter);
+ }
+ 
+@@ -1999,6 +2001,7 @@ AP4_CencSampleDecrypter::Create(AP4_ProtectedSampleDescription* sample_descripti
+                                 AP4_SaioAtom*&                  saio,
+                                 AP4_SaizAtom*&                  saiz,
+                                 AP4_CencSampleEncryption*&      sample_encryption_atom,
++                                AP4_CencSingleSampleDecrypter*  singlesample_decrypter,
+                                 AP4_CencSampleDecrypter*&       decrypter)
+ {
+     // default return values
+@@ -2032,6 +2035,7 @@ AP4_CencSampleDecrypter::Create(AP4_ProtectedSampleDescription* sample_descripti
+                   key_size,
+                   block_cipher_factory,
+                   reset_iv_at_each_subsample,
++                  singlesample_decrypter,
+                   decrypter);
+ }
+ 
+@@ -2045,6 +2049,7 @@ AP4_CencSampleDecrypter::Create(AP4_CencSampleInfoTable*  sample_info_table,
+                                 AP4_Size                  key_size,
+                                 AP4_BlockCipherFactory*   block_cipher_factory,
+                                 bool                      reset_iv_at_each_subsample,
++                                AP4_CencSingleSampleDecrypter* singlesample_decrypter,
+                                 AP4_CencSampleDecrypter*& decrypter)
+ {
+     // default return value
+@@ -2074,15 +2079,23 @@ AP4_CencSampleDecrypter::Create(AP4_CencSampleInfoTable*  sample_info_table,
+ 
+     // create a single-sample decrypter
+     AP4_CencSingleSampleDecrypter* single_sample_decrypter = NULL;
+-    AP4_Result result = AP4_CencSingleSampleDecrypter::Create(cipher_type,
+-                                                              key,
+-                                                              key_size,
+-                                                              sample_info_table->GetCryptByteBlock(),
+-                                                              sample_info_table->GetSkipByteBlock(),
+-                                                              block_cipher_factory,
+-                                                              reset_iv_at_each_subsample,
+-                                                              single_sample_decrypter);
+-    if (AP4_FAILED(result)) return result;
++    if (!singlesample_decrypter)
++    {
++        AP4_Result result = AP4_CencSingleSampleDecrypter::Create(cipher_type,
++                                                                  key,
++                                                                  key_size,
++                                                                  sample_info_table->GetCryptByteBlock(),
++                                                                  sample_info_table->GetSkipByteBlock(),
++                                                                  block_cipher_factory,
++                                                                  reset_iv_at_each_subsample,
++                                                                  single_sample_decrypter);
++
++        if (AP4_FAILED(result)) return result;
++    }
++    else
++    {
++        single_sample_decrypter = singlesample_decrypter;
++    }
+ 
+     // create the decrypter
+     decrypter = new AP4_CencSampleDecrypter(single_sample_decrypter, sample_info_table);
+@@ -2333,7 +2346,9 @@ AP4_CencFragmentDecrypter::ProcessSample(AP4_DataBuffer& data_in,
+ |   AP4_CencDecryptingProcessor::AP4_CencDecryptingProcessor
+ +---------------------------------------------------------------------*/
+ AP4_CencDecryptingProcessor::AP4_CencDecryptingProcessor(const AP4_ProtectionKeyMap* key_map, 
+-                                                         AP4_BlockCipherFactory*     block_cipher_factory) :
++                                                         AP4_BlockCipherFactory*     block_cipher_factory,
++                                                         AP4_CencSingleSampleDecrypter *cenc_singlesample_decrypter) :
++    m_CencSingleSampleDecrypter(cenc_singlesample_decrypter),
+     m_KeyMap(key_map)
+ {
+     if (block_cipher_factory) {
+@@ -2483,6 +2498,7 @@ AP4_CencDecryptingProcessor::CreateFragmentHandler(AP4_TrakAtom*      trak,
+         saio,
+         saiz,
+         sample_encryption_atom,
++        m_CencSingleSampleDecrypter,
+         sample_decrypter);
+     if (AP4_FAILED(result)) return NULL;
+     
+diff --git a/Source/C++/Core/Ap4CommonEncryption.h b/Source/C++/Core/Ap4CommonEncryption.h
+index 580de66..a6b20ce 100644
+--- a/Source/C++/Core/Ap4CommonEncryption.h
++++ b/Source/C++/Core/Ap4CommonEncryption.h
+@@ -48,6 +48,7 @@ class AP4_SaioAtom;
+ class AP4_CencSampleInfoTable;
+ class AP4_AvcFrameParser;
+ class AP4_HevcFrameParser;
++class AP4_CencSingleSampleDecrypter;
+ 
+ /*----------------------------------------------------------------------
+ |   constants
+@@ -654,7 +655,8 @@ class AP4_CencDecryptingProcessor : public AP4_Processor
+ public:
+     // constructor
+     AP4_CencDecryptingProcessor(const AP4_ProtectionKeyMap* key_map, 
+-                                AP4_BlockCipherFactory*     block_cipher_factory = NULL);
++                                AP4_BlockCipherFactory*     block_cipher_factory = NULL,
++                                AP4_CencSingleSampleDecrypter* cenc_singlesample_decrypter = NULL);
+ 
+     // AP4_Processor methods
+     virtual AP4_Processor::TrackHandler*    CreateTrackHandler(AP4_TrakAtom* trak);
+@@ -670,6 +672,7 @@ protected:
+ 
+     // members
+     AP4_BlockCipherFactory*     m_BlockCipherFactory;
++    AP4_CencSingleSampleDecrypter* m_CencSingleSampleDecrypter;
+     const AP4_ProtectionKeyMap* m_KeyMap;
+ };
+ 
+@@ -752,6 +755,7 @@ public:
+                              AP4_SaioAtom*&                  saio_atom,              // [out]
+                              AP4_SaizAtom*&                  saiz_atom,              // [out]
+                              AP4_CencSampleEncryption*&      sample_encryption_atom, // [out]
++                             AP4_CencSingleSampleDecrypter*  singlesample_decrypter,
+                              AP4_CencSampleDecrypter*&       decrypter);
+ 
+     static AP4_Result Create(AP4_ProtectedSampleDescription* sample_description, 
+@@ -761,6 +765,7 @@ public:
+                              const AP4_UI08*                 key, 
+                              AP4_Size                        key_size,
+                              AP4_BlockCipherFactory*         block_cipher_factory,
++                             AP4_CencSingleSampleDecrypter*  singlesample_decrypter,
+                              AP4_CencSampleDecrypter*&       decrypter);
+ 
+     static AP4_Result Create(AP4_CencSampleInfoTable*  sample_info_table,
+@@ -769,6 +774,7 @@ public:
+                              AP4_Size                  key_size,
+                              AP4_BlockCipherFactory*   block_cipher_factory,
+                              bool                      reset_iv_at_each_subsample,
++                             AP4_CencSingleSampleDecrypter* singlesample_decrypter,
+                              AP4_CencSampleDecrypter*& decrypter);
+     
+     // methods
+diff --git a/Source/C++/Core/Ap4Protection.cpp b/Source/C++/Core/Ap4Protection.cpp
+index fd421e9..80bb9f0 100644
+--- a/Source/C++/Core/Ap4Protection.cpp
++++ b/Source/C++/Core/Ap4Protection.cpp
+@@ -812,7 +812,8 @@ AP4_SampleDecrypter::Create(AP4_ProtectedSampleDescription* sample_description,
+                                                                 aux_info_data_offset,
+                                                                 key, 
+                                                                 key_size, 
+-                                                                block_cipher_factory, 
++                                                                block_cipher_factory,
++                                                                NULL,
+                                                                 decrypter);
+             if (AP4_FAILED(result)) return NULL;
+             return decrypter;
+-- 
+2.30.2
+
diff --git a/package/bento4/0012-Static-ReadGolomb-SignedGolomb.patch b/package/bento4/0012-Static-ReadGolomb-SignedGolomb.patch
new file mode 100644
index 0000000000..d20e1191bf
--- /dev/null
+++ b/package/bento4/0012-Static-ReadGolomb-SignedGolomb.patch
@@ -0,0 +1,54 @@
+From 91e148a9c53811447d35c36d9f11f767d49477a0 Mon Sep 17 00:00:00 2001
+From: Glenn Guy <glennguy83@gmail.com>
+Date: Thu, 22 Jul 2021 11:04:26 +0200
+Subject: [PATCH] Static ReadGolomb/SignedGolomb
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Codecs/Ap4AvcParser.cpp | 8 ++++----
+ Source/C++/Codecs/Ap4AvcParser.h   | 3 +++
+ 2 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/Source/C++/Codecs/Ap4AvcParser.cpp b/Source/C++/Codecs/Ap4AvcParser.cpp
+index cfa841d..a17b698 100644
+--- a/Source/C++/Codecs/Ap4AvcParser.cpp
++++ b/Source/C++/Codecs/Ap4AvcParser.cpp
+@@ -191,8 +191,8 @@ AP4_AvcFrameParser::~AP4_AvcFrameParser()
+ /*----------------------------------------------------------------------
+ |   ReadGolomb
+ +---------------------------------------------------------------------*/
+-static unsigned int
+-ReadGolomb(AP4_BitReader& bits)
++unsigned int
++AP4_AvcFrameParser::ReadGolomb(AP4_BitReader& bits)
+ {
+     unsigned int leading_zeros = 0;
+     while (bits.ReadBit() == 0) {
+@@ -209,8 +209,8 @@ ReadGolomb(AP4_BitReader& bits)
+ /*----------------------------------------------------------------------
+ |   SignedGolomb
+ +---------------------------------------------------------------------*/
+-static int
+-SignedGolomb(unsigned int code_num)
++int
++AP4_AvcFrameParser::SignedGolomb(unsigned int code_num)
+ {
+     if (code_num % 2) {
+         return (code_num+1)/2;
+diff --git a/Source/C++/Codecs/Ap4AvcParser.h b/Source/C++/Codecs/Ap4AvcParser.h
+index 99c5320..0c74c0e 100644
+--- a/Source/C++/Codecs/Ap4AvcParser.h
++++ b/Source/C++/Codecs/Ap4AvcParser.h
+@@ -321,6 +321,9 @@ public:
+                                 unsigned int                  nal_ref_idc,
+                                 AP4_AvcSliceHeader&           slice_header);
+ 
++    static unsigned int ReadGolomb(AP4_BitReader& bits);
++    static int SignedGolomb(unsigned int code_num);
++
+ private:
+     // methods
+     bool SameFrame(unsigned int nal_unit_type_1, unsigned int nal_ref_idc_1, AP4_AvcSliceHeader& sh1,
+-- 
+2.30.2
+
diff --git a/package/bento4/0013-Add-GetChannels-method.patch b/package/bento4/0013-Add-GetChannels-method.patch
new file mode 100644
index 0000000000..7e3f6e69ac
--- /dev/null
+++ b/package/bento4/0013-Add-GetChannels-method.patch
@@ -0,0 +1,40 @@
+From 15e31e3641e4f85475984bf4d9ebf8ae47303a8a Mon Sep 17 00:00:00 2001
+From: peak3d <pfau@peak3d.de>
+Date: Thu, 22 Jul 2021 11:07:13 +0200
+Subject: [PATCH] Add GetChannels method
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Core/Ap4Dac3Atom.cpp | 6 ++++++
+ Source/C++/Core/Ap4Dac3Atom.h   | 1 +
+ 2 files changed, 7 insertions(+)
+
+diff --git a/Source/C++/Core/Ap4Dac3Atom.cpp b/Source/C++/Core/Ap4Dac3Atom.cpp
+index 80a511e..a9ea78a 100644
+--- a/Source/C++/Core/Ap4Dac3Atom.cpp
++++ b/Source/C++/Core/Ap4Dac3Atom.cpp
+@@ -143,3 +143,9 @@ AP4_Dac3Atom::InspectFields(AP4_AtomInspector& inspector)
+     inspector.AddField("lfeon", m_StreamInfo.lfeon);
+     return AP4_SUCCESS;
+ }
++
++AP4_UI08 AP4_Dac3Atom::GetChannels() const
++{
++  static const AP4_UI08 CC[] = { 2, 1, 2, 3, 3, 4, 4, 5 };
++  return CC[m_StreamInfo.acmod] + m_StreamInfo.lfeon;
++}
+diff --git a/Source/C++/Core/Ap4Dac3Atom.h b/Source/C++/Core/Ap4Dac3Atom.h
+index 2532ef2..78e2875 100644
+--- a/Source/C++/Core/Ap4Dac3Atom.h
++++ b/Source/C++/Core/Ap4Dac3Atom.h
+@@ -73,6 +73,7 @@ public:
+     const AP4_DataBuffer& GetRawBytes()   const { return m_RawBytes;   }
+     unsigned int          GetDataRate()   const { return m_DataRate;   }
+     const StreamInfo&     GetStreamInfo() const { return m_StreamInfo; }
++    AP4_UI08              GetChannels() const;
+ 
+ private:
+     // methods
+-- 
+2.30.2
+
diff --git a/package/bento4/0014-Implemented-GetSampleIndexForTimeStamp-GetNearestSyn.patch b/package/bento4/0014-Implemented-GetSampleIndexForTimeStamp-GetNearestSyn.patch
new file mode 100644
index 0000000000..a2bc7aefeb
--- /dev/null
+++ b/package/bento4/0014-Implemented-GetSampleIndexForTimeStamp-GetNearestSyn.patch
@@ -0,0 +1,59 @@
+From f673675843144785658a010bab455972d83af004 Mon Sep 17 00:00:00 2001
+From: peak3d <pfau@peak3d.de>
+Date: Thu, 22 Jul 2021 11:09:37 +0200
+Subject: [PATCH] Implemented
+ GetSampleIndexForTimeStamp/GetNearestSyncSampleIndex
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Core/Ap4FragmentSampleTable.cpp | 25 ++++++++++++++++++----
+ 1 file changed, 21 insertions(+), 4 deletions(-)
+
+diff --git a/Source/C++/Core/Ap4FragmentSampleTable.cpp b/Source/C++/Core/Ap4FragmentSampleTable.cpp
+index cea5c7d..1c62f24 100644
+--- a/Source/C++/Core/Ap4FragmentSampleTable.cpp
++++ b/Source/C++/Core/Ap4FragmentSampleTable.cpp
+@@ -297,10 +297,19 @@ AP4_FragmentSampleTable::GetSampleChunkPosition(AP4_Ordinal  sample_index,
+ |   AP4_FragmentSampleTable::GetSampleIndexForTimeStamp
+ +---------------------------------------------------------------------*/
+ AP4_Result 
+-AP4_FragmentSampleTable::GetSampleIndexForTimeStamp(AP4_UI64     /*ts*/, 
++AP4_FragmentSampleTable::GetSampleIndexForTimeStamp(AP4_UI64 ts, 
+                                                     AP4_Ordinal& sample_index)
+ {
+-    sample_index = 0; // TODO
++    if (!m_Samples.ItemCount())
++        return AP4_ERROR_NOT_ENOUGH_DATA;
++
++    sample_index = 0;
++    while (sample_index < m_Samples.ItemCount() && m_Samples[sample_index].GetCts() + m_Samples[sample_index].GetDuration() < ts)
++        ++sample_index;
++
++    if (sample_index == m_Samples.ItemCount())
++        return AP4_ERROR_NOT_ENOUGH_DATA;
++
+     return AP4_SUCCESS;
+ }
+ 
+@@ -308,8 +317,16 @@ AP4_FragmentSampleTable::GetSampleIndexForTimeStamp(AP4_UI64     /*ts*/,
+ |   AP4_FragmentSampleTable::GetNearestSyncSampleIndex
+ +---------------------------------------------------------------------*/
+ AP4_Ordinal  
+-AP4_FragmentSampleTable::GetNearestSyncSampleIndex(AP4_Ordinal /*sample_index*/, bool /*before*/)
++AP4_FragmentSampleTable::GetNearestSyncSampleIndex(AP4_Ordinal sample_index, bool before)
+ {
+-    return 0; // TODO
++    if (sample_index >= m_Samples.ItemCount())
++        return sample_index;
++
++    AP4_Ordinal end(before ? 0 : m_Samples.ItemCount());
++
++    while (sample_index != end && !m_Samples[sample_index].IsSync())
++        sample_index = sample_index + (before ? -1 : 1);
++
++    return sample_index;
+ }
+ 
+-- 
+2.30.2
+
diff --git a/package/bento4/0015-Avoid-set-next-fragment-position.patch b/package/bento4/0015-Avoid-set-next-fragment-position.patch
new file mode 100644
index 0000000000..ded33ffdaf
--- /dev/null
+++ b/package/bento4/0015-Avoid-set-next-fragment-position.patch
@@ -0,0 +1,43 @@
+From 0658d38be16c88585b248b237895b4dc63f28e79 Mon Sep 17 00:00:00 2001
+From: peak3d <pfau@peak3d.de>
+Date: Thu, 22 Jul 2021 11:23:13 +0200
+Subject: [PATCH] Avoid set next fragment position
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Core/Ap4LinearReader.cpp | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/Source/C++/Core/Ap4LinearReader.cpp b/Source/C++/Core/Ap4LinearReader.cpp
+index eabeacf..61c3a9d 100644
+--- a/Source/C++/Core/Ap4LinearReader.cpp
++++ b/Source/C++/Core/Ap4LinearReader.cpp
+@@ -54,8 +54,8 @@ AP4_LinearReader::AP4_LinearReader(AP4_Movie&      movie,
+     m_HasFragments = movie.HasFragments();
+     if (fragment_stream) {
+         fragment_stream->AddReference();
+-        fragment_stream->Tell(m_CurrentFragmentPosition);
+-        m_NextFragmentPosition = m_CurrentFragmentPosition;
++        //fragment_stream->Tell(m_CurrentFragmentPosition);
++        //m_NextFragmentPosition = m_CurrentFragmentPosition;
+     }
+ }
+ 
+@@ -360,9 +360,11 @@ AP4_LinearReader::AdvanceFragment()
+     AP4_Result result;
+      
+     // go the the start of the next fragment
+-    result = m_FragmentStream->Seek(m_NextFragmentPosition);
+-    if (AP4_FAILED(result)) return result;
+-    m_CurrentFragmentPosition = m_NextFragmentPosition;
++    if (m_NextFragmentPosition) {
++        result = m_FragmentStream->Seek(m_NextFragmentPosition);
++        if (AP4_FAILED(result)) return result;
++        m_CurrentFragmentPosition = m_NextFragmentPosition;
++    }
+ 
+     // read atoms until we find a moof
+     assert(m_HasFragments);
+-- 
+2.30.2
+
diff --git a/package/bento4/Config.in b/package/bento4/Config.in
new file mode 100644
index 0000000000..5b9eb127e2
--- /dev/null
+++ b/package/bento4/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_BENTO4
+	bool "bento4"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Bento4 is a C++ class library designed to read and write
+	  ISO-MP4 files.
+
+	  https://www.bento4.com/
+
+comment "bento4 support needs a toolchain with C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/bento4/bento4.hash b/package/bento4/bento4.hash
new file mode 100644
index 0000000000..8b9ec610f5
--- /dev/null
+++ b/package/bento4/bento4.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  9f3eb912207d7ed9c1e6e05315083404b32a11f8aacd604a9b2bdcb10bf79eb9  bento4-1.6.0-639.tar.gz
+sha256  7daae92c8628ada28def8d096fe2fde298b72ec3e2d64a3c408afce38edb361b  Documents/LICENSE.txt
diff --git a/package/bento4/bento4.mk b/package/bento4/bento4.mk
new file mode 100644
index 0000000000..5e3a3d43be
--- /dev/null
+++ b/package/bento4/bento4.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# bento4
+#
+################################################################################
+
+BENTO4_VERSION = 1.6.0-639
+BENTO4_SITE = $(call github,axiomatic-systems,Bento4,v$(BENTO4_VERSION))
+BENTO4_INSTALL_STAGING = YES
+BENTO4_LICENSE = GPL-2.0+
+BENTO4_LICENSE_FILES = Documents/LICENSE.txt
+
+# Source/C++/Core/Ap4Config.h
+ifeq ($(BR2_ENDIAN),"BIG")
+BENTO4_BYTE_ORDER += 0
+else
+BENTO4_BYTE_ORDER += 1
+endif
+
+BENTO4_CONF_OPTS += \
+	-DBUILD_APPS=OFF \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -std=c++11 -fPIC -DAP4_PLATFORM_BYTE_ORDER=$(BENTO4_BYTE_ORDER)"
+
+$(eval $(cmake-package))
-- 
2.30.2


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

