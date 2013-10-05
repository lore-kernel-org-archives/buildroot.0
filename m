From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 05 Oct 2013 15:52:05 +0200
Subject: [Buildroot] [PATCH 1/1] netatalk: disable dtrace
Message-ID: <52501985.1090902@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


fix build failure:
http://autobuild.buildroot.net/results/dbade69e610a079c5e12356991e6b908f4f716e9/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/netatalk/netatalk.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 37115ec..5dab57d 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -24,7 +24,8 @@ NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--disable-shell-check \
 	--without-kerberos \
 	--without-pam \
-	--with-libevent=no
+	--with-libevent=no \
+	--with-dtrace=no

 ifeq ($(BR2_PACKAGE_CUPS),y)
 	NETATALK_DEPENDENCIES += cups
-- 
1.8.4
