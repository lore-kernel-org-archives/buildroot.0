From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 17:35:09 +0100
Subject: [Buildroot] [git commit] package/librtlsdr: drop cmake workaround
Message-ID: <20210126164410.0849A8175F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f225d19361c94b718022a28f7a68c075293713f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop workaround for cmake < 3.10 (not needed since commit
d4773b610a40be1d3ac7d793033abaf4eb2491ed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/librtlsdr/librtlsdr.mk | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
index 47586bdfb2..7796d1096a 100644
--- a/package/librtlsdr/librtlsdr.mk
+++ b/package/librtlsdr/librtlsdr.mk
@@ -34,15 +34,4 @@ else
 LIBRTLSDR_CONF_OPTS += -DENABLE_ZEROCOPY=OFF
 endif
 
-# In case of static-lib-only builds, CMake's FindThreads.cmake code tries to
-# get the right flags, checking first for -lpthreads, then -lpthread, and lastly
-# for -pthread.
-# The 2 first link checks fail because of undefined symbols: __libc_setup_tls.
-# In the later check, CMake successfully compiles and links the test program,
-# but it also tries to run it, which is wrong when cross-compiling.
-#
-# The following CMake variable only disables the TRY_RUN call in the -pthread
-# test.
-LIBRTLSDR_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
-
 $(eval $(cmake-package))
