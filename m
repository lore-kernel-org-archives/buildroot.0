From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 30 Apr 2017 13:14:38 +0200
Subject: [Buildroot] [PATCH] package/xenomai: update udev rules search path
Message-ID: <20170430111438.11069-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The udev rules has been moved to kernel/cobalt/udev.

Fixes:
http://autobuild.buildroot.net/results/8eb/8eb4643faed523ffccd421f20c2955adfde634a6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Do we want to keep the old path in the .mk for backward compatibility
with Xenomai < 3 ?
---
 package/xenomai/xenomai.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index c1477d9..fa46819 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -146,7 +146,7 @@ XENOMAI_DEPENDENCIES += udev
 
 define XENOMAI_INSTALL_UDEV_RULES
 	if test -d $(TARGET_DIR)/etc/udev/rules.d ; then \
-		for f in $(@D)/ksrc/nucleus/udev/*.rules ; do \
+		for f in $(@D)/kernel/cobalt/udev/*.rules ; do \
 			cp $$f $(TARGET_DIR)/etc/udev/rules.d/ || exit 1 ; \
 		done ; \
 	fi;
-- 
2.9.3
