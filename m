Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04418C31D97
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 12:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C47DC40B3C;
	Thu,  4 Jul 2024 12:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tS8hIsxr59_S; Thu,  4 Jul 2024 12:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7708140DA3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7708140DA3;
	Thu,  4 Jul 2024 12:14:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 063B71BF2C5
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E896460816
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4goVCeyqFTHI for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 12:14:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 81CC06066D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81CC06066D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81CC06066D
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 12:14:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.251]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbirE-1rqZMe1WGs-00bW6K; Thu, 04
 Jul 2024 14:14:14 +0200
To: buildroot@buildroot.org
Date: Thu,  4 Jul 2024 14:13:51 +0200
Message-ID: <20240704121352.1915154-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704121352.1915154-1-fiona.klute@gmx.de>
References: <20240704121352.1915154-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:P+6EtFektyBWDt1/8OpyWDzha/CdmSZr3fDvPyVmNhqQ01aLCQi
 KoMpj/AjuWv+dXDlr1eaK/1GCrftZ5VPuSfXZdwFq01km2u54OPWcM2QtNiZO9u8hTOskul
 18xjNUExYdaVC6rT+qG/Y3JLxRwk5X8x8EDo/qlANniTOE/C45k2hFdyU/ugGQ/7PZ8n70n
 KiJhA4Uy2ETEJK95Pksrg==
UI-OutboundReport: notjunk:1;M01:P0:c/WxpRJIGe4=;hdZRibHAhI5zaEg/trCb8l1vtbY
 7Cpa4L08VnrSBPU6TT39243oyWGbfUOsuf2BTpof9xpV5DDK6nRU2QZQLrFFhwhZcp4hegE4R
 NNGHMoHTHSIAspDgXbkr/W3J2hRK/bk1nNKcFw2rjibLGjw+FWe/7U9CbMLJEzZiwBvyC23md
 VE4WgKzcgw15p4n8l4ThBaomZWbIvg2hUU/8x0vXAvRbWJpDOM/LMvCh7O9lUj3O9ANRB11kX
 laJjNY9OSMekLOe51rfh0Uh4XFgUAbwotuUJzH2FcsxNY4VbgZlnMmfBTO3/Yj2G/wEv+8nrf
 /r5hG3h/HFsoZOuC41H5N1jWGki/Fkwbb6Y8lxwo/1Ul/7SGm6Bk8aE5ENlQqINlb3RvsoIrs
 m5Zc8CgWcV4IaHSStSt5sFG3lNcQ1825YM7jD0/4vn2rLq1P8i6KBkdGIaIThduvPfQnNWLKY
 Z4+Le4mUg8KhNn/n14kYeH16YB4WGJAxdkea6VWISSWaHT8TF1rHLPmdxxbW9EDSjsAjXjv+v
 4fNInmqzxPRhGsi+6Li98advL1TTQQ4pv6a71MvRMNiuoWARgrDzQsJIuv9uVJ/QvEI9VqflQ
 dX1g6aVwbMUol9F70FCdzYCwcPQ/NGVdd0YDUbT+p9Vf6QO/7/UIXMruT3T+GiOrHcf8Jx+ZE
 HBVNtGpqfkyheg/laBZcQCCip1WlV+lSIOlK1LDdJ7i3MDVoDm4J1HYgOrNbH1gjzNLscL0zQ
 8judoUueeuB9RMsiCiKd0JxpxNGHh3baIMpCJ4tmp2pfehL/rNIo2kqH9BcnW3QeySwl610kY
 gzx99lADoyFGWDkQskNHXhfCmE1RMzjhbL6Pgn07uKjoQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720095254; x=1720700054; i=fiona.klute@gmx.de;
 bh=s3KcbSxOd2VCbdJMIWH+tY4E3nYIya7AlWpbkjqjfyE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=RT6JV4EKrca6svPs+Z9Err514znQRLmCkYxtzVQTOLVudZCeRf6fckeDYSlSEP9L
 CNgA22KpugSNsFiWl8AFru5xiidzqhZrtdzf5q3ZCoMuoan8W7NhtEDOpve9G5g8w
 IqsVJVoBWrSXcofGGFBV/nP1CrfFXA9PYk+guwj4gq2BvuYuheo4D5wCD3T7HPcn/
 lYtT6ypyD4Kt8HhKhI0I6e5SAoq9duuhQgKNNkMjB2oWMmijpM9DWCodIcEd/I2k1
 peAp5bdHaYt9q63/pECq72oN1D312g0EEokD1LVYH9QPBs9Lkbf+6FHtB3z5pvHrc
 dJ813Zhm8VmO+32Niw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=RT6JV4EK
