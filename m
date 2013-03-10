From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 10 Mar 2013 10:47:36 +0100
Subject: [Buildroot] [PATCH 2/4] divine: bumping version to 1.6.3
In-Reply-To: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
References: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <1362908858-6340-3-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>

To be identical to the version of directfb switching also to version
1.6.3. The divine package needs at minimum directfb 1.6.0 as
dependencie.
Adding the license information to the package divine.
Also switch to Git for getting the package source because the tar.gz
for version 1.6.3 on directfb.org is broken because of a missed header
file inside.

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
 package/divine/divine.mk |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/divine/divine.mk b/package/divine/divine.mk
index b949601..df59a18 100644
--- a/package/divine/divine.mk
+++ b/package/divine/divine.mk
@@ -4,11 +4,16 @@
 #
 #############################################################
 
-DIVINE_VERSION = 0.4.0
-DIVINE_SITE = http://www.directfb.org/downloads/Extras
-DIVINE_SOURCE = DiVine-$(DIVINE_VERSION).tar.gz
+# tagged version 1.6.3
+DIVINE_VERSION = 83cafc257a42b9465cd9d6185bf66b8c1b7ed704
+DIVINE_SITE = git://git.directfb.org/git/directfb/extras/DiVine.git
+DIVINE_LICENSE = LGPLv2.1+
+DIVINE_LICENSE_FILE = COPYING
 DIVINE_INSTALL_STAGING = YES
 DIVINE_DEPENDENCIES = directfb
 DIVINE_CONFIG_SCRIPTS = divine-config
 
+# package has no configure script so we have generate it
+DIVINE_AUTORECONF = YES
+
 $(eval $(autotools-package))
-- 
1.7.10.4
