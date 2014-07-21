From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 23:52:27 +0200
Subject: [Buildroot] [git commit] mysql: add mysql user
Message-ID: <20140721220624.4F6399C4CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83cb67dde2daa1b51e84bb2473f5bda77282842b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: do not define a password nor a shell, add a description for
the user.]

Signed-off-by: Marcelo Guti??rrez <kuyurix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

merge user def
---
 package/mysql/mysql.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 21435f5..44dcb7e 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -89,6 +89,10 @@ define HOST_MYSQL_INSTALL_CMDS
 	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash  $(HOST_DIR)/usr/bin/
 endef
 
+define MYSQL_USERS
+	mysql -1 nogroup -1 * /var/mysql - - MySQL daemon
+endef
+
 define MYSQL_ADD_FOLDER
 	$(INSTALL) -d $(TARGET_DIR)/var/mysql
 endef
