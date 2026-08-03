Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A0DC55197
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 07:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 959EB6071E;
	Mon,  3 Aug 2026 07:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yP9uKjRzO1uI; Mon,  3 Aug 2026 07:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E019860712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785740403;
	bh=KLLBCsMjzE7Kvb0VbsEU0uPleRO7iu3m2Cqxfq+gbm0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j7Lw9kxRkSyvEL0ccVWhI5rdaj7qZs+tQ5AqSzdu2v2c9CI6BPkkk9obbNu6FJiXf
	 np+T2vS1x1XNfpMjyGkc+NVb+g4qhuJLxZvvSBYqwceyMsj2rWQKvj0+iJKfclcahi
	 0NbcW6WpHUlZhgctlyzR0J4OlowcoCgi6paEx/HnlkXiksvybwk2om7zT8UmPMjI8D
	 oBvdyI3SBcLe87VHonsa5Pe2aYicIGVzQf4ZGwOisMB1B8SOezZg14gtZS7bzZ7An8
	 NzKAKNKVYq3q9PtwE+txqVi92bfP1Xt9mLctNBr/qFgXhJvFQwqzuQQsKhT3PCkItK
	 1+hS8suKjVCXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E019860712;
	Mon,  3 Aug 2026 07:00:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15ED536E
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0BD980CA9
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_9jrShdkR2R for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 06:59:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 02C1F80C87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02C1F80C87
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02C1F80C87
 for <buildroot@busybox.net>; Mon,  3 Aug 2026 06:59:55 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-495635a85d2so15996065e9.0
 for <buildroot@busybox.net>; Sun, 02 Aug 2026 23:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785740394; x=1786345194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Wz9gzzm84g1fYZVacKgT3qwJP0zNfVIaq1F1ENRbPyw=;
 b=axN1eyiZ46auDoEtysD52ddA1tTwivg8DXNPD/ztS/tZbAPIpUloeFBofX8exUxB8B
 rpO7TumhcSWNY/P8RrJgSXIziMBS6xVX0rNXaqLD1KIrBLOSB0UcEupz/Jw1rP8T2fpO
 8V5KR2GFUAqR3kZrA660gO8ovlkbXYxIV+GlCNuMN+6dYkAD5znO1kU2D0iY/nDTqpaN
 0S1f8/YR7hyBtOXu/lwZzSW/EEaNYESKHuPDHNno8ab1bVDtzZMawgl06e3fxaky/doj
 yFTvTp201PN8DVeOY4s5vtab9914eXbegJCUdlCItslpEZhlDcZL2nCBvJ7apRabADTU
 JVcw==
X-Gm-Message-State: AOJu0YwZBsbVQG9a7X0wwbZqKWEnaXzgqsddZH8KZ8MPRCUlXKqitAuI
 Wkk4tdy9nhI/qRCUMA4FJpBuZqf2b1jJtEQZTI/qTIJi/+hXG8ncUSBAQY7IIA==
X-Gm-Gg: AR+sD10W31urvuLQufz5ZX7vbDrsxyGsPWwLtPxV6kIFQGIJw90IHCWBf7tjkGX6ezQ
 AppxZXcIcIenU1LGsmK/1Li5tES+TvfaO2Bj8/KS26gA7595bZ+QhAM+MeoCbM0qApHGvj80ddU
 L7SfaoUAepU+xgNlFa84wxjRd/LnQQGrCtb4DbakU1FibGboS/Z6YGmRRbvygtXoOd7oAik3/WX
 kX3MLhyQ3FRGSHFw0xNGu91ULXynG4Ao+tsAkZZvnGR+J9UQKQMUgfovo4Bn6goLmqt5lP5C1yO
 73wcAiUXJJHcIs62w+q1zb+hpba2l4wImCY4d3gjXLOcxKLAeRZJVGkNjzezLBGwv1VYAA3KcA2
 3OMdKuBr6gCFNuTTWKC5sbWtz8FxY9lnqxAgUSgjUvEuwqsqHUiozCXKIipEEP2bd6axoNxpjjl
 DudWNerp/4boYXKwd5qwErM2I81e4SfDcxM5Id8tNcE6AcBPlBstV/v9n9rpTTUWVikPkf/3Yy4
 zHYTgaFaeDtS3nh1y7z3g==
