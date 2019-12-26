From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 26 Dec 2019 12:01:22 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/quota: fix NLS build
Message-ID: <20191226110122.2623089-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/9e40a5b97dcd52cdfbd11688426ecad70390d56b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Replace patch by QUOTA_GETTEXTIZE = YES

 package/quota/quota.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index aafce0d1e9..3921860264 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -11,6 +11,7 @@ QUOTA_LICENSE = GPL-2.0+
 QUOTA_LICENSE_FILES = COPYING
 # We're patching configure.ac
 QUOTA_AUTORECONF = YES
+QUOTA_GETTEXTIZE = YES
 QUOTA_LIBS = $(TARGET_NLS_LIBS)
 QUOTA_CONF_OPTS = --disable-pie
 
-- 
2.24.0
