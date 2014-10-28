From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 28 Oct 2014 17:10:22 +0000
Subject: [Buildroot] [PATCH v2] trinity: enable only for supported
	architectures
Message-ID: <1414516222-3480-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package only has support for some architectures which are listed in
the project website: http://codemonkey.org.uk/projects/trinity/

We enable this package only for those supported architectures which are
also supported in Buildroot.

Fixes:
	http://autobuild.buildroot.net/results/ea7/ea788f1f0ed5ee4e9b1bf0c8a0d1304e7467dc77/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes since v1:
- Removed MIPS64 after talking with upstream and doing a runtime test.

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
 
-- 
1.7.1
