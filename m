From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Jun 2013 21:04:34 +0200
Subject: [Buildroot] [git commit] tzdata/zic: bump to version 2013c and
	switch SITE
Message-ID: <20130629190817.E38EA9B2CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e01ba1dc2ce282f9af2d859e37b88e674070b91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 2013c and switch to the FTP site since the HTTP one is
unfortunately serving .tar.gz files that are just plain tar files
(uncompressed).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tzdata/tzdata.mk |    4 ++--
 package/zic/zic.mk       |    4 ++--
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
