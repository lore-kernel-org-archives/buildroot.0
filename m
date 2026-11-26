Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402A1606A31E
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 16:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Xo6Tjucj;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=jB7TDZZ9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13202409CE;
	Thu, 26 Nov 2026 16:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wylj3L1NblUP; Thu, 26 Nov 2026 16:08:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 234C9409C1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795709332;
	b=kPUw4INasvM8PdG1D64q8a1GBFQkJKxP0iOxUNKKpmzWoK6bvDhR+ubTcA5hryHYjm3Z
	 VQaqSY3Dr6Mq37BPR5Y893p7CAj4F2u23SIaVPZgmpEQ0i5XcfLO4TPukYs+H60iR8uRV
	 Toe5cSXumUfHf92DFkHWQ8Mp7Q7+b2USUnvHIcRbeFGkGgg1V0MYjTDjZHuEgm9ZdCML/
	 tRAnaGJiEHDLCpOBS2Krjuk/8BUysOfCJOZN99TPROizLVoNukG6258OKgCjeEEftml1h
	 MTnM/OVtjp5nmAH2pv1/wd10IPFh2fYFB3PKM4GKKDWcYG7mH2th/LNUGdrBUszyOAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795709332;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0NttIKxQAVAKgoeKQ7W0EccuZtoCNOKbGUf/Wt3UABQ=;
	b=byQdnK0QDQJ5wQuaZwIwhObSqoS+xaZ+uIyAxEDxZCduHQFGClKIgp4j4N66GW5Le440
	 2qDzDsazBsoGgg+DTqj1QQ92GfJ7zJq7BmRb8pcKvOguKk04txctYhh8KVY/u2rLNKcUU
	 fw+5I9bIhpLAED5SaoxEIMCjTjkp57i24ShyMt1nrdtVKIN7f8smU1AfBgqeF+E24Oo/w
	 lqgVaEfKT71XZNoozRJ8XcsZ1H4yW+3Fg9NZU3x4M6JGxhr1JaYZMW7OPuSIm3wcmGtR7
	 xbT59cSNNPW2SEP3twMn/P/HY+xkNDhALsqPhvjiDIu5JTroQhBsAGU7Lu4SL1ilb3A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795709332;
	bh=0NttIKxQAVAKgoeKQ7W0EccuZtoCNOKbGUf/Wt3UABQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xo6TjucjMtWl9LboG1h0jRi3fotP0Z4ExkkDYshE9Cw/en8+HverVGEFD+i18TR0d
	 KlAoAFlWvA4okfdlvckkcSlC4bWdsGIuQSTww0e70myKRWZFga/3zNoQ0/BtFGpOKM
	 6+O/oxHexQNw1ASEVptNUA11TKKS2SkXgkQudyh01B2WUNuTjbGm9ZlZE3P3f5/ar1
	 tDWf8+nJkFOZQpCkJBBU22mOnWLyp+EmVlwPzpdDQofHU4yhWz5WWv330ntTnQBVBU
	 MGerhDfHI8K81oVvPqVwQX5e6iXe8ygjM9qaiYKokQ59oOuTJcyKovmc52CZQY+rto
	 0PAavNAl280TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 234C9409C1;
	Thu, 26 Nov 2026 16:08:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EEC2410B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 16:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E03B580F7B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 16:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njB68Za-hhnr for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 16:08:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 78BF280F0E
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=jB7TDZZ9
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78BF280F0E
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 16:08:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4bb55cda775so44874425e9.0
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 08:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795709326; x=1796314126;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZRLgqvhtD3mKoxhiM1lfrog7w3RkGZllIBCFkkhUN6E=;
 b=jB7TDZZ9OPKVj98E2Wk3AVl6hHhEUBhJtREtZ7r3ahiifrPSyjH22vkaCPmpUe5PO5
 EQ+fbGm3vh880DMdtvnhZe5cULtQBMeuMliPWn9wVAQ7y+JVsFRPMOS4aXcrAzFLwoBT
 +ZpeJ2I/GoWI5G8xa6oEaPA5PoaR8VRsPaGiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795709326; x=1796314126;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZRLgqvhtD3mKoxhiM1lfrog7w3RkGZllIBCFkkhUN6E=;
 b=rYfOmTc2aUXDKsOQXiZIEzMxCLnYKt+nYQBzSymtm+L8xtUv29dimdq4Revw87Dw0L
 O3rO8FfpDRSJZM9DQ7XFXWW3O3cIA30lyqS6wgy4ATvRcvWVCSFvftpEF/Gx0pi6L735
 xezImVyTWPsprGmchL1YB4rRkgr3yAePMRe1i2l4cGFthdiIjMPAiYWQfFZ09ODDkSvU
 r3JDzgWC1UJvZnRxaYkivGWh0Owd5CG0bnTPEPzoreQpO0Ph4QdsiI9PWFfZeWJhSt0z
 td0urVNqa7iWpHV3UFs5IFExXhZsyi3/LEJZOa/dpx9IRgj9hVPVf/1bb1uRoCuGJ8oN
 +kTg==
