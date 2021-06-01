From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jun 2021 22:39:40 +0200
Subject: [Buildroot] [git commit] package/oracle-mysql: use
 BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
Message-ID: <20210607144658.BC023810DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd14435d8182d2e891f0757e0bcfe6bfad4a27e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_ENABLE_DEBUG should just steer the availability of debug symbols and
should have no negative effect on performance.

Introduction of 'assert' statements, 'debug'-type builds with additional
logging, etc. should be steered by BR2_ENABLE_RUNTIME_DEBUG instead.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/oracle-mysql/oracle-mysql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index ccfa40cfb1..e7d6354ed8 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -95,7 +95,7 @@ ORACLE_MYSQL_CONF_OPTS += \
 
 # Debugging is only available for the server, so no need for
 # this if-block outside of the server if-block
-ifeq ($(BR2_ENABLE_DEBUG),y)
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
 ORACLE_MYSQL_CONF_OPTS += --with-debug=full
 else
 ORACLE_MYSQL_CONF_OPTS += --without-debug
