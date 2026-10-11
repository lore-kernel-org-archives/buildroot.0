Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3878CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 10:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C006480F4D;
	Sun, 11 Oct 2026 10:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OW_JI0e4k7qJ; Sun, 11 Oct 2026 10:21:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1DFC480EDF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791714108;
	b=eHqp4OXedbMClESxEU3pYIq653iehFZCYC4BXiZq53NJbNqUYnEQYgHFTcXZG0dW9VFM
	 rMPzIegnbu7Q6de3+3d3Av44GuFig6eMUdj57NDUfZLJJSh1ufjh/5nZjUD1ohZ2TWcPG
	 YAd3AyfmTb+sTZ6uqtCceqwNEIhrvi9rAoArt3Puyi2B1dA6+bCXnGfmpvR1s4vVqM52B
	 LUY1Gyn1LVx+ZEP374a4qItDZbi61pdvOwzSdRXISIxHrXkx72Tcz6lk3VbSEiKEm5v0X
	 LJ0uzblInMzpKCX363AyMHVoXMJfMND+sA7Dh9wywJbJ9zwwKy8kVu336TwFGfdRlqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791714108;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SyBUzYFwjdPPtHBbgqAnIAe2q5+VgmzWT2bY1YhzbL0=;
	b=NRqgGB1C4dP1LUUKaNExAAzN0HLH3ryl0MpFiiK9pQopmYphoxhayM+oGhz1NZKLeOSI
	 loeC3Z2m8s83jOOMQskLx106RYrEDxe+7vQdeUSaYBRx5oCuNqvTBR//6GA+HG42NVKNn
	 pyoneqLMmcxgdEotumGN1d1ozvGj7PTDe+UFEMnfsEb18i+rSvETYa5D+Lk9XUznQaO3M
	 sFVPdRXKzWHYp1g63gf0nkjxz9rlKzaWDnDangI9WX/F3YcafYj75QAYYKjY4BLq9ziHI
	 b1NHu4jlm1pRTdNxV+aVn+maf6aIvbyUUqgRfRiRszVhJEqbCdLo5DIpnVtYH3wa9fg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791714108;
	bh=SyBUzYFwjdPPtHBbgqAnIAe2q5+VgmzWT2bY1YhzbL0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z6h8MoF7RnXxQP4Q/wRUGRxDhpZtT7zAgpAS7MqI8MuK5rtLCvFlEFpy1S/lgWZjB
	 MDlb/UrLjNfoRvftud4WzIeC1J8NgAi5x6giznLsFBFh3CHj94H6kWQ2UJv8qTuO2E
	 kUoOM8czL2hzUkzz1OuZAIFG4I5/VRGWY6+aS3nFHVCFi8M57qwZWnoJjUnZX4/Ntr
	 YxK5pQcbbpICxORATxawmeLP7XKXJnA/PHPBdYYHRsloFjKiucJLBbZU+0E6gEK3Yz
	 nGK7JjFSTODOjEnVsgHZBwmDKWF4mECXXMY5+M62I6NoFshPFmAKWB/tv9oiMdqvud
	 cgLoFHmBgrhnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DFC480EDF;
	Sun, 11 Oct 2026 10:21:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D1A0111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62E4140677
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSXAqX-sblP8 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 10:21:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D27E340665
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791714105;
 b=ZbDEsVCMDY8VwsdK839k1ohKd5Qf3ZjFGu7lrvjn8THu67l5limOt7vTE9LZWbo3iTQl
 4OQFJZNSMuBwBmb4LcOXJ6ZB297NG1TJp0/8RtAyLlD/O79MlkL+NUKizp3bjkjDuqDOM
 +3HwuGUSpc8AQ3ktJMWcwV6gyiAHDR/xOozblK19FToDCKjjFtsk9ewp/64shqhzzXevk
 zo84S8ol7hOsdiqEY6vZzIEDQlSVGT3Pr5ql5rb5ZKmAP/DW0Fj07Cay2tbbg4SM4D4Er
 FiNkRM4r01EOOxfjtrJxIg7mkIvwloE6nNaIJLCieH63vBNshvjumUv0VH0RqAaNGMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791714105;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=+Ba3xOzLS9I78pEsJlfgN41A6gSXMsRPkTaJBp3AjQs=;
 b=MtyoBG4f5u7k8pHA35ZLv8wxqLvTz5u09fJ5aVI9nopXuwt/MO7GNBpyr79ySPXG2DtI
 vT+bkTcZjAVTLEoM+gxmDm+pFWN1iHWVwCSjbjY4tPHcnmmpN7yfH4rZDzfr9EmLB2f4Q
 2A7lYU5lOEQMYVgFRgIxFBrKktnTHYWo0nUALCoS9hKRPxjRYFcIln+WCCKbI/ItxzPIG
 FxT5VEapsc8py1ezSlwXKtLj9OeRtQt/cgfILZ5GHGmxOiCuFbtfXaZvJKV7LCWWdXPBN
 +qL/0o+/7J0ubNRgbc303S1DzYPl+23VzLo4DAlkXc3lmolct1Uw3lAEfDxJS3tJH9Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Worajp02; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D27E340665
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:21:44 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a16bc2278aso6676065e9.1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 03:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791714102; x=1792318902;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=+Ba3xOzLS9I78pEsJlfgN41A6gSXMsRPkTaJBp3AjQs=;
 b=abGZhPf8CaXdgN4gwka/Prnip41NtOSgwbqDspf79NTPC48tGQeJviZdWjxov8O87s
 fKcIM/+WRW9/GHtOcRSV4MBi2FFS69OBBqQLFqXRYGaspO9YqfXHR5fiol17FBtynLe9
 mSce2wCrWQ3cvmA+kP/zVIe6gnFpSnaVyqouUXE8CCozxWb7ah3K39Ble/UcZV4+V7sE
 87k5ugTrxLa//Quv1HaUmu61tA3o0O3yMnlX46nA8SaAixHK+VD23JiifhCzLwYNdLGq
 VZIG0rPHAei6Mvc2a4qAoot8Ya91DFly/JXvCG35VWSlmHAmS5dlC576w5CuxB2Pg1Gg
 u3Kw==
