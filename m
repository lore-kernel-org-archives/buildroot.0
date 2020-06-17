From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 17 Jun 2020 15:21:58 -0700
Subject: [Buildroot] [PATCH 1/2] package/open-plc-utils: bump to version
 32408520fcebe785983a68e39ec83830a3005779
Message-ID: <20200617222159.176141-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Update 0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch to apply
    properly with the udpated version.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 ...NER-and-GROUPS-parameters-to-install.patch | 99 ++++++++-----------
 package/open-plc-utils/open-plc-utils.hash    |  2 +-
 package/open-plc-utils/open-plc-utils.mk      |  2 +-
 3 files changed, 41 insertions(+), 62 deletions(-)

diff --git a/package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch b/package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch
index 9fc30a969f..d3364440e4 100644
--- a/package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch
+++ b/package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch
@@ -1,4 +1,4 @@
-From fdfeac7e77382ddd0e3fb4f2abeae84f0a31584f Mon Sep 17 00:00:00 2001
+From 1fe7b756365254f7175558e7a89c1d89f95c5e2e Mon Sep 17 00:00:00 2001
 From: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
 Date: Tue, 30 Sep 2014 13:46:59 +0200
 Subject: [PATCH] Remove OWNER and GROUPS parameters to install
@@ -8,25 +8,25 @@ Buildroot we don't want that, since fakeroot will do its job when we
 finalize the rootfs.
 
 Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
+[aduskett at gmail.com: Updated for 32408520fcebe785983a68e39ec83830a3005779]
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 ---
- docbook/Makefile  | 4 ++--
- ether/Makefile    | 8 ++++----
- iso15118/Makefile | 8 ++++----
- key/Makefile      | 8 ++++----
- mdio/Makefile     | 8 ++++----
- mme/Makefile      | 8 ++++----
- nvm/Makefile      | 8 ++++----
- pib/Makefile      | 8 ++++----
- plc/Makefile      | 8 ++++----
- ram/Makefile      | 8 ++++----
- scripts/Makefile  | 4 ++--
- serial/Makefile   | 8 ++++----
- slac/Makefile     | 8 ++++----
- tools/Makefile    | 2 +-
- 14 files changed, 49 insertions(+), 49 deletions(-)
+ docbook/Makefile | 4 ++--
+ ether/Makefile   | 8 ++++----
+ key/Makefile     | 8 ++++----
+ mdio/Makefile    | 8 ++++----
+ mme/Makefile     | 8 ++++----
+ nvm/Makefile     | 8 ++++----
+ pib/Makefile     | 8 ++++----
+ plc/Makefile     | 8 ++++----
+ ram/Makefile     | 8 ++++----
+ serial/Makefile  | 8 ++++----
+ slac/Makefile    | 8 ++++----
+ tools/Makefile   | 2 +-
+ 12 files changed, 43 insertions(+), 43 deletions(-)
 
 diff --git a/docbook/Makefile b/docbook/Makefile
-index d630822..23a9b5a 100755
+index d630822..039d62a 100755
 --- a/docbook/Makefile
 +++ b/docbook/Makefile
 @@ -32,9 +32,9 @@ manuals:
