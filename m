Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3F8C7EE25
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 11:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B4BD60BE5;
	Fri,  9 Jun 2023 11:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B4BD60BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LDqkdHHJ36ZU; Fri,  9 Jun 2023 11:30:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC72660BA9;
	Fri,  9 Jun 2023 11:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC72660BA9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B0281BF37F
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 11:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73F6A60BA9
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 11:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73F6A60BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hbqNhBruqCDY for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 11:30:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44F8F60AC0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44F8F60AC0
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 11:30:36 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mf0Jg-1peaI33BAQ-00gY9l; Fri, 09
 Jun 2023 13:25:25 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 13:25:20 +0200
Message-Id: <20230609112522.97790-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609112522.97790-1-laurent@vivier.eu>
References: <20230609112522.97790-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:C/qrrkuiCQ3wCCBorK/1UuTRLvxhRUFbZr5VEfwEgfFk0d5tPcS
 pU6rlj68OHVkEHxEn0mAwWdRVYqS/u5k5xxNfY22cty2hT1wvc8GuLH/dXl2ReRU3r1cb6U
 qTFyzOIkTUWg6tvcwgLqD4BMjO7kJ/ioyclHxKFUUXlVXyNHENJj9KRvPqhfv+dKmYb324s
 F7lZ9NiPTLSaG6RHo1y3A==
UI-OutboundReport: notjunk:1;M01:P0:yLAP1ocP9J8=;aodkjQb3kCam+2Z/QEZrODk+ugr
 iH1Vj3U3vxJzwodP9nUOEM/Wr24bOGDAWyaFHZ9JLSE4GBWnwwpdM67+aQnwZpRKT2cg9h+XY
 hntKCU7rtyrALiVJH1RP0d7NlepsDwRpUa+njeZwnvi+/fGmQ251CQ7ZEcd2JFxXppzBKm7U9
 IgLlEjFLaGOgMTGFafab4iziJS3SPLBY7ab61k7Qnmz3om47CPhnA3AgBNEqp+jAvKWPxSZVI
 slE32vCRR4GdlsNvQidTp8/9vaaem/h3P1tNH1glV+e6JUolMJndEKFRZvNEKpcmx8WhN0Sr0
 Sq4knNaISRD59ZhflMeVL1vKP3mfK1myhal/pIPloUpGAe0tI6mke1z0pQ0jt7QgeyM/RIVL1
 /wsj7L2YwPrjMuH3yec1vQbb9KEw7AvjNgXaf3f8WPPaVRE4f6pq3s8mq+qmVcl+MIculwT3c
 PQDYHF8oAa/aHZRQo/UyAPfIsFqLQnu+LVPV9fBE57/aULht5QQlmWYQJipI+n1SezxshzBz2
 4iXryGmGxZUeIs3NcIfqY/MOc7nLkXc7EPLvtd4ewor7r8pT9VFkZH+rM8FV3MpAaZm/JrmzH
 3fKPuHlBq/QQdcwTaYQIFiFA10rMIf9c/nsenk+l+OH908hc3rRFODcEc2dG4MhDmSeZ3Tx6K
 hc4b4ie0J9d/meFQJD4hs9YO6XrMuqcpPBy62fHbLw==
Subject: [Buildroot] [PATCH v13 2/4] petitboot: start petitboot on all tty
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
