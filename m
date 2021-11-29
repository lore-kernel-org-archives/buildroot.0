Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0E0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 07:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8B7B80F1C;
	Mon, 29 Nov 2021 07:15:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGQL6Sd_teUE; Mon, 29 Nov 2021 07:15:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5581980F16;
	Mon, 29 Nov 2021 07:15:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 590811BF3FF
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 07:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48B24409FD
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 07:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FvxanfHaYzkp for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 07:15:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 979964014A
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 07:15:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q3so11660776wru.5
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 23:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cQ/3/g+ngi3iI/WZ0h+yksvtUIOxRhq7ZRj8fohQv2U=;
 b=WyVLV0G47Xhiv15/RYwle04YhvxIRSklT58qhssL0mOAyHTJdiLA/CAY6gj8YX3yQT
 0mjUowxMSnUgDLW0pb7PBV+8yDvNthFZ/XhXOLNefeL6Ukc7KJPoufuiABnFezscnrbK
 x04tBd10pmL9Pd9EpMN9yvqSWBsAOTsQMsyhVw7/VOjKUkBCkud2NqnO60T/yRRiBif1
 vM2Lj2adjATLEaiywrhz/K0IMqJlEgVD2Oh8L1JR+o03YZKbss+oiw3Oa6bkTxxlrcg5
 L6XniznNMLxCwxC3RiwregJmG8dp0+pNkq4RfM2b1JA8JPMV2AJ+qQ4Qs5c1FGI1BDv4
 rJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cQ/3/g+ngi3iI/WZ0h+yksvtUIOxRhq7ZRj8fohQv2U=;
 b=oB+kXnyp2QFUzzWygvEDDIVHHSKmezo+fXbzimSpwZSMzRyuL5R1+eD00f3/845Enx
 YSYpePYv457KQi1hbD8iiditi+x3E6jxuWbXeKL8kYiM813Pm2ZUyrIsoaU++woMD8uh
 YIPkpwULnPlOc3b0rZQhzd//OvB4bEe/3aAby5QkVSSioOPHWPJNelFmlRhhp+X1YF0M
 i72BrohChsU5lsc1k2W8DJ1b68VuCHI4lv+IBBV9w6oRUH3z/EDYQxSgph6z8CGFl7kQ
 oTqRqqUQdXI9N1yxr2NiM0NW5dqfw0p0ZAPPRKSeOAEUmxJCflOiPvtc06rfNvWqScof
 mKOQ==
X-Gm-Message-State: AOAM532ydPBHJLx6sn4n+uEkzOwiPmHyevgihAR03rer04BFz5YCzX07
 lJrLkWb93tVtBo/IonUKUUaT/Bojjh8=
X-Google-Smtp-Source: ABdhPJxw47WQbG8uUrdZfVfwgEHNG4r2dw1Dzn33if2/I29wfRyV2kIUbyv8kv9jv6KQhHgTETj6sg==
X-Received: by 2002:adf:82f7:: with SMTP id 110mr31910681wrc.111.1638170123523; 
 Sun, 28 Nov 2021 23:15:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id v8sm12681261wrd.84.2021.11.28.23.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 23:15:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 08:12:51 +0100
Message-Id: <20211129071251.2176586-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ca-certificates: drop spurious space
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
Cc: Martin Bark ~ <martin@barkynet.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
beb24ce2b0abea2ac68bd86a0ac2162d98bda6cc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ca-certificates/ca-certificates.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index eb75d23f44..7084ab781e 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -22,7 +22,7 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/update-ca-certificates
 
 	# Remove any existing certificates under /etc/ssl/certs
-	rm -f  $(TARGET_DIR)/etc/ssl/certs/*
+	rm -f $(TARGET_DIR)/etc/ssl/certs/*
 
 	# Create symlinks to certificates under /etc/ssl/certs
 	# and generate the bundle
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
