Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4DFC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 07:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 835FE8208C;
	Wed,  7 Feb 2024 07:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JAZUfU5cirvt; Wed,  7 Feb 2024 07:51:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B4BD81FD4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B4BD81FD4;
	Wed,  7 Feb 2024 07:51:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B16E01BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id 9D47C40A59
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id 72GNfhfhvlVD for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 07:50:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.205.221.233;
 helo=out203-205-221-233.mail.qq.com; envelope-from=hanyuan-z@qq.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50CEB40A48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50CEB40A48
Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com
 [203.205.221.233])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id 50CEB40A48
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 07:50:56 +0000 (UTC)
Received: from localhost.localdomain ([36.101.73.56])
 by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
 id CAB11A20; Wed, 07 Feb 2024 15:50:43 +0800
X-QQ-mid: xmsmtpt1707292243tpu7mnqna
Message-ID: <tencent_8285BE4A2D0B360BFED14B9C383000EA8C09@qq.com>
X-QQ-XMAILINFO: NyTsQ4JOu2J2opr+7k5sHR9DrxhY5BXzNjv4VarDYkqz95j16EQi16nFCuVKOG
 R7goVVjdSnyWc23mzF88FnhF/wmlWP+3n8kpA/3/HVPmkw2KFS9UaidgdriAuNB1P/hmvsbBXsk4
 6mvUVLOlc2TNtFuukTSsK0L5oRZzrmnMNnozImBHHs81CBe30vMPnaYuJUcx/UVJ3x6XqQGKne5D
 XuthaUrE+aoRfqeAsqjtrsoix1k2lKtFuksAgU7Nk0KBWy1X9NQoiRqYln/KsUPg6BU4SZqWdkfG
 M3/FwJlaM56vwI2Jb7mL4WAH10nAhgOl/QpcpZZyECtJ6NAtNNiyuXya9ROoierDOBnSkiUDDYpe
 wuC0csgIwqGBhmcxo0PZ/+hkC+qBtybCD2ckmAJKKKvfM5m1zd8YuirFzzchq716boFOxBETQcMf
 Qcp7/HgvpmRkzLn6H62gzRY9zKH+qRJKnhGu2lHTcYhuaQp3sR2gP5BjuyFJW1DrO+Vi2X+P6kRj
 FtzDp56YaOxKSEr0+fgexP83s3NxvpItBuTxlzZHCctxy4R096ztnszg2/A+1jejms64+r4MKg6I
 5zaeCzWjyOHzOrDxxncabnqTCiVRwz44Xk5yiOi4yz45LO9uNsAhyScvohrQhDH16JU7zMsAuLIo
 VOY672nZ67sBeQkY7KbariIgf14QOpJAeiN0LaEJU8k2ZLf9zUN/E4sv9Ae/R80f3g+voCLfn6X3
 N0FCu/uj7Loub77kSI/RVMmUjdwNl7jhu5vrJuGpz0cgvHw/lGSoArwfjnWKA3j1xs4fzBy+rAIK
 RTKL5Xj1TWhSCY+0k9JTONUWX3oANWTQd6i0Zqsxm2xICjHTeHZKM1Zat16geIGNsf5KfKffTjOe
 /fsiaNAXf/6HnL4Z2lvDlun2UN99mit+LWMzm3zkVGrYqExfZpiz+cSoc1pQVVgtvrc6M7UQFbRg
 n9UYJPw6h4H/Byh1Jl+fJQ+B7mnE44ddkdc6iwQMNJvymnPt5rskCuLObMHxt8cxygh7IujsA=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 15:49:49 +0800
X-OQ-MSGID: <20240207074950.2049-1-hanyuan-z@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1707292245; bh=8Hc7kXs82nyzIxl22NJsPtdmq+svTAlcdQDp0sLmFOg=;
 h=From:To:Cc:Subject:Date;
 b=iWV7O9G6eipPsyK37TbkvWfdPnqPbwxIsZOvWpoRmMT0wjcBvAHTXdFIu83FbeEt6
 Xy69kIUvlHvlBLdshttsW8rRT090flb6yMkCVdyweGm9ZeJfvgEyq2zIozp9JcgXaw
 JfMKIpzoHiisBUXE13+LCamRb/WZZ+uU3roGLHyc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qq.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=iWV7O9G6
