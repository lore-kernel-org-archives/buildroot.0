From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Sep 2017 21:36:27 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libidn: fix build without
	makeinfo
Message-ID: <20170924203032.828D380007@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07ddb405672e14f52f416f525df133201b3bb283
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Build fails when the makeinfo utility is not installed on the host.

Fixes:
http://autobuild.buildroot.net/results/dfd/dfdfb34ed81ba3a4b7a7271be482e75eca849dbf/
http://autobuild.buildroot.net/results/b33/b33c0b0e6b1033ab1d1294a91b869ee6adcd391a/
http://autobuild.buildroot.net/results/940/9401cc10f6da6a2e3453ebc65ce573c370733fb5/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f6227928cd55c8d2d6ddac64773367c0edde095d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libidn/libidn.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 80fc827..c4088ae 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -7,7 +7,7 @@
 LIBIDN_VERSION = 1.33
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
-LIBIDN_CONF_ENV = EMACS="no"
+LIBIDN_CONF_ENV = EMACS="no" MAKEINFO=true
 LIBIDN_CONF_OPTS = --disable-java --enable-csharp=no
 LIBIDN_DEPENDENCIES = host-pkgconf $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBIDN_LICENSE = GPLv2+, GPLv3+, LGPLv3+
