From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue,  5 Nov 2013 15:12:31 -0500
Subject: [Buildroot] [PATCH] dependencies.sh: update i386 package names
Message-ID: <1383682351-14610-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the list needed to run the Linaro pre-built toolchain
on a 64-bit Ubuntu 13.10 system.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 support/dependencies/dependencies.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
1.8.3.2
