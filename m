From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:39:26 +0100
Subject: [Buildroot] [git commit] postgresql: move systemd service file to
	/usr/lib
Message-ID: <20150320194323.811478181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=173f15e62b4539e670690a03e3a1f59a83923656
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 7bb1678..bc382ce 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -85,9 +85,9 @@ endef
 
 define POSTGRESQL_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/postgresql/postgresql.service \
-		$(TARGET_DIR)/etc/systemd/system/postgresql.service
+		$(TARGET_DIR)/usr/lib/systemd/system/postgresql.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../postgresql.service \
+	ln -fs ../../../../usr/lib/systemd/system/postgresql.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/postgresql.service
 endef
 
