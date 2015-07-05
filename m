From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 16:08:46 +0200
Subject: [Buildroot] [git commit] upmpdcli: use relative path for systemd
	service symlink
Message-ID: <20150705140912.3C48580107@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63b1fec279500eb8e8827f6db228709c1dcde566
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/upmpdcli/upmpdcli.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 69a0ab3..9531b61 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -35,7 +35,7 @@ define UPMPDCLI_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 $(@D)/systemd/upmpdcli.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/upmpdcli.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf /usr/lib/systemd/system/upmpdcli.service \
+	ln -sf ../../../../usr/lib/systemd/system/upmpdcli.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/upmpdcli.service
 endef
 
