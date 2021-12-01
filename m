Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1D6C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 07:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED3BE404E6;
	Wed,  1 Dec 2021 07:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id khOkSeByfqvV; Wed,  1 Dec 2021 07:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70412404BD;
	Wed,  1 Dec 2021 07:23:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29A4A1BF32A
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 07:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 176D2400BA
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 07:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YPnW9bIHkDZ5 for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 07:23:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26894400A4
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 07:23:39 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i5so50018175wrb.2
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 23:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aeI+vsax08zAJcrqSlOAuRhKPaHNM2epm+1VGo7CNi8=;
 b=c1xhJZL1VIm1YKWLWORPKBHz3bsFwYyobD/LpF8fyLlntxO5Jw34+bqaU/1Zs0A9pJ
 4+Of6vxJXTGWP567Z6uPh/h0i1zC+JRTCiNCY66Gy8hNQchgELXp/o6cF82HsyckU/ws
 9P/5H7KrHoTP9Yd8jR1a0ws1NYxJexdNuDrHL2mpsbA5T3sbBwCAmocta7uNF2Hv1+lB
 VXT9xVbv5gn9BE7tF11KZSLl1khDx6dgb0O8190qDT2IEi2Gn5r9UNcQY6okMRsbiWgi
 X9RgFs5thk50f2oizbDOlCEH/AlyEBh75/5+Znm8/tnfZK5V9F9AWhHcqaw/aOfONMQG
 /vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aeI+vsax08zAJcrqSlOAuRhKPaHNM2epm+1VGo7CNi8=;
 b=TmfNE16BAFtj1MkYYsBVLStOR+RJTiavBUGSRWFlnA+QnVQk9RMUQcTwOwayobUs50
 oJJ4wh/EQ8bX09fy6grROXO80VGf4QAvV6CS7ffo1L6xdsuIBiswqRICjFwn820WJU8w
 fBIGif+oA2uYCun5kRw3qs63w5jSkMqJFSrMYc4c9xLugBROvufm1t+Hv3sdoCi3kbGK
 yUeksz9QeTYKl2cLk1M8zHLn71iNd3UDKuSQEgT5NlpaijTnKkoEV9//ycW3grDoHrsK
 Gqz1fQicUNRsWbDzWhA3DowPRUhAeZur+g0kiKH7UmLnarcDBiULfIr1tMNDLPsbpbHq
 KIkg==
X-Gm-Message-State: AOAM533klwrDawwx45sECQhHX/02w1Ukzq+Z0OhGYKeQmaroBKhfvGYA
 r0NQ66iuh/HPNqn1nUlcV4IYayEHwBzKUA==
X-Google-Smtp-Source: ABdhPJyekKQGX1uOzvQ/vK2PP0YPZx5TdxQpVle+3M6tkMvsZiKFD/9XJJu8OEhgT2oPb1PPkDe+3w==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr4680950wrw.21.1638343417819; 
 Tue, 30 Nov 2021 23:23:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id q26sm18807589wrc.39.2021.11.30.23.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 23:23:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 08:23:51 +0100
Message-Id: <20211201072351.565700-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/linenoise: drop spurious spaces
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

Drop spurious spaces added by commit
d87847203f3b1b6af51515978563f0dee737b6fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linenoise/linenoise.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index f51e2871e7..a8fe7674c2 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -19,9 +19,12 @@ define LINENOISE_BUILD_CMDS
 endef
 
 define LINENOISE_INSTALL_STAGING_CMDS
-	$(INSTALL) -m 644 -D $(@D)/linenoise.h          $(STAGING_DIR)/usr/include/linenoise.h
-	$(INSTALL) -m 644 -D $(@D)/liblinenoise.a       $(STAGING_DIR)/usr/lib/liblinenoise.a
-	$(INSTALL) -m 755 -D $(@D)/linenoise_example    $(STAGING_DIR)/usr/bin/linenoise_example
+	$(INSTALL) -m 644 -D $(@D)/linenoise.h \
+		$(STAGING_DIR)/usr/include/linenoise.h
+	$(INSTALL) -m 644 -D $(@D)/liblinenoise.a \
+		$(STAGING_DIR)/usr/lib/liblinenoise.a
+	$(INSTALL) -m 755 -D $(@D)/linenoise_example \
+		$(STAGING_DIR)/usr/bin/linenoise_example
 endef
 
 $(eval $(generic-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
