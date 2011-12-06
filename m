From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Dec 2011 09:49:09 +0100
Subject: [Buildroot] [git commit] dnsmasq: create runtime directory
Message-ID: <20111206090153.701488F72F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09be7e24e567c3cb93bec0978a9ee64c396168cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

$(TARGET_DIR)/var/lib/misc/ is the location where dnsmasq stores its
lease files. Create it to make the daemon work.

Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dnsmasq/dnsmasq.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 0f8db9d..fc43abd 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -57,6 +57,7 @@ endef
 
 define DNSMASQ_INSTALL_TARGET_CMDS
 	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPT) install
+	mkdir -p $(TARGET_DIR)/var/lib/misc/
 endef
 
 define DNSMASQ_UNINSTALL_TARGET_CMDS
