Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204CFC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 17:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6031860BAD;
	Thu, 17 Feb 2022 17:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MtvV0jIFsz76; Thu, 17 Feb 2022 17:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86C9C60B8F;
	Thu, 17 Feb 2022 17:26:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C00C41BF322
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 17:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC2E3415BD
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 17:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSDzLcQ8Wr2x for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 17:25:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20DF2414C3
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 17:25:59 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so6750032wme.1
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 09:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xntTUSCxH9wgKFhSM7GxuHrjsxpi0RxRXGJAt6HP5uI=;
 b=WduV3PtsfWFCLYhqpuhbpgbaku7YShqANV1lB0GDPFoDGcYdyvl5C3MJOXxbPEdlcl
 cYrqJN/0Bp6ryYsxwqE1snQBX6sj46QO5hLKPNwmP0eGniQMHWOOMNWlEu/yxxMf9lKW
 YiKbbiwcOSGrW8U8LYGmP/famm8Ey+592GHCPMkICmF/NJU6rUgK9F1H+DbLAdZChoev
 aeIRuh3slD8hUeawys/kh1AtATNmbVvbKKjIiiiXX+PPAPhWKKpdiFUZBlCe5RUwcquG
 mnfv7KOyf8GOBCTBwXiPTnOUTdr8/sf5LjDzgqM4MZdChPhu1qSe7HGC581bt6jDXwO8
 z6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xntTUSCxH9wgKFhSM7GxuHrjsxpi0RxRXGJAt6HP5uI=;
 b=sUbv4gedrkgJH8uwiC/xMS8t85l1KHq9tzzxao1XiVxn8mga82PsZVoraGAh4t4LHG
 /E5gLIE4c09QAAdhZLPjVkVnrO3IhPpALOW5pq6P6Rof6NVe8Xnx/hhpTg8w+yLNpd6D
 Sxt2DlvVHjq8RWId+NshwZ5pC0eSWP6GSSCvGOFzhCM7kFhFnT15aNUzsvPSRAkeRebg
 Y53jcyXp61sOkaZybE4XOjTFBiSZuV8S4yVlh5qewUxyWlYk9iTWyrQtWuomAt3zps7d
 ca2D239CTXBKdY1YQ+DrLE1Fg8blZBvuOXzI310V6U+iPeuuBTsDFCUOrnHJIUer40tt
 6Ssw==
X-Gm-Message-State: AOAM5321S+OoWf8wGguLjc0DFH6nqnkuGBBCkTycrWNV1moy7EQS/ntK
 Tv6PCz8an+le7KBSw4K0718hmaLpzyg=
X-Google-Smtp-Source: ABdhPJxr2wlcWEjlRfOv7VPXk11OyiyiR/8Cwf0aI36CRwnTDVG3132XqKyJhbfb/rQdgy6F2sJPTg==
X-Received: by 2002:a05:600c:2108:b0:37b:b89a:46b6 with SMTP id
 u8-20020a05600c210800b0037bb89a46b6mr3632756wml.83.1645118756996; 
 Thu, 17 Feb 2022 09:25:56 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n2sm2402065wmq.6.2022.02.17.09.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 09:25:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 18:26:08 +0100
Message-Id: <20220217172608.552983-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/psmisc: don't override
 PSMISC_CONF_OPTS
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

PSMISC_CONF_OPTS is overridden in a conditional since commit
953b0f4de8ebcb5b42c8da760c025873ce82550d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/psmisc/psmisc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 3d0d2c5367..8b92be11e8 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -13,7 +13,7 @@ PSMISC_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
 # Don't force -fstack-protector when SSP is not available in toolchain
-PSMISC_CONF_OPTS = --disable-harden-flags
+PSMISC_CONF_OPTS += --disable-harden-flags
 endif
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
