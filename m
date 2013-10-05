From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Oct 2013 21:12:44 +0200
Subject: [Buildroot] [git commit] netatalk: disable dtrace
Message-ID: <20131005191321.A4E2E9B953@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a67c54c77782936b69fd062d49aa590f4f97bb3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fix build failure:
http://autobuild.buildroot.net/results/dbade69e610a079c5e12356991e6b908f4f716e9/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netatalk/netatalk.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