Subject: [Buildroot] [PATCH v4 1/3] package/milkv-duo-libraries: new package
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
From: Hanyuan Zhao via buildroot <buildroot@buildroot.org>
Reply-To: Hanyuan Zhao <hanyuan-z@qq.com>
Cc: Emil S <emil.soltys@outlook.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Hanyuan Zhao <hanyuan-z@qq.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds the libraries for RISC-V dev board
milk-v duo, containing board-specific firmware and
hardware tools.

https://github.com/milkv-duo/milkv-duo-buildroot-libraries

Co-authored-by: Emil S <emil.soltys@outlook.com>
Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>

---
Changes v3 -> v4:
  - Update the info in help section
  - Provide more info about ION (camera memory use)

Changes v2 -> v3:
  - Update the desc's repo url

Changes v1 -> v2:
  - Lint the code
  - Refactor the select and depend logic
---
 package/Config.in                             |  1 +
 package/milkv-duo-libraries/Config.in         | 63 +++++++++++++++++++
 .../milkv-duo-libraries.mk                    | 51 +++++++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 package/milkv-duo-libraries/Config.in
 create mode 100644 package/milkv-duo-libraries/milkv-duo-libraries.mk

diff --git a/package/Config.in b/package/Config.in
index 047877c960..322aba90b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -564,6 +564,7 @@ endmenu
 	source "package/memtester/Config.in"
 	source "package/memtool/Config.in"
 	source "package/mhz/Config.in"
+	source "package/milkv-duo-libraries/Config.in"
 	source "package/minicom/Config.in"
 	source "package/msr-tools/Config.in"
 	source "package/nanocom/Config.in"
