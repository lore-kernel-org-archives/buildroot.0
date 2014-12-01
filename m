From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:15:00 +0100
Subject: [Buildroot] [git commit] xenomai: add error handling to for loop
Message-ID: <20141201233009.0C0AF80051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f26616a3086ee8874964dac38143d2577c72a699
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xenomai/xenomai.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
