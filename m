From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 00:33:02 +0200
Subject: [Buildroot] [git commit] postgresql: fix ZIC configure variable
	assignment
Message-ID: <20150929223556.DE22D8078F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=468233a9b776a55dfd8ced7d5d67189f6bb76855
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'ZIC=$$(ZIC)' assignment is seen as 'ZIC=$(ZIC)' by the shell, that
interprets that as command substitution causing an error like:

/bin/sh: ZIC: command not found

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 2bad6b4..e710e92 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -50,7 +50,7 @@ POSTGRESQL_DEPENDENCIES += tzdata
 POSTGRESQL_CONF_OPTS += --with-system-tzdata=/usr/share/zoneinfo
 else
 POSTGRESQL_DEPENDENCIES += host-zic
-POSTGRESQL_CONF_ENV += ZIC=$$(ZIC)
+POSTGRESQL_CONF_ENV += ZIC="$(ZIC)"
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
