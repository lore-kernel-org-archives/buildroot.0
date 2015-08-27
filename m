From: Douglas RAILLARD <public.douglas.raillard@gmail.com>
Date: Thu, 27 Aug 2015 18:47:17 +0200
Subject: [Buildroot] [PATCH 1/1] Fix elf2flt build
Message-ID: <1440694037-9022-1-git-send-email-public.douglas.raillard@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add -ldl to fix elf2flt build, because libbfd
uses dlopen and friends for plugin loading

Signed-off-by: Douglas RAILLARD <public.douglas.raillard@gmail.com>
---
 package/elf2flt/elf2flt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 0233ed5..d3ff293 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -21,6 +21,6 @@ HOST_ELF2FLT_CONF_OPTS = \
 	--with-libiberty=$(HOST_BINUTILS_DIR)/libiberty/libiberty.a \
 	--target=$(GNU_TARGET_NAME)
 
-HOST_ELF2FLT_CONF_ENV = LIBS=-lz
+HOST_ELF2FLT_CONF_ENV = LIBS="-lz -ldl"
 
 $(eval $(host-autotools-package))
-- 
2.5.0
