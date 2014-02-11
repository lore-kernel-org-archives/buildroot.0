From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2014 19:29:45 +0100
Subject: [Buildroot] [git commit] iozone: needs thread support in toolchain
Message-ID: <20140211185414.6D2A09C987@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=06b53255cf639a5b033a2cdbfcf114770b94a83b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/2a3/2a33d2c7535a9d867d76dd5cf05e1bcc3f5cdc38//

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iozone/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/iozone/Config.in b/package/iozone/Config.in
index 26d4daa..8cf50b1 100644
--- a/package/iozone/Config.in
+++ b/package/iozone/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IOZONE
 	bool "iozone"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  IOzone is a filesystem benchmark tool.
 	  The benchmark generates and measures a variety of file operations
