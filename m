From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 23:13:06 +0200
Subject: [Buildroot] [git commit] mysql: fix missing directory
Message-ID: <20140721220624.3C44F9D2A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=add126c84d06aa9fa60056c49c1d8b0a6c74ac4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcelo Guti??rrez <kuyurix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mysql/mysql.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 808abce..21435f5 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -50,6 +50,7 @@ HOST_MYSQL_CONF_OPT = \
 	--disable-mysql-maintainer-mode
 
 MYSQL_CONF_OPT += \
+	--localstatedir=/var/mysql \
 	--disable-dependency-tracking \
 	--with-atomic-ops=up \
 	--with-embedded-server \
@@ -88,6 +89,12 @@ define HOST_MYSQL_INSTALL_CMDS
 	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash  $(HOST_DIR)/usr/bin/
 endef
 
+define MYSQL_ADD_FOLDER
+	$(INSTALL) -d $(TARGET_DIR)/var/mysql
+endef
+
+MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_ADD_FOLDER
+
 else
 MYSQL_CONF_OPT += \
 	--without-server
