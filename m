From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  2 Nov 2019 22:14:09 +0100
Subject: [Buildroot] [PATCH] package/yaffs2utils: fix upstream URL
Message-ID: <20191102211409.31980-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current URL from which we download the yaffs2utils tarball no
longer works:

-2019-11-02 10:17:20--  https://yaffs2utils.googlecode.com/files/0.2.9.tar.gz
Resolving yaffs2utils.googlecode.com (yaffs2utils.googlecode.com)... 2a00:1450:400c:c02::52, 173.194.76.82
Connecting to yaffs2utils.googlecode.com (yaffs2utils.googlecode.com)|2a00:1450:400c:c02::52|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2019-11-02 10:17:20 ERROR 404: Not Found.

So, let's replace it with a working URL.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/yaffs2utils/yaffs2utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/yaffs2utils/yaffs2utils.mk b/package/yaffs2utils/yaffs2utils.mk
index d3a8bdc9d2..bcd5d6d66f 100644
--- a/package/yaffs2utils/yaffs2utils.mk
+++ b/package/yaffs2utils/yaffs2utils.mk
@@ -6,7 +6,7 @@
 
 YAFFS2UTILS_VERSION = 0.2.9
 YAFFS2UTILS_SOURCE = $(YAFFS2UTILS_VERSION).tar.gz
-YAFFS2UTILS_SITE = https://yaffs2utils.googlecode.com/files
+YAFFS2UTILS_SITE = https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/yaffs2utils
 YAFFS2UTILS_LICENSE = GPL-2.0
 YAFFS2UTILS_LICENSE_FILES = COPYING
 
-- 
2.21.0
