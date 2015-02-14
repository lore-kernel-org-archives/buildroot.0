From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 10:23:09 +0100
Subject: [Buildroot] [PATCH 06/12 v2] toolchain/extrnal: avr32 is no more
In-Reply-To: <cover.1423905753.git.yann.morin.1998@free.fr>
References: <cover.1423905753.git.yann.morin.1998@free.fr>
Message-ID: <29fca61763466d342b20c3daa58cb073b18465cb.1423905753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Slightly reword a comment to no longer mention avr32.

This part dealing with sysroot detection will have to be reworked, now
that we got rid of avr32: we can now require a fully sysroot-aware
toolchain, i.e. at least gcc-4.4.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 5a69eb8..999a354 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -97,8 +97,8 @@ LIB_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 # mangling the path to find the base directory of the sysroot.
 #
 # Note that we do not use the -print-sysroot option, because it is
-# only available since gcc 4.4.x, and we still support 4.2.x (for
-# AVR32) and 4.3.x.
+# only available since gcc 4.4.x, and we only recently dropped support
+# for 4.2.x and 4.3.x.
 #
 # When doing this, we don't pass any option to gcc that could select a
 # multilib variant (such as -march) as we want the "main" sysroot,
-- 
1.9.1
