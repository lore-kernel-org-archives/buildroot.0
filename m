Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D05C433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 21:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D6BC84342;
	Wed,  9 Mar 2022 21:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fD9BXCYhjJbR; Wed,  9 Mar 2022 21:55:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2243D84241;
	Wed,  9 Mar 2022 21:55:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B36AB1BF37E
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB2E540143
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EQSeuFo6nhcA for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 21:55:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 844EA40142
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 21:55:39 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id s6so3120687qtc.4
 for <buildroot@buildroot.org>; Wed, 09 Mar 2022 13:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x+kAQqjDRNM3aWWJnd6andR/H9Fu3enAlAB0qMr+jLk=;
 b=pctnBNFwyRYxDcs3US+b+oSWicNziDgK+z5jUAD4qKDpIS+MSnSmf9QX5TYmEHQNzl
 lYr1CNcRM6vQkc2lEKXVZNmPM1XNUmsJ/kl2PKw3xMo001lVHBaSWZvViYnuxIW6T9Wp
 FAO2ACcpCHnc4u3Im7iW1Tr6IaNNQfqSitf1NJJxzGJNVyRRtpnczUz3e7BINyk9kmud
 YMgp0OATinBPqFLXU7QfJ7/fmUA1QzVFE70C5NUG+niEZX5txzT9jo25Qu4alD7Q6Uce
 i2HCdDpJr9mz4K2CGckmamJYwxwfXH8KGfmGb8Cz3JtbjInM1o9iCk+dPzzsfYV5Lwnl
 SD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x+kAQqjDRNM3aWWJnd6andR/H9Fu3enAlAB0qMr+jLk=;
 b=lITCUhmTXS7mQ32jTB4iwysxprg9lRpvx98HwyF7f+mLgjYll63+Zv4QvUOhcmAt8c
 ptDgCNhMEAr8viJ2w437PsmVoe86sg+uy7jtM0zPPSwrI0mOnwQzc2K+pXLhUU7ciffA
 ksrRNDgBfKzexN7J/G5ZcoDh3n158qImQu9mzLXSZ+R8FCIgVZm/TDuIBV/zAe3popnI
 MnklkmTO1xtuxi0POZhEQQE9natDBpN6IIHekffLoKnku59EqpiQAOw/OcOPdNW6MX98
 Clo+EzAiSfHhycoD1uC+OlTs5rE8F2pNBUxxUFuK3s+mzDSB3DW3FMPtdxR5ZPy2R9pB
 Dn/g==
X-Gm-Message-State: AOAM531GxrNNRlpJ81oEBZe/HrBfEhpooV2Pbw7fT44/M+2re67vPKtR
 MFO6TF3u1wTQ3xmhSwqkyRA33dL0Rxo=
X-Google-Smtp-Source: ABdhPJyIQ5Ee7ewAuf7lkAqeBAN8upn/26oU/RR1Wdp2UotexR5XYfJWVNI3HIZqjf0itDsvVrZbtQ==
X-Received: by 2002:a05:622a:145:b0:2de:b3fb:7329 with SMTP id
 v5-20020a05622a014500b002deb3fb7329mr1563825qtw.472.1646862938127; 
 Wed, 09 Mar 2022 13:55:38 -0800 (PST)
Received: from grrm.ddns.uqam.ca ([132.208.12.65])
 by smtp.gmail.com with ESMTPSA id
 i68-20020a37b847000000b0047b5486eb0bsm1475087qkf.62.2022.03.09.13.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 13:55:37 -0800 (PST)
From: Yannick Brosseau <yannick.brosseau@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 16:55:31 -0500
Message-Id: <20220309215531.638593-1-yannick.brosseau@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] docs/manual: Remove link to emdebian and
 replace with debian port page
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
Cc: Yannick Brosseau <yannick.brosseau@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the list of full distribution, the FAQ contains a link to Emdebian.
This project stopped receiving updates in 2014 and the main web page does not exist anymore.
This replace the entry with a link to the Debian ports page.

Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>
---
 docs/manual/faq-troubleshooting.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 5adf3fa6ce..b08bf9bc4a 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -45,7 +45,7 @@ distribution_ and you should opt for something like:
 
 * http://www.openembedded.org[openembedded]
 * https://www.yoctoproject.org[yocto]
-* http://www.emdebian.org[emdebian]
+* https://www.debian.org/ports/[Debian]
 * https://fedoraproject.org/wiki/Architectures[Fedora]
 * http://en.opensuse.org/Portal:ARM[openSUSE ARM]
 * http://archlinuxarm.org[Arch Linux ARM]
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
