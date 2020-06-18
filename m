From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 18 Jun 2020 18:17:34 +0200
Subject: [Buildroot] [PATCH] package/glibc: remove outdated cvs configure
 option
Message-ID: <20200618161734.3354476-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--without-cvs has been removed from glibc tree since glibc 2.15 [1]

[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=92963737c4376bcfd65235d5c325fa7f48302f89

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.25.4
