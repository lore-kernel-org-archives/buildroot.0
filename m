Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D85C83029
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 15:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E89140AFA;
	Mon, 30 Jun 2025 15:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aB3_JQZhaRz5; Mon, 30 Jun 2025 15:14:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 295D640AD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 295D640AD8;
	Mon, 30 Jun 2025 15:14:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69093DF
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 15:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B0AD60E34
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 15:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCtkHNsx74V8 for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 15:14:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 24B7E608EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24B7E608EC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24B7E608EC
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 15:14:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E5BD44204;
 Mon, 30 Jun 2025 15:14:14 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 thomas.petazzoni@bootlin.com,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 "Yann E . MORIN" <yann.morin@orange.com>
Date: Mon, 30 Jun 2025 17:14:11 +0200
Message-ID: <20250630151412.341903-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630151412.341903-1-maxime.chevallier@bootlin.com>
References: <20250630151412.341903-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevveegueeljeekudeivdffieehtdejkeehueekhfeuhfdttdfgheeffeelheeuveenucffohhmrghinhepsghuihhlughrohhothdrnhgvthenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnr
 dgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopeihrghnnhdrmhhorhhinhesohhrrghnghgvrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1751296454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zdF9+M4pi6I4/2pV6csAOYl0LajPR9GLL7zuU0BsDHQ=;
 b=FdMBUNQkm+kibjOd+CIiwVarkiCSjX+PiIIW7/pgN//5BLb+S9/52n2fmTKoFh8zEUlDj9
 qospqunQAU/TSZ0i5dUjE1YPpGN6m+g8OPA7t6Q9HAr0ivJNEVc3OLUW+YVLAZZOC4X9RC
 SV3t8XEIrpZe/QzUDaaFfJg3Q5H64uV0ea4GL2zlZMXlpTBNpLxM7mIk0/5S4xC1tuKP7x
 SOx+qtKsw4wer8gWSy3ni7GvwDEIWl8c9ZuJ0NREolK5eDupa+Foxp4OXmDdoLJ3msc/mE
 cVfk4Mq2RuDfttJQauk6ac4IJ1zeKbc3jqs368UdnULSf8CGcAhOEcb/VAFudg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FdMBUNQk
Subject: [Buildroot] [PATCH v2 2/2] package/elfutils: elfutils programs now
 require a c++ toolchain
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
From: Maxime Chevallier via buildroot <buildroot@buildroot.org>
Reply-To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 0.192 release of elfutils introduced the src/srcfiles.cxx program,
that lists all source files of a given ELF binary. As this is a C++
program, we need a toolchain that supports it.

Without it, the build system tries to use "no" as the CXX compiler,
resulting in the following errors :

  /bin/sh: line 1: no: command not found

as can be seen here for example :

https://autobuild.buildroot.net/results/849/849221c794a469a423857a290db775d150b84900

Add a dependency to a CPP toolchain for the elfutils programs.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/elfutils/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 9608ef4905..e866dd448b 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -24,11 +24,13 @@ if BR2_PACKAGE_ELFUTILS
 config BR2_PACKAGE_ELFUTILS_PROGS
 	bool "Install programs"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  This option tells elfutils to not only install the libelf
 	  libraries, but also the elfutils programs.
 
-comment "elfutils programs needs a glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+comment "elfutils programs needs a glibc toolchain w/ C++"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC \
+		|| !BR2_INSTALL_LIBSTDCPP
 
 endif
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
