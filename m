From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:43 -0000
Subject: [Buildroot] [git commit] package/strace: reenable bpf for m68k
Message-ID: <20190903133620.EF0E58A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d5f3984aea606fb5671f877542b2c858f9bb9cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel commit 0472301a28f ("bpf: fix uapi bpf_prog_info fields
alignment") fixed the issue causing build failure in bpf support code.
The fix has been applied to all kernel versions that are affected and
supported (v4.19, v5.1, v5.2). Enable back bpf for m68k.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strace/strace.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 9ec81728e2..9049e52d4a 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -19,12 +19,6 @@ STRACE_CONF_OPTS += st_cv_m32_mpers=no \
 	st_cv_mx32_mpers=no
 endif
 
-# struct bpf_prog_info fields offset mismatch
-# https://lists.strace.io/pipermail/strace-devel/2019-May/thread.html#8750
-ifeq ($(BR2_m68k),y)
-STRACE_CONF_OPTS += ac_cv_header_linux_bpf_h=no
-endif
-
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 STRACE_DEPENDENCIES += libunwind
 STRACE_CONF_OPTS += --with-libunwind
