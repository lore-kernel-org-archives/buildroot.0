From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 18 Jun 2012 21:18:32 -0400
Subject: [Buildroot] [PATCH] xinetd: explicitly specify AR in build step
Message-ID: <1340068712-10822-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xinetd's configure does not set up an AR variable, and there
are no libtool files to autoreconfigure.  So instead, lets
pass in AR during the build.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/xinetd/xinetd.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index 6a69a55..e8fc037 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -11,4 +11,6 @@ ifneq ($(BR2_INET_RPC),y)
 XINETD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DNO_RPC"
 endif
 
+XINETD_MAKE_OPT = AR="$(TARGET_AR)"
+
 $(eval $(call AUTOTARGETS))
-- 
1.7.9.5
