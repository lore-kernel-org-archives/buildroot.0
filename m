From: Karoly Kasza <kaszak@gmail.com>
Date: Sun, 19 Oct 2014 14:18:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/cdrkit: download from svn
Message-ID: <1413721134-23010-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

www.cdrkit.org looks dead, the cdrkit archive always downloads from the
buildroot.org mirror. This patch points the downloader back to the
original svn release.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/cdrkit/cdrkit.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index 8ec0b8b..b2f0459 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CDRKIT_VERSION = 1.1.11
-CDRKIT_SITE = http://www.cdrkit.org/releases
+CDRKIT_SITE = svn://svn.debian.org/debburn/cdrkit/tags/release_1.1.11/
+CDRKIT_VERSION = 854
 CDRKIT_DEPENDENCIES = libcap bzip2 zlib
 CDRKIT_LICENSE = GPLv2
 CDRKIT_LICENSE_FILES = COPYING
-- 
1.7.10.4
