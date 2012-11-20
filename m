From: Richard Braun <rbraun@sceen.net>
Date: Tue, 20 Nov 2012 17:59:57 +0100
Subject: [Buildroot] [PATCH] toolchain-crosstool-ng: install libthread_db if
	appropriate
Message-ID: <1353430797-26819-1-git-send-email-rbraun@sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Richard Braun <rbraun@sceen.net>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 5f9119d..ebc7b4b 100644
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
-- 
1.7.2.5
