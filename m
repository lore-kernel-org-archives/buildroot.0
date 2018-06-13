From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Jun 2018 18:39:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/autossh: bump version to 1.4f
Message-ID: <20180613163906.31307-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream, added all upstream and license hashes.

Removed _AUTORECONF, configure and configure.ac in the tarball match,
also removed _INSTALL_TARGET_CMDS, the upstream install target works
just fine nowadays.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/autossh/0001-honour-LDFLAGS.patch | 16 ----------------
 package/autossh/autossh.hash              |  8 ++++++--
 package/autossh/autossh.mk                |  9 +--------
 3 files changed, 7 insertions(+), 26 deletions(-)
 delete mode 100644 package/autossh/0001-honour-LDFLAGS.patch

diff --git a/package/autossh/0001-honour-LDFLAGS.patch b/package/autossh/0001-honour-LDFLAGS.patch
deleted file mode 100644
index 2e6160b8fd..0000000000
--- a/package/autossh/0001-honour-LDFLAGS.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Honour LDFLAGS, especially required when static linking
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur autossh-1.4e.orig/Makefile.in autossh-1.4e/Makefile.in
---- autossh-1.4e.orig/Makefile.in	2015-02-10 05:41:58.000000000 +0100
-+++ autossh-1.4e/Makefile.in	2016-11-25 12:49:06.052122855 +0100
-@@ -31,7 +31,7 @@
- 
- 
- $(TARGET):	$(OFILES)
--		$(CC) $(CPPFLAGS) -o $(TARGET) $(OFILES) $(LIBS)
-+		$(CC) $(CPPFLAGS) $(LDFLAGS) -o $(TARGET) $(OFILES) $(LIBS)
- 
- clean:
- 		- /bin/rm -f *.o *.a *.core *~
diff --git a/package/autossh/autossh.hash b/package/autossh/autossh.hash
index 4f3de137a5..5c6cfbc98f 100644
--- a/package/autossh/autossh.hash
+++ b/package/autossh/autossh.hash
@@ -1,2 +1,6 @@
-# From http://www.harding.motd.ca/autossh/autossh-1.4e.cksums
-sha256	9e8e10a59d7619176f4b986e256f776097a364d1be012781ea52e08d04679156	autossh-1.4e.tgz
+# From http://www.harding.motd.ca/autossh/autossh-1.4f.cksums
+sha256 0172e5e1bea40c642e0ef025334be3aadd4ff3b4d62c0b177ed88a8384e2f8f2  autossh-1.4f.tgz
+sha1 28189c42ab2e05448596a44adc9d62071172fe9b  autossh-1.4f.tgz
+md5 432ed721a71b8af4b5763b5c484f80df  autossh-1.4f.tgz
+# Locally computed
+sha256 b6938db718166520533b1d56b01e1eb5f0ad508624478e674938b8f507b66d98  autossh.c
diff --git a/package/autossh/autossh.mk b/package/autossh/autossh.mk
index d52b4e9666..1538a4c8bc 100644
--- a/package/autossh/autossh.mk
+++ b/package/autossh/autossh.mk
@@ -4,19 +4,12 @@
 #
 ################################################################################
 
-AUTOSSH_VERSION = 1.4e
+AUTOSSH_VERSION = 1.4f
 AUTOSSH_SITE = http://www.harding.motd.ca/autossh
 AUTOSSH_SOURCE = autossh-$(AUTOSSH_VERSION).tgz
 AUTOSSH_LICENSE = Modified BSD
 AUTOSSH_LICENSE_FILES = autossh.c
 
-# Bundled ./configure is not up-to-date with what is in configure.ac
-AUTOSSH_AUTORECONF = YES
-
 AUTOSSH_CONF_OPTS = --with-ssh=/usr/bin/ssh
 
-define AUTOSSH_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 -D $(@D)/autossh $(TARGET_DIR)/usr/bin/autossh
-endef
-
 $(eval $(autotools-package))
-- 
2.17.1
