From: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Date: Mon,  2 Jul 2018 14:38:20 +0200
Subject: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
Message-ID: <20180702123820.32222-1-david.degrave@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the i686 package list to install when using pre-built 32 bits binaries with
a redhat/fedora host distribution (glibc.i686 and zlib.i686).

Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
---
Remark: The 32 bits libraries are already included in the gcc package contrary
        to debian where additionnal packages are needed. So it's not needed to
        do something similar for BR2_HOSTARCH_NEEDS_IA32_COMPILER.
---
 support/dependencies/dependencies.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index e570a9ee1a..58c34d880f 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -222,6 +222,8 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 		echo "If you're running a Debian/Ubuntu distribution, install the libc6-i386,"
 		echo "lib32stdc++6, and lib32z1 packages (or alternatively libc6:i386,"
 		echo "libstdc++6:i386, and zlib1g:i386)."
+		echo "If you're running a RedHat/Fedora distribution, install the glibc.i686 and"
+		echo "zlib.i686 packages."
 		echo "For other distributions, refer to the documentation on how to install the 32 bits"
 		echo "compatibility libraries."
 		exit 1
-- 
2.13.6
