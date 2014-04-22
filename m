From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 22 Apr 2014 17:41:25 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: add host-zic dependency
Message-ID: <1398181285-4260-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes zic related build failure [1], patch suggested by
Yann E. MORIN [2].

[1] http://autobuild.buildroot.net/results/9ec69f92a48c1adc50bdb3096008243d842c27e6/
[2] http://lists.busybox.net/pipermail/buildroot/2014-April/094767.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/postgresql/postgresql.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 11b167a..2606e25 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -29,6 +29,9 @@ endif
 ifeq ($(BR2_PACKAGE_TZDATA),y)
 	POSTGRESQL_DEPENDENCIES += tzdata
 	POSTGRESQL_CONF_OPT += --with-system-tzdata=/usr/share/zoneinfo
+else
+	POSTGRESQL_DEPENDENCIES += host-zic
+	POSTGRESQL_CONF_ENV += ZIC=$$(ZIC)
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
1.8.1.4
