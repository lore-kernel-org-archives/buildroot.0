From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 21:49:19 +0100
Subject: [Buildroot] [git commit] package/sudo: add CPE variables
Message-ID: <20210118203943.DDE6188530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=466abd778c5f1c662e5ca8ac33a685fb5086c483
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:sudo_project:sudo is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asudo_project%3Asudo

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sudo/sudo.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 6faccfa25b..129bcc0280 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,10 +4,13 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.9.5p1
+SUDO_VERSION = $(SUDO_CPE_ID_VERSION)$(SUDO_CPE_ID_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
+SUDO_CPE_ID_VALID = YES
+SUDO_CPE_ID_VERSION = 1.9.5
+SUDO_CPE_ID_VERSION_MINOR = p1
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
 SUDO_CONF_OPTS = \
