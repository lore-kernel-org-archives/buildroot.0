Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B643AC77B76
	for <buildroot@archiver.kernel.org>; Fri, 21 Apr 2023 18:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B0586FFEE;
	Fri, 21 Apr 2023 18:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B0586FFEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TfLRtC7jvApy; Fri, 21 Apr 2023 18:50:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 823D270008;
	Fri, 21 Apr 2023 18:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 823D270008
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9731A1BF2C2
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 18:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A94883EB8
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 18:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A94883EB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DE69Nl6Lf29d for <buildroot@lists.busybox.net>;
 Fri, 21 Apr 2023 18:50:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C5D583FAA
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C5D583FAA
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 18:50:12 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M2xjg-1ptE9L2u9E-003O17; Fri, 21
 Apr 2023 20:50:07 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Fri, 21 Apr 2023 20:50:01 +0200
Message-Id: <20230421185003.1221000-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421185003.1221000-1-laurent@vivier.eu>
References: <20230421185003.1221000-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:aqUkQ4TbXdn1+OSnSDjTEcTxNBxfbiddLRhCE1gmRQ7FDV0F3SH
 tvGe+cpIzSLDEdUQChk2AiFqG0TEXzxRJgC7201DOx3JsTu3C7vBCLHwLXpJLL2XEIci6aR
 6mCjqBX96s5uc3y3oETHxQemjm9B6PE1XmnzBoYVxixbSn0Hk+P6H+gAbNIUXtHGpynDCLr
 Lf77QZ4N4SCbCrA7huCWw==
UI-OutboundReport: notjunk:1;M01:P0:gR8RT0r+sTU=;50OOY56QpkCbp4mZL9hX2TuC9aK
 me9fyWVPO+p4SlAR6rUsVLfkkZ7neBJ5UQazSAIrdBDJ9NhKsf1T3wVRqYU7K53pJoqjUF+I3
 Tz6iv94xOBZHdwI2JC9b4fNBcecBadeFodsYWRbCe0fsZAZRR68T4tsRHrZYMWx3Xdkz61e5e
 7TCfy+nF4LdC0W58SjYtQRlvQt+mJsebenDMkL+x4B+aUXQlpwJlyZuOqtcvjJ3KBkJnb5UpG
 iA+lstSbEM8eRbNWzvFOD5YzPdKIz/JsanUQh4URVXQSis4tugX6NC7hDDYE4ZSUkAcIH+8/k
 XJsCT/cld7vTWj1uObUsJPOEiEi0N9OK/CFYyB9QjwqHMskBfwum2asGl//0maXT00ti58le4
 P5Lv8zMQfdgdYnPRE6q6Oi2sEGBYKiF2joRm/7VTijNOkXqFEDKcuhqNr7YbwDa3MqiFf5sX/
 /YXrwxGf7ulQITbDeRSMrSaS3eOiiMRo7UOzLzXtw5GkWTtfHYHFLsphQzowgQHGYmrWpWosp
 7CQoEkMIbYDCr6hTk25bZaYNXJcFQz7UhXlzmGFSPMoeeDfPBJpd9m3xqcD14OniHbYcKhNft
 u+Lfw6Tl73k6TSfE8ZU7mKZTopjkdHpZmyU3a/5NxoBxCGl9MgDWichFJBZlg61Ugntt3DluE
 m3WxeWNdSRa07hIzYg08rDumiWTdRNSTNgj1F9MbbQ==
Subject: [Buildroot] [PATCH v11 3/5] petitboot: start petitboot on all tty
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
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
