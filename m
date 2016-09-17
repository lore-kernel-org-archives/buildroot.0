From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 14:27:38 +0200
Subject: [Buildroot] [git commit] openal: Disable build also for examples
	and tests
Message-ID: <20160917122814.1CE6381D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16dbd226ce5b045813181b3cc28d6845f8d7a893
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/a11eab534b8642077705d891329c1fd40d394419

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openal/openal.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 356f2c1..6384104 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -16,8 +16,8 @@ OPENAL_LICENSE = LGPLv2+
 OPENAL_LICENSE_FILES = COPYING
 OPENAL_INSTALL_STAGING = YES
 
-# We don't need the utilities, Distros don't ship them either
-OPENAL_CONF_OPTS += -DALSOFT_UTILS=OFF
+# We don't need examples, tests and utilities, Distros don't ship them either
+OPENAL_CONF_OPTS += -DALSOFT_UTILS=OFF -DALSOFT_EXAMPLES=OFF -DALSOFT_TESTS=OFF
 
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),y)
 OPENAL_CONF_OPTS += -DEXTRA_LIBS=atomic
