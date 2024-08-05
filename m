Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A395C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 16:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF370810B6;
	Mon,  5 Aug 2024 16:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8bU0rSjqF5jX; Mon,  5 Aug 2024 16:31:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F8E480CA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F8E480CA5;
	Mon,  5 Aug 2024 16:31:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C186D1BF3AD
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 16:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFEB680EFB
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 16:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_Dx_KONY7ix for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 16:31:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF95480D11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF95480D11
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF95480D11
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 16:31:36 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-39641271f2aso38968865ab.3
 for <buildroot@buildroot.org>; Mon, 05 Aug 2024 09:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722875495; x=1723480295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uJXqJOUAI/UFsR/uwWU3rhrux2H/BjIlybw7cTNjIX8=;
 b=Ubn7gJg7JN+xNJ539LzpsfrS+7YyJZNByM9Rk3z2zIIx79oafP11sizS77cAwGzLj8
 zNoe0Xd4TXr0DSKm43aoBpjTKTDUByxYmM4punKPTvkghub6DGVTtmd8C49so44Olp5Y
 NlXJMGu5n5yKpFFxsJXpmdurpfOM/lEZgAmXYSzbOxT91ei6Y0NNGNAE3VrIqIizyWST
 jjNHOOXZiZaMdbpZ1StCMGdvUYmFXL5pWXyHoXdu1cfrkrVvFdt2L0ArXtNXrMNeS7Gx
 mxIyyE1yhHjB6UakA2kmD4iR7O/m1mwPI/73xZ77/Onm2uv/BkKs+xfDRtbFesrS6H0E
 o/Zg==
X-Gm-Message-State: AOJu0YyGSfknMzmHiPwkvq9M3XBwQpjF4fC4kSLJj8T+H6TaD9lvqtAD
 +nBQ1YxTGr0gxXoQr85T8WQDd2yB8YP1VnxccwmZpGXc2vPZxzaEmtyc3TU9
X-Google-Smtp-Source: AGHT+IFcgEnVWJcncCpV7ron11oApf6X+3ApP4EBTF0n5JDQ+1ZBv7i3J6xoUKLSvietffmg3XQaWw==
X-Received: by 2002:a92:6909:0:b0:39a:12d7:2841 with SMTP id
 e9e14a558f8ab-39b1fb87912mr120306635ab.15.1722875495144; 
 Mon, 05 Aug 2024 09:31:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39b20ae354dsm29940935ab.59.2024.08.05.09.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 09:31:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Aug 2024 10:31:33 -0600
Message-Id: <20240805163133.4126564-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240805163133.4126564-1-james.hilliard1@gmail.com>
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722875495; x=1723480295; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uJXqJOUAI/UFsR/uwWU3rhrux2H/BjIlybw7cTNjIX8=;
 b=iioYc+Q9MeUPW4K9g2e45O3QvtaFYoaEp/8TwCT4qVyDc1T2nG4gU8Xdx83QBMTFYh
 3s9jbpFnFIYYx5lv/3PGkqPoPCMEUAggNyya3etiIKbjobpnwwTrCsgUpJb0jrVy1WQ0
 QVAxRGwhzD4QVxDkkTmVDGUDgHsmeStG9dAyqPvL5CjfpribTCYqwigxH7wtDvu5ZTE/
 flYdrylC+BCXdxC7mbeKX1KcRVVn2Cnbr7WNEw7HSXOxMKIpVg7Dah61RIHqMcSOYgPA
 Isy2r4nVyYtaGtasDk0M5/AB73iGsy9LbXqVAF66v+g7QD8GNYU7pUr3+nS/Q8EkH9T8
 eraQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iioYc+Q9
Subject: [Buildroot] [PATCH v4 2/2] package/tailscale: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v3 -> v4:
  - restore GOPROXY override
Changes v2 -> v3:
  - set required CONFIG_TUN kernel config option
Changes v1 -> v2:
  - don't set GOPROXY
---
 package/Config.in                |  1 +
 package/tailscale/Config.in      |  8 ++++++++
 package/tailscale/tailscale.hash |  3 +++
 package/tailscale/tailscale.mk   | 23 +++++++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/tailscale/Config.in
 create mode 100644 package/tailscale/tailscale.hash
 create mode 100644 package/tailscale/tailscale.mk

diff --git a/package/Config.in b/package/Config.in
index 2ac351cce5..a12010b32d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2622,6 +2622,7 @@ endif
 	source "package/stunnel/Config.in"
 	source "package/suricata/Config.in"
 	source "package/system-config-printer/Config.in"
+	source "package/tailscale/Config.in"
 	source "package/tcpdump/Config.in"
 	source "package/tcping/Config.in"
 	source "package/tcpreplay/Config.in"
diff --git a/package/tailscale/Config.in b/package/tailscale/Config.in
new file mode 100644
index 0000000000..c81a7134ee
--- /dev/null
+++ b/package/tailscale/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TAILSCALE
+	bool "tailscale"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  The easiest, most secure way to use WireGuard and 2FA.
+
+	  https://github.com/tailscale/tailscale
diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
new file mode 100644
index 0000000000..882ff9d5d0
--- /dev/null
+++ b/package/tailscale/tailscale.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  a961aa07a3b0927cd647d6ae69fc212afbbdb0e4c47b8aeb181cb64360b7f143  tailscale-1.70.0-go2.tar.gz
+sha256  d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
new file mode 100644
index 0000000000..882ab9b584
--- /dev/null
+++ b/package/tailscale/tailscale.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# tailscale
+#
+################################################################################
+
+TAILSCALE_VERSION = 1.70.0
+TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
+TAILSCALE_LICENSE = BSD-3-Clause
+TAILSCALE_LICENSE_FILES = LICENSE
+TAILSCALE_GOMOD = tailscale.com
+TAILSCALE_BUILD_TARGETS = cmd/tailscale cmd/tailscaled
+TAILSCALE_INSTALL_BINS = tailscale tailscaled
+TAILSCALE_DL_GOPROXY = https://proxy.golang.org
+TAILSCALE_LDFLAGS = \
+	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
+	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
+
+define TAILSCALE_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+endef
+
+$(eval $(golang-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
