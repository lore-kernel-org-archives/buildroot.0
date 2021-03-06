From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Mar 2021 17:06:47 +0100
Subject: [Buildroot] [git commit] package/sudo: cleanup the CPE_ID variables
Message-ID: <20210306160433.A743281294@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0b208652f123eb0049aee20d88b66e0f86707ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CPE variables are derived from the package upstream values, so they
must be set from the package values, not the other way around.

Also drop CPE_ID_VALID as it is implied as soon as at least one CPE
variable is set.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/sudo.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 7f57c66b75..57c2292506 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-SUDO_VERSION = $(SUDO_CPE_ID_VERSION)$(SUDO_CPE_ID_UPDATE)
+SUDO_VERSION_MAJOR = 1.9.5
+SUDO_VERSION_MINOR = p2
+SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
-SUDO_CPE_ID_VALID = YES
-SUDO_CPE_ID_VERSION = 1.9.5
-SUDO_CPE_ID_UPDATE = p2
+SUDO_CPE_ID_VERSION = $(SUDO_VERSION_MAJOR)
+SUDO_CPE_ID_UPDATE = $(SUDO_VERSION_MINOR)
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
 SUDO_CONF_OPTS = \
