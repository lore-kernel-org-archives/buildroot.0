Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621C0C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 18:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E76534060E;
	Fri, 22 Apr 2022 18:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YimDQNxjN1oj; Fri, 22 Apr 2022 18:14:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1769C40A98;
	Fri, 22 Apr 2022 18:14:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E4B31BF330
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 18:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BB3360F18
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 18:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUxrZJAjUi8C for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 18:14:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78DF060674
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 18:14:37 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id n18so12573583plg.5
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 11:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oN9WEvaWKwHkorg4308h67AqBrhHkSWnQpcp2T3opSE=;
 b=nZop9DmpFGamxj5Wp5pIWhQgAndeKbgkkSXBqZ55CiUlvkTgDoetHMryCbtrBGWtKl
 BJW/ViCmY8oWqbtW/9R7xE5AzgnrTztNNqcvrKOw0jXEoHGhYmianLFAEVC/5ff/xrks
 kxsxULmfZybCkczHmZANLHC5GR0Os2AxcaJOlFAPqv+lmOuGumN06NdlcZxoSmrJpfNB
 aG9u0zJDSz/6sm3cj3T1SnbgptN/bE2bBjCWPKekluIwB3BfbLWHVvMIHSzZL+cEOr+T
 KKYZnpK+6bliSK32SqRwS6eBO/e/rpiG301mGZxvVt4yEMtnhcQONtkX2EbbiNsKy0lS
 SBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oN9WEvaWKwHkorg4308h67AqBrhHkSWnQpcp2T3opSE=;
 b=ezijh+rtcOFJLZfA0XwDWE5odxCv0H4LvPOJDWQe0lXgrbZb38NHoeYVvdxpdTNBMq
 XLi2/l5610EwuoDnfoPfJujQgZMmse2gS/mQ6gYiRdHUVkLAX89F7CKcVRAnFqycxUm4
 JYNZ67gbqUt5uo4iwHMWegTVuCpUaX4donKh8u49p69sarekmHndiahpyrnisbQfhAZr
 Aced8HJ+dLnYBAAi75ZClnYdpiosjyv/jSV4naFpbrFu/Bj4rJQClDRDQMLNkoZmbAyW
 SRC8DSJCUFlOOAc39boSlXxAS2FYuGFylzbbtA84fGi2Z1u75zBGPa24zfulusWpquwO
 FZeA==
X-Gm-Message-State: AOAM531FOQM/7aJkFZzXAoUjGlBBUll1IPWBkm2XY17l3yH1qN3vvqcA
 l+ORgNuZKMdJUq5f28RM39fuErhRCuhbxQ==
X-Google-Smtp-Source: ABdhPJw9JPx65bCNtZlDpo90H/FcfjzP3tBNEbiTrK2Y0rKER0Bs7Z8evKWsMCftnyIi2BgOSWS72A==
X-Received: by 2002:a17:90b:4b84:b0:1d2:ae96:6c27 with SMTP id
 lr4-20020a17090b4b8400b001d2ae966c27mr17773969pjb.70.1650651275823; 
 Fri, 22 Apr 2022 11:14:35 -0700 (PDT)
Received: from localhost.localdomain (172-223-248-144.res.spectrum.com.
 [172.223.248.144]) by smtp.gmail.com with ESMTPSA id
 124-20020a621982000000b0050a73577a37sm3301175pfz.45.2022.04.22.11.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 11:14:34 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 11:14:17 -0700
Message-Id: <20220422181418.2411463-1-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/nghttp2: add host variant
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/nghttp2/nghttp2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 9190fa30d6..5f46f24431 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -21,3 +21,4 @@ endef
 NGHTTP2_POST_INSTALL_TARGET_HOOKS += NGHTTP2_INSTALL_CLEAN_HOOK
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
