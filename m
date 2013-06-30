From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jun 2013 21:28:52 +0200
Subject: [Buildroot] [PATCH 02/23] busybox: don't use kernel headers directly
In-Reply-To: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372620553-11416-3-git-send-email-thomas.petazzoni@free-electrons.com>
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
