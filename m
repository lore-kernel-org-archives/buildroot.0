Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B145C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FE4660BC5;
	Mon, 29 Nov 2021 22:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L4cQ1r_mPu9v; Mon, 29 Nov 2021 22:17:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 005C56089D;
	Mon, 29 Nov 2021 22:17:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1854D1BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07D996089D
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXAjNXmGzwC6 for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:17:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5678E60610
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:17:27 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id o29so15864919wms.2
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5KKl0C7bMy15uqvmdDxEN34bdxeB59W4X1bu9QrHMQM=;
 b=eh887sb0MihK3svY1dcuzNQGlTWJ/hfOpFIzrtrLPMyJlrz/KwqfQhFwVrOeq6DStN
 lx7yQ64NyVPhdxUiHdswodIqJTt0WpQd4woLzdxkoMY8c7bsnoj1Bd8gJDHvku/rjfsS
 4wnMlduU2n+F9C5xIIExN0msD2m6z+xeLLc2lWXA6FxXoAOSvD3qHeb1rLClUyXjyomo
 wcFAEDLJ1n6arSv12P2ls2t/vT/z3uCTyMn/DMRkiZnyqr4MOgN2/oVWfRwdWoS87yPv
 8q3xFUehzpA4/MSrB/GJ10jYDd830c1+2m/VVyxQX5KC3YVM7GOsv8Pp1ws8gIzyYcgp
 WGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5KKl0C7bMy15uqvmdDxEN34bdxeB59W4X1bu9QrHMQM=;
 b=bAeCJL5p0Pqp9Rt/4Rm7lT61Htmn/kInOzNQGLC3VWuxEgSZihDBZKBPiVjFee9E0t
 Nn2d7TlTaPo8CKqv/iCRWn2w1U7ULjyu0vRgKOzHQ5EpuLLXMoB+ZdqGkl1aDNXroRot
 TIyaDIQTNPc8gxM/DTHAGegY4xjUt7+/85BquKKxg6NS8bKGKDuo6D8vdUdKvSrwAIsT
 rDQx0j5rVQUjV4woBv7iPqQ4wCNe1FRGqY/pEGmtkT3CxSnpuzsd2BJ46/Fv9csSwMw4
 CIM4gB/W/4HuI5pBKSAC3w9fxpOhOUYojRoin9PsBnoXnOd8INdCBPURsQ/7J9pFCqg0
 yVng==
X-Gm-Message-State: AOAM5339IUXI5B9+f9myxfoR+/0kF5Qh5RajNH8LiltTrwRiEJ36oPsK
 A25YjBuI/MLFPkwuWTKtecxet3choBI=
X-Google-Smtp-Source: ABdhPJyYmHU28Ilg7B3oaKgKwVfAe7G3v1a6bjGcUBcu/VcBnW4Ui0I17FUp29MwIka1vmA21ld07A==
X-Received: by 2002:a05:600c:500a:: with SMTP id
 n10mr819459wmr.136.1638224245443; 
 Mon, 29 Nov 2021 14:17:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id z7sm481057wmi.33.2021.11.29.14.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:17:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:14:51 +0100
Message-Id: <20211129221451.2183558-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/open62541: drop spurious space
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
b36ea68b5ad0f89ffd92cac3f91654e180683b1c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/open62541/open62541.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 671ec3b2dc..66777ce501 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -27,7 +27,7 @@ OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL
 else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED),y)
 OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=REDUCED
 else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL),y)
-OPEN62541_CONF_OPTS +=  -DUA_NAMESPACE_ZERO=FULL
+OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=FULL
 endif
 
 ifeq ($(BR2_PACKAGE_OPEN62541_JSON_ENCODING),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