diff --git a/package/milkv-duo-libraries/Config.in b/package/milkv-duo-libraries/Config.in
new file mode 100644
index 0000000000..047b78fb7b
--- /dev/null
+++ b/package/milkv-duo-libraries/Config.in
@@ -0,0 +1,63 @@
+config BR2_PACKAGE_MILKV_DUO_LIBRARIES
+	bool "milk-v duo libraries"
+	depends on BR2_riscv
+	help
+	  Package providing board-specific firmware and hardware tools
+	  for Milk-V Duo platform.
+
+	  https://github.com/milkv-duo/milkv-duo-buildroot-libraries
+
+if BR2_PACKAGE_MILKV_DUO_LIBRARIES
+
+config BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL
+	bool "milkv-duo-firmware-fsbl"
+	select BR2_PACKAGE_HOST_MTOOLS
+	help
+	  This package is obtained from
+	  https://github.com/milkv-duo/duo-buildroot-sdk,
+	  from which we download the first stage bootloader source and
+	  compile it, generating the ATF bl2.bin. At the mean time, we
+	  will use the fiptool.py in this package to create the binary
+	  file fip.bin to pack the opensbi, u-boot and so on.
+
+	  If you intend to generate the whole sdcard image or the
+	  fip.bin for milk-v duo, you must say Y to this package!
+
+config BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL_64MB
+	bool "64 MiB free ram"
+	default n
+	depends on BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL
+	help
+	  Say Y to this will disable the ION (Camera Algorithm Memory)
+	  in order to have the all 64MiB Free memory.
+
+config BR2_PACKAGE_MILKV_DUO_PINMUX
+	bool "duo-pinmux tool"
+	default n
+	help
+	  Say Y to this will compile the duo-pinmux, which can
+	  get or set function of any Milk-V Duo GPIO Pin. More info at
+
+	  https://milkv.io/docs/duo/application-development/pinmux
+
+config BR2_PACKAGE_MILKV_DUO_FEATURES
+	bool "duo usb features"
+	default n
+	select BR2_PACKAGE_DHCPCD
+	select BR2_PACKAGE_DNSMASQ
+	select BR2_PACKAGE_DROPBEAR
+	select BR2_PACKAGE_LRZSZ
+	select BR2_PACKAGE_HTOP
+	help
+	  Say Y to this will copy the cvitek usb shell scripts to have
+	  the USB features. The role could be configured at
+
+	  /etc/milkv-duo.conf
+
+	  Supported usb functions are rndis, host and mass-storage.
+	  By default Duo has the LED blinking. It could be configured
+	  in that conf file as well. Say Y to this will also select
+	  some packages automatically, to have the same experience
+	  with the official release.
+
+endif
diff --git a/package/milkv-duo-libraries/milkv-duo-libraries.mk b/package/milkv-duo-libraries/milkv-duo-libraries.mk
new file mode 100644
index 0000000000..a5cf40a764
--- /dev/null
+++ b/package/milkv-duo-libraries/milkv-duo-libraries.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# milkv-duo-libraries
+#
+################################################################################
+
+MILKV_DUO_LIBRARIES_VERSION = f359994bd497f942bb67734280d81f6640c7c168
+MILKV_DUO_LIBRARIES_SITE = $(call github,milkv-duo,milkv-duo-buildroot-libraries,$(MILKV_DUO_LIBRARIES_VERSION))
+MILKV_DUO_LIBRARIES_INSTALL_STAGING = YES
+MILKV_DUO_LIBRARIES_DEPENDENCIES = host-python3 host-mtools
+MILKV_DUO_LIBRARIES_FSBL_64MB = ION
+
+ifeq ($(BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL_64MB),y)
+MILKV_DUO_LIBRARIES_FSBL_64MB = 64MB
+endif
+
+define MILKV_DUO_LIBRARIES_BUILD_CMDS
+	if [ $(BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL) = y ]; then \
+		$(MAKE) -C $(@D)/firmware \
+		ARCH=riscv BOOT_CPU=riscv CHIP_ARCH=cv180x \
+		PROJECT_FULLNAME=cv1800b_milkv_duo_sd \
+		CROSS_COMPILE=$(TARGET_CROSS) \
+		FREE_RAM_SIZE=$(MILKV_DUO_LIBRARIES_FSBL_64MB) \
+		bl2; \
+	fi
+
+	if [ $(BR2_PACKAGE_MILKV_DUO_PINMUX) = y ]; then \
+		$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		-I $(@D)/pinmux/include $(@D)/pinmux/src/*.c -o $(@D)/pinmux/duo-pinmux; \
+	fi
+endef
+
+define MILKV_DUO_LIBRARIES_INSTALL_STAGING_CMDS
+	if [ $(BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL) = y ]; then \
+		$(INSTALL) -D -m 0755 $(@D)/firmware/build/cv180x/bl2.bin $(BINARIES_DIR)/bl2.bin; \
+		$(INSTALL) -D -m 0755 $(@D)/firmware/plat/cv180x/chip_conf.bin $(BINARIES_DIR)/chip_conf.bin; \
+		$(INSTALL) -D -m 0755 $(@D)/firmware/plat/cv180x/fiptool.py $(BINARIES_DIR)/fiptool.py; \
+		$(INSTALL) -D -m 0644 $(@D)/firmware/plat/cv180x/multi.its $(BINARIES_DIR)/multi.its; \
+		$(INSTALL) -D -m 0755 $(@D)/firmware/test/cv181x/ddr_param.bin $(BINARIES_DIR)/ddr_param.bin; \
+	fi
+
+	if [ $(BR2_PACKAGE_MILKV_DUO_PINMUX) = y ]; then \
+		$(INSTALL) -D -m 0755 $(@D)/pinmux/duo-pinmux $(TARGET_DIR)/usr/bin/; \
+	fi
+
+	if [ $(BR2_PACKAGE_MILKV_DUO_FEATURES) = y ]; then \
+		cp $(@D)/overlay/* -r $(TARGET_DIR); \
+	fi
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
