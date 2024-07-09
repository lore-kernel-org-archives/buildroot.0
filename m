Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26583C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 10:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A186240BEF;
	Tue,  9 Jul 2024 10:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjkEvlkSN6sJ; Tue,  9 Jul 2024 10:19:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7748340DAF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7748340DAF;
	Tue,  9 Jul 2024 10:19:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C60E1BF298
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A88C60661
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8L0EIjPeR-UN for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 10:19:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C4D8060827
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4D8060827
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4D8060827
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 10:19:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.127.252]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt75H-1s7Ffc1w7t-0153oQ; Tue, 09
 Jul 2024 12:18:57 +0200
To: buildroot@buildroot.org
Date: Tue,  9 Jul 2024 12:18:40 +0200
Message-ID: <20240709101841.1145134-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709101841.1145134-1-fiona.klute@gmx.de>
References: <20240709101841.1145134-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:hQUvmhN7A19I8/uQ4fexqat3ccxFSzrMZVYENsZMjVFWAXgMx6I
 RQWTHa6GrRClimMb+uupftxNrmOu8n375LI2KIoPVHI89U0pbO/97AkkVi2bwpNQjIDJDb/
 RSU0ssAUeJJjnHprAsZ1wnUHJ4DfAqj+QDvy7rUJ8kQ4ilB70M/c9vYeB9cNAdV0K/XFa1q
 6Lx8q6CeRqXpSFhexj12A==
UI-OutboundReport: notjunk:1;M01:P0:GCCNZ2IT0pQ=;v/5vklWGrvofid+Fqy8Oia8iuSa
 bmXpPjxh88c7kSz4YgOevC5AwThgR4oYwaVpPG76THEbHc5Rj8WH4uEqNmBH4R/Sa9tPUIUKW
 K+rYqtynaY5QO+GYLx3vbYM8isCAI1oSZaY4b0Sv0ExCJakQA0mZFdiGIRn4IY3we9ALju72u
 GQs1mxaQe5OExacx0CTmE6hM/Q8dTyZXrS/DTtBIW4NFn9YxaXWHTOhTCvJnK28kcMReODvUQ
 tI3EgL/o24zVc9PnQjpEHJGIwA/xmqa7EIHjoo7VeF3EhsOsz00nYJEqqxckxnp64fMSaQ7B2
 gh88Eghmla8UGFFvYhBhxKw83AHEvs7RQpI9eyAKG8pXOvOuS4IsT8CI1F4Ew4bo0RgagtD2G
 KpTBu3g3FQLXDMfv9t/LvOCmV11PbezMH1tf3hcAs98pwc96pF3FRECnw1Z15uG54HnQoH5n8
 9qBsvVUQqZ0+ogx75P0qbr7LjEPgj777wI9ck0ybTP4NLBuC8pb+wz0xTK6t5E/h+YaJ6Oowb
 AzSNRrTw1AkAXHkzqZ4WV41LBg5YHddSKnFUXzkMb/dG2ERh9MrxShci6SrWCG2GJSSMwmWZq
 4LicC77jEePC+zbUA7qYB66nd+SvH7BA5pjymH5axlVDmmCLyeKVJY4tcnZEC5ufC0cT3Nw5V
 4mtee5Y5ndSY1Ce0AMrbnOhrqlcSjnY9p6RAdMSE9llwl4UK4T28CbSFqUYyKdJKlW+wsMsKV
 OkqRVEqvQXut5DxsRGi4nCV8tqWtstCuaZgPzhBtcz4dBiDIOtuGAl9aXVZegftEJbsK5Z1Mc
 W9ExxYksF9FzWFJGgQ5F2hmw9mihUu6Mg4xdnbUwpkN5k=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720520337; x=1721125137; i=fiona.klute@gmx.de;
 bh=tToioO7CxPfUYVWUKkE6BFJrKvZi/P3+WewTxnG/X8o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=sxrhMeXP1Jbf34BYqeCF3jjQ0WDX1oAR845LZcH4zYCMA0Dlo7cRQGLVN7eKPHd0
 lM3ZHI7FRp0TWHGVWQApasZJ+9m31ydhxh1dIfL+pnlSOpQb1DjkvbitnJEePvL/A
 0HyPt+brBN07J+PU2T/HbXcajuOlQQcFheR2SFqlSJAwbgkM7m5EFoO3yBghPaCZI
 DC1V85jkTgwvpVrsRjRUET49uBdiWv6AaGW/c8ERS+kpZUDPREu2CyCHQkv8b8h74
 G9JABkYQpeMvnwBJMUroP5/s0nPm1gwrFc94dXJjwf9DLQFlWEMdQMUGfu4tMF7gj
 WUFmuDcmpLJfQc313Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=sxrhMeXP
Subject: [Buildroot] [PATCH v3 3/4] package/fail2ban: bump version to 1.1.0
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
Changes v2 -> v3:
* Add "# runtime" comment for pyasynchat dependency, drop
  FAIL2BAN_DEPENDENCIES in fail2ban.mk

 package/fail2ban/Config.in     |  1 +
 package/fail2ban/fail2ban.hash |  2 +-
 package/fail2ban/fail2ban.mk   | 14 +++++++-------
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/fail2ban/Config.in b/package/fail2ban/Config.in
index 8a48a8c1d0..4c2c56440d 100644
--- a/package/fail2ban/Config.in
+++ b/package/fail2ban/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FAIL2BAN
 	bool "fail2ban"
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PYASYNCHAT # runtime
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
index 0c1208c6fe..a77e5fad6c 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-FAIL2BAN_VERSION = 1.0.2
+FAIL2BAN_VERSION = 1.1.0
 FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
 FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
@@ -12,13 +12,13 @@ FAIL2BAN_CPE_ID_VENDOR = fail2ban
 FAIL2BAN_SELINUX_MODULES = fail2ban
 FAIL2BAN_SETUP_TYPE = setuptools

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
