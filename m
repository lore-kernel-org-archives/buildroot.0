From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 20:10:38 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/flashrom: disable
 on microblaze and xtensa
Message-ID: <20190319191327.D74B181935@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e99a7b8177d6cc4227181daf363a749b2e6f788e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/cdf0fb462eec143ea881d43cdd0c69c86122f66b
 - http://autobuild.buildroot.org/results/df4d9702959b610762e87cf21fac9de62365dae6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 582448032d97b9dc6b196d838f57ec7f695048ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flashrom/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index 948c774133..cf1f53c1a3 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FLASHROM
 	bool "flashrom"
+	depends on !BR2_microblaze && !BR2_xtensa # platform.h
 	help
 	  flashrom is a utility for identifying, reading, writing,
 	  verifying and erasing flash chips. It is designed to flash
