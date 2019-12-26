From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 26 Dec 2019 16:05:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/quota: drop QUOTA_LIBS
Message-ID: <20191226150510.3415063-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop QUOTA_LIBS as this variable is always set to $(TARGET_NLS_LIBS)
since bump to version 4.05 in commit
540797f95553b0b5cbdd314e4bb0d3b136935b0a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quota/quota.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 3921860264..f4bf9e5c58 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -12,7 +12,7 @@ QUOTA_LICENSE_FILES = COPYING
 # We're patching configure.ac
 QUOTA_AUTORECONF = YES
 QUOTA_GETTEXTIZE = YES
-QUOTA_LIBS = $(TARGET_NLS_LIBS)
+QUOTA_CONF_ENV = LIBS="$(TARGET_NLS_LIBS)"
 QUOTA_CONF_OPTS = --disable-pie
 
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBNL),yy)
@@ -40,6 +40,4 @@ else
 QUOTA_CONF_OPTS += --disable-ldapmail
 endif
 
-QUOTA_CONF_ENV = LIBS="$(QUOTA_LIBS)"
-
 $(eval $(autotools-package))
-- 
2.24.0
