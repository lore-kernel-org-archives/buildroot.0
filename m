Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FE5E77182
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 16:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DE2380F43;
	Tue, 10 Dec 2024 16:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnqgXEGaarxe; Tue, 10 Dec 2024 16:23:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47ED680F5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47ED680F5D;
	Tue, 10 Dec 2024 16:23:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13822ED2
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 16:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01D21403B9
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 16:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSgHRSY34iBP for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 16:23:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E3AC403B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E3AC403B5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E3AC403B5
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 16:23:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.124.199]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbRfl-1tsRxD0OoD-00cgkX; Tue, 10
 Dec 2024 17:23:06 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Bis <marcin@bis.org.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2024 17:22:41 +0100
Message-ID: <20241210162243.1541113-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210162243.1541113-1-fiona.klute@gmx.de>
References: <20241210162243.1541113-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:/0/MMVUlu2wESktdIYcQiwYPZpu1V0BqGGxgSlZIEmEdxm7dFDL
 mYtqejQrobXtMdgkej7j1oXwXLZMkxolprxSm3pARRwPsRpUJ0PQYrVBzHL8Qb2fVcvhVwh
 GtHaiY0xNVh9K/BAdQkSARJB7tvUK0h3b1aFzvUsu0Uh3JPAnugblLpYyioRyvVBAUxC8gb
 228vnEZhD2g/20EZYlDxQ==
UI-OutboundReport: notjunk:1;M01:P0:uxrkyuYq54s=;x4xZPA/k+Q4ijZ/LX+H7oxK/1pd
 PS3ctm7aywvd7UTnZrZoXD4F8XYqieI2QFWyanzuyA9KU3HhAju0Hxmx7e+HH5Xzrhl/KoBf8
 E0BNhM9rCcPknNXdCbzpoFdbWbRxyMnKD/wKap3g8iQVg7yoRanDs4HNeHzXwdnD48xX4JH5t
 Qr3mxyT3NXhxZUSVQyyEQn5U2jrFTiXCWJ8zCON3wMOUZus6KkbhTOUmzockTiZTvBNSl6Lrw
 AZHi/bjzgruVE/0i5GpkX0J9HuKzOKHsvmly0jsfhDQjzXZZXRm3LhwBp8/blBIFEfyZyFE2a
 Rj4nr4TbAUsWwCE5+Q+xee4k9ckW2gd0m3NN8+t1Fw7irPEhvSqAoNsseyn6kslRlDoUAV8Dn
 09zbxqIXjDKdYqEisW1m/TaHKcF2Ke6E1oHe9eHrE92w8LbaRl1K0GVnXewzXOqd4eMxBubYR
 YhcHVvzIHXHaIkDSR797PmqbjfROLtZnknfygciPc2so2zQMm6+vAGGCjyCiJZzks/DH8nuOV
 38ovL/EUDcBuMzecKAN4E6Tq4xKu+51jM4JPBmndKCuax7P7HWjcEgSeqLEUw6We9flOOpnc/
 vBV4UdPQvO7/2PmiaofAnrmOothgzESCVSQJPFS1Zpfl2rPSrwFNjduBfCjJ1ATaeCOrQbeCU
 x/Jf9c6SySAX39elU58UBsHrXMdX1HdLE3W6BeBRfBVPkSlI1Bqi84HbPSKBrErFNUlBexrxM
 xUYM2kqTazAHqzDkcWFB5lDAvGvoSanCylRiA2t8yFI1EgC+kK+9xnTpC5QiH0DMB7DNWMYB6
 jpCETfLAwKgmVFsEY9znW0B/U3xaeoIWVRvvWmXPJjRIGUAakmfHagqwA1rc2VhXbDWW65jQN
 E+yug8zbfdM3sM+xNeA64UstefsvhQLwCZfOFTXKnxYO2QSZuB3FT4V8D70+EWfn84+ft02zJ
 bD8MyI9te0ZfVy3ua/TTRUnF7H5c9raZoONIEDe19fcCZNjSTx1Su6VrRe/yKi3v0Lpap2gRH
 SftLvd2HZAkbJIa7IPBaVzt2mPZ5fUaNk3TX7418JXUyHv9V152UzsvEda6huTcTkcYEV/cjV
 jQ0wkGIqVVK5R35eEmtTaVmNKE33Na
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733847786; x=1734452586; i=fiona.klute@gmx.de;
 bh=Cn8Wt7g2jMXWm5wXd43H/a/nXO4vI43wku2z/V93aqE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZqImolNG+p3RaOWrHou7Jg6JuCW/9EAtAdsX4fyHHESX3vzsvmnoy0uwySt2VWfs
 4IE4FJb3SrJLZR+lmB5G79OVekwCj4fvNpFP9pB0acIjDbJTxglhxXHmMinqnlUla
 YSIm90Bx+dgbiNqSogfqEO7ijLYNPiH7joWeFMyub46yzeVp/teIeQLPVyDxKciA8
 JLB/dHGpXSSjQHGHqctgAiQnbyGlhRO3o2xstzdwM+Jgg4in5CgMHsQ3aNgOSVUTO
 uzTCjXjVgup1OwyY+yUgPPcu3dvcoT0n60Eu4bmFZZgME6RZhH/zOmi9MAs5f9y0w
 scpY/poWWoTPV/HErA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ZqImolNG
