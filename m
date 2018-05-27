From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 23:26:36 +0200
Subject: [Buildroot] [git commit] quota: depend on host-nfs-utils
Message-ID: <20180527213342.7CE7C8284A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d200fabc5a588998cfaf07f6ee3fa16a750d0bb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-nfs-utils provides the host rpcgen utility. This fixes the build on
recent Fedora systems that removed rpcgen from the glibc package.

Fixes:
http://autobuild.buildroot.net/results/730/730acb23663ebbbaba847073979654670a8bc64c/
http://autobuild.buildroot.net/results/e49/e49932e9d958203d585cdddd795df06aad6ff3a9/
http://autobuild.buildroot.net/results/1b7/1b7dccf7b9742d1b9cb57bffe55eac5cfc66b15c/

Cc: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quota/quota.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 5bd9013d6a..38e18a60c2 100644
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
