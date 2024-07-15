Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E556FC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 16:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C91F403ED;
	Mon, 15 Jul 2024 16:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMLqXalbOWVM; Mon, 15 Jul 2024 16:10:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1448C403EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1448C403EF;
	Mon, 15 Jul 2024 16:10:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10A421BF401
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 16:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B06E400D6
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 16:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXmyZRTDncEG for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 16:10:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.selirafood.com; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7777B40018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7777B40018
Received: from mail.selirafood.com (mail.selirafood.com [117.53.144.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7777B40018
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 16:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.selirafood.com (Postfix) with ESMTP id 66CD926649;
 Mon, 15 Jul 2024 23:09:58 +0700 (WIB)
Received: from localhost.localdomain (unknown [192.168.100.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.selirafood.com (Postfix) with ESMTPSA id 282C62663E;
 Mon, 15 Jul 2024 23:09:58 +0700 (WIB)
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 23:09:37 +0700
Message-ID: <20240715160941.90353-2-foss@athaariq.my.id>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715160941.90353-1-foss@athaariq.my.id>
References: <20240715160941.90353-1-foss@athaariq.my.id>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=athaariq.my.id; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received; s=dkim20240121; t=1721059798; x=1722269399; bh=cRMa3k
 epaMifq36epJv+PQv9cJ4pyUCe3FCfxylAOnc=; b=kZQVilzv9aBSX3XrSyCJux
 XWk9eWuW0qbFqya/gPZCcuRt8dOX/iMnvn/gr3V+/tyJaHXN5+ZJCxli5FXD3dVF
 TxtB/0+h0wVB8mAAKeE2v5G+akT6nW/8HC3rh/61/dsgc0by1fjkGiA7SdR9+puC
 +TjT2/ZuqOtV1YaC6eyrTbrPJMm/oZ5bJpbR7YHFIxn+3WJ3bD+OwZhBNbPoMCSC
 bVXPjxhEuIIhvYcf8FxIGfFAwTBaD1NvAd0xiHgosWliu0THiJD54HUa/SxUyb3e
 f1VJOrnO/nQBhCU4RzxB1oFwwisu9t8qSR8hX+NzQU/OZ/CzvM2BtheL10Umu1MA
 ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=athaariq.my.id header.i=@athaariq.my.id
 header.a=rsa-sha256 header.s=dkim20240121 header.b=kZQVilzv
X-Mailman-Original-Authentication-Results: mail.selirafood.com (amavisd-new); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=athaariq.my.id
Subject: [Buildroot] [PATCH v5 2/3] package/raspberrypi-usbboot: bump commit
 to cd6896c
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
Cc: Athaariq Ardhiansyah <foss@athaariq.my.id>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit explicitly mentioned for latest EEPROM firmware version
(1.20240605) support. Even though the current DTB firmware version is
1.20240529, there is no known issue for earlier DTB version according to
its issue tracker and my last personal experience.

Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>

---
Changes v1 -> v2:
  - Fix missing description due to terminal issue
  - Use the latest commit instead of the latest tag

Changes v2 -> v3:
  - Update the commit title
  - Add more explanation on commit description

Changes v4 -> v5:
  - Re-bump from 4a3d311 to cd6896c
  - Fixed my shameful mistake on the patch, sorry Fiona and other
    contributors :(
---
 ...1-Makefile-allow-passing-CFLAGS-LDFLAGS.patch | 16 +++++++++-------
 .../raspberrypi-usbboot/raspberrypi-usbboot.hash |  2 +-
 .../raspberrypi-usbboot/raspberrypi-usbboot.mk   |  2 +-
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
index 29a9311651..7684eb476a 100644
--- a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
+++ b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
@@ -12,20 +12,22 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 [Rebased on 20221215-105525-0-g1afa26c5]
 Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
+[Rebased on cd6896c]
+Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index dc78cfe..c9d4910 100755
+index cd6896c..076ae43 100755
 --- a/Makefile
 +++ b/Makefile
-@@ -1,7 +1,7 @@
- PKG_VER=$(shell grep rpiboot debian/changelog | head -n1 | sed 's/.*(\(.*\)).*/\1/g')
- GIT_VER=$(shell git rev-parse HEAD 2>/dev/null | cut -c1-8 || echo "")
- rpiboot: main.c msd/bootcode.h msd/start.h msd/bootcode4.h msd/start4.h
--	$(CC) -Wall -Wextra -g -o $@ $< `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\""
-+	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ $< `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" $(LDFLAGS)
+@@ -3,7 +3,7 @@ GIT_VER=$(shell git rev-parse HEAD 2>/dev/null | cut -c1-8 || echo "")
+ INSTALL_PREFIX?=/usr
+ 
+ rpiboot: main.c bootfiles.c msd/bootcode.h msd/start.h msd/bootcode4.h msd/start4.h
+-	$(CC) -Wall -Wextra -g -o $@ main.c bootfiles.c `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" -DINSTALL_PREFIX=\"$(INSTALL_PREFIX)\"
++	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ main.c bootfiles.c `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" -DINSTALL_PREFIX=\"$(INSTALL_PREFIX)\" $(LDFLAGS)
  
  %.h: %.bin ./bin2c
  	./bin2c $< $@
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
index 830ead8243..e99df15b4a 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2f02dbe9a88e9dfad5f05e513e1f30afd47b1575820f7c3b09665dfefc45bbaa  raspberrypi-usbboot-20221215-105525.tar.gz
+sha256  fe8d2e1ef6da5355779c12a9371d3d4d4fe627b817ba949050e27bf2f525f5a3  raspberrypi-usbboot-cd6896cbafabad02fef44c815579a91dccd8e04e.tar.gz
 
 # License files
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
index 24a1f6d906..a85ac81f64 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RASPBERRYPI_USBBOOT_VERSION = 20221215-105525
+RASPBERRYPI_USBBOOT_VERSION = cd6896cbafabad02fef44c815579a91dccd8e04e
 RASPBERRYPI_USBBOOT_SITE = \
 	$(call github,raspberrypi,usbboot,$(RASPBERRYPI_USBBOOT_VERSION))
 RASPBERRYPI_USBBOOT_LICENSE = Apache-2.0
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
