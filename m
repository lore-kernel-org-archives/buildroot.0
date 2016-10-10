From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Oct 2016 12:50:09 -0300
Subject: [Buildroot] [PATCH 1/2] squid: disable netfilter for musl toolchains
Message-ID: <1476114610-11134-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It has been broken for several releases, fixes:
http://autobuild.buildroot.net/results/d6c/d6cf725e88bc0a4afd0b7e1ae58a8e5a649ae6c3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 702b220..c8a7248 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -25,7 +25,7 @@ SQUID_CONF_ENV = \
 	BUILDCXXFLAGS="$(HOST_CXXFLAGS)"
 SQUID_CONF_OPTS = \
 	--enable-async-io=8 \
-	--enable-linux-netfilter \
+	$(if $(BR2_TOOLCHAIN_USES_MUSL),--disable-linux-netfilter,--enable-linux-netfilter) \
 	--enable-removal-policies="lru,heap" \
 	--with-filedescriptors=1024 \
 	--disable-ident-lookups \
-- 
2.7.3
