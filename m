From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional openldap
	dependency
Message-ID: <20170923171327.A203D8103C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04d86a599104d2558a335d62e34d04402e155f53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Arnout: --with-ldap, suggested by Bernd]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 921281e..5ccd451 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -66,7 +66,6 @@ ASTERISK_CONF_OPTS = \
 	--without-jack \
 	--without-uriparser \
 	--without-kqueue \
-	--without-ldap \
 	--without-libedit \
 	--without-libxslt \
 	--without-ltdl \
@@ -155,6 +154,13 @@ else
 ASTERISK_CONF_OPTS += --without-ical
 endif
 
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+ASTERISK_DEPENDENCIES += openldap
+ASTERISK_CONF_OPTS += --with-ldap
+else
+ASTERISK_CONF_OPTS += --without-ldap
+endif
+
 ifeq ($(BR2_PACKAGE_NEON),y)
 ASTERISK_DEPENDENCIES += neon
 ASTERISK_CONF_OPTS += --with-neon
