Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C07C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 07:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5928F8375B;
	Wed,  7 Feb 2024 07:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WNy9CUq2_KLB; Wed,  7 Feb 2024 07:57:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F258838D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F258838D3;
	Wed,  7 Feb 2024 07:57:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 966981BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id 81C4A40A48
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id BQ1vLMq4E6Bl for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 07:57:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.62.57.252;
 helo=out162-62-57-252.mail.qq.com; envelope-from=hanyuan-z@qq.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50605400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50605400B9
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com
 [162.62.57.252])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id 50605400B9
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 07:57:27 +0000 (UTC)
Received: from localhost.localdomain ([36.101.73.56])
 by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
 id CAB11A20; Wed, 07 Feb 2024 15:50:43 +0800
X-QQ-mid: xmsmtpt1707292244t8ykojoer
Message-ID: <tencent_09FFA925CC1CAC0076C6605FE496419B1308@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85NoZgDWhwFckWsOCg20etwkHenhv12t2HcOWCww5OntEPW1dCYM7I
 s72wzOE3IflX5dj7EeLcWX0X+wBDRxn8LujP6w6+QERTDjE/nNtxoK5N3e5QnppPLi2g6efJedKW
 h93TtU9BrSW0oQ9lWqhzuhgVbE4WiY63eqNgnR6lATh5UU0DS3ac0s8faoFgHh5DJa6gua1EEHPS
 iAgtjwcHudoPtfyDIeiVHuO5z6OvrpoqhsYNJC9vwspl2CRi/BBNXTEsVu2jur3M01CAF+KnMO9l
 TMn0bZC728PpHZusUA38igYR6qccWk1iRZN61ZQbx4w5salmj6ey+I885U4UgacdPs2uIOVxQHFf
 rzVwB/Rm0CajNRLdeb40Aut8M7lSF7BFHT1hBZM5Ob43v8sCSZ4lKym1UCs/QjhDW4g9Xvk8GAHh
 Xw523NAID6SinhqjB56N4day0RBrSkOQamB8vz282gLL7gGKXNVM1HDKqqDqQlk86iL33okPK2Jm
 VCrrZYYiyoRLv7zwdlkKCRd14CzLsR2sYy9j70kKL0S2imBNufTTDdTHg3FmGTbMceL0Jj3DcNbZ
 EvV5UHeJ+qarvvUmkDa1MhfeYlP58BueXVDRRZnufNPrYYN7PIvUkkIDcMqz7Lbp0muXQ9RpkYSZ
 6+7iPwijaiUyz8IbI0Neb1xUUpWLwtNUWAhpkSWp5sGEMvfHPDjWCefIV/AicQC87pN4vl3DoJmV
 uM0bmwNG9Gonnqt3wpcDOoT7D1IBXzK8xEz09CFXa4mcdSysDeDcl+/KM1U+2mU8Wf6NlM9ZVtBa
 xk/l0ZZP4UeL4ZQaiP3Hf8VdcXfnEbefUk/WTUK0FRbMi+XlUe+xY02n9NEougI2Hwk5Wiwgsip5
 gomklx53PfDO77I95iuJNfBjyDPUj0D0Or746DeI9VHRLesgKjfkaI0qCKgyGoYruKPDcpUhsv53
 ifHEVqY2iIZLT4betrqeISp/LoWVg22itORpWQXCpC9el90Zt6sXn2B/LKTwIne3QCedPjSQz4GI
 oDsBqsEg==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 15:49:51 +0800
X-OQ-MSGID: <20240207074950.2049-2-hanyuan-z@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207074950.2049-1-hanyuan-z@qq.com>
References: <20240207074950.2049-1-hanyuan-z@qq.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1707292644; bh=Aw+SzeFb0xkRXOCYH7j8qaUVLbIitkRUzCxTqU5kQRM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ZyhfqDAXfq2ape+t6TGrpKdZKOalnTrN8rR/tZmDrtg5IslxGGQvZaFgQKfwZnNxa
 vBiLgH3mdyvTucLe99tZSqGUlLJ+/WhgJGdR9GfsAZLJRzaBWteP+jkJolmUmN1kOd
 tnFv79jZvrPnzdfFoyUV1SNzjdw5amFhFLMqJlWQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qq.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=ZyhfqDAX
