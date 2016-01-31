From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 23:30:14 +0100
Subject: [Buildroot] [git commit] package/sigrok-cli: bump version to 0.6.0
Message-ID: <20160201224701.447E47F918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e4684a5f9332943155cc928da119905ce074eb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to upstream tarball, remove autoreconf, add hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sigrok-cli/sigrok-cli.hash |  2 ++
 package/sigrok-cli/sigrok-cli.mk   | 13 ++-----------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/sigrok-cli/sigrok-cli.hash b/package/sigrok-cli/sigrok-cli.hash
new file mode 100644
index 0000000..b60b57e
--- /dev/null
+++ b/package/sigrok-cli/sigrok-cli.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	ab2ede4e245f3987e19a89a530bd204e0d792c07474d9fed3345d4af4e84723c	sigrok-cli-0.6.0.tar.gz
diff --git a/package/sigrok-cli/sigrok-cli.mk b/package/sigrok-cli/sigrok-cli.mk
index 34e0a0e..ec5c8bd 100644
--- a/package/sigrok-cli/sigrok-cli.mk
+++ b/package/sigrok-cli/sigrok-cli.mk
@@ -4,13 +4,10 @@
 #
 ################################################################################
 
-SIGROK_CLI_VERSION = c59bf72b694ab1d08b2ea44de4349c277e206414
-# No https access on upstream git
-SIGROK_CLI_SITE = git://sigrok.org/sigrok-cli
+SIGROK_CLI_VERSION = 0.6.0
+SIGROK_CLI_SITE = http://sigrok.org/download/source/sigrok-cli
 SIGROK_CLI_LICENSE = GPLv3+
 SIGROK_CLI_LICENSE_FILES = COPYING
-# Git checkout has no configure script
-SIGROK_CLI_AUTORECONF = YES
 SIGROK_CLI_DEPENDENCIES = host-pkgconf libsigrok
 
 ifeq ($(BR2_PACKAGE_LIBSIGROKDECODE),y)
@@ -20,10 +17,4 @@ else
 SIGROK_CLI_CONF_OPTS += --with-libsigrokdecode=NO
 endif
 
-define SIGROK_CLI_ADD_MISSING
-	mkdir -p $(@D)/autostuff
-endef
-
-SIGROK_CLI_PRE_CONFIGURE_HOOKS += SIGROK_CLI_ADD_MISSING
-
 $(eval $(autotools-package))
