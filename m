From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  1 Aug 2018 21:47:29 +0200
Subject: [Buildroot] [PATCH] package/glibc: remove --{with,
 without}-fp option
Message-ID: <20180801194729.6590-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option has been removed since glibc 2.27 [1].

[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=8df5d34720dd71e934545bade879e04697830757

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/glibc/glibc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 2cd902bdcc..399cf395ce 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -93,7 +93,6 @@ define GLIBC_CONFIGURE_CMDS
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--enable-shared \
-		$(if $(BR2_SOFT_FLOAT),--without-fp,--with-fp) \
 		$(if $(BR2_x86_64),--enable-lock-elision) \
 		--with-pkgversion="Buildroot" \
 		--without-cvs \
-- 
2.14.4