Subject: [Buildroot] [PATCH v4 2/3] package/milkv-duo-smallcore-freertos:
 new package
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

This commit adds the freertos support for the
RISC-V dev board milk-v duo.

https://github.com/milkv-duo/milkv-duo-smallcore-freertos

Co-authored-by: Emil S <emil.soltys@outlook.com>
Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>

---
Changes v3 -> v4:
  - Move the make recipes to the repo
  - Bump the version to latest

Changes v2 -> v3:
  - No Changes

Changes v1 -> v2:
  - Set the depends and select logic
  - Add host tools
---
 package/Config.in                             |  1 +
 .../milkv-duo-smallcore-freertos/Config.in    | 21 ++++++++++++++++++
 .../milkv-duo-smallcore-freertos.mk           | 22 +++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 package/milkv-duo-smallcore-freertos/Config.in
 create mode 100644 package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk

diff --git a/package/Config.in b/package/Config.in
index 322aba90b8..7be3316f71 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -565,6 +565,7 @@ endmenu
 	source "package/memtool/Config.in"
 	source "package/mhz/Config.in"
 	source "package/milkv-duo-libraries/Config.in"
+	source "package/milkv-duo-smallcore-freertos/Config.in"
 	source "package/minicom/Config.in"
 	source "package/msr-tools/Config.in"
 	source "package/nanocom/Config.in"
diff --git a/package/milkv-duo-smallcore-freertos/Config.in b/package/milkv-duo-smallcore-freertos/Config.in
new file mode 100644
index 0000000000..8503932461
--- /dev/null
+++ b/package/milkv-duo-smallcore-freertos/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_MILKV_DUO_SMALLCORE_FREERTOS
+	bool "milkv-duo-smallcore-freertos"
+	depends on BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL
+	select BR2_PACKAGE_HOST_CMAKE
+	help
+	  This package is obtained from
+	  https://github.com/milkv-duo/duo-buildroot-sdk,
+	  from which we download the FreeRTOS ported to Milk-V Duo
+	  into the Buildroot. This FreeRTOS will run in the small core
+	  and will not do anything because it is simply a template
+	  with some basic UART demos. You can realize your own ideas
+	  by adding code to
+
+	  output/build/milkv-duo-smallcore-freertos-hash/cvitek/task
+	  /comm/src/riscv64/comm_main.c
+
+	  If you say Y, then every time you make Buildroot, it will
+	  automatically compile and include the FreeRTOS into the
+	  fip.bin, which will then be packed into sdcard.img
+
+	  https://github.com/milkv-duo/milkv-duo-smallcore-freertos
diff --git a/package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk b/package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk
new file mode 100644
index 0000000000..1d8d4fcf12
--- /dev/null
+++ b/package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# milkv-duo-smallcore-freertos
+#
+################################################################################
+
+MILKV_DUO_SMALLCORE_FREERTOS_VERSION = 10b86e308ca2305a464ae2bb3eb868a72295f7ab
+MILKV_DUO_SMALLCORE_FREERTOS_SITE = $(call github,milkv-duo,milkv-duo-smallcore-freertos,$(MILKV_DUO_SMALLCORE_FREERTOS_VERSION))
+MILKV_DUO_SMALLCORE_FREERTOS_INSTALL_STAGING = YES
+MILKV_DUO_SMALLCORE_FREERTOS_DEPENDENCIES = host-cmake host-ninja
+MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV = CROSS_COMPILE=$(TARGET_CROSS) MK_ENV=$(TARGET_MAKE_ENV) TARGET_CMAKE=$(BR2_CMAKE) BUILD_PATH=$(@D)
+
+define MILKV_DUO_SMALLCORE_FREERTOS_BUILD_CMDS
+	$(MAKE) -C $(@D) all $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV)
+endef
+
+define MILKV_DUO_SMALLCORE_FREERTOS_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/cvitek/install/bin/cvirtos.bin $(BINARIES_DIR)/cvirtos.bin
+	touch $(BINARIES_DIR)/empty.bin
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
