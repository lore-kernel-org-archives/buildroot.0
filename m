From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Mar 2020 23:37:39 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/sqlcipher: fix
 static build
Message-ID: <20200313065149.6183180584@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb3e8bad8c52a03986ada677bb080e9d9ddaa251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/ebd8678a56a7dd8679fd4ec3ca1385c04866cc88

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7144c8169755b58ffbad27e0e5ff0963df2fda2d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
