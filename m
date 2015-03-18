From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 15:01:09 -0700
Subject: [Buildroot] [PATCH] package/glibc: enable lock elision on x86_64
	hosts
In-Reply-To: <1426716071-27570-1-git-send-email-steven@uplinklabs.net>
References: <1426716071-27570-1-git-send-email-steven@uplinklabs.net>
Message-ID: <1426716071-27570-2-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/glibc/glibc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0a37bb3..651711a 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -90,6 +90,7 @@ define GLIBC_CONFIGURE_CMDS
 		--prefix=/usr \
 		--enable-shared \
 		$(if $(BR2_SOFT_FLOAT),--without-fp,--with-fp) \
+		$(if $(BR2_x86_64),--enable-lock-elision,) \
 		--with-pkgversion="Buildroot" \
 		--without-cvs \
 		--disable-profile \
-- 
2.3.3
