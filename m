From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 00:08:04 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: add elf2flt to dependencies
Message-ID: <20130912223325.58BDB9B295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4fc45ccca5de28fec0b1f777f3b6c920b02c2dcf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add host-elf2flt to the gcc common dependencies so we get it built after
binutils but before gcc/uclibc since it's required for all packages and
in some uClibc configuration scenarios.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/gcc.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 6654b51..157357c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -86,7 +86,8 @@ endef
 HOST_GCC_COMMON_DEPENDENCIES = \
 	host-binutils \
 	host-gmp \
-	host-mpfr
+	host-mpfr \
+	$(if $(BR2_BINFMT_FLAT),host-elf2flt)
 
 HOST_GCC_COMMON_CONF_OPT = \
 	--target=$(GNU_TARGET_NAME) \
