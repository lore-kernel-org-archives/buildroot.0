Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1F6C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 16:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A2760B2F;
	Sun,  7 May 2023 16:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7A2760B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IwoBOulUruBK; Sun,  7 May 2023 16:54:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13476613DC;
	Sun,  7 May 2023 16:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13476613DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80C721BF861
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 666B0416B4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 666B0416B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QRtvOYLljQVS for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 16:53:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A26F4171B
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A26F4171B
 for <buildroot@buildroot.org>; Sun,  7 May 2023 16:53:48 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MdNoW-1qUlLL3eb2-00ZRS8; Sun, 07
 May 2023 18:53:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 18:53:38 +0200
Message-Id: <20230507165340.42151-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507165340.42151-1-laurent@vivier.eu>
References: <20230507165340.42151-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ye1mgZ2uroAIYhBLz3C43dcJxKcPozMDaUa3zLqx3KuuqWICzbi
 tVZOGO6z4cIj71Jm/usvarqCokPSxga82SH1PYUse+pqfOTOlszAfupGeALZ23x71wQ2vm+
 0ci1jBqcS4RTZG4sfYk5TzTfJZneR/yQA2B7CCg3S0RpZbDP0wDwCkd6sKGl0kEZ4F6jQoI
 DAeV+vQeNYbirx6Mj4B5g==
UI-OutboundReport: notjunk:1;M01:P0:KeRwQRy0c+g=;aAkfsqOKSQFRCJpCIWFm1YgYwtz
 7TNI+YE2ueYKBuh9Q3tGgJjmR+/5VWyL3Of2tNaNbKhITQvyNvYBYdfCswLsYM1Q18utugZ0x
 gJDpUuGqDqavLfVOGnEqZvD9Pkf1Y+oirIV4A0ZofTiH+RVMpi8PtKqtISTCEVWKzQNbe9H/u
 OSrjEnU2Ab66EQeHceCJ2WMcFuoBXARk8Ta0s7nR0Pt1aehLTxv7jjNh1xd1cgV8+h1mXo3Ku
 CN/LuAojsNWHicWZL9LvwPLrkGam7BgBr41oq9UHCAmkER5jnCKDsYW3nzHuPjXJusfsEYo0t
 tF0RihrRIO/uEJ8cHu126JgnpRdDTYdVZvwNC5zJaFexxcXSsn36DNpf8OCj+3aHYmXedLJe/
 fpbBe3CJhCxK23aH5kKGWBzioRqDr9KpypB7vd53rDMMhy47Wtpszy7JjDWUqC5dXOahq0Rk5
 QnPqasa6UaQ5blkk+5uoT0ifq2TBx4+ppUxngvO+0f6bNdWbyzaTMkbsgpYa+MgjEKEV8yq34
 LkqNzLs1nCW24519IVO2iZLMolI9qbE5+pep+8q3oSC/9gwddeoj3Fe1e8WcyyHNDpTT6TrFJ
 vwmqv7gMA/8/aMP1wtwW2Mi+8TtqJUU9cuPEzIvhwQ70RZLz+78rkQf2m+pg+hNWGWn2kqbWg
 In2v7N17NZBtryzdmcPD2TuoIrlq7KcirUfdW98O7Q==
Subject: [Buildroot] [PATCH v12 3/5] petitboot: start petitboot on all tty
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 package/petitboot/petitboot-console-ui.rules | 5 +++++
 package/petitboot/petitboot.mk               | 4 ++++
 package/petitboot/sysctl.conf                | 1 +
 system/Config.in                             | 2 +-
 4 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 package/petitboot/petitboot-console-ui.rules
 create mode 100644 package/petitboot/sysctl.conf

diff --git a/package/petitboot/petitboot-console-ui.rules b/package/petitboot/petitboot-console-ui.rules
new file mode 100644
index 000000000000..ceeada256f2b
--- /dev/null
+++ b/package/petitboot/petitboot-console-ui.rules
@@ -0,0 +1,5 @@
+# spawn a petitboot UI on common user-visible interface devices
+SUBSYSTEM=="tty", KERNEL=="ttyGF*", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/getty --detach -- -n -i $name 0 linux"
+SUBSYSTEM=="tty", KERNEL=="hvc*", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/getty --detach -- -n -i $name 0 linux"
+SUBSYSTEM=="tty", KERNEL=="tty0", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/getty --detach -- -n -i $name 0 linux"
+SUBSYSTEM=="tty", KERNEL=="ttyS*", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/getty --detach -- -n -i $name 0 linux"
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 4d56b73938e7..e74a5ff623ea 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -55,6 +55,10 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
 	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
 		$(TARGET_DIR)/etc/init.d/S15pb-discover
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/petitboot-console-ui.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/sysctl.conf \
+		$(TARGET_DIR)/etc/sysctl.conf
 	ln -sf /usr/sbin/pb-udhcpc \
 		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
 endef
diff --git a/package/petitboot/sysctl.conf b/package/petitboot/sysctl.conf
new file mode 100644
index 000000000000..02ab8e3275b5
--- /dev/null
+++ b/package/petitboot/sysctl.conf
@@ -0,0 +1 @@
+kernel.printk = 1 1 1 1
diff --git a/system/Config.in b/system/Config.in
index 1ca7690ea3ba..786ec9a1c6b3 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -375,7 +375,7 @@ config BR2_SYSTEM_BIN_SH
 
 menuconfig BR2_TARGET_GENERIC_GETTY
 	bool "Run a getty (login prompt) after boot"
-	default y
+	default y         if !BR2_PACKAGE_PETITBOOT
 
 if BR2_TARGET_GENERIC_GETTY
 config BR2_TARGET_GENERIC_GETTY_PORT
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
