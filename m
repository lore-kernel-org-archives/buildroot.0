From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 02 Oct 2013 09:47:14 +0800
Subject: [Buildroot] [PATCH v2] setserial: bump to version 2.17-45.3
Message-ID: <1380678434.6489.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to patchlevel 3 since 2 is gone upstream.
Also switch to use http://snapshot.debian.org/ instead of BR2_DEBIAN_MIRROR to
avoid disappearing packages.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
v2: Switch to use http://snapshot.debian.org/ instead of BR2_DEBIAN_MIRROR.

 package/setserial/setserial.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index e6846b2..f8d0a4b 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 SETSERIAL_VERSION            = 2.17
-SETSERIAL_PATCH              = setserial_2.17-45.2.diff.gz
+SETSERIAL_PATCH              = setserial_2.17-45.3.diff.gz
 SETSERIAL_SOURCE             = setserial_$(SETSERIAL_VERSION).orig.tar.gz
-SETSERIAL_SITE               = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/setserial/
+SETSERIAL_SITE               = http://snapshot.debian.org/archive/debian/20131001T214925Z/pool/main/s/setserial/
 
 define SETSERIAL_APPLY_DEBIAN_PATCHES
 	# Touching gorhack.h is needed for the Debian patch 18 to work
-- 
1.8.1.2
