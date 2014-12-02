From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 09:43:21 +0100
Subject: [Buildroot] [git commit] sysklogd: fix redundant newline escape
Message-ID: <20141202084355.9A7737FA71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3df3fe717f6640e1fe790a19a9973bafb53008fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Broken since 428f1e7e70c6b (sysklogd: install configuration file
unconditionally). Fixes:

package/sysklogd/sysklogd.mk:21: *** missing 'endef', unterminated 'define'.  Stop.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysklogd/sysklogd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 1e8652d..de2edf4 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -22,7 +22,7 @@ define SYSKLOGD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0500 $(@D)/syslogd $(TARGET_DIR)/sbin/syslogd
 	$(INSTALL) -D -m 0500 $(@D)/klogd $(TARGET_DIR)/sbin/klogd
 	$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
-		$(TARGET_DIR)/etc/syslog.conf; \
+		$(TARGET_DIR)/etc/syslog.conf
 endef
 
 define SYSKLOGD_INSTALL_INIT_SYSV
