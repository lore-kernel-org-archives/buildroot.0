From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 11:10:27 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] support/dependencies: Add
 hint for ArchLinux when host needs IA32 libs
Message-ID: <20190526091607.C082A80F7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc51e660ea1fe02030e50213284ff2ad3c36260a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add hint about which package needs to be installed to provide IA32 libs
support for the host when it is needed.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 28878798cf557dadc58ebee9e1f39c62a29ffcea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 826874baa2..60c63d7743 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -232,6 +232,7 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 		echo "libstdc++6:i386, and zlib1g:i386)."
 		echo "If you're running a RedHat/Fedora distribution, install the glibc.i686 and"
 		echo "zlib.i686 packages."
+		echo "If you're running an ArchLinux distribution, install lib32-glibc."
 		echo "For other distributions, refer to the documentation on how to install the 32 bits"
 		echo "compatibility libraries."
 		exit 1
