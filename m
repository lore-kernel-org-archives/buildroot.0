From: Karoly Kasza <kaszak@gmail.com>
Date: Thu, 10 Jul 2014 12:36:57 +0200
Subject: [Buildroot] [PATCH] dependencies.sh message: fix Debian renamed
	packages
Message-ID: <1404988617-10992-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Debian renamed the 32bit compatibility packages.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 support/dependencies/dependencies.sh |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 255a07b..399bc06 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -205,8 +205,8 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 		echo "Your Buildroot configuration uses pre-built tools for the x86 architecture,"
 		echo "but your build machine uses the x86-64 architecture without the 32 bits compatibility"
 		echo "library."
-		echo "If you're running a Debian/Ubuntu distribution, install the libc6:i386,"
-		echo "libstdc++6:i386, and zlib1g:i386 packages."
+		echo "If you're running a Debian/Ubuntu distribution, install the libc6-i386,"
+		echo "lib32stdc++6, and lib32z1 packages."
 		echo "For other distributions, refer to the documentation on how to install the 32 bits"
 		echo "compatibility libraries."
 		exit 1
-- 
1.7.10.4
