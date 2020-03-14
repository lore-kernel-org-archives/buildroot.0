From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 16:04:31 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/busybox: fix
 individual binaries installation
Message-ID: <20200314145209.51AA3832B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e96786c6233d2ec32d324c89fe47001b7a7e5579
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Call BUSYBOX_INSTALL_INDIVIDUAL_BINARIES in BUSYBOX_INSTALL_TARGET_CMDS,
not in BUSYBOX_INSTALL_INIT_SYSV. This should have been done in commit
b1e07d6d796e67a980d4a05d04c64f00162245ff but was somehow lost during the
review/aply process.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3da205b274b121efa92b8ff5eb4a90a19115d1e5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 565488ce1a..bf3b8aeec8 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -334,6 +334,7 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	# Use the 'noclobber' install rule, to prevent BusyBox from overwriting
 	# any full-blown versions of apps installed by other packages.
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install-noclobber
+	$(BUSYBOX_INSTALL_INDIVIDUAL_BINARIES)
 	$(BUSYBOX_INSTALL_INITTAB)
 	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
@@ -344,7 +345,6 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
-	$(BUSYBOX_INSTALL_INDIVIDUAL_BINARIES)
 endef
 
 # Checks to give errors that the user can understand
