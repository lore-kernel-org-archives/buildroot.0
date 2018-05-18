From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 18 May 2018 14:31:57 +0300
Subject: [Buildroot] [PATCH 2/4] quota: depend on host-nfs-utils
In-Reply-To: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
References: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
Message-ID: <019d713946a4d86bc6cceede37e82e6994e34978.1526643119.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-nfs-utils provides the host rpcgen utility. This fixes the build on
recent Fedora systems that removed rpcgen from the glibc package.

Fixes:
http://autobuild.buildroot.net/results/730/730acb23663ebbbaba847073979654670a8bc64c/
http://autobuild.buildroot.net/results/e49/e49932e9d958203d585cdddd795df06aad6ff3a9/
http://autobuild.buildroot.net/results/1b7/1b7dccf7b9742d1b9cb57bffe55eac5cfc66b15c/

Cc: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/quota/quota.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 5bd9013d6a36..38e18a60c28c 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -6,7 +6,7 @@
 
 QUOTA_VERSION = 4.01
 QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
-QUOTA_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+QUOTA_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-nfs-utils
 QUOTA_AUTORECONF = YES
 QUOTA_LICENSE = GPL-2.0+
 QUOTA_CONF_OPTS = --disable-strip-binaries
-- 
2.17.0
