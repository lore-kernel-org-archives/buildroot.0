From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:58:54 +0200
Subject: [Buildroot] [git commit] dependencies.sh: add other Debian package
	names for 32 bits libraries
Message-ID: <20140715185906.5E5E59D246@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9b4b57f8496b43cc7b6f9463c9f83595f000cef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: implemented Arnout suggestion.]

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 255a07b..fa50666 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -205,8 +205,9 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 		echo "Your Buildroot configuration uses pre-built tools for the x86 architecture,"
 		echo "but your build machine uses the x86-64 architecture without the 32 bits compatibility"
 		echo "library."
-		echo "If you're running a Debian/Ubuntu distribution, install the libc6:i386,"
-		echo "libstdc++6:i386, and zlib1g:i386 packages."
+		echo "If you're running a Debian/Ubuntu distribution, install the libc6-386,"
+		echo "lib32stcd++6, and lib32z1 packages (or alternatively libc6:i386,"
+		echo "libstdc++6:i386, and zlib1g:i386)."
 		echo "For other distributions, refer to the documentation on how to install the 32 bits"
 		echo "compatibility libraries."
 		exit 1
