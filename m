From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 May 2014 08:55:30 +0200
Subject: [Buildroot] [git commit] monit: uses fork(), disable for nommu
Message-ID: <20140528065621.84DAC9CDF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e507615555d190dc86787506d3e3854027d6f628
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/monit/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/monit/Config.in b/package/monit/Config.in
index b5d4b52..9f80858 100644
--- a/package/monit/Config.in
+++ b/package/monit/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MONIT
 	bool "monit"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Monit is a free open source utility for managing and
 	  monitoring, processes, programs, files, directories and
@@ -11,4 +12,5 @@ config BR2_PACKAGE_MONIT
 	  http://mmonit.com/monit/
 
 comment "monit needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
