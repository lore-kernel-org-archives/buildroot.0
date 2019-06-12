From: Victor Huesca <victor.huesca@bootlin.com>
Date: Wed, 12 Jun 2019 08:42:08 +0200
Subject: [Buildroot] [PATCH 3/4] package: remove non-conventional
 prefix/suffix from github-fetched packages
In-Reply-To: <20190612064209.23619-1-victor.huesca@bootlin.com>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
Message-ID: <20190612064209.23619-4-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Github, a large number of projects name their tag
<some-prefix>-0.3-<some-suffix> (i.e release-3.0, poco-0.1-release,
etc.). In fact majority of the cased adressed in this commit concerns
prefixes.

In most packages, we encode those prefix/suffix in the <pkg>_VERSION
variable.

The problem with this approach is that when used in conjunction with
release-monitoring.org, it doesn't work very well, because
release-monitoring.org has the concept of "version prefix/suffix" and
using that they drop the prefix/suffix to really get the version. For
example on https://release-monitoring.org/project/5418/ the latest
release of "poco" is "1.8.1", not "poco-1.8.1-release".

Therefore, a number of packages in Buildroot have a version that
doesn't match with release-monitoring.org.

Since really the version number of 1.8.1, is makes sense to update our
packages to drop these prefixes/suffixes.

This commit addreses the case of github-fetched packages with
non-conventional prefixes/suffixes.

Note that these changes modify the name of the files stored in DL_DIR,
which means that this will force a re-download of those package source
code for all users, and requires a change to their .hash file.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 package/emlog/emlog.hash                     | 2 +-
 package/emlog/emlog.mk                       | 4 ++--
 package/gtest/gtest.hash                     | 2 +-
 package/gtest/gtest.mk                       | 4 ++--
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 4 ++--
 package/iputils/iputils.hash                 | 2 +-
 package/iputils/iputils.mk                   | 4 ++--
 package/jasper/jasper.hash                   | 2 +-
 package/jasper/jasper.mk                     | 4 ++--
 package/libnfs/libnfs.hash                   | 2 +-
 package/libnfs/libnfs.mk                     | 4 ++--
 package/libusbgx/libusbgx.hash               | 2 +-
 package/libusbgx/libusbgx.mk                 | 4 ++--
 package/lua-cqueues/lua-cqueues.hash         | 2 +-
 package/lua-cqueues/lua-cqueues.mk           | 4 ++--
 package/motion/motion.hash                   | 2 +-
 package/motion/motion.mk                     | 4 ++--
 package/openjdk/openjdk.hash                 | 2 +-
 package/openjdk/openjdk.mk                   | 4 ++--
 package/poco/poco.hash                       | 2 +-
 package/poco/poco.mk                         | 4 ++--
 package/ptpd2/ptpd2.hash                     | 2 +-
 package/ptpd2/ptpd2.mk                       | 4 ++--
 package/python-web2py/python-web2py.hash     | 2 +-
 package/python-web2py/python-web2py.mk       | 4 ++--
 package/python-webpy/python-webpy.hash       | 2 +-
 package/python-webpy/python-webpy.mk         | 4 ++--
 package/xinetd/xinetd.hash                   | 2 +-
 package/xinetd/xinetd.mk                     | 4 ++--
 30 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/package/emlog/emlog.hash b/package/emlog/emlog.hash
index 9d81d47ec2..ba0a201acb 100644
--- a/package/emlog/emlog.hash
+++ b/package/emlog/emlog.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9f791a00c86215306597b761ef5c5ad267efee5f01efbe23cfcc04e583aa402d  emlog-emlog-0.60.tar.gz
+sha256 9f791a00c86215306597b761ef5c5ad267efee5f01efbe23cfcc04e583aa402d  emlog-0.60.tar.gz
diff --git a/package/emlog/emlog.mk b/package/emlog/emlog.mk
index e0926e6cbd..42e3c9dd7b 100644
--- a/package/emlog/emlog.mk
+++ b/package/emlog/emlog.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EMLOG_VERSION = emlog-0.60
-EMLOG_SITE = $(call github,nicupavel,emlog,$(EMLOG_VERSION))
+EMLOG_VERSION = 0.60
+EMLOG_SITE = $(call github,nicupavel,emlog,emlog-$(EMLOG_VERSION))
 EMLOG_LICENSE = GPL-2.0
 EMLOG_LICENSE_FILES = COPYING
 
diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
index 0a8d8ba096..aa42570eb2 100644
--- a/package/gtest/gtest.hash
+++ b/package/gtest/gtest.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8	gtest-release-1.8.0.tar.gz
+sha256	58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8	gtest-1.8.0.tar.gz
 sha256	9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138	googletest/LICENSE
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index b62ceb3270..f26098bad7 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GTEST_VERSION = release-1.8.0
-GTEST_SITE = $(call github,google,googletest,$(GTEST_VERSION))
+GTEST_VERSION = 1.8.0
+GTEST_SITE = $(call github,google,googletest,release-$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
 GTEST_LICENSE = BSD-3-Clause
diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 257cc85c41..bb474ad2bb 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 9e67903a5b62b51f5e031b59a8046d3dff226834d79899799943803481a55d20  intel-microcode-microcode-20190514a.tar.gz
+sha256 9e67903a5b62b51f5e031b59a8046d3dff226834d79899799943803481a55d20  intel-microcode-20190514a.tar.gz
 sha256 1f8bf63fc2b1b486c507b98ff7d283c7eb58c7945746b94188a310d6787cbee5  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index dacb619a14..1279a1d364 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = microcode-20190514a
-INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,$(INTEL_MICROCODE_VERSION))
+INTEL_MICROCODE_VERSION = 20190514a
+INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
 INTEL_MICROCODE_REDISTRIBUTE = NO
diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index 613414ce5c..0e2963dda2 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 9b5125eb5ef9f4e947ad8fdddcf77f538f53b8f47b53eb5bc5347cb16d01c8fd  iputils-s20190515.tar.gz
+sha256 9b5125eb5ef9f4e947ad8fdddcf77f538f53b8f47b53eb5bc5347cb16d01c8fd  iputils-20190515.tar.gz
 sha256 b8ea785d12fa6a44916601104dd746216957e93f13a26d3eb858b3b5a4ad66ab  LICENSE
 sha256 9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/LICENSE.GPL2
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 8be54b4788..ffeabde513 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -11,8 +11,8 @@
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = s20190515
-IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
+IPUTILS_VERSION = 20190515
+IPUTILS_SITE = $(call github,iputils,iputils,s$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
 IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 4fea367ebc..036ebc88d7 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 85266eea728f8b14365db9eaf1edc7be4c348704e562bb05095b9a077cf1a97b  jasper-version-2.0.14.tar.gz
+sha256 85266eea728f8b14365db9eaf1edc7be4c348704e562bb05095b9a077cf1a97b  jasper-2.0.14.tar.gz
 sha256 4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 31fded779b..f1260f2a9c 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JASPER_VERSION = version-2.0.14
-JASPER_SITE = $(call github,mdadams,jasper,$(JASPER_VERSION))
+JASPER_VERSION = 2.0.14
+JASPER_SITE = $(call github,mdadams,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
 JASPER_LICENSE_FILES = LICENSE
diff --git a/package/libnfs/libnfs.hash b/package/libnfs/libnfs.hash
index 9cd2fd71c5..bb92ebe697 100644
--- a/package/libnfs/libnfs.hash
+++ b/package/libnfs/libnfs.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 6ee77e9fe220e2d3e3b1f53cfea04fb319828cc7dbb97dd9df09e46e901d797d  libnfs-libnfs-4.0.0.tar.gz
+sha256 6ee77e9fe220e2d3e3b1f53cfea04fb319828cc7dbb97dd9df09e46e901d797d  libnfs-4.0.0.tar.gz
 sha256 edd960c0142b8ada98b43b6396b78f4e557b0bc70ac601a51e397ad04070e2c5  COPYING
 sha256 d9406ced95457941032aa11d04623b8ab71f2827a3395ebef137aec475be35b1  LICENCE-BSD.txt
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 5c8f66b011..5f950b5cde 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNFS_VERSION = libnfs-4.0.0
-LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
+LIBNFS_VERSION = 4.0.0
+LIBNFS_SITE = $(call github,sahlberg,libnfs,libnfs-$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
 LIBNFS_LICENSE = LGPL-2.1+ (library), BSD-2-Clause (protocol, .x files), GPL-3.0+ (examples)
diff --git a/package/libusbgx/libusbgx.hash b/package/libusbgx/libusbgx.hash
index 107123ae11..dd43ec7b97 100644
--- a/package/libusbgx/libusbgx.hash
+++ b/package/libusbgx/libusbgx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  b15abc89a0ef82c6a650cc1d58b5ba50f7ce076db392add84caabcd86c608ee2  libusbgx-libusbgx-v0.2.0.tar.gz
+sha256  b15abc89a0ef82c6a650cc1d58b5ba50f7ce076db392add84caabcd86c608ee2  libusbgx-0.2.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/libusbgx/libusbgx.mk b/package/libusbgx/libusbgx.mk
index e7c082f9f3..516ad25970 100644
--- a/package/libusbgx/libusbgx.mk
+++ b/package/libusbgx/libusbgx.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBUSBGX_VERSION = libusbgx-v0.2.0
-LIBUSBGX_SITE = $(call github,libusbgx,libusbgx,$(LIBUSBGX_VERSION))
+LIBUSBGX_VERSION = 0.2.0
+LIBUSBGX_SITE = $(call github,libusbgx,libusbgx,libusbgx-v$(LIBUSBGX_VERSION))
 LIBUSBGX_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
 LIBUSBGX_LICENSE_FILES = COPYING COPYING.LGPL
 LIBUSBGX_DEPENDENCIES = host-pkgconf libconfig
diff --git a/package/lua-cqueues/lua-cqueues.hash b/package/lua-cqueues/lua-cqueues.hash
index 9fd664d69a..7824c08f9b 100644
--- a/package/lua-cqueues/lua-cqueues.hash
+++ b/package/lua-cqueues/lua-cqueues.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ae51b713bdf966215b87244e03ac60b5a12beb82d15dfb02755a000cfb2df905  lua-cqueues-rel-20161215.tar.gz
+sha256 ae51b713bdf966215b87244e03ac60b5a12beb82d15dfb02755a000cfb2df905  lua-cqueues-20161215.tar.gz
diff --git a/package/lua-cqueues/lua-cqueues.mk b/package/lua-cqueues/lua-cqueues.mk
index 4f31c3277f..5cd30ce8dc 100644
--- a/package/lua-cqueues/lua-cqueues.mk
+++ b/package/lua-cqueues/lua-cqueues.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUA_CQUEUES_VERSION = rel-20161215
-LUA_CQUEUES_SITE = $(call github,wahern,cqueues,$(LUA_CQUEUES_VERSION))
+LUA_CQUEUES_VERSION = 20161215
+LUA_CQUEUES_SITE = $(call github,wahern,cqueues,rel-$(LUA_CQUEUES_VERSION))
 LUA_CQUEUES_LICENSE = MIT
 LUA_CQUEUES_LICENSE_FILES = LICENSE
 LUA_CQUEUES_DEPENDENCIES = luainterpreter openssl host-m4
diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index 679defa3d3..4ce70f8640 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	d97ec6ae766adfd478b6f7f9cc0da5f2fe21faa9366d98664be255714c1cf81d	motion-release-4.2.1.tar.gz
+sha256	d97ec6ae766adfd478b6f7f9cc0da5f2fe21faa9366d98664be255714c1cf81d	motion-4.2.1.tar.gz
 sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 6dfc5a5619..eb7f75e3fb 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MOTION_VERSION = release-4.2.1
-MOTION_SITE = $(call github,Motion-Project,motion,$(MOTION_VERSION))
+MOTION_VERSION = 4.2.1
+MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = COPYING
 MOTION_DEPENDENCIES = host-pkgconf jpeg libmicrohttpd $(TARGET_NLS_DEPENDENCIES)
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 91d0f1dbce..e94d4d6d44 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 de278328668bdaf35d50d0319d15d64d195ddd8a0de9c6fde3a6c9ca10135a92  openjdk-jdk-12+33.tar.gz
+sha256 de278328668bdaf35d50d0319d15d64d195ddd8a0de9c6fde3a6c9ca10135a92  openjdk-12+33.tar.gz
 sha256 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 91a00870c5..e6e834cde9 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,8 +6,8 @@
 
 OPENJDK_VERSION_MAJOR = 12
 OPENJDK_VERSION_MINOR = 33
-OPENJDK_VERSION = jdk-$(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
-OPENJDK_SITE = $(call github,AdoptOpenJDK,openjdk-jdk12u,$(OPENJDK_VERSION))
+OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
+OPENJDK_SITE = $(call github,AdoptOpenJDK,openjdk-jdk12u,jdk-$(OPENJDK_VERSION))
 OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
 
diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 0c0266f472..33e60dba45 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  43cc469c01d1f799efc51e2bfde6ffdf467b98a8a0901e6b33db86958619b3af  poco-poco-1.8.1-release.tar.gz
+sha256  43cc469c01d1f799efc51e2bfde6ffdf467b98a8a0901e6b33db86958619b3af  poco-1.8.1.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index aa96d5127b..7283447f9d 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POCO_VERSION = poco-1.8.1-release
-POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION))
+POCO_VERSION = 1.8.1
+POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
 POCO_INSTALL_STAGING = YES
diff --git a/package/ptpd2/ptpd2.hash b/package/ptpd2/ptpd2.hash
index af1f78a5a8..0a7379a1d8 100644
--- a/package/ptpd2/ptpd2.hash
+++ b/package/ptpd2/ptpd2.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	267ad61d09d97069acec5d4878dceda20d0ddbebd27557d80230847848cee6c2	ptpd2-ptpd-2.3.1.tar.gz
+sha256	267ad61d09d97069acec5d4878dceda20d0ddbebd27557d80230847848cee6c2	ptpd2-2.3.1.tar.gz
diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index c0c414ae83..f4a70760ad 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PTPD2_VERSION = ptpd-2.3.1
-PTPD2_SITE = $(call github,ptpd,ptpd,$(PTPD2_VERSION))
+PTPD2_VERSION = 2.3.1
+PTPD2_SITE = $(call github,ptpd,ptpd,ptpd-$(PTPD2_VERSION))
 PTPD2_DEPENDENCIES = libpcap
 PTPD2_CONF_OPTS = --with-pcap-config=$(STAGING_DIR)/usr/bin/pcap-config
 # configure not shipped
diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index 9a1df0c2a1..57ac02c2a9 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256 8205a7a08595ca1a41919750a8dc4e431258966cb46c8021564b25003cf90863  python-web2py-R-2.17.2.tar.gz
+sha256 8205a7a08595ca1a41919750a8dc4e431258966cb46c8021564b25003cf90863  python-web2py-2.17.2.tar.gz
 sha256 2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 922b267b8b..0b86fb148e 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = R-2.17.2
-PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
+PYTHON_WEB2PY_VERSION = 2.17.2
+PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,R-$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
 PYTHON_WEB2PY_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python) \
diff --git a/package/python-webpy/python-webpy.hash b/package/python-webpy/python-webpy.hash
index 70981e0cb4..8ac6827538 100644
--- a/package/python-webpy/python-webpy.hash
+++ b/package/python-webpy/python-webpy.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  f074241a0b839408a0b9840ade1198e16fbd6aa6393a48a0e84f73b545baab9a  python-webpy-webpy-0.39.tar.gz
+sha256  f074241a0b839408a0b9840ade1198e16fbd6aa6393a48a0e84f73b545baab9a  python-webpy-0.39.tar.gz
 sha256  3826fd531a9b904841f5e3560fcda7e93f2ab8d11ef124ec65e10625efa26c34  LICENSE.txt
 sha256  7347fd17bfd33c4093c31dc77076733e1e0150ce8c13296c56dc042bbecede84  web/wsgiserver/LICENSE.txt
diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
index 192ba5727f..86812a04cb 100644
--- a/package/python-webpy/python-webpy.mk
+++ b/package/python-webpy/python-webpy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_WEBPY_VERSION = webpy-0.39
-PYTHON_WEBPY_SITE = $(call github,webpy,webpy,$(PYTHON_WEBPY_VERSION))
+PYTHON_WEBPY_VERSION = 0.39
+PYTHON_WEBPY_SITE = $(call github,webpy,webpy,webpy-$(PYTHON_WEBPY_VERSION))
 PYTHON_WEBPY_SETUP_TYPE = setuptools
 PYTHON_WEBPY_LICENSE = Public Domain, CherryPy License
 PYTHON_WEBPY_LICENSE_FILES = LICENSE.txt web/wsgiserver/LICENSE.txt
diff --git a/package/xinetd/xinetd.hash b/package/xinetd/xinetd.hash
index 051436613c..d02d6d3a50 100644
--- a/package/xinetd/xinetd.hash
+++ b/package/xinetd/xinetd.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  620b25f4ab4d72fdf32b13797156ea40df2049f1c07e640177e5fec544e9a94c  xinetd-xinetd-2-3-15.tar.gz
+sha256  620b25f4ab4d72fdf32b13797156ea40df2049f1c07e640177e5fec544e9a94c  xinetd-2-3-15.tar.gz
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index 98185122ce..a2ba10df74 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XINETD_VERSION = xinetd-2-3-15
-XINETD_SITE = $(call github,xinetd-org,xinetd,$(XINETD_VERSION))
+XINETD_VERSION = 2-3-15
+XINETD_SITE = $(call github,xinetd-org,xinetd,xinetd-$(XINETD_VERSION))
 XINETD_LICENSE = xinetd license
 XINETD_LICENSE_FILES = COPYRIGHT
 
-- 
2.21.0
