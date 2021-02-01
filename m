From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2021 10:53:59 +0100
Subject: [Buildroot] [git commit branch/2020.11.x]
 package/intel-mediadriver: fix option
Message-ID: <20210201094924.9D51D844E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f11b344d9cfdcf236a6b34cb11c8ebbbfdc7a15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Replace INSTALL_DRIVERS_SYSCONF by INSTALL_DRIVER_SYSCONF which is the
correct name since version 18.2.0 and
https://github.com/intel/media-driver/commit/81796c8a9e44b878e26064c898e0f4730e8220cf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9d41e98d6f8245f0ff3e077d876d9f451debd7b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-mediadriver/intel-mediadriver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 49bf85e092..963e4b8f9c 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -22,7 +22,7 @@ INTEL_MEDIADRIVER_DEPENDENCIES = \
 INTEL_MEDIADRIVER_SUPPORTS_IN_SOURCE_BUILD = NO
 
 INTEL_MEDIADRIVER_CONF_OPTS = \
-	-DINSTALL_DRIVERS_SYSCONF=OFF \
+	-DINSTALL_DRIVER_SYSCONF=OFF \
 	-DMEDIA_RUN_TEST_SUITE=OFF
 
 $(eval $(cmake-package))
