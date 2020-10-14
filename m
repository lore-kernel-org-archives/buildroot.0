From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 14 Oct 2020 21:40:00 +0200
Subject: [Buildroot] [PATCH 2/3] package/gcc: use binutils wrappers for
 target libs
In-Reply-To: <20201014194002.9753-1-nolange79@gmail.com>
References: <20201014194002.9753-1-nolange79@gmail.com>
Message-ID: <20201014194002.9753-2-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will use gcc-ar, gcc-nm and gcc-ranlib instead of the
normal binutils tools. The difference is that with the
wrappers, gcc plugins will be automatically picked up,
which might be necessary with some flags.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/gcc/gcc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 114c2887a0..9be155c3ff 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -99,6 +99,7 @@ GCC_COMMON_TARGET_CFLAGS += -Wno-error
 endif
 
 # Propagate options used for target software building to GCC target libs
+HOST_GCC_COMMON_CONF_ENV += AR_FOR_TARGET=gcc-ar NM_FOR_TARGET=gcc-nm RANLIB_FOR_TARGET=gcc-ranlib
 HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
 
-- 
2.28.0
