Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88279FF886D
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 09:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDF816141D;
	Wed, 29 Apr 2026 09:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9EZIr7MCgyX; Wed, 29 Apr 2026 09:33:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67CEE613C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777455233;
	bh=8NRhf15aIQAJG135TQoUGJHTg1HCyWCSrc5NE8rVoiA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=qkeAdamDwjm3vwHJBhrFdG1hWcRZB9nQ+yzDeqXEtShPnjact3nzbtK+9mMyUlfHx
	 0xsu/i+GGjuiqo3rd76CakuGlYqifm5xlfRoLq9FB7b9G9NktDvegxT+WgKCQMCLKC
	 penhYmnAsDIABfMx9GsEVSysSJNuy7cGcJT/2sKN28WfH+aMiV0onfoebNWYqeq9vg
	 83XWqq1bOI9yyc/TFpomKUr8I4/L7auO13yVR/imzas70V7hXa6ML3NtwzoTPjfsBW
	 C2H19YfgHXeG76/G9mUp14fC1HjuVylYkDLq8Z/8c2KxcjcgCd6Owc8acuTV3uG94h
	 pj/WH9wlVMAkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67CEE613C4;
	Wed, 29 Apr 2026 09:33:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C38B1231
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 09:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C128B84339
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 09:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqEjf-z9o_cX for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 09:33:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE9EB84337
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE9EB84337
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE9EB84337
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 09:33:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6ux-1vXzQP2Rgp-00bYH4; Wed, 29
 Apr 2026 11:33:46 +0200
To: buildroot@buildroot.org
Date: Wed, 29 Apr 2026 11:33:39 +0200
Message-ID: <20260429093339.3232096-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:g1MIO8HS/KjvdNYVLArBmkenWGq419vy2Y5XSO/kV5Fp41q6hET
 rffgLLt0rY5AUz/fp/OI4/g45F63nc05lgy6hk8QU7eDM4mZsCl5ZYtO0XI+OZ3nMiKP/sA
 b+hUtWGcxEzgA41xKLWPqnQ83SL/n51H0a6bCicidvGi086xqxIVljrtylCSad4DKwQwbSE
 8nHOIQkEjVoINWEzX3MwQ==
UI-OutboundReport: notjunk:1;M01:P0:6riTldCGSpo=;S7Vt9Yo6D+dsAKv43OmQ8ypi49m
 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
 Bk5o3j9Z7dtPTqwoiTnxt4X/PDEvtuDaGAAE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777455226; x=1778060026; i=fiona.klute@gmx.de;
 bh=9RzN93Upso5ZSWQj9+85c3y7neRkKF4YGwowqRsmXvY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=WAQKloAvDw+glNqI3e4BubhtCAfrc9+vE0JqnfTo7aFVzaCLjbOnxSVG/bAlfYx2
 L/9sQu2CXhWx7BNFEo/szHU+cXPTjRP3Uy+lxtYfkg69K8PGBsOEqnGmxGhaE+kfl
 Ox+D17GYa4NutmzQcsHZaU6tDQ/bP/TI07A+9e5paJTHFaga7AzCqCA8OFVzbnqlC
 xYwlVz5yRgUgwGh0X/Zjfswp/q4gIAkGc2hY3kGvIf1crdFJPeKGhnNZKsTiPhyCe
 KUg168dd+h8ZJ1Zi2lCg7+/i9TRZRiEB7/tGpaMVbKyhL5Ym+BTmLvJN75euWYuiU
 b4xeL7D2qzonya6WLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=WAQKloAv
Subject: [Buildroot] [PATCH 1/1] package/ugetty: support building
 "proxycommand" binary for host
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The "proxycommand" binary is used with SSH clients to connect to
ugetty over serial. Building it as a host package makes it easy to use
with Buildroot builds including ugetty on the target, without needing
a separate install.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/Config.in.host        |  1 +
 package/ugetty/Config.in.host | 13 +++++++++++++
 package/ugetty/ugetty.mk      | 10 ++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/ugetty/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index b990ce8b14..bb6732a639 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -124,6 +124,7 @@ menu "Host utilities"
 	source "package/ti-cgt-pru/Config.in.host"
 	source "package/tipidee/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
+	source "package/ugetty/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/utp_com/Config.in.host"
 	source "package/uuu/Config.in.host"
diff --git a/package/ugetty/Config.in.host b/package/ugetty/Config.in.host
new file mode 100644
index 0000000000..6d907d1c38
--- /dev/null
+++ b/package/ugetty/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_UGETTY
+	bool "host ugetty"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8  # std=c17
+	help
+	  A minimal getty for embedded Linux that auto-detects the
+	  client and dispatches incoming serial connections to a login
+	  prompt, a PPP session, or the local SSH server as
+	  appropriate.
+
+	  The host package builds only the "proxycommand" binary for
+	  use with SSH clients to connect to ugetty over serial.
+
+	  https://github.com/ryancdotorg/ugetty
diff --git a/package/ugetty/ugetty.mk b/package/ugetty/ugetty.mk
index 0e306a02c2..d8e8c85918 100644
--- a/package/ugetty/ugetty.mk
+++ b/package/ugetty/ugetty.mk
@@ -20,4 +20,14 @@ define UGETTY_INSTALL_TARGET_CMDS
 	ln -snf ugetty $(TARGET_DIR)/sbin/getty
 endef
 
+define HOST_UGETTY_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) bin/proxycommand
+endef
+
+define HOST_UGETTY_INSTALL_CMDS
+	$(INSTALL) -m 0755 $(@D)/bin/proxycommand \
+		$(HOST_DIR)/bin/proxycommand
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
