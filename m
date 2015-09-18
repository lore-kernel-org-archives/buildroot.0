From: Chris Packham <judge.packham@gmail.com>
Date: Fri, 18 Sep 2015 21:19:35 +1200
Subject: [Buildroot] [PATCH] micropython: Set MICROPY_GCREGS_SETJMP=1 for
	xtensa and sh
In-Reply-To: <CAFOYHZCxy2PWfdPXiTrxDzf4LnLnPCwATyia200X2kHucNqJSA@mail.gmail.com>
References: <CAFOYHZCxy2PWfdPXiTrxDzf4LnLnPCwATyia200X2kHucNqJSA@mail.gmail.com>
Message-ID: <1442567975-11176-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These architectures don't have explicit exception handling support in
micropython but can use the setjmp fallback behaviour instead.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/micropython/micropython.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 
-- 
2.5.0
