From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Nov 2014 15:17:35 +0100
Subject: [Buildroot] [git commit] mysql: host variant needs ncurses as well
Message-ID: <20141119144703.E1F50B5B4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d81d202e97258e440d1fc271ba5cdb7c01f7257f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to the target variant.

Fixes:
http://autobuild.buildroot.net/results/0b8/0b8411482def8fdfba0aaaa19be01a477707d874/
http://autobuild.buildroot.net/results/dc0/dc0dd9e878edd2b359900d02e1d53d294321c00b/
http://autobuild.buildroot.net/results/dde/dde299d341135b547bd5c6a59edd7ba76f12ad10/
http://autobuild.buildroot.net/results/67a/67a3fc90fc26241f0c8257d08fb44ceea07f1335/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mysql/mysql.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 945ca18..8718193 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -43,7 +43,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
 MYSQL_DEPENDENCIES += host-mysql host-bison
-HOST_MYSQL_DEPENDENCIES = host-zlib
+HOST_MYSQL_DEPENDENCIES = host-zlib host-ncurses
 
 HOST_MYSQL_CONF_OPTS = \
 	--with-embedded-server \