@@ -42,7 +42,7 @@ index d630822..23a9b5a 100755
  	rm -f ${LIBRARY}/*.c.html ${LIBRARY}/*.h.html ${LIBRARY}/*.1.html
  setup:
 diff --git a/ether/Makefile b/ether/Makefile
-index 807cbcb..574050a 100755
+index 89174cb..8256d50 100755
 --- a/ether/Makefile
 +++ b/ether/Makefile
 @@ -27,13 +27,13 @@ compact: compile
@@ -62,31 +62,9 @@ index 807cbcb..574050a 100755
 +	install -m ${SUID_PERM} ${TOOLS} ${BIN}
  uninstall:
  	cd ${BIN}; rm -f ${TOOLS}
- check:
-diff --git a/iso15118/Makefile b/iso15118/Makefile
-index 72afdc4..da11a1c 100755
---- a/iso15118/Makefile
-+++ b/iso15118/Makefile
-@@ -27,13 +27,13 @@ compact: compile
- 	if [ ! -z ${STRIP} ]; then ${STRIP} ${TOOLS}; fi
- 	if [ -x /usr/local/bin/upx ]; then upx --best ${TOOLS}; fi
- library:
--	install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${BIN}
-+	install -m ${DIR_PERM} -d ${BIN}
- scripts:
- manuals:
--	if [ ! -d ${MAN} ]; then install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${MAN}; fi
--	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
-+	if [ ! -d ${MAN} ]; then install -m ${DIR_PERM} -d ${MAN}; fi
-+	install -m ${MAN_PERM} ${PAGES} ${MAN}
- install: compile library
--	install -m ${SUID_PERM} -o ${OWNER} -g ${GROUP} ${TOOLS} ${BIN}
-+	install -m ${SUID_PERM} ${TOOLS} ${BIN}
- uninstall:
- 	cd ${BIN}; rm -f plc ${TOOLS}
- 	cd ${MAN}; rm -f plc ${PAGES}
+ 	cd ${MAN}; rm -f ${PAGES}
 diff --git a/key/Makefile b/key/Makefile
-index 7de75ff..ee8968c 100755
+index de62a49..78fa200 100755
 --- a/key/Makefile
 +++ b/key/Makefile
 @@ -28,13 +28,13 @@ compact: compile
@@ -108,7 +86,7 @@ index 7de75ff..ee8968c 100755
  	cd ${BIN}; rm -f ${TOOLS}
  	cd ${MAN}; rm -f ${PAGES}
 diff --git a/mdio/Makefile b/mdio/Makefile
-index 60a75a9..062d858 100755
+index 049b08e..3ff4c26 100755
 --- a/mdio/Makefile
 +++ b/mdio/Makefile
 @@ -27,13 +27,13 @@ compact: compile
@@ -130,7 +108,7 @@ index 60a75a9..062d858 100755
  	cd ${BIN}; rm -f int6k ${TOOLS}
  	cd ${MAN}; rm -f int6k ${PAGES}
 diff --git a/mme/Makefile b/mme/Makefile
-index d6a9132..23f4775 100755
+index 0313aea..77a6b96 100755
 --- a/mme/Makefile
 +++ b/mme/Makefile
 @@ -27,13 +27,13 @@ compact: compile
@@ -150,9 +128,9 @@ index d6a9132..23f4775 100755
 +	install -m ${BIN_PERM} ${TOOLS} ${BIN}
  uninstall:
  	cd ${BIN}; rm -f ${TOOLS}
- check:
+ 	cd ${MAN}; rm -f ${PAGES}
 diff --git a/nvm/Makefile b/nvm/Makefile
-index 5ae47d2..d7f4037 100755
+index 9aa05ec..b468e70 100755
 --- a/nvm/Makefile
 +++ b/nvm/Makefile
 @@ -28,12 +28,12 @@ compact: compile
@@ -171,9 +149,9 @@ index 5ae47d2..d7f4037 100755
 +	install -m ${BIN_PERM} ${TOOLS} ${BIN}
  uninstall:
  	cd ${BIN}; rm -f ${TOOLS}
- check:
+ 	cd ${MAN}; rm -f ${PAGES}
 diff --git a/pib/Makefile b/pib/Makefile
-index 3af94c8..908b03a 100644
+index 93f0c3b..23195b4 100644
 --- a/pib/Makefile
 +++ b/pib/Makefile
 @@ -30,12 +30,12 @@ compact: compile
@@ -192,9 +170,9 @@ index 3af94c8..908b03a 100644
 +	install -m ${BIN_PERM} ${TOOLS} ${BIN}
  uninstall:
  	cd ${BIN}; rm -f ${TOOLS}
- check:
+ 	cd ${MAN}; rm -f ${PAGES}
 diff --git a/plc/Makefile b/plc/Makefile
-index bd8b806..5b41c0b 100644
+index 43d6bd5..9fd4e0a 100644
 --- a/plc/Makefile
 +++ b/plc/Makefile
 @@ -32,13 +32,13 @@ compact: compile
@@ -213,10 +191,10 @@ index bd8b806..5b41c0b 100644
 -	install -m ${SUID_PERM} -o ${OWNER} -g ${GROUP} ${TOOLS} ${BIN}
 +	install -m ${SUID_PERM} ${TOOLS} ${BIN}
  uninstall:
- 	cd ${BIN}; rm -f int6k ${TOOLS}
- 	cd ${MAN}; rm -f int6k ${PAGES}
+ 	cd ${BIN}; rm -f ${TOOLS}
+ 	cd ${MAN}; rm -f ${PAGES}
 diff --git a/ram/Makefile b/ram/Makefile
-index 60b9bb3..c951218 100755
+index 60b9bb3..c34ddd0 100755
 --- a/ram/Makefile
 +++ b/ram/Makefile
 @@ -27,13 +27,13 @@ compact: compile
@@ -238,7 +216,7 @@ index 60b9bb3..c951218 100755
  	cd ${BIN}; rm -f ${TOOLS}
  	cd ${MAN}; rm -f ${PAGES}
 diff --git a/serial/Makefile b/serial/Makefile
-index c25f1a6..6420d4a 100755
+index c25f1a6..aebbac9 100755
 --- a/serial/Makefile
 +++ b/serial/Makefile
 @@ -27,13 +27,13 @@ compact: compile
@@ -260,7 +238,7 @@ index c25f1a6..6420d4a 100755
  	cd ${BIN}; rm -f int6k ${TOOLS}
  	cd ${MAN}; rm -f int6k ${PAGES}
 diff --git a/slac/Makefile b/slac/Makefile
-index d69da17..449f20a 100755
+index bd12db9..1f0b65d 100755
 --- a/slac/Makefile
 +++ b/slac/Makefile
 @@ -27,13 +27,13 @@ compact: compile
@@ -279,10 +257,10 @@ index d69da17..449f20a 100755
 -	install -m ${SUID_PERM} -o ${OWNER} -g ${GROUP} ${TOOLS} ${BIN}
 +	install -m ${SUID_PERM} ${TOOLS} ${BIN}
  uninstall:
- 	cd ${BIN}; rm -f plc ${TOOLS}
- 	cd ${MAN}; rm -f plc ${PAGES}
+ 	cd ${BIN}; rm -f ${TOOLS}
+ 	cd ${MAN}; rm -f ${PAGES}
 diff --git a/tools/Makefile b/tools/Makefile
-index 1d992cf..f17db3d 100755
+index 1d992cf..a74fd24 100755
 --- a/tools/Makefile
 +++ b/tools/Makefile
 @@ -27,7 +27,7 @@ compact: compile
@@ -294,5 +272,6 @@ index 1d992cf..f17db3d 100755
  scripts:
  manuals:
  #	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
---
-2.1.0
+-- 
+2.26.2
+
diff --git a/package/open-plc-utils/open-plc-utils.hash b/package/open-plc-utils/open-plc-utils.hash
index 0c3b64b7e7..1788b42fc0 100644
--- a/package/open-plc-utils/open-plc-utils.hash
+++ b/package/open-plc-utils/open-plc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  00cd7f71e03849b1d6a96ec040351b819481e2f420cfb246f0b0f02cde73e098  open-plc-utils-1be781d1ea81827e5f6c1a35961c65dd4d15472c.tar.gz
+sha256  b0156567a71c608cc1a0b18bbb1c5a97dd0ad9180097435f7e99119712bb299b  open-plc-utils-32408520fcebe785983a68e39ec83830a3005779.tar.gz
 sha256  3137c632bbcec5e88b72dc13f4fe06ee184eea364fec8f7494bdfa57672ef921  LICENSE
diff --git a/package/open-plc-utils/open-plc-utils.mk b/package/open-plc-utils/open-plc-utils.mk
index e1e66bf7e0..bb40432697 100644
--- a/package/open-plc-utils/open-plc-utils.mk
+++ b/package/open-plc-utils/open-plc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN_PLC_UTILS_VERSION = 1be781d1ea81827e5f6c1a35961c65dd4d15472c
+OPEN_PLC_UTILS_VERSION = 32408520fcebe785983a68e39ec83830a3005779
 OPEN_PLC_UTILS_SITE = $(call github,qca,open-plc-utils,$(OPEN_PLC_UTILS_VERSION))
 OPEN_PLC_UTILS_LICENSE = BSD-3-Clause
 OPEN_PLC_UTILS_LICENSE_FILES = LICENSE
-- 
2.26.2