X-Gm-Message-State: APuU4Z9u80Su1EovZM2Wsjut/3fjPWMLCe+Sy3lGosgEgZRdq2YPNet0
 ob1iHAd86aEfB3mNJ5nTlf7sCWtntgHEtQgT0qgfPlCwReMfZB1V3GnziwMiKwQPnRoOAZ3JMxR
 X1PFA
X-Gm-Gg: AZFdTZdWGY5HfTB60seIvwpvtQUMyx0hf/2Tgur8E52cZfPCtWsGVJyLSfD6MRyAI/H
 pZ1PLEeOiZQO5qLjx5nGfJHcEF5UjAxxhybZknKWnqVPNT2bknGri5o442K/Qqx26Mz8ezXGS/K
 KOaXxy5Onv09UjUIZ5mABFG3Q8DL0WMfOS5SjEeB70vnkPHK3ryZGzeTT9dAgEKzbkNEAn8ppfw
 +ukpjcSTF7T//WgX4M7mWb4HOQzE+F7VuIYs0GGh6T5dzlrCG4b6bK4ncJYbVwqBg8hRdFVA7YU
 0rOhdQTnE6v/CEnSLu3XOgOyjlX2vluuLhaR7pmfFbuCsdePSD+BHfBbwl1KE9wGOHqU2bDpvo2
 oeDDPsWsDTS11yqtYhUdXFh5TShWm8Kd59YS3VYONSJFSGEIPDEOO8Fs/6ejTiPOmra6ijBc5Jf
 Ja/RJpK8jomjE8h64hETUkkBfYje6nFdWuI8aPGuaQjEMpbfL+Bj+a+ul++vAi08Z3/JvejSZgm
 F99GwgaAPNnZILf7B3QRpELK5104p+iVVRKHhbLsYjvMJQqzi9bn/u89GcZ6LQc/o0vn+RT5QA/
 ftuLervH4HFYmUFbsI16bNZsb6quLFsS3yWbQqbqhIIcYiwDgWlHdMs9dp6HivtNBQWg/36HUt8
 0y2UDOxU20ixZOeaTIHEmIx+GcQoG0m/0oF9gydk1H4de2b01P4xPBb8tcrN/vdFlR3e/ViCeg7
 1x4FTojT0StThKqtFe7Ebicw==
X-Received: by 2002:a05:600c:12cb:b0:4a2:1104:7ca7 with SMTP id
 5b1f17b1804b1-4bb861576bemr334574365e9.11.1795709326116; 
 Thu, 26 Nov 2026 08:08:46 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67fe48sm37925209f8f.23.2026.11.26.08.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 08:08:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 26 Nov 2026 17:08:39 +0100
Message-ID: <20261126160839.1277903-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/qt6/qt6base: add support for extra
 configure options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Following the same approach already used for qt5base, add a single
config entry to pass arbitrary qt6base options, which are appended
to the ones generated by Buildroot. This allows to reduce the qt6base
binary size without requiring every qt6base option to be mapped to
Buildroot.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes in v2:
- Rebase on current master.
- Move the option out of the BR2_PACKAGE_QT6BASE_GUI block, so that it
  is also available without the GUI module.
- Use the FEATURE_ prefix in the help example, as done in qt6base.mk.

v1: https://lore.kernel.org/buildroot/20250910134822.2908515-1-dario.binacchi@amarulasolutions.com

 package/qt6/qt6base/Config.in  | 11 +++++++++++
 package/qt6/qt6base/qt6base.mk |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index e6bb99de28fa..dc8694fc72b0 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -17,6 +17,17 @@ config BR2_PACKAGE_QT6BASE
 
 if BR2_PACKAGE_QT6BASE
 
+config BR2_PACKAGE_QT6BASE_CUSTOM_CONF_OPTS
+	string "Custom configuration options"
+	help
+	  Define custom qt6 configuration options which can be used to
+	  enable or disable options not managed by buildroot. These
+	  options are appended to the ones generated by buildroot and
+	  passed to qt6base during configuration.
+
+	  E.g. to disable mimetype handling, add the option
+	  -DFEATURE_mimetype=OFF.
+
 config BR2_PACKAGE_QT6BASE_CONCURRENT
 	bool "concurrent module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 032947417259..26f7a6f7cc5f 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -426,6 +426,9 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
 endif
 
+# Must be last so can override all options set by Buildroot
+QT6BASE_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_QT6BASE_CUSTOM_CONF_OPTS))
+
 define QT6BASE_RM_USR_MKSPECS
 	$(RM) -rf $(TARGET_DIR)/usr/mkspecs
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