Subject: [Buildroot] [PATCH v2 3/4] package/fail2ban: bump version to 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Fail2ban 1.1.0 brings Python 3.12 compatibility, and removes support
for 2.x. This means 2to3 handling can be dropped.

Unfortunately fail2ban 1.1.0 still relies on asynchat and asyncore,
which have been removed from the Python standard library in
3.12. Depend on the compatibility package python-pyasynchat (which
pulls in python-pyasyncore) and remove copies bundled in upstream
code.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/fail2ban/Config.in     |  1 +
 package/fail2ban/fail2ban.hash |  2 +-
 package/fail2ban/fail2ban.mk   | 15 ++++++++-------
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/fail2ban/Config.in b/package/fail2ban/Config.in
index 8a48a8c1d0..33228c3103 100644
--- a/package/fail2ban/Config.in
+++ b/package/fail2ban/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FAIL2BAN
 	bool "fail2ban"
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PYASYNCHAT
 	select BR2_PACKAGE_PYTHON_SYSTEMD if BR2_PACKAGE_SYSTEMD
 	help
 	  Fail2ban scans log files (e.g. /var/log/apache/error_log) and
diff --git a/package/fail2ban/fail2ban.hash b/package/fail2ban/fail2ban.hash
index b40922e70a..8627e01f05 100644
--- a/package/fail2ban/fail2ban.hash
+++ b/package/fail2ban/fail2ban.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  ae8b0b41f27a7be12d40488789d6c258029b23a01168e3c0d347ee80b325ac23  fail2ban-1.0.2.tar.gz
+sha256  474fcc25afdaf929c74329d1e4d24420caabeea1ef2e041a267ce19269570bae  fail2ban-1.1.0.tar.gz
 sha256  a75fec0260742fe6275d63ff6a5d97b924b28766558306b3fa4069763096929b  COPYING
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 0c1208c6fe..9ab084b576 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -4,21 +4,22 @@
 #
 ################################################################################

-FAIL2BAN_VERSION = 1.0.2
+FAIL2BAN_VERSION = 1.1.0
 FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
 FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
 FAIL2BAN_CPE_ID_VENDOR = fail2ban
 FAIL2BAN_SELINUX_MODULES = fail2ban
 FAIL2BAN_SETUP_TYPE = setuptools
+FAIL2BAN_DEPENDENCIES = host-python3 python-pyasynchat

-define FAIL2BAN_PYTHON_2TO3
-	$(HOST_DIR)/bin/2to3 --write --nobackups --no-diffs $(@D)/bin/* $(@D)/fail2ban
+# fail2ban contains bundled copies of pyasyncore and pyasynchat,
+# remove them so only the packaged versions are installed.
+define FAIL2BAN_REMOVE_BUNDLED_COMPAT
+	$(SED) '/fail2ban\.compat/d' $(@D)/setup.py
+	rm -rf $(@D)/fail2ban/compat
 endef
-FAIL2BAN_DEPENDENCIES = host-python3
-# We can't use _POST_PATCH_HOOKS because dependencies are not guaranteed
-# to build and install before _POST_PATCH_HOOKS run.
-FAIL2BAN_PRE_CONFIGURE_HOOKS += FAIL2BAN_PYTHON_2TO3
+FAIL2BAN_POST_PATCH_HOOKS += FAIL2BAN_REMOVE_BUNDLED_COMPAT

 define FAIL2BAN_FIX_DEFAULT_CONFIG
 	$(SED) '/^socket/c\socket = /run/fail2ban.sock' $(TARGET_DIR)/etc/fail2ban/fail2ban.conf
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
