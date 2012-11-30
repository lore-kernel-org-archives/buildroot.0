From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 13:56:31 -0800
Subject: [Buildroot] [git commit] toolchain-crosstool-ng: install
	libthread_db if appropriate
Message-ID: <20121130223213.5FE49995B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b644575579cb7f1fddf4f9c38928606e138ac053
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Richard Braun <rbraun@sceen.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 5f9119d..6f81e30 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -41,6 +41,10 @@ uclibc-source: $(CTNG_DIR)/.config
 CTNG_LIBS_LIB := ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so    \
                  libnsl.so libpthread.so libresolv.so librt.so libutil.so
 
+ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
+CTNG_LIBS_LIB += libthread_db.so
+endif
+
 #--------------
 # The libc-specific system libraries (in /lib)
 # Note: it may be needed to tweak the NSS libs in the glibc and eglibc cases...
