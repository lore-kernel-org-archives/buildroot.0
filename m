From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Oct 2014 17:17:20 +0000
Subject: [Buildroot] [PATCH] trinity: enable only for supported architectures
Message-ID: <1414430240-53243-1-git-send-email-Vincent.Riera@imgtec.com>
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
 package/trinity/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/trinity/Config.in b/package/trinity/Config.in
index de9c467..9882573 100644
--- a/package/trinity/Config.in
+++ b/package/trinity/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TRINITY
 	bool "trinity"
+	depends on !BR2_microblazeel && !BR2_microblazeeb
 	help
 	  A Linux System call fuzz tester
 
-- 
1.7.1
