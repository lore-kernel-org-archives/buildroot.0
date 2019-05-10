From: Vadim Kochan <vadim4j@gmail.com>
Date: Fri, 10 May 2019 08:42:33 +0300
Subject: [Buildroot] [PATCH 1/1] support/dependencies: Add hint for
 ArchLinux when host needs IA32 libs
Message-ID: <20190510054233.18724-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hint about which package needs to be installed to provide IA32 libs
support for the host when it is needed.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 support/dependencies/dependencies.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 1d5c164aa6..3a170cbda6 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -231,6 +231,7 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 		echo "libstdc++6:i386, and zlib1g:i386)."
 		echo "If you're running a RedHat/Fedora distribution, install the glibc.i686 and"
 		echo "zlib.i686 packages."
+		echo "If you're running an ArchLinux distribution, install lib32-glibc."
 		echo "For other distributions, refer to the documentation on how to install the 32 bits"
 		echo "compatibility libraries."
 		exit 1
-- 
2.21.0
