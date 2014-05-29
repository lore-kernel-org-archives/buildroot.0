From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 May 2014 23:17:44 +0200
Subject: [Buildroot] [git commit] sysklogd: needs MMU
Message-ID: <20140529212159.39B279BB4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf4586d7ce80913488de249656f3ee4b428c22e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/bf1/bf1a6e1d4798c5abea4ff5114279329d6d90548f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysklogd/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index 1216bcc..6339d76 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SYSKLOGD
 	bool "syslogd & klogd"
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # fork()
 	help
 	  System log daemons syslogd and klogd.
 
@@ -8,3 +9,4 @@ config BR2_PACKAGE_SYSKLOGD
 
 comment "syslogd needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
+	depends on BR2_USE_MMU
