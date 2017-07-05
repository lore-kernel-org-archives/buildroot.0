From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 12:20:06 +0200
Subject: [Buildroot] [git commit] toolchain-external: also put libgcc_s.so
	unconditionally in TOOLCHAIN_EXTERNAL_LIBS
Message-ID: <20170705101717.294D181809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cdd18c7f09a69194c15771a931ab0827c2b04ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgcc_s.so is now added to TOOLCHAIN_EXTERNAL_LIBS for glibc/uclibc
in one place, and for musl in another place. Bottom line: it should be
in TOOLCHAIN_EXTERNAL_LIBS unconditionally.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 67f1361..3cba6ff 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -108,10 +108,10 @@ endif
 # Definitions of the list of libraries that should be copied to the target.
 #
 
-TOOLCHAIN_EXTERNAL_LIBS += ld*.so*
+TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.*
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-TOOLCHAIN_EXTERNAL_LIBS += libatomic.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
+TOOLCHAIN_EXTERNAL_LIBS += libatomic.so.* libc.so.* libcrypt.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 TOOLCHAIN_EXTERNAL_LIBS += libpthread.so.*
 ifneq ($(BR2_PACKAGE_GDB)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
@@ -125,7 +125,7 @@ TOOLCHAIN_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.* libmvec.so.* libanl
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
-TOOLCHAIN_EXTERNAL_LIBS += libc.so libgcc_s.so.*
+TOOLCHAIN_EXTERNAL_LIBS += libc.so
 endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
