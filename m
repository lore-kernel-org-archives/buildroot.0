Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB0FC43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 07:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21F2C613E0;
	Tue,  7 Jun 2022 07:29:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PAD4UGboyzee; Tue,  7 Jun 2022 07:29:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6394A613DC;
	Tue,  7 Jun 2022 07:29:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 35B5F1BF2C1
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 07:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20D2D41C02
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 07:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lem5JDpFPVU4 for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 07:29:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D863641680
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 07:29:41 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id q76so9395327iod.8
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=00PWmn+vANRojH3SjoSaEkiMQgL16pyGYJEG2Tk1MyQ=;
 b=r1bFHFc+x3NJi07vlM0BRpVtQ4znvVALMWr00TTwuDKTqL+3K9N9mDmOMWd3BdJiAO
 gNcJcplRJ07XhjY7wZ6b2bS56/1NM7yOmemUCVdFXlApi+RIxE92hFaVYdqgaOomZ/AA
 Iw4M9m6RNHBvJ1czi7aD3qnoPaEu/QmF13deE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=00PWmn+vANRojH3SjoSaEkiMQgL16pyGYJEG2Tk1MyQ=;
 b=6JogZ3Wi/8+J1uO1VAqcJukNakrwC8Rs5LpUadDPOwUSKlQQFSrPPS75TvfxDBqA30
 47ripfmcCs3ZXWDx7pVFprMzcb1kWYPkbpQAEWn8WtRI7cjrG6umpYl2mILdAkhGdd6m
 9UDjiCgRkOnRbq4vpOEUAxA7p2dwtQNtC8cmmtJG8JKlKHIvmkYGsLvSmiteFfAR5L0T
 JtQFG7RPKhEvihkAWc7WQqs8m6wiSQR56G69DohXOt3o1YNSbsF2Ag/pf9s1R4Ea8HgH
 J3YWKaynN/C6Jap+IfMfVsFUt6mAEmeoIBKubsn+ai3plnQ9BR6ekhxQq/Fre3IXEbnF
 bOOg==
X-Gm-Message-State: AOAM533zCBqBYOhwrO16ssPPzPaToYOjQl+dgZ40rXS9F1giCzoeQaXR
 rsWHT1QXS8pscw2ofaKDnV7KXBz0tFe9mQ==
X-Google-Smtp-Source: ABdhPJz0MaCDl7yZxNHgJctYKpupEuvYWB0XraBoJWC15Br5IiD57QMjDqYAlnOT90QJ03ZzqO9uPg==
X-Received: by 2002:a02:84ac:0:b0:32b:a11b:4586 with SMTP id
 f41-20020a0284ac000000b0032ba11b4586mr14827328jai.231.1654586980522; 
 Tue, 07 Jun 2022 00:29:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-80-116-90-174.retail.telecomitalia.it. [80.116.90.174])
 by smtp.gmail.com with ESMTPSA id
 cx4-20020a056638490400b0033126faae3asm6406075jab.116.2022.06.07.00.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 00:29:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 09:28:50 +0200
Message-Id: <20220607072852.1007185-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220607072852.1007185-1-dario.binacchi@amarulasolutions.com>
References: <20220607072852.1007185-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/uuu: new package
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
Cc: michael@amarulasolutions.com,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Samuel Martin <s.martin49@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 dario.binacchi@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UUU (Universal Update Utility) is a Freescale/NXP I.MX Chip image deploy
tools. It is an evolution of MFGTools (aka MFGTools v3). For this and
for backward compatibility we have created a new package instead of
updating the mfgtools package.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                 |  3 +++
 package/Config.in.host     |  1 +
 package/uuu/Config.in.host | 18 ++++++++++++++++++
 package/uuu/readme.txt     | 13 +++++++++++++
 package/uuu/uuu.hash       |  4 ++++
 package/uuu/uuu.mk         | 19 +++++++++++++++++++
 6 files changed, 58 insertions(+)
 create mode 100644 package/uuu/Config.in.host
 create mode 100644 package/uuu/readme.txt
 create mode 100644 package/uuu/uuu.hash
 create mode 100644 package/uuu/uuu.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index aa18de83bcb6..60fa58ab35d6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -650,6 +650,9 @@ F:	package/lua-cjson/
 F:	package/luaexpat/
 F:	package/xinetd/
 
+N:	Dario Binacchi <dario.binacchi@amarula.solutions.com>
+F:	package/uuu/
+
 N:	Dario Binacchi <dariobin@libero.it>
 F:	package/davinci-bootcount/
 F:	package/libmnl/
diff --git a/package/Config.in.host b/package/Config.in.host
index cd1c34b5a3d9..d00547d324a5 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -96,6 +96,7 @@ menu "Host utilities"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/utp_com/Config.in.host"
+	source "package/uuu/Config.in.host"
 	source "package/vboot-utils/Config.in.host"
 	source "package/xorriso/Config.in.host"
 	source "package/zip/Config.in.host"
diff --git a/package/uuu/Config.in.host b/package/uuu/Config.in.host
new file mode 100644
index 000000000000..017e37517d0e
--- /dev/null
+++ b/package/uuu/Config.in.host
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_HOST_UUU
+	bool "host uuu"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
+	help
+	  UUU (Universal Update Utility) is Freescale/NXP I.MX Chip
+	  image deploy tool. UUU is an evolution of MFGTools
+	  (aka MFGTools v3).
+
+	  To be able to run uuu without root privileges, execute the
+	  following steps:
+
+            sudo sh -c "uuu -udev >> /etc/udev/rules.d/70-uuu.rules"
+            sudo udevadm control --reload
+
+	  https://github.com/NXPmicro/mfgtools
+
+comment "host uuu needs a toolchain w/ host gcc >= 4.9"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/uuu/readme.txt b/package/uuu/readme.txt
new file mode 100644
index 000000000000..80dd90b93384
--- /dev/null
+++ b/package/uuu/readme.txt
@@ -0,0 +1,13 @@
+uuu Howto
+=========
+
+Running uuu without root privileges
+-----------------------------------
+
+Accessing USB devices on Linux requires root privileges by default.
+To be able to run uuu without root priviles, execute the following
+steps:
+
+  sudo sh -c "uuu -udev >> /etc/udev/rules.d/70-uuu.rules"
+  sudo udevadm control --reload
+
diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
new file mode 100644
index 000000000000..10efff0337a1
--- /dev/null
+++ b/package/uuu/uuu.hash
@@ -0,0 +1,4 @@
+# locally computed
+sha256  4fda8db488c4d3a98c2480c47b41907ad26b714c6400dd0a202baab4c17b0a9b  uuu-1.4.193.tar.gz
+sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
+sha256  77b90738ae98b7958d34d9f96caf2671210a133427f8f6b784914b54f406c29b  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
new file mode 100644
index 000000000000..550c42af8d86
--- /dev/null
+++ b/package/uuu/uuu.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# uuu
+#
+################################################################################
+
+UUU_VERSION = 1.4.193
+UUU_SITE = $(call github,NXPmicro,mfgtools,uuu_$(UUU_VERSION))
+UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
+UUU_LICENSE_FILES = LICENSE README.md
+HOST_UUU_DEPENDENCIES = host-bzip2 host-zlib host-libusb
+
+define SET_VERSION
+	echo $(UUU_VERSION) > $(@D)/.tarball-version
+endef
+
+HOST_UUU_POST_EXTRACT_HOOKS += SET_VERSION
+
+$(eval $(host-cmake-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
