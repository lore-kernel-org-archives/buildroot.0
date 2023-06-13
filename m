Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A52CC7EE29
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 10:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0478610E7;
	Tue, 13 Jun 2023 10:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0478610E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bl_oxSGiL0AY; Tue, 13 Jun 2023 10:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14B6560F00;
	Tue, 13 Jun 2023 10:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14B6560F00
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48A131BF2BE
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 10:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F15D8211F
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 10:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F15D8211F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZABB4yT2ucr for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 10:50:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AB678211A
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AB678211A
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 10:50:24 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M5fQq-1qBml72GOQ-007GTu; Tue, 13
 Jun 2023 12:50:19 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 12:50:13 +0200
Message-Id: <20230613105015.739870-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230613105015.739870-1-laurent@vivier.eu>
References: <20230613105015.739870-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BZFalR0Z7oAtzF4LOXyHNIBCHeUT5uMZFTsePN8yWLxayuqGvQV
 9qOfWW+6ukmL1E9yybCB25Qpc7m2SSEcPf2MaLiw3YhQcopykv8QIsDcOD+3svheJdlGnah
 7w+CdbJ4zzGZ629IB14ERkAm1LhZCRGx+uiz3zb4aWEqt166rGhc9czocB04H4VU4Pa3ZAg
 DrJslKzSRNT1GNYZu+hJA==
UI-OutboundReport: notjunk:1;M01:P0:CDzrYDP/N7g=;kiQisjwUkRBvN8KEdw9KOxKiCZC
 bNoCsrOAgAZbJFi/bzggSRdnuxM4hy3rVycgHkNekIJM6TLFov+Gy07TkTsRk1vwtFwy5aF5L
 +kw0u7Vo9ee6lb209EZ2f/gHt5Em+c8AplmO5tHgBC3ttO4dCDvbogSiaAiwYhR60/KOMPnIL
 c8q58ZElp16wkXZMrkg4GHICRJkDmnYMZo9sFeVwweJrJAE+F0L3kk551jRrL5vnZAY+liU3Y
 7IUml+6G2/zjKcMiE/qbwb8C7kVATvmbc5DK4jUHVEHvE/V2bHwxrV/x9M6CxCIu1ze6VcN/j
 BVkDmeSHbMUtcvuVVi7RP70laH/KvSLFQFSPyvyvcQHYNTmZTPP1RaFuQflcFxvw12cf5mPI9
 ytJgbliI0zCi9+vVzQmt8WQnY0NXnyfJ4UdAZco8nSuCJFHPNLlpUXL+y64Je8LFqDcU6aSmF
 m3JiQIxBgBsp3ZUc8q6p7z0ZO8aQBrJCU/snWpsruPExU2k8A8NiyT9/d8zD1fOacczW7eWF1
 9SJ69FFfDJWSvXZgxjfG1B4+g3GTIYn3KFHlKQsjYEnTI4mmsxr8rmKChPX7d8RJGjcOY7Vug
 ESUloeoDWFOBFvjN+mo05cxAHG5zrGLv/k2R1H2GSePPTpHS2D6TcnWiOVBq7plsGVZIwjyMX
 4mJxiZKARWdAqL382ZbrryyilZgkxNPT6uNDUfJLcg==
Subject: [Buildroot] [PATCH v14 2/4] petitboot: start petitboot on all tty
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
