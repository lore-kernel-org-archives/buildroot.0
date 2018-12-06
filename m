From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:11:36 +0100
Subject: [Buildroot] [git commit] package/ejabberd: fix ejabberdctl
 permissions
Message-ID: <20181206200757.E4B9D86C03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2877aef3d1dfb7e7b32e0ff8b0946d548ef1e708
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow ejabberd user to run ejabberdctl.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
