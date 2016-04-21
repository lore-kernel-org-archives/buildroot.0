From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:17:36 +0200
Subject: [Buildroot] [git commit] support/scripts/check-host-rpath: also
	check HOST_DIR/{bin, sbin}
Message-ID: <20160421201741.2950380676@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf8f0136e97f40eeb00240ac63760ed9fb84d0aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At least syslinux is installing stuff in HOST_DIR/sbin.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/check-host-rpath | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 48d69da..6ce547c 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -26,7 +26,7 @@ main() {
             printf "*** ERROR: package %s installs executables without proper RPATH:\n" "${pkg}"
         fi
         printf "***   %s\n" "${file}"
-    done < <( find "${hostdir}"/usr/{bin,sbin} -type f -exec file {} + 2>/dev/null \
+    done < <( find "${hostdir}"/{,usr/}{bin,sbin} -type f -exec file {} + 2>/dev/null \
               |sed -r -e '/^([^:]+):.*\<ELF\>.*\<executable\>.*/!d'                \
                       -e 's//\1/'                                                  \
             )
