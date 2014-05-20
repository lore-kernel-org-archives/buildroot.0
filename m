From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 May 2014 14:05:05 +0200
Subject: [Buildroot] [git commit branch/next] inadyn: install initscript in
	INSTALL_INIT_SYSV hook
Message-ID: <20140520120656.0F0B19CCC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7fc34b7be19602ee2f600e34072e39e9d949050d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/inadyn/inadyn.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 463eaa8..3886390 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -17,6 +17,9 @@ define INADYN_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/src/inadyn $(TARGET_DIR)/usr/sbin/inadyn
 	$(INSTALL) -D -m 0600 package/inadyn/inadyn.conf \
 		$(TARGET_DIR)/etc/inadyn.conf
+endef
+
+define INADYN_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/inadyn/S70inadyn \
 		$(TARGET_DIR)/etc/init.d/S70inadyn
 endef
