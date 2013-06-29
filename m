From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 21:09:10 -0300
Subject: [Buildroot] [PATCH] tzdata/zic: bump to version 2013c and switch
	SITE
Message-ID: <1372464550-15032-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 2013c and switch to the FTP site since the HTTP one is
unfortunately serving .tar.gz files that are just plain tar files
(uncompressed).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tzdata/tzdata.mk | 4 ++--
 package/zic/zic.mk       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 4a9affe..26f623d 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2012j
+TZDATA_VERSION = 2013c
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
-TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
+TZDATA_SITE = ftp://ftp.iana.org/tz/releases
 TZDATA_DEPENDENCIES = host-zic
 TZDATA_LICENSE = Public domain
 
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 7a06a58..3d56df1 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2012j
+ZIC_VERSION = 2013c
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
-ZIC_SITE = http://www.iana.org/time-zones/repository/releases
+ZIC_SITE = ftp://ftp.iana.org/tz/releases
 ZIC_LICENSE = Public domain
 
 # Don't strip any path components during extraction.
-- 
1.8.1.5
