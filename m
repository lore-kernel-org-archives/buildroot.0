From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 28 Apr 2013 21:44:25 +0200
Subject: [Buildroot] [git commit] divine: bumping version to 1.6.3
Message-ID: <20130428205743.E566D9B895@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3fe23510961fe44db2bf3747163b1a8125ea5be4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To be identical to the version of directfb switching also to version
1.6.3. The divine package needs at minimum directfb 1.6.0 as
dependencie.
Adding the license information to the package divine.
Also switch to Git for getting the package source because the tar.gz
for version 1.6.3 on directfb.org is broken because of a missed header
file inside.

[Peter: tweak comments]
Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/divine/divine.mk |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/divine/divine.mk b/package/divine/divine.mk
index b949601..596debf 100644
--- a/package/divine/divine.mk
+++ b/package/divine/divine.mk
@@ -4,11 +4,16 @@
 #
 #############################################################
 
-DIVINE_VERSION = 0.4.0
-DIVINE_SITE = http://www.directfb.org/downloads/Extras
-DIVINE_SOURCE = DiVine-$(DIVINE_VERSION).tar.gz
+# tagged version 1.6.3, tarball is missing files
+DIVINE_VERSION = 83cafc257a42b9465cd9d6185bf66b8c1b7ed704
+DIVINE_SITE = git://git.directfb.org/git/directfb/extras/DiVine.git
+DIVINE_LICENSE = LGPLv2.1+
+DIVINE_LICENSE_FILE = COPYING
 DIVINE_INSTALL_STAGING = YES
 DIVINE_DEPENDENCIES = directfb
 DIVINE_CONFIG_SCRIPTS = divine-config
 
+# package has no configure script so we have to generate it
+DIVINE_AUTORECONF = YES
+
 $(eval $(autotools-package))
