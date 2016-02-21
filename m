From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:59:24 +0100
Subject: [Buildroot] [git commit] package/links: add --with/--without-ssl
Message-ID: <20160221135928.25B0780824@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81d5945f1fcfa8ebe4796dc137c585321f1da3ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/links/links.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index 97af418..516d4c8 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -58,7 +58,10 @@ LINKS_CONF_OPTS += --without-libevent
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LINKS_CONF_OPTS += --with-ssl --enable-ssl-pkgconfig
 LINKS_DEPENDENCIES += openssl
+else
+LINKS_CONF_OPTS += --without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
