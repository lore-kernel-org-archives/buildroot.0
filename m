From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:26:25 +0100
Subject: [Buildroot] [git commit] rsyslog: rename sysv initscript to
	S01logging
Message-ID: <20150114192851.31B4980DE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f74996c1e168f5ab910033e5f7f3039e3831d58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do it to avoid having duplicate and conflicting functionality with
busybox's S01logging.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsyslog/{S01rsyslog => S01logging} |    0
 package/rsyslog/rsyslog.mk                 |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/S01rsyslog b/package/rsyslog/S01logging
similarity index 100%
rename from package/rsyslog/S01rsyslog
rename to package/rsyslog/S01logging
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 688a335..27a72da 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -39,8 +39,8 @@ else
 endif
 
 define RSYSLOG_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/rsyslog/S01rsyslog \
-		$(TARGET_DIR)/etc/init.d/S01rsyslog
+	$(INSTALL) -m 0755 -D package/rsyslog/S01logging \
+		$(TARGET_DIR)/etc/init.d/S01logging
 endef
 
 define RSYSLOG_INSTALL_INIT_SYSTEMD
