From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 21:46:55 +0100
Subject: [Buildroot] [git commit] package/sqlcipher: fix static build
Message-ID: <20190309204431.4615D8E381@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7144c8169755b58ffbad27e0e5ff0963df2fda2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/ebd8678a56a7dd8679fd4ec3ca1385c04866cc88

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sqlcipher/sqlcipher.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index fcca3b7254..4427344120 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -33,4 +33,10 @@ else
 SQLCIPHER_CONF_OPTS += --disable-readline
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+SQLCIPHER_CONF_OPTS += --disable-load-extension
+else
+SQLCIPHER_CONF_OPTS += --enable-load-extension
+endif
+
 $(eval $(autotools-package))
