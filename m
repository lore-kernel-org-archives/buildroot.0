From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 09:33:48 +0100
Subject: [Buildroot] [git commit branch/next] grep: bump to version 2.9
Message-ID: <20111114083550.2BDC88F555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7dbf60b29dfe14b46f3a54afba609f73a22e370f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump grep to version 2.9
Also make it build after busybox if it's enabled, we prefer full-blown
utilities.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/grep/grep.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index e8b9cfe..e039135 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GREP_VERSION = 2.7
+GREP_VERSION = 2.9
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
 GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
@@ -15,4 +15,9 @@ GREP_CONF_ENV += LIBS=-liconv
 GREP_DEPENDENCIES += libiconv
 endif
 
+# Full grep preferred over busybox grep
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+GREP_DEPENDENCIES += busybox
+endif
+
 $(eval $(call AUTOTARGETS))
