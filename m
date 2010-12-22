From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Dec 2010 23:47:28 +0100
Subject: [Buildroot] [git commit master 1/1] grep: bump to version 2.7
Message-ID: <20101222232249.6CB698E20B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0b584467c193234250819ee52d806f8cec13c1f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs wchar]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/grep/Config.in |    4 ++++
 package/grep/grep.mk   |    7 +++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/grep/Config.in b/package/grep/Config.in
index 430616b..1b39922 100644
--- a/package/grep/Config.in
+++ b/package/grep/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_GREP
 	bool "grep"
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  The GNU regular expression matcher.
 
 	  http://www.gnu.org/software/grep/grep.html
+
+comment "grep needs a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 5b945d5..e323b1d 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -3,11 +3,10 @@
 # grep
 #
 #############################################################
-GREP_VERSION:=2.5.3
-GREP_SOURCE:=grep-$(GREP_VERSION).tar.bz2
-GREP_SITE:=$(BR2_GNU_MIRROR)/grep
-GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
 
+GREP_VERSION = 2.7
+GREP_SITE = $(BR2_GNU_MIRROR)/grep
+GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
 GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
 $(eval $(call AUTOTARGETS,package,grep))
-- 
1.7.2.2