X-Received: by 2002:a05:600c:8711:b0:495:52a5:8829 with SMTP id
 5b1f17b1804b1-4980c652515mr231644475e9.11.1785740393849; 
 Sun, 02 Aug 2026 23:59:53 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b5b4a2sm234639805e9.1.2026.08.02.23.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 23:59:53 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon,  3 Aug 2026 08:59:38 +0200
Message-ID: <20260803065940.224429-8-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803065940.224429-1-francois.perrad.86@gmail.com>
References: <20260803065940.224429-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785740394; x=1786345194; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Wz9gzzm84g1fYZVacKgT3qwJP0zNfVIaq1F1ENRbPyw=;
 b=qLNvzBzXP8Ah7m4UGxM4uD1xEtyT4VPVC6YuDy0MIfMrCjoxLRp4x0kFXdJyxdVOb1
 XVW7dT8ye8vrFldvYWDrDMTZuhl6f1Th3I+FfhJYH3WGcDCbpD4vjjRKhbHO1cBURaRp
 rv/SMxZRdM1Lyz+AX0uPdIcfFYj1U5oeJOCOqWned5BIfgKInIDV5anQZt2dEz1HjEma
 E+LFQKvAT8v5DrGsRZN23oGhTUBCoXTKk8T6zLiIDVU8oXa1/GqhvafnqHfPvmNu0A9n
 ctdzQwF7cJHGXRay9ayILxiQgr/fmsE+TcoBLW4TRP/n0TN5t+Efzo8S4g5M26AOrYmu
 JmFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=qLNvzBzX
Subject: [Buildroot] [PATCH v4 7/8] package/hare-xml: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/Config.in              |  1 +
 package/hare-xml/Config.in     |  8 ++++++++
 package/hare-xml/hare-xml.hash |  3 +++
 package/hare-xml/hare-xml.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/hare-xml/Config.in
 create mode 100644 package/hare-xml/hare-xml.hash
 create mode 100644 package/hare-xml/hare-xml.mk

diff --git a/package/Config.in b/package/Config.in
index 5cdf0c13d..1d0dac96c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1883,6 +1883,7 @@ menu "JSON/XML"
 	source "package/benejson/Config.in"
 	source "package/cjson/Config.in"
 	source "package/expat/Config.in"
+	source "package/hare-xml/Config.in"
 	source "package/jansson/Config.in"
 	source "package/jose/Config.in"
 	source "package/jsmn/Config.in"
diff --git a/package/hare-xml/Config.in b/package/hare-xml/Config.in
new file mode 100644
index 000000000..469a9907a
--- /dev/null
+++ b/package/hare-xml/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HARE_XML
+	bool "hare-xml"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_HARE
+	help
+	  This package provides XML support for Hare.
+
+	  https://git.sr.ht/~sircmpwn/hare-xml
diff --git a/package/hare-xml/hare-xml.hash b/package/hare-xml/hare-xml.hash
new file mode 100644
index 000000000..25c1f3c1d
--- /dev/null
+++ b/package/hare-xml/hare-xml.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  56703cc20f70878a02f37967385e9af3659733b31c91c5f34cf819d235a20a28  hare-xml-0.25.2.0-git4.tar.gz
+sha256  be782a711236b742d7231a4a9a15ca781013e61dead0d6908105fbc2cb38a317  COPYING
diff --git a/package/hare-xml/hare-xml.mk b/package/hare-xml/hare-xml.mk
new file mode 100644
index 000000000..be30fd934
--- /dev/null
+++ b/package/hare-xml/hare-xml.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# hare-xml
+#
+################################################################################
+
+HARE_XML_VERSION = 0.25.2.0
+HARE_XML_SITE_METHOD = git
+HARE_XML_SITE = https://git.sr.ht/~sircmpwn/hare-xml
+HARE_XML_LICENSE = MPL-2.0
+HARE_XML_LICENSE_FILES = COPYING
+HARE_XML_INSTALL_STAGING = YES
+
+$(eval $(hare-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
