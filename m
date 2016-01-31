From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 21:08:44 +0100
Subject: [Buildroot] [git commit] package/open-plc-utils: bump version
Message-ID: <20160201224714.529A87F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=247cc9ef70c710742c4aa130d27d445be0708a3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch for scripts/Makefile because the file was removed upstream:
https://github.com/qca/open-plc-utils/commit/3682e7be80b76490360b655c6217da41bfb90a8e

Fixes musl build error:
http://autobuild.buildroot.net/results/582/5824f101d21698d562e9836c571ceab6fdfadc29//

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-Remove-OWNER-and-GROUPS-parameters-to-install.patch | 15 ---------------
 package/open-plc-utils/open-plc-utils.mk                  |  2 +-
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch b/package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch
index 061b3a6..9fc30a9 100644
--- a/package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch
+++ b/package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch
@@ -237,21 +237,6 @@ index 60b9bb3..c951218 100755
  uninstall:
  	cd ${BIN}; rm -f ${TOOLS}
  	cd ${MAN}; rm -f ${PAGES}
-diff --git a/scripts/Makefile b/scripts/Makefile
-index c9a785a..022e5f9 100755
---- a/scripts/Makefile
-+++ b/scripts/Makefile
-@@ -30,8 +30,8 @@ all compile:
- install:
- scripts:
- manuals:
--	test -d ${MAN} || install -m ${DIR_PERM} -o ${OWNER} -g ${GROUP} -d ${MAN}
--	install -m ${MAN_PERM} -o ${OWNER} -g ${GROUP} ${PAGES} ${MAN}
-+	test -d ${MAN} || install -m ${DIR_PERM} -d ${MAN}
-+	install -m ${MAN_PERM} ${PAGES} ${MAN}
- library:
- uninstall:
- clean:
 diff --git a/serial/Makefile b/serial/Makefile
 index c25f1a6..6420d4a 100755
 --- a/serial/Makefile
diff --git a/package/open-plc-utils/open-plc-utils.mk b/package/open-plc-utils/open-plc-utils.mk
index 61badcd..a674372 100644
--- a/package/open-plc-utils/open-plc-utils.mk
+++ b/package/open-plc-utils/open-plc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN_PLC_UTILS_VERSION = 1f6e7e372b313cf570aa63314037588ed01ec0de
+OPEN_PLC_UTILS_VERSION = 05ef40c0a2949cfaf1c3230e10679fbcf912d174
 OPEN_PLC_UTILS_SITE = $(call github,qca,open-plc-utils,$(OPEN_PLC_UTILS_VERSION))
 OPEN_PLC_UTILS_LICENSE = BSD-3c
 OPEN_PLC_UTILS_LICENSE_FILES = LICENSE
