From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 11:52:57 +0100
Subject: [Buildroot] [git commit] perl: add GDBM_File
Message-ID: <20121103161144.3030299A31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ff20d33e3f213ea1efc2e6939516b1ea43393c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/perl/Config.in |    6 ++++++
 package/perl/perl.mk   |    3 +++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/perl/Config.in b/package/perl/Config.in
index 6cb89f0..98b41da 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -22,6 +22,12 @@ config BR2_PACKAGE_PERL_DB_FILE
 	help
 	  Build the DB_File module.
 
+config BR2_PACKAGE_PERL_GDBM_FILE
+	bool "GDBM_File"
+	select BR2_PACKAGE_GDBM
+	help
+	  Build the GDBM_File module.
+
 endif
 
 comment "perl requires an architecture supported by qemu"
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 186158b..56abbc1 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -16,6 +16,9 @@ PERL_DEPENDENCIES = host-qemu
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
     PERL_DEPENDENCIES += berkeleydb
 endif
+ifeq ($(BR2_PACKAGE_GDBM),y)
+    PERL_DEPENDENCIES += gdbm
+endif
 
 PERL_CONF_OPT = -des \
 		-Dusecrosscompile \
