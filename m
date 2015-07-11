From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 00:51:30 +0200
Subject: [Buildroot] [git commit] tzdata: use <PKG>_STRIP_COMPONENTS
Message-ID: <20150711225139.CCA048081D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8fe6ee1631cc3713247d29d5f45dfe280e176b16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tzdata/tzdata.mk |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index eb6da6c..c38d4fe 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -7,6 +7,7 @@
 TZDATA_VERSION = 2015e
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = ftp://ftp.iana.org/tz/releases
+TZDATA_STRIP_COMPONENTS = 0
 TZDATA_DEPENDENCIES = host-tzdata
 HOST_TZDATA_DEPENDENCIES = host-zic
 TZDATA_LICENSE = Public domain
@@ -45,11 +46,6 @@ define TZDATA_INSTALL_TARGET_CMDS
 	fi
 endef
 
-define HOST_TZDATA_EXTRACT_CMDS
-	gzip -d -c $(DL_DIR)/$(TZDATA_SOURCE) \
-		| $(TAR) --strip-components=0 -C $(@D) -xf -
-endef
-
 define HOST_TZDATA_BUILD_CMDS
 	(cd $(@D); \
 		for zone in $(TZDATA_ZONELIST); do \
