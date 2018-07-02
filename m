From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 22:43:56 +0200
Subject: [Buildroot] [git commit] support/dependencies/dependencies.sh: add
 details for Redhat/Fedora
Message-ID: <20180702205155.0019483FFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0505b849f20ad7396c767cc18159df6af40099f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the i686 package list to install when using pre-built 32 bits
binaries with a redhat/fedora host distribution (glibc.i686 and
zlib.i686).

Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
