From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:56:44 +0100
Subject: [Buildroot] [PATCHv2 26/74] at: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-27-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/at/at.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/at/at.mk b/package/at/at.mk
index 851a05b..1504e32 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -21,10 +21,8 @@ AT_CONF_OPTS = \
 	--with-daemon_groupname=root \
 	SENDMAIL=/usr/sbin/sendmail
 
-define AT_INSTALL_INITSCRIPT
+define AT_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/at/S99at $(TARGET_DIR)/etc/init.d/S99at
 endef
 
-AT_POST_INSTALL_TARGET_HOOKS += AT_INSTALL_INITSCRIPT
-
 $(eval $(autotools-package))
-- 
2.1.0
