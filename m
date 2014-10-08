From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed,  8 Oct 2014 16:48:52 +0200
Subject: [Buildroot] [PATCH 2/2] quota: bump to version 4.01
In-Reply-To: <1412779736-11412-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1412779736-11412-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1412779736-11412-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/quota/quota-01-tools-getrpcbynumber.patch |    4 ++--
 package/quota/quota.hash                          |    3 +++
 package/quota/quota.mk                            |    2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)
 create mode 100644 package/quota/quota.hash

diff --git a/package/quota/quota-01-tools-getrpcbynumber.patch b/package/quota/quota-01-tools-getrpcbynumber.patch
index 3fed853..899db91 100644
--- a/package/quota/quota-01-tools-getrpcbynumber.patch
+++ b/package/quota/quota-01-tools-getrpcbynumber.patch
@@ -20,8 +20,8 @@ Index: b/configure.in
 +   AC_MSG_ERROR([Neither getrpcbynumber_r nor getrpcbynumber are available])
 +fi
 +
- AC_ARG_ENABLE(altformat,
- 	[  --enable-altformat=[yes/no]     Enable alternative format used by edquota [default=yes].],
+ AC_ARG_ENABLE(rpc,
+ 	[  --enable-rpc=[yes/no]           Enable RPC support [default=yes].],
  	,
 Index: b/svc_socket.c
 ===================================================================
diff --git a/package/quota/quota.hash b/package/quota/quota.hash
new file mode 100644
index 0000000..7bba98d
--- /dev/null
+++ b/package/quota/quota.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/linuxquota/files/quota-tools/4.01/ (click an info button)
+md5	5c2c31e321d2e1322ce12d69ae5c66d6	quota-4.01.tar.gz
+sha1	64d2ab8b039cfea1aa4bd9e77e8c373488a7f0bf	quota-4.01.tar.gz
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index cd15375..5011c0f 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUOTA_VERSION = 4.00
+QUOTA_VERSION = 4.01
 QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 QUOTA_DEPENDENCIES = host-gettext
 QUOTA_AUTORECONF = YES
-- 
1.7.9.5
