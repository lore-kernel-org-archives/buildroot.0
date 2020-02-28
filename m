From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Fri, 28 Feb 2020 14:30:56 +0100
Subject: [Buildroot] [PATCH] package/exim: fix spool directory
Message-ID: <20200228133056.9482-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure the exim spool directory exists and
has the proper permissions so the following error
does not occur:

Cannot open main log file "/var/spool/exim/log/mainlog"

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/exim/exim.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index e4b0bfc1b4..1ed3961a14 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -145,6 +145,10 @@ define EXIM_USERS
 	exim 88 mail 8 * - - - exim
 endef
 
+define EXIM_PERMISSIONS
+        /var/spool/exim d 755 88 8 - - - - -
+endef
+
 define EXIM_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/exim/S86exim \
 		$(TARGET_DIR)/etc/init.d/S86exim
-- 
2.17.1
