From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 May 2018 13:30:14 +0300
Subject: [Buildroot] [PATCH v2 3/6] quota: depend on host-nfs-utils
In-Reply-To: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
References: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
Message-ID: <3b071e052f529a5557e6c7bfc75419a220367bfe.1526985017.git.baruch@tkos.co.il>
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
v2: no change
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
