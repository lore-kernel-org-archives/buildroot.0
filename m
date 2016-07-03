From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 16:58:11 +0200
Subject: [Buildroot] [git commit] package/gcc: complete the logic on
	libquadmath
Message-ID: <20160703145820.5888981E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7de668a1deae7d187bf2f0c30ee82e2a92ab81f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libquadmath requires wchar.

So, turn to positive logic and complete it to only enabling quadmath
support when it is available.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b6a3ac9..f324f99 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -115,7 +115,9 @@ HOST_GCC_COMMON_CONF_OPTS += --disable-libitm
 endif
 
 # quadmath support requires wchar
-ifeq ($(BR2_USE_WCHAR),)
+ifeq ($(BR2_USE_WCHAR)$(BR2_TOOLCHAIN_HAS_LIBQUADMATH),yy)
+HOST_GCC_COMMON_CONF_OPTS += --enable-libquadmath
+else
 HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath
 endif
 
