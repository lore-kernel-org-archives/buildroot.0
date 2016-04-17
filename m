From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 17 Apr 2016 23:38:26 +0200
Subject: [Buildroot] [PATCH v8 09/14] support/scripts/check-host-rpath:
	silent find command
In-Reply-To: <1460929111-15615-1-git-send-email-s.martin49@gmail.com>
References: <1460929111-15615-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1460929111-15615-10-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Silent find command when HOST_DIR/usr/sbin does not exist.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v7->v8:
- none

changes v6->v7:
- new patch
---
 support/scripts/check-host-rpath | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 45bece8..3df70bd 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -45,7 +45,7 @@ main() {
                 "${pkg}"
         fi
         printf "***   %s\n" "${file}"
-    done < <(find "${hostdir}"/usr/{bin,sbin} -type f -print |
+    done < <(find "${hostdir}"/usr/{bin,sbin} -type f -print 2>/dev/null |
                   readelf.filter_elf_executable)
 
     return ${ret}
-- 
2.8.0
