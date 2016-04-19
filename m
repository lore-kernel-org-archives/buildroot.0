From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 19 Apr 2016 23:49:00 +0200
Subject: [Buildroot] [PATCH v9] support/scripts/check-host-rpath: also check
	HOST_DIR/{bin, sbin}
Message-ID: <1461102541-5987-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At least syslinux is installing stuff in HOST_DIR/sbin.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v8->v9:
- none
- move out of the RPATH series

changes v7->v8:
- none

changes v6->v7:
- new patch
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
-- 
2.8.0
