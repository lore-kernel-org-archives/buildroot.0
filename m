From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 18:49:28 +0100
Subject: [Buildroot] [git commit] trinity: enable only for supported
	architectures
Message-ID: <20141028174947.8AC5FB1C4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=763e85d9bdddeb0d24c56ea1f05357a02a021728
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package only has support for some architectures which are listed in
the project website: http://codemonkey.org.uk/projects/trinity/

We enable this package only for those supported architectures which are
also supported in Buildroot.

Fixes:
	http://autobuild.buildroot.net/results/ea7/ea788f1f0ed5ee4e9b1bf0c8a0d1304e7467dc77/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/trinity/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/trinity/Config.in b/package/trinity/Config.in
index de9c467..5c4c7c8 100644
--- a/package/trinity/Config.in
+++ b/package/trinity/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_TRINITY
 	bool "trinity"
+	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
+		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 || \
+		BR2_powerpc64le || BR2_sparc || BR2_x86_64
 	help
 	  A Linux System call fuzz tester
 
