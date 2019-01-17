From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Jan 2019 09:27:11 +0100
Subject: [Buildroot] [git commit] package/libva-utils: drop _SOURCE variable
 which has the default value
Message-ID: <20190117082753.65D36882A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96d90ae4e782559c78ae48de5230a9e3a8a08964
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit b0907949261ef5e8179c027c086903f30417dd66
("package/libva-utils: bump to version 2.3.0"), the LIBVA_UTILS_SOURCE
variable has the default value of the <pkg>_SOURCE variable, so
check-package complains:

package/libva-utils/libva-utils.mk:8: remove default value of _SOURCE variable (http://nightly.buildroot.org/#generic-package-reference)

Let's fix this by dropping the now unneeded variable assignment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva-utils/libva-utils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index f08ffebb23..ac341cd428 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBVA_UTILS_VERSION = 2.3.0
-LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.gz
 LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/archive/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
