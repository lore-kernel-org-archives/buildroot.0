From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] mysql: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132037.01587819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=354554418bf4e9ec4d6f079deb854c5b9ee66995
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mysql/mysql.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 7af4711..92bf45a 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -47,13 +47,13 @@ HOST_MYSQL_CONF_OPTS = \
 	--disable-mysql-maintainer-mode
 
 define HOST_MYSQL_BUILD_CMDS
-	$(MAKE) -C $(@D)/include my_config.h
-	$(MAKE) -C $(@D)/mysys libmysys.a
-	$(MAKE) -C $(@D)/strings libmystrings.a
-	$(MAKE) -C $(@D)/vio libvio.a
-	$(MAKE) -C $(@D)/dbug libdbug.a
-	$(MAKE) -C $(@D)/regex libregex.a
-	$(MAKE) -C $(@D)/sql gen_lex_hash
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/include my_config.h
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/mysys libmysys.a
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/strings libmystrings.a
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/vio libvio.a
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/dbug libdbug.a
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/regex libregex.a
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/sql gen_lex_hash
 endef
 
 define HOST_MYSQL_INSTALL_CMDS
