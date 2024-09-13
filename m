Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5F0FA375E
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 15:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3367440104;
	Fri, 13 Sep 2024 15:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGpzMx1KQZ1I; Fri, 13 Sep 2024 15:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F23DF401CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F23DF401CC;
	Fri, 13 Sep 2024 15:47:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A50A71BF97E
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 15:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9291F401CC
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 15:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtWoOVgqHfqI for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 15:47:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.73;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF3AB40104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF3AB40104
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF3AB40104
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 15:47:29 +0000 (UTC)
Received: from evilbit.green-communications.fr ([88.171.60.104]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1MIxqu-1saCxi3he6-00K2Od; Fri, 13 Sep 2024 17:47:24 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Sep 2024 17:44:28 +0200
Message-ID: <20240913154634.10723-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:3EVWZDBxSOFjj2R+U2PRT6bFziWaJ0pqmshF+yjzetD55mBlwr6
 yG6nJHk1uKZ7FK6Xng2d2MOrJlNBKVpL8wjHrTwn38hQVJNT75sTxXGR72k0hFxIMWrXid1
 HPt0Xt+krlgPo4ZRxpkuLb2wk5f855LNzCXfhAmO58S924UIGWQAJy865Wkkl3IeKD8FAW+
 KX7/Q1gVUqupVbKDzp1tw==
UI-OutboundReport: notjunk:1;M01:P0:CL4gB98fsqc=;cjQ3KUpba5/8+pqaiPaRkG9CjxI
 KUuwKTIFUUzHN//F6yur7MJNDDIqNQpQzrtYGWj40pry9NmDxa7/9Nr+2ET0H254CRnX0KaH8
 Hq2flHzvFsR4LFndn6UNBS/Ac4spssBnZ3nRFcjfD8qqSm7peTJSljcPRrdawcvSIJOV/1+M2
 lHfaJVE1CmNu0JOZ4Q9OX/2HU2i8EI3cLOjEnSwSD36A7evnhTlLzWzVDY7yGp2/GpjBw34l3
 xgj1tUVvbOGGN9q0rbTVJSrSLOArTdPGux82Ghk9AnQjvOKpbEjVwWrzeuOmfM1IH2UWH74su
 UcViRybKk5MVr5bq6I+8FUGbrldGjzeU5wTVTTf/7HF2RUN7SB5pBQJeJAntRWSgrcjuhI/7/
 LWawpqdsej+WRZqTDLvUUn/OJI9d5fNkAiTP0Y0HjFE74eUxPRdJs62v/Jegx0p6DzvncWqud
 ztoJjCFeW8AJEdPrS5AZHM/29y6wD7Qyubk0YyjfEPpihZ0ioeO3htdnyjVu6MYchu+hPzsc4
 2jVE9SHyLdzeff7SBcUC5WCQFbdIL3qqmpYWeNztvY+MlBYGcMMwgx6qZXEaMf8PcKOFfit0A
 YE7LazEw25numjQlkk6CroRqD6pu8Te/hrlacdHjOTnir2+pdJDuTigVGr1XWfIYbN8NYqxMq
 smhIQwLq2qlRpyxQU9jCoYmSGbNaiQDYpk5LJtfhUkyb4BWEpTu63ibbrN5cGugiCXEGM+s8G
 pG5h1pXOzMvP4uzyoHiXscv4VuBW35jpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix bluetoothd daemon
 not starting
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bluetoothd does not start since commit 1a8676aa6e4b
("package/bluez5_utils: disable datafiles"):

bluetoothd[4242]: Bluetooth daemon 5.75
bluetoothd[4242]: src/main.c:main() Unable to get on D-Bus

This because --disable-datafiles also disables installing the D-Bus
policy file /etc/dbus-1/system.d/bluetooth.conf that allows bluetoothd
to own the "org.bluez" service name.

The underlying issue that the commit tried to fix is that this package
now installs /etc/bluetooth with mode 555, which causes problems when
buildroot need to remove or patch files.

To fix this, fix the permissions in target/ and staging/ after
installation, but still make sure that the permissions on the rootfs are
555.

There could still be permissions issues if make install fails, because
the fixups will not be applied.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/bluez5_utils/bluez5_utils.mk | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index b1caef5cc5..f5c556a3db 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -22,7 +22,6 @@ BLUEZ5_UTILS_DEPENDENCIES = \
 BLUEZ5_UTILS_CONF_OPTS = \
 	--enable-library \
 	--disable-cups \
-	--disable-datafiles \
 	--disable-manpages \
 	--disable-asan \
 	--disable-lsan \
@@ -194,6 +193,23 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-systemd
 endif
 
+# bluez installs /etc/bluetooth with mode 555 which causes issues
+define BLUEZ5_UTILS_FIX_PERMISSIONS_STAGING
+	chmod 755 $(STAGING_DIR)/etc/bluetooth/
+endef
+BLUEZ5_UTILS_POST_INSTALL_STAGING_HOOKS += \
+	BLUEZ5_UTILS_FIX_PERMISSIONS_STAGING
+
+define BLUEZ5_UTILS_FIX_PERMISSIONS_TARGET
+	chmod 755 $(TARGET_DIR)/etc/bluetooth/
+endef
+BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += \
+	BLUEZ5_UTILS_FIX_PERMISSIONS_TARGET
+
+define BLUEZ5_UTILS_PERMISSIONS
+	/etc/bluetooth/ d 555 0 0 - - - - -
+endef
+
 define BLUEZ5_UTILS_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/bluez5_utils/S40bluetoothd \
 		$(TARGET_DIR)/etc/init.d/S40bluetoothd
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
