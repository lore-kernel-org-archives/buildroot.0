From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:58:42 +0100
Subject: [Buildroot] [git commit] package/acpid: fix acpid.service
 permissions
Message-ID: <20181213205530.93DB38D293@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e49e811a88ad379543940464d74ba6422c018f4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Execution permissions cause systemd to throw runtime warnings since
systemd service files are essentially a type of configuration file and
are not designed to be executed like init scripts.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acpid/acpid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 514fd31fe6..adcc1757aa 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -11,7 +11,7 @@ ACPID_LICENSE = GPL-2.0+
 ACPID_LICENSE_FILES = COPYING
 
 define ACPID_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0755 package/acpid/acpid.service \
+	$(INSTALL) -D -m 0644 package/acpid/acpid.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/acpid.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf ../../../../usr/lib/systemd/system/acpid.service \
