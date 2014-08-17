From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:16:34 +0200
Subject: [Buildroot] [git commit] postgresql: remove devfiles from target
Message-ID: <20140817191642.2EC149D461@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e116bf3696234347a2628cda78b976ac70ba6da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 73762e2..e83fa83 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -51,6 +51,7 @@ endef
 
 define POSTGRESQL_INSTALL_TARGET_FIXUP
 	$(INSTALL) -dm 0700 $(TARGET_DIR)/var/lib/pgsql
+	$(RM) -rf $(TARGET_DIR)/usr/lib/postgresql/pgxs
 endef
 
 POSTGRESQL_POST_INSTALL_TARGET_HOOKS += POSTGRESQL_INSTALL_TARGET_FIXUP
