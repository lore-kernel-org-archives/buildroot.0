From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:20 -0000
Subject: [Buildroot] [git commit] toolchain/external: avr32 is no more
Message-ID: <20150302222718.50011807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5272eabd61c43e399221658c597efaf9eb23e378
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Slightly reword a comment to no longer mention avr32.

This part dealing with sysroot detection will have to be reworked, now
that we got rid of avr32: we can now require a fully sysroot-aware
toolchain, i.e. at least gcc-4.4.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
