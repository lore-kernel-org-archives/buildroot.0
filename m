From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 16:51:31 +0200
Subject: [Buildroot] [git commit] squid: disable netfilter for musl
	toolchains
Message-ID: <20161014145259.B16587F995@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c355ee5bd8bf5026b10e46e0a878ccc4a36c4295
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It has been broken for several releases, fixes:
http://autobuild.buildroot.net/results/d6c/d6cf725e88bc0a4afd0b7e1ae58a8e5a649ae6c3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
