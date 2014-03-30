From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 17:32:46 +0200
Subject: [Buildroot] [git commit] ifplugd: fix typo introduced in previous
	commit
Message-ID: <20140330153327.CCB689C2C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba53265b9c2d1d54bdde96becee20613f6d688c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b1ec31a4dd2b7bd8959bdbc6d44e2cf2b56f8363 ('ifplugd: only
install default action if not provided in skeleton') introduced a
small typo, which we fix in this commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ifplugd/ifplugd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 81b3884..7725978 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -27,7 +27,7 @@ define IFPLUGD_INSTALL_FIXUP
 	fi
 	if [ ! -f $(TARGET_DIR)/etc/ifplugd/ifplugd.action ]; then \
 		$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.action \
-			$(TARGET_DIR)/etc/ifplugd/ifplugd.action
+			$(TARGET_DIR)/etc/ifplugd/ifplugd.action ; \
 	fi
 	$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.init \
 		$(TARGET_DIR)/etc/init.d/S45ifplugd
