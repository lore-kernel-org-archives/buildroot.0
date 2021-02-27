From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:29:13 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/bind: disable
 backtrace support
Message-ID: <20210227182008.27CD78396F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b14d720f4b96836dde7e1f90b2f48f25a9a413c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Disable backtrace support, fixes linking failure for uclibc/musl based
toolchains.

Fixes:

  - http://autobuild.buildroot.net/results/7a1a140314bc8d134f9eeb95ef2e46e7fb0ce9fd/

  .../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../isc/.libs/libisc.so: undefined reference to `_Unwind_GetIP'

  - http://autobuild.buildroot.net/results/f0db5fe7fc6860b7270c784989c451e2e7aa2afb/

  .../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../isc/.libs/libisc.so: undefined reference to `_Unwind_GetIP'

  - http://autobuild.buildroot.net/results/cb963298885df37f1e5c4d3ab3989773c01c54fc/

  .../arm-buildroot-linux-musleabihf/bin/ld: ../isc/.libs/libisc.so: undefined reference to `_Unwind_GetIP'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 700674b45c86d28570ecb50d657ac7f6dfd89784)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0df2467bc5..ab42762e12 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -30,7 +30,8 @@ BIND_CONF_OPTS = \
 	--with-randomdev=/dev/urandom \
 	--enable-epoll \
 	--with-gssapi=no \
-	--enable-filter-aaaa
+	--enable-filter-aaaa \
+	--disable-backtrace
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 BIND_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
