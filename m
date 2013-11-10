From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 00:41:06 +0100
Subject: [Buildroot] [git commit] util-linux: disable fallocate for avr32
Message-ID: <20131110234140.CFCF09BB23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0353409933429058e04adf8f5d3f34d33c5697c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fallocate syscall is not implemented in the avr32 toolchain.

Fixes build failures such as the following.

  http://autobuild.buildroot.net/results/bc4/bc41a3fea20181526eb247ac910244aa2aa4c4c0/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 41e0986..d56e631 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -72,6 +72,7 @@ config BR2_PACKAGE_UTIL_LINUX_EJECT
 
 config BR2_PACKAGE_UTIL_LINUX_FALLOCATE
 	bool "fallocate"
+	depends on !BR2_avr32 # fallocate not implemented
 	help
 	  Preallocate space to a file
 
