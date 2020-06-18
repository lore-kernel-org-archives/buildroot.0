From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jun 2020 21:32:47 +0200
Subject: [Buildroot] [git commit] package/glibc: remove outdated cvs
 configure option
Message-ID: <20200618193130.4E30282ADA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d58fbd0e13e8f7f70103002cef137db6863ff94e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--without-cvs has been removed from glibc tree since glibc 2.15 [1]

[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=92963737c4376bcfd65235d5c325fa7f48302f89

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glibc/glibc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f1c846b727..76fae1f9f7 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -130,7 +130,6 @@ define GLIBC_CONFIGURE_CMDS
 		--enable-shared \
 		$(if $(BR2_x86_64),--enable-lock-elision) \
 		--with-pkgversion="Buildroot" \
-		--without-cvs \
 		--disable-profile \
 		--without-gd \
 		--enable-obsolete-rpc \
