From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 00:51:24 +0200
Subject: [Buildroot] [git commit] nanocom: use <PKG>_STRIP_COMPONENTS
Message-ID: <20150711225139.C26788081D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c0188d7a578ae7294e50f6c19b033ac150e914c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nanocom/nanocom.mk |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
index f723951..293dd09 100644
--- a/package/nanocom/nanocom.mk
+++ b/package/nanocom/nanocom.mk
@@ -7,14 +7,10 @@
 NANOCOM_VERSION = 1.0
 NANOCOM_SOURCE = nanocom.tar.gz
 NANOCOM_SITE = http://downloads.sourceforge.net/project/nanocom/nanocom/v$(NANOCOM_VERSION)
+NANOCOM_STRIP_COMPONENTS = 0
 NANOCOM_LICENSE = GPLv2+
 NANOCOM_LICENSE_FILES = COPYING
 
-# N.B. Don't strip any path components during extraction.
-define NANOCOM_EXTRACT_CMDS
-	gzip -d -c $(DL_DIR)/$(NANOCOM_SOURCE) | tar --strip-components=0 -C $(NANOCOM_DIR) -xf -
-endef
-
 define NANOCOM_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" -C $(@D)
 endef
