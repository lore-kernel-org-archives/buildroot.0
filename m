From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Jul 2013 07:32:53 +0200
Subject: [Buildroot] [git commit] busybox: don't use kernel headers directly
Message-ID: <20130703070346.C79AF998B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17733c2e1461eaec41692a22b714c91b6bd0c340
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel headers are part of the staging directory, so there is no
reason to point the Busybox CFLAGS directly to them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index cfefdbb..acc9008 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -16,8 +16,7 @@ BUSYBOX_LICENSE = GPLv2
 BUSYBOX_LICENSE_FILES = LICENSE
 
 BUSYBOX_CFLAGS = \
-	$(TARGET_CFLAGS) \
-	-I$(LINUX_HEADERS_DIR)/include
+	$(TARGET_CFLAGS)
 
 BUSYBOX_LDFLAGS = \
 	$(TARGET_LDFLAGS)
