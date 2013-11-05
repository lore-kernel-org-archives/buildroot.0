From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2013 00:31:47 +0100
Subject: [Buildroot] [git commit] dependencies.sh: update i386 package names
Message-ID: <20131105233238.49FB49BA95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f408f398f2a5258f481c7d21483d235f3068498b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the list needed to run the Linaro pre-built toolchain
on a 64-bit Ubuntu 13.10 system.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index bce5cc6..b563f60 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -178,7 +178,8 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BUILDROOT_CONFIG ; then
 	/bin/echo -e "\nYour Buildroot configuration uses pre-built tools for the x86 architecture,"
 	/bin/echo -e "but your build machine uses the x86-64 architecture without the 32 bits compatibility"
 	/bin/echo -e "library."
-	/bin/echo -e "If you're running a Debian/Ubuntu distribution, install the libc:i386 package."
+	/bin/echo -e "If you're running a Debian/Ubuntu distribution, install the libc6:i386,"
+	/bin/echo -e "libstdc++6:i386, and zlib1g:i386 packages."
 	/bin/echo -e "For other distributions, refer to the documentation on how to install the 32 bits"
 	/bin/echo -e "compatibility libraries."
 	exit 1
