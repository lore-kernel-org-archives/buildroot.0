From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 14:00:15 +0200
Subject: [Buildroot] [git commit] micropython: Set MICROPY_GCREGS_SETJMP=1
	for xtensa and sh
Message-ID: <20150919120021.5FE9C807FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4685485ef7651786da87f0e09a7d787aae68c1fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These architectures don't have explicit exception handling support in
micropython but can use the setjmp fallback behaviour instead.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/micropython/micropython.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 2d7c924..6266882 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -12,7 +12,7 @@ MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
 
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
-ifeq ($(BR2_powerpc),y)
+ifeq ($(BR2_powerpc)$(BR2_sh)$(BR2_xtensa),y)
 MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
 endif
 
