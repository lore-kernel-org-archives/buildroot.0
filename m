From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 21 Jan 2021 20:12:07 +0100
Subject: [Buildroot] [PATCH 1/2] package/ltp-testsuite: update patch status
Message-ID: <20210121191208.16756-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...pi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch b/package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
index f1b6743f21..29a986cbab 100644
--- a/package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
+++ b/package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
@@ -26,7 +26,16 @@ In file included from ../include/tst_safe_macros.h:15,
 x86_64-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
 
 Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-[ upstream status: https://patchwork.ozlabs.org/project/ltp/patch/20201001231256.6930-1-petr.vorel at gmail.com/ ]
+
+[ upstream status: https://patchwork.ozlabs.org/project/ltp/patch/20201001231256.6930-1-petr.vorel at gmail.com/
+
+But this patch is not going to get upstreamed because it got fixed in Linux kernel:
+a85cbe6159ff "uapi: move constants from <linux/kernel.h> to <linux/const.h>"
+
+This patch was also backported to stable and LTS versions,
+which we use since buildroot 54584d233b "{linux, linux-headers}: bump
+5.{4, 10}.x 4.{4, 9, 14, 19} series".
+We just wait for all musl based toolchains to be rebuilt. ]
 ---
  include/lapi/sysinfo.h                        | 22 +++++++++++++++++++
  include/tst_safe_macros.h                     |  2 +-
-- 
2.30.0
