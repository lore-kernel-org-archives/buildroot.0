From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 09:39:14 +0100
Subject: [Buildroot] [git commit] ifplugd: remove spurious newline escape
Message-ID: <20141202084355.84F8180078@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d1ab19be4b63c210eede7fef9ee61d1a9ddde3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5ad5d55924bcc (ifplugd: install configuration files unconditionally)
removed the conditional configuration file install, but left an redundant
newline escape, causing the following error:

package/ifplugd/ifplugd.mk:23: *** missing 'endef', unterminated 'define'.  Stop.

Fix this.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ifplugd/ifplugd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 03ed8cd..6b6141e 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -24,7 +24,7 @@ define IFPLUGD_INSTALL_FIXUP
 	$(INSTALL) -D -m 0644 $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
 	$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
 	$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.action \
-		$(TARGET_DIR)/etc/ifplugd/ifplugd.action ; \
+		$(TARGET_DIR)/etc/ifplugd/ifplugd.action
 endef
 
 IFPLUGD_POST_INSTALL_TARGET_HOOKS += IFPLUGD_INSTALL_FIXUP
