From: Karoly Kasza <kaszak@gmail.com>
Date: Sun, 19 Oct 2014 15:30:08 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/cdrkit: download from alternate
	site
Message-ID: <1413725408-25972-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

www.cdrkit.org looks dead, the cdrkit archive always downloads from the
buildroot.org mirror. This patch points the downloader to the Debian
archive site.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/cdrkit/cdrkit.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index 8ec0b8b..3f2b429 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 CDRKIT_VERSION = 1.1.11
-CDRKIT_SITE = http://www.cdrkit.org/releases
+CDRKIT_SOURCE = cdrkit_$(CDRKIT_VERSION).orig.tar.gz
+CDRKIT_SITE = http://snapshot.debian.org/archive/debian/20101018T151929Z/pool/main/c/cdrkit/
 CDRKIT_DEPENDENCIES = libcap bzip2 zlib
 CDRKIT_LICENSE = GPLv2
 CDRKIT_LICENSE_FILES = COPYING
-- 
1.7.10.4
