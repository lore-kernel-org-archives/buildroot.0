From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 14:35:29 +0200
Subject: [Buildroot] [git commit] package/glibc: remove --{with,
 without}-fp option
Message-ID: <20180805122920.82F688B487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0f77c11949167739ab5eaadf7e37b4c0eb94824
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option has been removed since glibc 2.27 [1].

[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=8df5d34720dd71e934545bade879e04697830757

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 6d21ae7ac0..d34b42b831 100644
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