Subject: [Buildroot] [PATCH v2 3/4] package/bluez5_utils: install datafiles
 with correct permissions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

The datafiles include the dbus policy, without which bluetoothd fails
to start (unless it is provided by other means):

# /usr/libexec/bluetooth/bluetoothd -n
bluetoothd[1011]: Bluetooth daemon 5.78
D-Bus setup failed: Connection ":1.7" is not allowed to own the service "org.bluez" due to security policies in the configuration file
bluetoothd[1011]: src/main.c:main() Unable to get on D-Bus

The installation issue 1a8676aa6e4b0e372a1a744eac6e53c90c03bf0e was
meant to fix is the result of upstream incorrectly installing
/etc/bluetooth with 0555 (strictly read-only) permissions.

Fixes: 1a8676aa6e4b0e372a1a744eac6e53c90c03bf0e

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Path has been accepted upstream, update patch file and upstream URL.

 ...eave-config-files-writable-for-owner.patch | 35 +++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk          |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch

diff --git a/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch b/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch
new file mode 100644
index 0000000000..09ebe5edf1
--- /dev/null
+++ b/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch
@@ -0,0 +1,35 @@
+From b1fd409960001a77cda2a09ecc00147ebd9c3667 Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Mon, 9 Dec 2024 16:40:43 +0100
+Subject: [PATCH BlueZ] build: Leave config files writable for owner
+
+This is needed for builds running as non-root users, so the build
+process and any distribution tools can create/move/delete files in the
+config directory without adjusting permissions separately. Limiting
+writes from the running service needs to be done in the systemd unit
+(already the case) or init script.
+
+See also: https://lore.kernel.org/linux-bluetooth/4d1206df-598b-4a68-8655-74981b62ecca@gmx.de/T/
+Reviewed-by: Bastien Nocera <hadess@hadess.net>
+Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b1fd409960001a77cda2a09ecc00147ebd9c3667
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 297d0774c..29018a91c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -32,7 +32,7 @@ confdir = $(sysconfdir)/bluetooth
+ statedir = $(localstatedir)/lib/bluetooth
+ 
+ bluetoothd-fix-permissions:
+-	install -dm555 $(DESTDIR)$(confdir)
++	install -dm755 $(DESTDIR)$(confdir)
+ 	install -dm700 $(DESTDIR)$(statedir)
+ 
+ if DATAFILES
+-- 
+2.45.2
+
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 7725fb94bf..e3b47e1e80 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -13,6 +13,9 @@ BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 BLUEZ5_UTILS_CPE_ID_VENDOR = bluez
 BLUEZ5_UTILS_CPE_ID_PRODUCT = bluez
+# required because 0002-Leave-config-files-writable-for-owner.patch
+# modifies Makefile.am
+BLUEZ5_UTILS_AUTORECONF = YES
 
 BLUEZ5_UTILS_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BLUEZ5_UTILS_HEADERS),bluez5_utils-headers) \
@@ -22,7 +25,6 @@ BLUEZ5_UTILS_DEPENDENCIES = \
 BLUEZ5_UTILS_CONF_OPTS = \
 	--enable-library \
 	--disable-cups \
-	--disable-datafiles \
 	--disable-manpages \
 	--disable-asan \
 	--disable-lsan \
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
