Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95146C7618A
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 12:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B7F840364;
	Mon, 20 Mar 2023 12:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B7F840364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G21cbQDOy9_p; Mon, 20 Mar 2023 12:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43B544053C;
	Mon, 20 Mar 2023 12:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43B544053C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 224811BF3FC
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 12:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE3CA41606
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 12:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE3CA41606
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jdv8huCHsthI for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 12:06:41 +0000 (UTC)
X-Greylist: delayed 00:05:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F9F2415FD
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F9F2415FD
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 12:06:40 +0000 (UTC)
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from wslxew169.fritz.box ([46.114.207.194]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MVrft-1q5yEk04t3-00RY9L; Mon, 20
 Mar 2023 13:01:35 +0100
From: Jens Kleintje <scooby22@web.de>
To: buildroot@buildroot.org
Date: Mon, 20 Mar 2023 12:55:09 +0100
Message-Id: <20230320115508.1249295-1-scooby22@web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:0mMU2pGV6HVb18BRnNYoiKMFpoDA1E+U7YSpN8VxhaXLBpJHanN
 cyYchd5GgoTt1uCJONYNNtYQQOyxncB5CoP4v36E6Uo3on8zlZmqpbmn9GsWql0H5dVF7Dg
 q2U6uD68JOk451OYZg2cylVxboFz0TH7J9rlIECq8dOqCOiW1cqrNIDay8M10TH5j2Mr/Ix
 axsCumoV6VQsbfcym0rMg==
UI-OutboundReport: notjunk:1;M01:P0:zgJ/66iBoU8=;Y2zR/SQy7UXm6kSBnXnl0k9UeKE
 nj2+uK2wmakWviHABJuAX7uj1yPGkq32iSc9WLMYpKnfT/v01QsaqakzAyZV7KZeIJl+ILi3T
 xYP3vfANdbqylMWRNSlICikcFVxQ31G9lsqwx23JblsJ0H8xHRPkbhCKWYabq1T+f/NjhqkKz
 H01ZpT4FntLUr/pZBGyQ7QZHZ6GdnUlxdhDxyG6M/O665Sw9wEnkrbJPK8I7+4k+dQF1qXNDw
 0xIuBikuOCoNjpoXjT41AmNjv1xyyF66GXjL5spMiEdOwvRoDzQdnrjgfM23JmzuQnX5u5TzN
 aeW6uXOZKBi7iEhkoz2cKi4/swgpnUnuBfmdNZHd0oHeOvpXQACOMuPL2+4dB5/yHz4RsqAmA
 nUJJ+xff4algOur5qXrtPno1Q7lhcMzmfLoJITekwlqRXoIeF10E7kiIZD5iAO7E6/Gbtkxrb
 s3bR0tJC0GEvCuzP1gX8C+0BWF4MHHpWvKRRjp+6GHCHTfXMcrmGPBbjBzMMtXQ2bENTGSLCC
 frTDugOo1BSft2HfxgPVfCbaxOf3RSndQgq44Rnx7MvEAXsSoql8MJdAw3UGRgiD/PwwkkieD
 aVgUGWPqU6XzpEgsDk7slxpW+nXcTl8tNoeSIfGWMj0iH0EYW2NcRSN7Uvx3IoGD4YtxdxdoT
 dI6w6Ic8SPGr4CAIh2xVxZI2yYLjk4uppO8zLbhU8ueAvS/sLZKdz39yC7FcxaACcoaJ5F96O
 fczbQ26ybdCIWS/9U202S+IJDLmYb+opuw9DXxBbbYoLzjoQ1li6MUZa+BnKHo7wsvdVDEOoN
 f7mqv0mdwGYAGXtMlhyn+arlxUiyCRNPsh3iXkylX7NVu32AB4jOqVdWLp2iVJgERCy9Q3PEk
 8rt5TT+TMk+RDN5ZHeFqBIQeeubwnWjXaN3rAhV1HOzeEaoTjRf6Oqit1lJcSq7hZC0qko5Sn
 9+Jm4uW/ZaaOidWIl/adJ21h+nA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=s29768273; 
 t=1679313999; i=scooby22@web.de;
 bh=N4TothIPPv6rMcjmoT6dd9/6kkhCxb4yfnr4SixVS6g=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Y1foqJ4GY70Jx54odB62uvQ1IZauQ0mk61KNK+Mxei3yngkFAT0sH2iuQebAvZUSW
 1ITx8E70/Gakxojf+ELc9DZIPTL+Dvdtgb0OCXgYTLPxTEfEUBJDUv3mQ9OOSKeXt5
 T30L40p+50aFA8p5hiQCjUSmVpPAj2K4vP6Df55m8g4lo/lPIaS7B/c6whjgmbRUJK
 MWYLpsKdcIP0+lrD+LAZXLPAFf/cuDLD3rnOqmUSqCxrROr35LFFMKZ+KGAlA9Otgf
 QcKs9rB/xRGf/v8g1d+Arhd9lpDbQu3jswqjnWnh45VhwxcushehweHtNFAbG9jNoL
 ATK7gC8GsbPLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=web.de header.i=scooby22@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=Y1foqJ4G
Subject: [Buildroot] [Patch 1/1] esp-hosted: new package
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
Cc: scooby22@web.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package provides a kernel driver for esp32 as wifi module.
The project https://github.com/espressif/esp-hosted/tree/release/ng-v1.0.2.
 configures the esp32 as a wifi module. The host and the esp32 can be
connected via sd bus or spi. This package supports only the host sd
connection.
On the esp the firmware from
https://github.com/espressif/esp-hosted/releases/download/release%2Fng-v1.0.2/ESP-Hosted-NG_release_v1.0.2.tgz
needs to be flashed.

Signed-off-by: Jens Kleintje <scooby22@web.de>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/esp-hosted/Config.in       |  8 ++++++++
 package/esp-hosted/esp-hosted.hash |  2 ++
 package/esp-hosted/esp-hosted.mk   | 17 +++++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/esp-hosted/Config.in
 create mode 100644 package/esp-hosted/esp-hosted.hash
 create mode 100644 package/esp-hosted/esp-hosted.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b6d288c54f..2d2559242c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1483,6 +1483,7 @@ F:	package/openfpgaloader/

 N:	Jens Kleintje <scooby22@web.de>
 F:	package/gcnano-binaries/
+F:	package/esp-hosted/

 N:	Jens Rosenboom <j.rosenboom@x-ion.de>
 F:	package/sl/
diff --git a/package/Config.in b/package/Config.in
index 0f8dab3e71..89a6dacbc1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -494,6 +494,7 @@ endmenu
 	source "package/edid-decode/Config.in"
 	source "package/edk2-non-osi/Config.in"
 	source "package/edk2-platforms/Config.in"
+	source "package/esp-hosted/Config.in"
 	source "package/eudev/Config.in"
 	source "package/ev3dev-linux-drivers/Config.in"
 	source "package/evemu/Config.in"
diff --git a/package/esp-hosted/Config.in b/package/esp-hosted/Config.in
new file mode 100644
index 0000000000..b1f44aa956
--- /dev/null
+++ b/package/esp-hosted/Config.in
@@ -0,0 +1,8 @@
+comment "esp-hosted needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_ESP_HOSTED
+	bool "esp-hosted"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Wireless driver for esp32
diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
new file mode 100644
index 0000000000..6be9337159
--- /dev/null
+++ b/package/esp-hosted/esp-hosted.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 5538d6aa0f322801ddd8428d131f485e7e490be871d9cdf650afb894bb485905 esp-hosted-ng-v1.0.2.tar.gz
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
new file mode 100644
index 0000000000..53e5d3bcc0
--- /dev/null
+++ b/package/esp-hosted/esp-hosted.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# esp-hosted
+#
+################################################################################
+
+ESP_HOSTED_VERSION = ng-v1.0.2
+ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,refs/tags/release/$(ESP_HOSTED_VERSION))
+ESP_HOSTED_DEPENDENCIES = linux
+ESP_HOSTED_MODULE_SUBDIRS = esp_hosted_ng/host
+
+ESP_HOSTED_MODULE_MAKE_OPTS = KERNEL=$(LINUX_DIR) \
+			      CROSS_COMPILE=$(TARGET_CROSS) \
+			      MODULE_NAME=esp32_sdio
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
--
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
