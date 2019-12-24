From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 24 Dec 2019 09:06:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/quota: add autoreconf
Message-ID: <20191224080625.564034-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit feef4b733c4e5a6ee89d1554d29786304be7a720 added a patch on
configure.ac but forgot to set QUOTA_AUTORECONF=YES

Fixes:
 - http://autobuild.buildroot.org/results/15f2dbfbafc91719ad1f5209811300ddaa5cec91

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quota/quota.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 8c7563d289..aafce0d1e9 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -9,6 +9,8 @@ QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(Q
 QUOTA_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-nfs-utils
 QUOTA_LICENSE = GPL-2.0+
 QUOTA_LICENSE_FILES = COPYING
+# We're patching configure.ac
+QUOTA_AUTORECONF = YES
 QUOTA_LIBS = $(TARGET_NLS_LIBS)
 QUOTA_CONF_OPTS = --disable-pie
 
-- 
2.24.0
