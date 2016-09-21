From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 20:29:05 +0200
Subject: [Buildroot] [git commit] trinity: needs MMU support
Message-ID: <20160921182910.ABB9B81F9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2c4b4a3c16e03ea4be7a62c58c5114f5a6df1ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/2fc/2fca707deb6fda2da83ab817f8e594f76415d997/

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/trinity/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/trinity/Config.in b/package/trinity/Config.in
index 5c4c7c8..2495e5d 100644
--- a/package/trinity/Config.in
+++ b/package/trinity/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TRINITY
 	bool "trinity"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
 		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 || \
 		BR2_powerpc64le || BR2_sparc || BR2_x86_64
