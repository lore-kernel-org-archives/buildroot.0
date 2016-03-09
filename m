From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  9 Mar 2016 23:58:56 +0100
Subject: [Buildroot] [PATCH v7 15/18] support/scripts/check-host-rpath: also
	check HOST_DIR/{bin, sbin}
In-Reply-To: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1457564339-27294-16-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At least syslinux is installing stuff in HOST_DIR/sbin.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v6->v7:
- new patch
---
 support/scripts/check-host-rpath | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 2d3ddec..f5f16ff 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -45,7 +45,7 @@ main() {
                 "${pkg}"
         fi
         printf "***   %s\n" "${file}"
-    done < <( find "${hostdir}"/usr/{bin,sbin} -type f -print 2>/dev/null |
+    done < <( find "${hostdir}"/{,usr/}{bin,sbin} -type f -print 2>/dev/null |
                   readelf.filter_elf_executable )
 
     return ${ret}
-- 
2.7.2
