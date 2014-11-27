From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:57:09 +0100
Subject: [Buildroot] [PATCHv2 51/74] xenomai: add error handling to for loop
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-52-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/xenomai.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 740a40b..ccbae35 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -99,7 +99,7 @@ XENOMAI_DEPENDENCIES += udev
 define XENOMAI_INSTALL_UDEV_RULES
 	if test -d $(TARGET_DIR)/etc/udev/rules.d ; then \
 		for f in $(@D)/ksrc/nucleus/udev/*.rules ; do \
-			cp $$f $(TARGET_DIR)/etc/udev/rules.d/ ; \
+			cp $$f $(TARGET_DIR)/etc/udev/rules.d/ || exit 1 ; \
 		done ; \
 	fi;
 endef
-- 
2.1.0
