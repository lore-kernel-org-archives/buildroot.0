From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Jul 2013 08:15:41 +0200
Subject: [Buildroot] [git commit] elf2flt: needs to link with zlib
Message-ID: <20130708061806.EF37C9A0B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fbee81a64c7f0d572e2084212b9db7cef2a6def
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Got dropped by the move to packages/.

Fixes http://autobuild.buildroot.net/results/bb7/bb7b2c0bb23e0ab6e148a1e690b2c0827135ff55/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/elf2flt/elf2flt.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 5afa5ca..cd1c21d 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -21,6 +21,8 @@ HOST_ELF2FLT_CONF_OPT = \
 	--with-libiberty=$(HOST_BINUTILS_DIR)/libiberty/libiberty.a \
 	--target=$(GNU_TARGET_NAME)
 
+HOST_ELF2FLT_CONF_ENV = LIBS=-lz
+
 define HOST_ELF2FLT_EXTRACT_CMDS
 	cp -r package/elf2flt/src/* $(@D)
 endef
