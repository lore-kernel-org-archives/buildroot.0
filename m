From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jul 2014 00:05:34 +0200
Subject: [Buildroot] [git commit] mysql: host-mysql depends on host-zlib
Message-ID: <20140721220624.5FE389C4CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8062299ed1edebc931a6ef4bac8d27e3ce2e6595
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

 http://autobuild.buildroot.org/results/ffe/ffe8229f869a67e84c1eacec0055cce8b1906441/

[Thomas: add autobuilder reference.]

Signed-off-by: Marcelo Guti??rrez <kuyurix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mysql/mysql.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index fec8b03..0802860 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -43,7 +43,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
 MYSQL_DEPENDENCIES += host-mysql host-bison
-HOST_MYSQL_DEPENDENCIES =
+HOST_MYSQL_DEPENDENCIES = host-zlib
 
 HOST_MYSQL_CONF_OPT = \
 	--with-embedded-server \
