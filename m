From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 20:06:43 +0100
Subject: [Buildroot] [git commit] package/ltp-testsuite: update patch status
Message-ID: <20210122184901.61DAF826C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16f5b79130d62a49aeda5003f5d0d6a3be9f0b84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch | 11 ++++++++++-
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
