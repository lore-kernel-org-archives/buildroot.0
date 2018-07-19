From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 12:13:55 +0200
Subject: [Buildroot] [git commit branch/2018.05.x]
 support/dependencies/dependencies.sh: add details for Redhat/Fedora
Message-ID: <20180719101153.5C1D188DFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c11e0b720be23a52517bc30e26eac453055a4f8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Add the i686 package list to install when using pre-built 32 bits
binaries with a redhat/fedora host distribution (glibc.i686 and
zlib.i686).

Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d0505b849f20ad7396c767cc18159df6af40099f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index f98678973b..c5f29d32f4 100755
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
