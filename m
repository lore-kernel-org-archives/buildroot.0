From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:01 -0300
Subject: [Buildroot] [PATCH 14/93] mysql: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-15-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.7.3
