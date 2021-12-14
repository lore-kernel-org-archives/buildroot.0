Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57715C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 21:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCAC260D5F;
	Tue, 14 Dec 2021 21:29:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1iRThKQe2kO; Tue, 14 Dec 2021 21:29:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EA6A60D60;
	Tue, 14 Dec 2021 21:29:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1CEF1BF3C8
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 21:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCBF8405EA
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 21:29:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WztKR4NLerFv for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 21:29:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C61E4401DF
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 21:29:05 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d9so34722693wrw.4
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 13:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pz8lP9UPqjcWYCpEgTW/WuiyQ2/HFPnjWLCnx+hwET8=;
 b=p6BpKIRMWtl1tRBBdImmOgxLQFhd5juUdpmjv9KjshwfJq77NAZIzBRC6u4YnNjmyP
 F+lw/R+svtCnfqtQKECzFlNxgVSqwakx6QHE+4ZXOU2SCcZYTHQP7fLBNMF/s0GRvem+
 sngweoWkRcf7z4b6b2BnKLG66MZq8EPCY05yIiG3u5pOpPXUAVbM8U4IoaAspKPL//Lf
 mmQod/URAINarENP8NTf7qmUgmH/gO5KCy2R6If6EgnRyuT6Lqys4cYZYHLewRiMNmva
 p4h7nzoSM9TaJxtZ3W5bCAdKAjSzgcPL0glCADlOeDRD+6IIYUVVP+nfEabB497+/78W
 PcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pz8lP9UPqjcWYCpEgTW/WuiyQ2/HFPnjWLCnx+hwET8=;
 b=2XtEI1MopTTxrjPDBHzRn/wF/Mhlk45UrGvVdrjn09/LOKNQ3qd1LS5gR6hL9EGL6u
 aaPYw7vJyx8EihvjFzyVkwu69/Ze9OEU82oXKcNcbpcPSa66Ii0uWkdCkvBIto098L2B
 NB0R2KCy8b2go2zEguceztbT2o4IYOW1C7/CzPUfeKCWG5El5ArlMHXAgLjm/eiIZtTJ
 jYMXPudYwIBQzJpw8zcoF5lp1CJzGzL6upXIVd5pM3vPxmiIe2/Avbu8bbi7eQ24BT5f
 bOhbnNUH5yh1yOzG5+AGJk7pVk5jvXqlC9PH0MKhVoQ1p1lBkPBpS7ubafWjxvwWwbA8
 71/Q==
X-Gm-Message-State: AOAM533t+ywHWxgrWuhG+Hm3wcoS13YT3N3/hhUm2JZBXpXyrEMM9IcU
 7ORXTA2jj6tN/OXPtSGBMQ73RzXzvnBCcA==
X-Google-Smtp-Source: ABdhPJy/Vj/5tXLIefupSG2arwTLyoVf/7Qi3CByBeucjxL76nMINJ4//z1ff/PrJESj2gu9EdJ4YQ==
X-Received: by 2002:adf:8165:: with SMTP id 92mr1615064wrm.199.1639517343812; 
 Tue, 14 Dec 2021 13:29:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id d6sm53121wrn.53.2021.12.14.13.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 13:29:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 22:28:12 +0100
Message-Id: <20211214212813.2251144-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dav1d: don't override TARGET_LDFLAGS
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

TARGET_LDFLAGS is overriden since the addition of the package in commit
8d66bc940d6e4707f9773aeb052e94d45fa439ad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dav1d/dav1d.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 7a798bbd4f..d7224625c8 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -25,7 +25,7 @@ endif
 
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-DAV1D_LDFLAGS += -latomic
+DAV1D_LDFLAGS += $(TARGET_LDFLAGS) -latomic
 endif
 
 $(eval $(meson-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
