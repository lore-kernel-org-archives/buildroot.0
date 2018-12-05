From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed,  5 Dec 2018 17:11:31 +0100
Subject: [Buildroot] [PATCH] package/ejabberd: fix ejabberdctl permissions
Message-ID: <20181205161131.7235-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow ejabberd user to run ejabberdctl.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/ejabberd/ejabberd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 26768c7f89..6982375cf4 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -56,6 +56,7 @@ endef
 
 define EJABBERD_PERMISSIONS
 	/etc/ejabberd r 750 root ejabberd - - - - -
+	/usr/sbin/ejabberdctl f 750 root ejabberd - - - - -
 endef
 
 define EJABBERD_INSTALL_INIT_SYSV
-- 
2.17.1
