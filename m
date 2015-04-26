From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Apr 2015 12:29:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: limit libseccomp support to
	archs supported by upstream
Message-ID: <1430044186-17979-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See this commit for a list of supported archs:
https://gitweb.torproject.org/tor.git/commit/src/common/sandbox.c?id=b0c1c700114aa8d4dfc180d85870c5bbe15fcacb

Fixes mips64el build error:
http://autobuild.buildroot.net/results/f97/f9792a0b013f6b79774ecc978d859f56bd941586/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 138a5b2..2c671ba 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -25,7 +25,7 @@ TOR_CONF_OPTS += \
 	--enable-static-zlib
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_i386)$(BR2_x86_64)$(BR2_PACKAGE_LIBSECCOMP),yy)
 TOR_CONF_OPTS += --enable-seccomp
 TOR_DEPENDENCIES += libseccomp
 else
-- 
1.7.10.4
