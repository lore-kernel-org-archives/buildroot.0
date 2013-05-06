From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 May 2013 00:23:55 +0200
Subject: [Buildroot] [git commit] ndisc6: only needs gettext if locale is
	selected
Message-ID: <20130506222814.70D5599C7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a55068547c511d5c0750b8b558400601f3209f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add missing select in Config.in.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ndisc6/Config.in |    1 +
 package/ndisc6/ndisc6.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ndisc6/Config.in b/package/ndisc6/Config.in
index 126bfa2..6abe4ce 100644
--- a/package/ndisc6/Config.in
+++ b/package/ndisc6/Config.in
@@ -4,6 +4,7 @@ comment "ndisc6 requires a toolchain with IPv6 support"
 config BR2_PACKAGE_NDISC6
 	bool "ndisc6 tools"
 	depends on BR2_INET_IPV6
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  NDisc6 is a small collection of useful tools for IPv6 networking
 
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index f58cc13..1d3c0e7 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -10,7 +10,7 @@ NDISC6_SITE = http://www.remlab.net/files/ndisc6/
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
 NDISC6_CONF_OPT = --localstatedir=/var --disable-rpath --disable-suid-install
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 NDISC6_DEPENDENCIES += gettext
 NDISC6_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
 endif