X-Gm-Message-State: AFq9FYLMEyp+UtlUABG/zv9mtovOYG956purk2j14o3MRXgJMOt2ch18
 g5+/1tE1LHadgbGgVzVhl38B+/CpHvTYwc3Z7FykyYgo6dy31+qnTuam+j1TXSDY9p7ZLHi15k1
 d7R85MpM=
X-Gm-Gg: AYBFou0fM1ZjT3yDSIdv8NGkgb4ktB0tcyI7w+w9rrSBxUCl197IJ+ECbl1sWlWpPJ6
 5eKYcnWY+5RVzzCAohv+FS5P+2pqS0pQNJI+8c8vr/KLpgilyJFnkn3GLwMhibJVpc8g4kq8gBM
 jZp6HEuM3sk5MWQPHbYnbnjjO7mQo80jRtiw0Kf7JAOIqtLVEyQU9XNSB5zHoCdtsvH46MowEzQ
 dNKEdn/q7Wtg5ZQmrxb/YaeCr36+1HW+u4dMA229KCgz+bnXgiuFYrledeIbz3FG/JgWhOcuYXN
 3cinxDbdWqFDYP7PK+OaWAk/L8xZKfwOAZJrnZOZ+hpIXwfZpvrXn07Sr2BeYdr8wvNhTXTV/gp
 aRnfizDbvJfrYgUU4++blDJMxxNGFSHercjodDgxPfNhQ8uWzMR8015g+CJXZV47Pje6K5N62oM
 WJTz3UU4wxi5Vh7eWV7TS9Wuwat8ebtA9QfpBC+yjhgZgapv0Y443jqkP/FMBzhzQvOZkjW9eiZ
 G2Z3bWLRZk3h2J6lqZ9dtcoq+ZYFC5OqZrluJ2AcutFjr9bmxQLUh91SkNuEY6ZueLK42p0UA==
X-Received: by 2002:a05:600c:548e:b0:4a0:1aa0:7cfa with SMTP id
 5b1f17b1804b1-4a18e4aa724mr125965615e9.12.1791714101866; 
 Sun, 11 Oct 2026 03:21:41 -0700 (PDT)
Received: from dragon.telekom.ip
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf15691sm196548605e9.6.2026.10.11.03.21.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 03:21:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 12:21:31 +0200
Message-ID: <20261011102131.1144118-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ifenslave: remove package
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ifenslave has not received any recent update, has no Buildroot DEVELOPER
and its upstream NEWS [1] states the following:

  This version of the ifenslave package no longer provides /sbin/ifenslave. The
  /sbin/ip command from the iproute2 package supports creating bonding masters
  and enslaving other interfaces to it.

