From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 15:03:44 +0200
Subject: [Buildroot] [git commit] postgresql: add host-zic dependency
Message-ID: <20140507130434.7F1F89CB29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb4e64e5fb8973489082118cc4f1858e5cedef8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes zic related build failure [1], patch suggested by
Yann E. MORIN [2].

[1] http://autobuild.buildroot.net/results/9ec69f92a48c1adc50bdb3096008243d842c27e6/
[2] http://lists.busybox.net/pipermail/buildroot/2014-April/094767.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
