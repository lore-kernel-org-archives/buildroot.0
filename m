From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Jun 2013 00:25:57 +0200
Subject: [Buildroot] [RFCv2 02/19] busybox: don't use kernel headers directly
In-Reply-To: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372285574-29423-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The kernel headers are part of the staging directory, so there is no
reason to point the Busybox CFLAGS directly to them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

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
-- 
1.8.1.2
