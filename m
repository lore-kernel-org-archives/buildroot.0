Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68439C433FE
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 14:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 173AF83FA0;
	Tue, 24 May 2022 14:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzkYHoi23xZ6; Tue, 24 May 2022 14:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 116A283F8C;
	Tue, 24 May 2022 14:32:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3903F1BF329
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 14:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3447E83F8C
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 14:32:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xlcYjttcUNf1 for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 14:32:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71E5B83F6C
 for <buildroot@buildroot.org>; Tue, 24 May 2022 14:32:50 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id f21so22078591ejh.11
 for <buildroot@buildroot.org>; Tue, 24 May 2022 07:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0sHjaHY14JcdV2fqFPPK7FE+gkVrwQ1qt+w2Yyce4/s=;
 b=MI2Ade9GnGdYNske6FdvIjwVcFu7owMzYIwBnHgO3YpY3vWZ4lexTaH6qrXWPEVPVJ
 mNK2LMY/M7H3yU38+Ud0ptMoCPWVqAJFze7SibQBGCZvYK8gEFa1Zg2gPDl+EElhpg0I
 2s8STfcjuCwgKmnLWxtSEfZNogpZu2iBR3f1AQnpVFOnzB1wsn5WiGSYo+gS/dfQ9qrv
 6m+oivuH7E6MMUBKg58Tw7LTdXEMDeJThuULZ4porBnOBnaB7BkNBbooUYm8heI3rxQ8
 PZzz89qJE+Auait/SNWo2p1PhFa6+RyLFW8yOXrNrASSG7FT6RD9frWO6KSHdpast3z/
 5nJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0sHjaHY14JcdV2fqFPPK7FE+gkVrwQ1qt+w2Yyce4/s=;
 b=66VgQMdqsWIqqYgPUBxwFnUyOgmtQSkxF8Cc65cHh+cj5BNzfCxmLR8Gel6AYC6hF+
 vA+OzZvTMyswLAhs0Mpz7qUVbB1c4OGKMV5omzlaWNHTDqljvA/rTcYq4d/ucI88TmNJ
 dfTf0LpFPQ93wtJhctGR2EazQfbHnNLZSaivbkA2aPpz+Fy48w6CjRMA/W1rhQk5weG6
 BqDIXmlZHVvClusUo6rFeE6exJVP7FUtqZLj6addRIzUZ/iZby4NPZUcb+eU/Kkh3gaR
 GgL/PG/wtSqm0LTEvce9cpNDi+uadMnTL2FhzA97wFhxUctq5w66QBlgoW7BDqRKNoHp
 HlhQ==
X-Gm-Message-State: AOAM533pdI0/vqe166/3hUtHBFrY25hQTumtv1kjGl6Zf+7G59lZyKAn
 /E6JSPp6L8xdLXOYx7M4ACLZWqydZJZ4SQ==
X-Google-Smtp-Source: ABdhPJxznW3ozwBwGTM2bF9JbYoOvZOOqGisvG9MfHVU6L+AhJbSZzrA4CdSj3X4c3I9ekQeRH/row==
X-Received: by 2002:a17:907:9725:b0:6fe:fce4:e08d with SMTP id
 jg37-20020a170907972500b006fefce4e08dmr5855263ejc.657.1653402768507; 
 Tue, 24 May 2022 07:32:48 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 k23-20020aa7d8d7000000b0042aa153e73esm9570777eds.12.2022.05.24.07.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 07:32:47 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 16:32:39 +0200
Message-Id: <20220524143239.1050052-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next] package/linux-firmware: install all
 RTL_RTW88 blobs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rather than installing just the three blobs mentioned explicitly in the
.mk file, use a wildcard to install all blobs. At the time of this
writing, this matches the following:

-rw-r--r-- 1 arnout arnout  29K Mar  9 13:28 rtw8723d_fw.bin
-rw-r--r-- 1 arnout arnout 136K Mar  9 13:28 rtw8821c_fw.bin
-rw-r--r-- 1 arnout arnout 148K Mar  9 13:28 rtw8822b_fw.bin
-rw-r--r-- 1 arnout arnout 198K Mar  9 13:28 rtw8822c_fw.bin
-rw-r--r-- 1 arnout arnout 142K Mar  9 13:28 rtw8822c_wow_fw.bin

I.e. rtw8821c_fw.bin and rtw8822c_wow_fw.bin were missing.

Although including all blobs nearly doubles the size, it still totals to
just 660K which wouldn't warrant making more refined sub-options.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linux-firmware/linux-firmware.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0c725737d0..64d096df14 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -154,9 +154,7 @@ endif
 # rtw88
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_RTW88),y)
 LINUX_FIRMWARE_FILES += \
-	rtw88/rtw8723d_fw.bin \
-	rtw88/rtw8822b_fw.bin \
-	rtw88/rtw8822c_fw.bin
+	rtw88/rtw*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
