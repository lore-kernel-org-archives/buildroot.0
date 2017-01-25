From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 23:25:07 +1300
Subject: [Buildroot] [git commit] ocrad: bump to version 0.25
Message-ID: <20170125102515.9E4FB81F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a21d2c94091596ecf9a66726265eb5641c35d653
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
[Thomas:
 - fix indentation.]
 - use $(TAR_OPTIONS) instead of hardcoding -xf.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ocrad/ocrad.hash | 2 +-
 package/ocrad/ocrad.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/ocrad/ocrad.hash b/package/ocrad/ocrad.hash
index c40907b..d2a44ae 100644
--- a/package/ocrad/ocrad.hash
+++ b/package/ocrad/ocrad.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	4ec711239d6b667bac015ef9908cab3ea9f8fd73f098ae355498810c8e82a8cc	ocrad-0.21.tar.gz
+sha256	e710be9c030fbcbce2315077326c8268feb422c0bc39fa744644cbbd1f5d4dd4	ocrad-0.25.tar.lz
diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
index 7e4f8c1..d19e83e 100644
--- a/package/ocrad/ocrad.mk
+++ b/package/ocrad/ocrad.mk
@@ -4,11 +4,18 @@
 #
 ################################################################################
 
-OCRAD_VERSION = 0.21
+OCRAD_VERSION = 0.25
+OCRAD_SOURCE = ocrad-$(OCRAD_VERSION).tar.lz
 OCRAD_SITE = $(BR2_GNU_MIRROR)/ocrad
 OCRAD_LICENSE = GPLv3+
 OCRAD_LICENSE_FILES = COPYING
 OCRAD_INSTALL_STAGING = YES
+OCRAD_DEPENDENCIES = host-lzip
+
+define OCRAD_EXTRACT_CMDS
+	$(HOST_DIR)/usr/bin/lzip -d -c $(DL_DIR)/$(OCRAD_SOURCE) | \
+		tar --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
+endef
 
 # This is not a true autotools package.
 define OCRAD_CONFIGURE_CMDS
