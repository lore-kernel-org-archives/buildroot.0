From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 May 2013 00:23:35 +0200
Subject: [Buildroot] [git commit] flex: only needs gettext if locale is
	selected
Message-ID: <20130506222814.06D2C99C7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8989ecda1bd8955b8a5dfebf0b28ddf1cb2e9058
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add missing select in Config.in.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flex/Config.in |    1 +
 package/flex/flex.mk   |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/flex/Config.in b/package/flex/Config.in
index 90a75f4..f74a0f0 100644
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FLEX
 	bool "flex"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  A fast lexical analyser generator.  A tool for generating
 	  programs that perform pattern-matching on text.
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 59551f2..f7e319f 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -10,7 +10,7 @@ FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
 FLEX_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext) host-m4
+	$(if $(BR2_PACKAGE_GETTEXT_IF_LOCALE),gettext) host-m4
 # we don't have a host-gettext/libintl
 HOST_FLEX_DEPENDENCIES = host-m4
 
