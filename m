Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4309FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 13:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9ED5040376;
	Sat, 19 Feb 2022 13:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFkli3dIDWyP; Sat, 19 Feb 2022 13:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 858B4401DF;
	Sat, 19 Feb 2022 13:41:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 061FE1BF859
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 13:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0336B823F6
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 13:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8tk_raj7X3M for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 13:41:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1672823E3
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 13:41:04 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v12so19153708wrv.2
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 05:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VfuKsD7zYBrADwB46PooG71sxElurqvNKUCu8vNe7tA=;
 b=qfnt1rFVdq79hpJ+ZsEtgB3Of6YlqspEhrDdhzYykUcAH3hq2xDhuhhv6FTMsy89/9
 EuZWWYIDwS3ztozYfKDdhp3hi08+2RH6H64N1lCM4EcufFKDWBK1ytjUBJuYO3f2/KOg
 Sx5xEonpan/wJgZaptilyIiDqEcFxQNMw6XIwlIS0mEly9cTU4Xbmz2XLbVXJ4LWeo3C
 AqcDM27CMPBOiq7tEuE0ejkBstzaaU1S7WUwISpFbbpEOSOdaPnwyDQbFNcAWq/pr5PZ
 sHhpb+o5poS5FpYptKes72hMC68682mSfiXXWKJYyI8Pk9z+uouGcpF0jUnEsaLvbzoX
 P1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VfuKsD7zYBrADwB46PooG71sxElurqvNKUCu8vNe7tA=;
 b=4VcaEAeSATja5A37ThfVaky8UcE1xVKniS+Lqnv7tJJewLWcZQna5ng/bnPF2q9HIu
 WRA/rHqhP2UnmOjmJto89ZN7a1bWvHyOt7kJ3yLZDgKR2WnzwoyBa9TWc02zl/jNlWFn
 1sFQhqmQouLmnNo5Op8XaNiUPAHiWOmlZlagP0EApXN1DbX0VfpEcaYtKrDJxQ9hhEjV
 YBRnvwNSuMbqstPGDeG8C5ECylSsviwEDz27fDwWOmcSYz/OLb+iUFIyIuXk7Vt5OHDl
 wm1TIZGrIQBQbPtox7HohM+SfoRbQMUnhREL5SuLHzGqRUqzjyZZbEMixkTisyUgTALN
 Mmtw==
X-Gm-Message-State: AOAM531CAYnxJs1hJXkcFmz6dXhim91V5j2x1sh2NupXMprdACCe2mnD
 r9mGygXNDUuQnQk6trDoNWUktBjwUU8=
X-Google-Smtp-Source: ABdhPJytHYHIFpb3NUYE+XX8dqjLPCDpwnsqOTF1vmCtoEkio9tI519o8hPIS3/uOi2mYnrKMzo7WQ==
X-Received: by 2002:a5d:47ae:0:b0:1e8:e479:fa8e with SMTP id
 14-20020a5d47ae000000b001e8e479fa8emr8650847wrb.169.1645278062391; 
 Sat, 19 Feb 2022 05:41:02 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id b7sm33861375wrp.23.2022.02.19.05.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 05:41:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 19 Feb 2022 14:41:04 +0100
Message-Id: <20220219134104.3403344-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dovecot-pigeonhole: drop
 DOVECOT_PIGEONHOLE_FIXUP_DOVECOT_CONFIG
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop DOVECOT_PIGEONHOLE_FIXUP_DOVECOT_CONFIG added by commit
0901355c11f051846744a12f9b2044a751faa47a which is not needed since the
addition of PPD_FIXUP_PATHS in commit
b06294e9897e90862656416e8b67fdace15488d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index dd533977f4..62d9909cf5 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -15,12 +15,4 @@ DOVECOT_PIGEONHOLE_DEPENDENCIES = dovecot
 
 DOVECOT_PIGEONHOLE_CONF_OPTS = --with-dovecot=$(STAGING_DIR)/usr/lib
 
-ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define DOVECOT_PIGEONHOLE_FIXUP_DOVECOT_CONFIG
-	$(SED) 's,$(PER_PACKAGE_DIR)/dovecot/,$(PER_PACKAGE_DIR)/dovecot-pigeonhole/,g' \
-		$(STAGING_DIR)/usr/lib/dovecot-config
-endef
-DOVECOT_PIGEONHOLE_PRE_CONFIGURE_HOOKS = DOVECOT_PIGEONHOLE_FIXUP_DOVECOT_CONFIG
-endif
-
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
