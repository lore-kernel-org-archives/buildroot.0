Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F91CD3422
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 19:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C779A40303;
	Sat, 31 Aug 2024 19:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngv5lv6Op1fy; Sat, 31 Aug 2024 19:01:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB5AF404A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB5AF404A3;
	Sat, 31 Aug 2024 19:01:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4090C1BF316
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 19:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DE6181432
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 19:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tws3vgX3BIYd for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 19:01:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 018E981440
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 018E981440
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 018E981440
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 19:01:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.123.38]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnJlc-1sLHUO0t7M-00p3bd; Sat, 31
 Aug 2024 21:01:48 +0200
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 21:01:24 +0200
Message-ID: <20240831190126.366600-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240831190126.366600-1-fiona.klute@gmx.de>
References: <20240831190126.366600-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:7d3a1VOBbaaJDajbu437TviKeV7SVXt96xmAKzjIoLeOaFfNTJo
 xZfiIpaZTiyq0zBE56xfhQFr2Lyxr2u7wd/TE+ihLXV7oFhvzHGKWHHA6pvI0BuU4edps9r
 l8ymywUHea3UuM8Xhq51IDLXYJXl6vAExZPQD143S5pzCyXs/aauM4IcKX2fs2i5f3x6dnS
 y42lj+lDkdzMWr6cHQf6g==
UI-OutboundReport: notjunk:1;M01:P0:wgTGZ5zrpS0=;237LSRrW/7c5VJ9TKp7RrTQHgjp
 5xnwp14u3/Kujcazq9qvUBB6K2MEeiYQ+ELncoDmB3Bk95V/GZqhRHVd2AmyXRa4IUutflh8Q
 w0N1n6OMm4y+jRhIoOMpZm5UOV9s8OvkjgeFgHLn+FHL8PWf9y1WXsa2udoeRUe79QVNiR0xj
 5yosLYevWcgcnoMhbR0zqQK2UpO/76FeZB5mXcnX3xQfdN6/H5roe4iptprb5v7IlY+fIHxvQ
 B3TMUdO9NcKKmoT7zQkqjai0tQxvYkSW3NUAsa2f5Wnvg0NLgvrK6m24fANqHcfz7wdBSs5As
 QU45LBgNsM61ryQp5nPwi5ft+q6gFB/M/V/aHsvmB8PQpCiotEQ+lfwb1DC+XuP9m77jGi3jx
 mjMBGH+Z6N9f25iFoFeYJmgD7L912IpOGcIj4RoJQhnTWqu8kP43f7omlP1v2pes5FeVd3PTa
 /8D70KvhL9YpvluBCegFMB6APzGJB/SW1q2uAtXpkpg5SC8zXsnSCJaBzdT9OWZ49BMed5bXF
 NC1YCkp9cynW9xZRCjoUe9J1AtRfgs2ak2TlrwbMrABE5n1Af1DVyCEMujqtgPei23A5SZbht
 uQ76hUHOcZC/s/+QQ4nA6xupRNssgQHnS/Z5xPpfbnR0ko8wZnSwW/opDt8vI3vxvjjwnYBjc
 LrMF6Z6BRgRIUUSxl+DuplHPbAowU8rO+Oeav8IwAXMSLx/t9nkifEYp5RoGW2RziSIj5bR+E
 WQ7Z8jaU0+hexz2Lq0RwppW1utAwutkiPlS8VGxVZ/PgfRg0YPwc58ypkVJYOtSO5FxjurD0k
 MuP7wJ5dSMd7Dc4YJ8k9vi4Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725130908; x=1725735708; i=fiona.klute@gmx.de;
 bh=QXb6b12orPp4U6mauNspAWXupVxfISsMY29WjjS4o4I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=iC9U7VUdhMmLjviFjUegFs6dR8KAdYeNMZ0cEnJDqHTl3Sx5MzoqlLjDLbbyBggi
 yh8NEwOsmV+l3cKlDqXlflxaSJf/dO6JB1BQgum78F0lGIujGyDgJTGGALJz/tvnf
 jxCni9+T/vr9penK6dXHNt3hkz8zXtKHAMJBxbaXRUB1nqVXTZdsUqfAm+gMZrBT9
 /eLjWYZekEKjJap7I9mdhO/6ZKA4Di4oZrlh/DwC3+YuYFcf2bojBMRch7nlTso6H
 /rfVGDol6l7VxQIMoTxCLN9UerTGj1Y8smNWH0nQflQ2tZ8pNp5SNMv5Oh51t3l76
 pMWFkJMxu6KzUjSaMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=iC9U7VUd
Subject: [Buildroot] [PATCH next v2 1/3] board/raspberrypi: Support boot.scr
 for U-Boot
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 =?UTF-8?q?Jos=C3=A9=20Mendes?= <jp.baltazar.mendes@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

If using U-Boot as "kernel" for the raspberrypi bootloader, include
boot.scr in the boot partition if it exists.

To use this, use BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE to set a config
file that uses U-Boot, and enable building a boot script in the U-Boot
host tool settings.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/raspberrypi/post-image.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 9b9eac972b..e4611d05dd 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -19,6 +19,12 @@ if [ ! -e "${GENIMAGE_CFG}" ]; then
 	KERNEL=$(sed -n 's/^kernel=//p' "${BINARIES_DIR}/rpi-firmware/config.txt")
 	FILES+=( "${KERNEL}" )

+	# If config.txt calls for running U-Boot, include the boot
+	# script if any.
+	if [ "${KERNEL}" = "u-boot.bin" ] && [ -e "${BINARIES_DIR}/boot.scr" ]; then
+		FILES+=( "boot.scr" )
+	fi
+
 	BOOT_FILES=$(printf '\\t\\t\\t"%s",\\n' "${FILES[@]}")
 	sed "s|#BOOT_FILES#|${BOOT_FILES}|" "${BOARD_DIR}/genimage.cfg.in" \
 		> "${GENIMAGE_CFG}"
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
