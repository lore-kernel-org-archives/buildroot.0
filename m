Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B44BC27C4F
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 17:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F88981AD1;
	Wed, 26 Jun 2024 17:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qnz2KWL1HTYu; Wed, 26 Jun 2024 17:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A818782096
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A818782096;
	Wed, 26 Jun 2024 17:19:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3B171BF855
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 17:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD4544051E
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 17:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id InuAxMT81hIQ for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 17:19:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 482F641A03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 482F641A03
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 482F641A03
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 17:19:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.117.148]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M59GG-1sLPqM47bI-00G5yV; Wed, 26
 Jun 2024 19:19:43 +0200
To: buildroot@buildroot.org
Date: Wed, 26 Jun 2024 19:19:22 +0200
Message-ID: <20240626171922.718270-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626171922.718270-1-fiona.klute@gmx.de>
References: <20240626171922.718270-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Li3KwsEgc/5db/ZLpFIWgcqD+A6b5ZFQrYjABYVslDe5/6OaqQ5
 Tb4ESCP3zMuDLmMVa2zl2ATq8KRBLOj/WqM5bHLdv90CSpTgvI3gp9iinjjj6AySjcBlgEb
 dW0FMEC5hjIxdpGl46pDv/RhwerCljGAFB13ZDBQ2/ut/AobpPGzAwMaLDsjSjyqXd96Huh
 giGiqUKXzwPdasWF9L8SA==
UI-OutboundReport: notjunk:1;M01:P0:0cz8PehkXN8=;x7d68EoemvnfdrJxAjAdRsDPCUQ
 Wddw10yzgqkPNxQELjD101VWoNp0MwFThemL6wu7fJXMPkUqYUkbd3+0nC0N/xANcDaWK7W0S
 /i/Mfxl4zA9Nra3iX9x1vQr6kVefiQiD1uL4dpQwSWHaGzbDaaXFWAd7tNbHbvVFLzF7+28X1
 ZQBC7r+7oXyXjMnU7jHNsvyFeLlsn6VI5kjfi0ddyHQnob6UARN0P5Eb+vwWlhDLbgbBiIEfZ
 p+ouqet+B6VqSgILCo7KvQR1qgAyHG1hk/uzZCh8AzW7Ts4rHvCo3Ni/YGTDpGukCI1hhruh/
 exjORz3uKhjjkJDC16yvXiITCFaATRuQCCTVASLICDDJN9PhYja8NEze27vWMauyHZjpWXzAz
 T2o/6do38MX85Bv/UOvzt1U8GFhSJiJsgGXmqD+32nULI8b3GJKM9QnxkJpdpaI1+3zNVwizI
 A8Qd6gVeLwEImb2w1JMQuAtY9mTdEfH5uXUUm6GqZBNFXhLZNgJm7jGVcIKkbjT7Dj8XcbxWI
 pFZ/dAaQ3AOFHfGEQGf/OrafAuo+uVO2G6RTZvNtS2JSohxZFtVl3pFOSt+ECs07bWf9gNSeN
 x4xEwgQ8VZAF9B0cFRZhHKtGC7kB6WinqSAnOeiHh/ynY48JnxisAlZ1alrQ0soHbQFRb09wa
 38G6BA/SF/ezTJm3e9+xZm34xws5NfmUhQrf13xuJoOxSBEPwyIGSfEOMKaJuF+Fcv9GJHn+V
 j7hUp7Q6I1MY88nBAvRZLj475dS8HTOGB9LQIWOekqolvJscK7GjwYoP+TuVCvYXBl6tRywhk
 sjmkBMWT75vHY7uX4QQdhHm9P9HL93pSBDxlXCPJU0Gsg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1719422383; x=1720027183; i=fiona.klute@gmx.de;
 bh=XzMZYtbUWvcgNrJjzW2RQEmFG/giGEanKIV8h+mzIIk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ttgErgEUjGkkRaxW4F3RQKxYLskTR6ZvUiLuc0MEUokEDKfKjW2tfIcEmMVL2vCo
 ON6+fPjWFNutdsjEBfP/rpZ7zX8pw/MAAZg4PZ7Jo7wJ0fwWv3qWtRWQcHDhb9fWP
 lxoYIEZe6RcGJFRBpZ7TbFEa/xKn4nOsr6e5zDzmARD3Xl0m9BUztMEzm0mhl/+9n
 MNN0OzbWTg+dIxCJmEQ2mYrbMXcIesuwKzhHj8GD9OSjlp2TtaUInoKw7HtcZ2fSl
 OTW8u2siENUYXVbOnsgGHxNVuZdWYbyEXdbyRrqZtAFecOYBiH1ONrSNz5MKWGTS8
 +OLXLUA3lBclDKwOSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ttgErgEU
Subject: [Buildroot] [PATCH 3/3] package/fail2ban: bump version to 1.1.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fail2ban 1.1.0 brings Python 3.12 compatibility, and removes support
for 2.x. This means 2to3 handling can be dropped.

Unfortunately fail2ban 1.1.0 still relies on asynchat and asyncore,
which have been removed from the Python standard library in
3.12. Depend on the compatibility package python-pyasynchat (which
pulls in python-pyasyncore) and remove copies bundled in upstream
code.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
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
