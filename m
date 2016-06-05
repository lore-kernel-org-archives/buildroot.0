From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:38:11 +0200
Subject: [Buildroot] [git commit] package/iputils: bump version
Message-ID: <20160605200530.4A06F81E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f5fcfc1914207321544a1d5465c06a1117dee41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tracepath and tracepath6 were merged recently:
https://github.com/iputils/iputils/pull/48

Therefore we do not need to install tracepath6 anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iputils/iputils.hash | 2 +-
 package/iputils/iputils.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index 42ea5fd..d7d3f5c 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	08b9f686fcc874f75b465f90f3e831aa9ac1f2e043f4bb61e6d99868e8869025	iputils-31d947cf7156cf78d3f57e0bd82b33e6f6ece6b4.tar.gz
+sha256	79e22e940b6f52c37810657c8f12e7ba85692b517d6cd6e90cbceac2d94fc5e8	iputils-55828d1fef3fed7f07abcbf7be9282a9662e78c7.tar.gz
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 18e48b4..d6398f7 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -11,7 +11,7 @@
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = 31d947cf7156cf78d3f57e0bd82b33e6f6ece6b4
+IPUTILS_VERSION = 55828d1fef3fed7f07abcbf7be9282a9662e78c7
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPLv2+, BSD-3c, BSD-4c
 # Only includes a license file for BSD
@@ -66,7 +66,6 @@ define IPUTILS_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/rdisc       $(TARGET_DIR)/sbin/rdisc
 	$(INSTALL) -D -m 755 $(@D)/tftpd       $(TARGET_DIR)/usr/sbin/in.tftpd
 	$(INSTALL) -D -m 755 $(@D)/tracepath   $(TARGET_DIR)/bin/tracepath
-	$(INSTALL) -D -m 755 $(@D)/tracepath6  $(TARGET_DIR)/bin/tracepath6
 	$(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
 endef
 
