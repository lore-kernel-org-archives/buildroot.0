From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 May 2016 22:34:51 +0200
Subject: [Buildroot] [PATCH] system: add comment about busybox-show-others
Message-ID: <1464381291-24985-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the chosen init system is sysvinit, BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
is forcibly enabled.

This option looks like it is an option of the Busybox package, and thus
that it would not be available if Busybox is disabled (which can happen
when Busybox is not the init system).

Add a comment that explicitly states that BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
is also available when Busybox is not enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>

---
Hopefully, this will avoid people to go hunting like I did, and loose a
few precious minutes of hair-pulling... ;-]
---
 system/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/Config.in b/system/Config.in
index 2e14971..1820029 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -74,6 +74,7 @@ config BR2_INIT_BUSYBOX
 
 config BR2_INIT_SYSV
 	bool "systemV"
+	# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS exists even when Busybox is not enabled
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # sysvinit
 	select BR2_PACKAGE_INITSCRIPTS
 	select BR2_PACKAGE_SYSVINIT
-- 
2.7.4
