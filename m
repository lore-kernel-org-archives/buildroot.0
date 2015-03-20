From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:33:23 +0100
Subject: [Buildroot] [git commit] openvmtools: move systemd service to
	/usr/lib
Message-ID: <20150320194323.3BA558181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad56242ae3ef6997b7c30b940065ae8f1ba85978
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openvmtools/openvmtools.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index e0ec6d6..f8230b2 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -67,9 +67,9 @@ endef
 
 define OPENVMTOOLS_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/openvmtools/vmtoolsd.service \
-		$(TARGET_DIR)/etc/systemd/system/vmtoolsd.service
+		$(TARGET_DIR)/usr/lib/systemd/system/vmtoolsd.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../vmtoolsd.service \
+	ln -fs ../../../../usr/lib/systemd/system/vmtoolsd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/vmtoolsd.service
 endef
 
