From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 13 Nov 2011 19:27:56 -0300
Subject: [Buildroot] [PATCH 08/10] grep: bump to version 2.9
In-Reply-To: <1321223278-14388-1-git-send-email-gustavo@zacarias.com.ar>
References: <1321223278-14388-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1321223278-14388-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump grep to version 2.9
Also make it build after busybox if it's enabled, we prefer full-blown
utilities.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.3.4
