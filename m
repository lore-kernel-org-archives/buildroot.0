Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239E0C54E60
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 21:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC676402D7;
	Thu, 14 Mar 2024 21:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZIOaCo1BRwo; Thu, 14 Mar 2024 21:33:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E86BF4032A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E86BF4032A;
	Thu, 14 Mar 2024 21:33:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 450581BF3E9
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30B6B414BF
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3vaYC-THpihe for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 21:33:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C54B74149F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C54B74149F
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C54B74149F
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 21:32:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33ec7e38b84so717148f8f.1
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 14:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710451977; x=1711056777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X2cxg6FEOzpOCI8O6YZIiOx9NjuQKTER73LAN7OM7q4=;
 b=RiWaT3I4NS7Tpps+0CG1sNlgU7Ez1bMsYo98SIRtBWtBvbnhY4wLGa73nSKaFUwjcz
 m3hIRGR0VKYBgC3OG1Mg09pjg+d0ceGOHlnghu9BA81fsFe/GvZgCKDKywy2iBg9YJjR
 hOwPeM3nC9fr6Wb4DwV6PPTRRNE+CE189Q+XolpJCpXSnJg+bF8c6MILeLjbA2/386AH
 Ep5lZS5zbYnMkQZGyAXqi++fgGye2x6khPGpdF7BJSaIv5cEXBJMDEmYKk0RbGK6cZM+
 SpF9YFrcSX+0STGhkE05semb6D6KrxllGbjSInUzTb62SoCojB29YgaWujcKAYTfq37f
 4C9Q==
X-Gm-Message-State: AOJu0Yz2upHp7b+yKXxQ+9Wrv6sBgmLwUUfedUTPh1yyGNabBqTdPPoP
 0C7qn71i4BUCvrc/OFZoag0rCncZYkPzXzs6Eu7iTecLMGYk9CA1YoMuOkHq
X-Google-Smtp-Source: AGHT+IGCBhcVpYFkWo460lBdiHhEyAY7EASj6+jLF1xOCf9urhnXyJ/acqGWcBGF7/6AcbMryUv43w==
X-Received: by 2002:adf:eb11:0:b0:33d:2472:eb8c with SMTP id
 s17-20020adfeb11000000b0033d2472eb8cmr2047612wrn.19.1710451977169; 
 Thu, 14 Mar 2024 14:32:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o14-20020adfe80e000000b0033e8c50fc3fsm1563684wrm.90.2024.03.14.14.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 14:32:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Mar 2024 22:32:52 +0100
Message-ID: <20240314213252.346954-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710451977; x=1711056777; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X2cxg6FEOzpOCI8O6YZIiOx9NjuQKTER73LAN7OM7q4=;
 b=MEBxJN1hZ+ypijvqh9ud1XZ9fPNYYGWHu40LN0aslGjva5Ce/q6TltFpBdGfwXpsA5
 cixAM6kkIe7curfRUeAOKPkTWtpnN5YSkkBSIAWJXsstQ6FYKN6WxW/pSA20BqobaXTj
 xe3JOStxtYDSLO0XqUGosTdcwB/8KkUm25Gvlj+4ptELQSxrnKhPvcYKGSZzhjpOLPlz
 g0qfE6eKcbhIGhO2m2mLGuNqO2QGIaQxvkT0HFjJGSJyfuiwMELlophXlnhTSabHwpUe
 1FqeQn9K9suO9zFpEzyu0E2r88iq2RALJOhAIVO+qZPqb9yCJYoh7jJGJua6GRzCtNVf
 /9aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MEBxJN1h
Subject: [Buildroot] [PATCH 1/1] package/libkrb5: force arm mode instead of
 Thumb mode
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure in Thumb mode:

/tmp/ccdzbA2E.s:845: Error: selected processor does not support `mcr p15,0,r2,c7,c10,5' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/08be1fa0fee0f05818cd78d4718caa3476c570ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libkrb5/libkrb5.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 62a34b2379..c58763eddd 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -33,6 +33,13 @@ LIBKRB5_CONF_OPTS = \
 	--without-tcl \
 	--disable-rpath
 
+# libkrb5 has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `mcr p15,0,r2,c7,c10,5' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+LIBKRB5_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 # Enabling static and shared at the same time is not supported
 ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 LIBKRB5_CONF_OPTS += --disable-static
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
