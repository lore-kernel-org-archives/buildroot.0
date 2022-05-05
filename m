Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFDFC433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 04:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F091040236;
	Thu,  5 May 2022 04:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2lkF5cEKFNw3; Thu,  5 May 2022 04:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08F764013E;
	Thu,  5 May 2022 04:22:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1970D1BF8A8
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 04:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15EC44013E
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 04:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id okMXdvcDfrof for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 04:22:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA3064010E
 for <buildroot@buildroot.org>; Thu,  5 May 2022 04:22:29 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id l15so2153259ilh.3
 for <buildroot@buildroot.org>; Wed, 04 May 2022 21:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kXxalsImzbQTfAuXFnFJCCXPwMLi15X5I1PaNKss/OA=;
 b=JMceBpZJ6eHHPux4QQcDNYezd5EQNXjsfLtNmbPU92Yy8ut8iyxor3zYf0HLzUbluS
 IlUOYDPTj2UdbvmR+ZNH4J6uef5ZgmvsjBmDzGsbXIDmh+8das4/a0lq6DUe5cRsa7Dq
 sRSK/w2XR88+3IbXzlOZji2C0fQldhkt8MVFJjOn26r4HOpQOlLpAgTV+cdngcgNn9Dh
 tsxp5n00fNrZDAmC+iurhpt0rpj2WCHIeIH3GTATeZ7uFJwl22Cp5p1uh4eivcC30pbV
 P7zDQygTzMJ4XaXO6kZCYAQDAv/3Sma33kWlcVVVQQOclQmtB6h+Fp2sgrwY8fou1bBd
 kNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kXxalsImzbQTfAuXFnFJCCXPwMLi15X5I1PaNKss/OA=;
 b=d+E7CXIUhXxbNAtaRQ3HBSC4C1wftQxS5If0nK2jxoUIw8lxcjMUJBG0S4cWN2OEGi
 oenyhjYrzQiWIMRnbQ4PQs/PDrjnXc1MmzODx5lCfpyCEkkBZIW6QYnvVY7XOUhvM3kZ
 6/r2cgjxPwZekB4onf6KCrxMRdNnvtxojru8l5DYoj81u/3tSzd6A4r/+L80TzOOpJld
 dw+N3/Dak1oapQKrOZ2trPeeluC1YWCzfKlYeUU+lS37erwoHiSN0SC2kZ5J65Pzw2l3
 dRsi+Sp++jfPCljfML08oGImzIMp/WfNeaosMclu0hM5jHcKGPB2ElEjSD7cxBgnEOIH
 Kw5A==
X-Gm-Message-State: AOAM533eYu5N7KoDMeIUfts/sTGMKjy4Bv264P0xsgo2RFDchUL4MPIy
 bEbKSJClgCfsXzcDL0a8iUXzY5t1TO4=
X-Google-Smtp-Source: ABdhPJz5FinzFzKnoi2KTGZ9/bSogvlAEjoKy/2+MNfVJdLzG4OM6sXyrCqLaa3jdZhzSD8+UNI6nA==
X-Received: by 2002:a05:6e02:1c45:b0:2ce:7f37:928f with SMTP id
 d5-20020a056e021c4500b002ce7f37928fmr8834918ilg.182.1651724548884; 
 Wed, 04 May 2022 21:22:28 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 n14-20020a92d9ce000000b002cde6e352f7sm174196ilq.65.2022.05.04.21.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 21:22:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 May 2022 22:22:26 -0600
Message-Id: <20220505042226.2216083-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: add support for new cpu
 families
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add mappings for new cpu families based on the reference table:
https://mesonbuild.com/Reference-tables.html#cpu-families

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-meson.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index f1390a18d0..ff850fa79f 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -36,6 +36,8 @@ else ifeq ($(BR2_arm)$(BR2_armeb),y)
 PKG_MESON_TARGET_CPU_FAMILY = arm
 else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 PKG_MESON_TARGET_CPU_FAMILY = aarch64
+else ifeq ($(BR2_csky),y)
+PKG_MESON_TARGET_CPU_FAMILY = csky
 else ifeq ($(BR2_i386),y)
 PKG_MESON_TARGET_CPU_FAMILY = x86
 else ifeq ($(BR2_m68k),y)
@@ -50,8 +52,12 @@ else ifeq ($(BR2_powerpc),y)
 PKG_MESON_TARGET_CPU_FAMILY = ppc
 else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
 PKG_MESON_TARGET_CPU_FAMILY = ppc64
-else ifeq ($(BR2_riscv),y)
+else ifeq ($(BR2_riscv)$(BR2_RISCV_32),yy)
+PKG_MESON_TARGET_CPU_FAMILY = riscv32
+else ifeq ($(BR2_riscv)$(BR2_RISCV_64),yy)
 PKG_MESON_TARGET_CPU_FAMILY = riscv64
+else ifeq ($(BR2_s390x),y)
+PKG_MESON_TARGET_CPU_FAMILY = s390x
 else ifeq ($(BR2_sh4)$(BR2_sh4eb)$(BR2_sh4a)$(BR2_sh4aeb),y)
 PKG_MESON_TARGET_CPU_FAMILY = sh4
 else ifeq ($(BR2_sparc),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
