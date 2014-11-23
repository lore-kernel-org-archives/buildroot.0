From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:39:23 +0100
Subject: [Buildroot] [PATCH 51/51] xenomai: add error handling to for loop
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-52-git-send-email-thomas.petazzoni@free-electrons.com>
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