Its feature is available either in iproute or in Busybox, so we can
simply remove it from Buildroot.

[1] https://salsa.debian.org/debian/ifenslave/-/blob/main/debian/NEWS

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in.legacy                 |  7 +++++++
 package/Config.in                |  1 -
 package/busybox/busybox.mk       |  1 -
 package/ifenslave/Config.in      |  7 -------
 package/ifenslave/ifenslave.hash |  5 -----
 package/ifenslave/ifenslave.mk   | 19 -------------------
 6 files changed, 7 insertions(+), 33 deletions(-)
 delete mode 100644 package/ifenslave/Config.in
 delete mode 100644 package/ifenslave/ifenslave.hash
 delete mode 100644 package/ifenslave/ifenslave.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 97824f701f..db320ea981 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_IFENSLAVE
+	bool "ifenslave"
+	select BR2_LEGACY
+	help
+	  ifenslave has been removed. Its feature is otherwise
+	  available from iproute2 or as a Busybox applet
+
 config BR2_PACKAGE_SZIP
 	bool "szip has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 5773f33316..f559315977 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2497,7 +2497,6 @@ endif
 	source "package/iana-assignments/Config.in"
 	source "package/ibrdtn-tools/Config.in"
 	source "package/ibrdtnd/Config.in"
-	source "package/ifenslave/Config.in"
 	source "package/ifmetric/Config.in"
 	source "package/ifplugd/Config.in"
 	source "package/iftop/Config.in"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 855d553360..7bb40ee298 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -53,7 +53,6 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_GREP),grep) \
 	$(if $(BR2_PACKAGE_GZIP),gzip) \
 	$(if $(BR2_PACKAGE_I2C_TOOLS),i2c-tools) \
-	$(if $(BR2_PACKAGE_IFENSLAVE),ifenslave) \
 	$(if $(BR2_PACKAGE_IFPLUGD),ifplugd) \
 	$(if $(BR2_PACKAGE_IFUPDOWN),ifupdown) \
 	$(if $(BR2_PACKAGE_IPCALC),ipcalc) \
diff --git a/package/ifenslave/Config.in b/package/ifenslave/Config.in
deleted file mode 100644
index d28e0f7c29..0000000000
--- a/package/ifenslave/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_IFENSLAVE
-	bool "ifenslave"
-	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	help
-	  Configure network interfaces for parallel routing (bonding)
-
-	  https://salsa.debian.org/debian/ifenslave
diff --git a/package/ifenslave/ifenslave.hash b/package/ifenslave/ifenslave.hash
deleted file mode 100644
index 825f2d6f2a..0000000000
--- a/package/ifenslave/ifenslave.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://snapshot.debian.org/archive/debian/20170102T091407Z/pool/main/i/ifenslave/ifenslave_2.9.dsc
-sha1  a17e88fa298ef337e872c8aa5d7a390921239d1a  ifenslave_2.9.tar.xz
-sha256  e5666c0b61347bd06f2394c16eca6895fcb5e5cc83d0a1c596a975274de5a3c9  ifenslave_2.9.tar.xz
-# Locally computed
-sha256  299e00f3afc0e6ea0685340df73ad444e58e6fe0229989ba0983f5f33e275c41  debian/copyright
diff --git a/package/ifenslave/ifenslave.mk b/package/ifenslave/ifenslave.mk
deleted file mode 100644
index b51aa72051..0000000000
--- a/package/ifenslave/ifenslave.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# ifenslave
-#
-################################################################################
-
-IFENSLAVE_VERSION = 2.9
-IFENSLAVE_SOURCE = ifenslave_$(IFENSLAVE_VERSION).tar.xz
-IFENSLAVE_SITE = http://snapshot.debian.org/archive/debian/20170102T091407Z/pool/main/i/ifenslave
-IFENSLAVE_LICENSE = GPL-3.0+
-IFENSLAVE_LICENSE_FILES = debian/copyright
-
-# shell script, so nothing to build
-
-define IFENSLAVE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/ifenslave $(TARGET_DIR)/sbin/ifenslave
-endef
-
-$(eval $(generic-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
