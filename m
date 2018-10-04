From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 14:20:31 +0200
Subject: [Buildroot] [git commit] crda: fix check-package warning
Message-ID: <20181004122051.E6D1D8C636@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=255a8090054d39705109efbc0075234715c740cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 3e79bd3f456cef12886ac6b086c8bc78e3e520f8 ("crda: bump
version to 4.14"), the value of CRDA_SOURCE was changed to use what is
the default value for <pkg>_SOURCE, triggering a warning from
check-package:

package/crda/crda.mk:8: remove default value of _SOURCE variable (http://nightly.buildroot.org/#generic-package-reference)

This commit fixes that by dropping CRDA_SOURCE entirely.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/crda/crda.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index ab50030126..eb43a7d772 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 CRDA_VERSION = 4.14
-CRDA_SOURCE = crda-$(CRDA_VERSION).tar.gz
 CRDA_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/snapshot
 CRDA_DEPENDENCIES = host-pkgconf host-python-pycrypto libnl libgcrypt
 CRDA_LICENSE = ISC
