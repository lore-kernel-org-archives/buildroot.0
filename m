From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 23:45:01 +0200
Subject: [Buildroot] [git commit] sparc64: fix toolchain building when C++
	is enabled
Message-ID: <20151012214511.8C31E81DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4c7e9f4ef155f559712485cf7e1c80a4d759ea6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable libsanitizer for sparc64, too. Same problem as for
sparc, see https://bugs.busybox.net/show_bug.cgi?id=7951

Reported-By: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 4def65c..1b30e6d 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -142,7 +142,7 @@ endif
 
 # libsanitizer is broken for SPARC
 # https://bugs.busybox.net/show_bug.cgi?id=7951
-ifeq ($(BR2_sparc),y)
+ifeq ($(BR2_sparc)$(BR2_sparc64),y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
 endif
 
