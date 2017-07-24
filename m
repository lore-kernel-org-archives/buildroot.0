From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 18:23:07 +0200
Subject: [Buildroot] [git commit] grep: standardise pcre optional dependency
Message-ID: <20170724162038.A40588018F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e27dda19540a7dd8fb3aa6dcf478c4e805c749e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the 'disable' config option in the 'else' clause of the optional
dependency as is the common pattern.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/grep/grep.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index cfbf2ec..06d84ed 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -9,8 +9,7 @@ GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
-GREP_CONF_OPTS = --disable-perl-regexp \
-	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
+GREP_CONF_OPTS = $(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # link with iconv if enabled
@@ -23,6 +22,8 @@ endif
 ifeq ($(BR2_PACKAGE_PCRE),y)
 GREP_CONF_OPTS += --enable-perl-regexp
 GREP_DEPENDENCIES += pcre
+else
+GREP_CONF_OPTS += --disable-perl-regexp
 endif
 
 # Full grep preferred over busybox grep
