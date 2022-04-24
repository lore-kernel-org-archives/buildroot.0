Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4458C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 20:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4778F4018F;
	Sun, 24 Apr 2022 20:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gg0Ae1Wk8SYo; Sun, 24 Apr 2022 20:18:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60804401CC;
	Sun, 24 Apr 2022 20:18:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 359D91BF404
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3248E60AA7
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:18:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bM_FBzoCH_LS for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 20:18:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 173BF60A82
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 20:18:41 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j15so4924433wrb.2
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 13:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PNDBcLUETZk5hrDrLGR3O8gwieqPl7UJKhy+BUP6kgc=;
 b=knku+FYClApjq8hoisnztyyM8wJP1DPcavwc+QdnpbzDqniQEU8ZzSJK5muxlOwtEm
 SxMGFNMboKMw3cK1cWotqYqmKvEUs/kEFGxPM79JL9bQ6ZdQEFiaDx0sAgfjFI/DcCXs
 TD7blyynC8MQ44RKWR8Ohn4S7VFX6pH9rN0KPs1SkH1JXpOcgnAMwKZjkpXNwaSgOHV2
 rx6SNEJ+IGoEGAR47SAz+ErogFQlbg27verLgnQEUY7tIOrRnXIUM6IXb8vRQ+VsfcJ0
 i//xvlH1u4CI2lGdY3UejPo9ZNmkaiZ/f/l7E3MP985bzjYcxJW/ksSX5EWhd3fWVEuE
 6lPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PNDBcLUETZk5hrDrLGR3O8gwieqPl7UJKhy+BUP6kgc=;
 b=Qlsu4tdUuFUTCKN9uYqHuSQg5EKAqFM4dgxx6mCNmLTG+Tdi/RqPEW24eR+KlxD9sj
 zOu/bCcO+sTfYJuiAnjP1yK861Cb7Ro87lAXYl0LLWQNZKJOZRuXUfY/Ox3RHc90DA0B
 U56mdxyZtyE+Lx31L3Agdfq67EDrnZVsLjJ9QQSrtsg/LWy1wTsw9FDt4NnU+CPuKzPL
 YdevZA+fvHtiwAqM6oeUvZSuOoB+k9d5BykPnX4+8XuoT+2CZRtYIIRPyK0mWPIvB3kf
 /pgAAKOrfQgOE8NShOJrypcocDiG7Q9cK5H6JLEoHSYlvKj72t33YOJCyeDdMj7P0aUB
 I0Ow==
X-Gm-Message-State: AOAM530hQJSOFrBHnHiT8osaBeKohyN6J5kuc9Ge/AjlWHaMX6pmGIjC
 W4o3m4q20ICgvn6bC4Bx8T74o7BBrXk=
X-Google-Smtp-Source: ABdhPJwiK7jl5/76Om/70X4FeuVfiByI/5IQO3BtP3nZuZF1zNDKcm46u0Ln7JyCwHuPUJiD9NlTSw==
X-Received: by 2002:a5d:6c68:0:b0:20a:8d5f:681a with SMTP id
 r8-20020a5d6c68000000b0020a8d5f681amr12080025wrz.470.1650831520185; 
 Sun, 24 Apr 2022 13:18:40 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a0560001ac600b0020a93f75030sm7406436wry.48.2022.04.24.13.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 13:18:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 22:16:15 +0200
Message-Id: <20220424201615.3421463-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rtl_433: fix CVE-2022-27419
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

rtl_433 21.12 was discovered to contain a stack overflow in the function
acurite_00275rm_decode at /devices/acurite.c. This vulnerability allows
attackers to cause a Denial of Service (DoS) via a crafted file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0004-Fix-overflow-in-Acurite-00275rm.patch | 35 +++++++++++++++++++
 package/rtl_433/rtl_433.mk                    |  3 ++
 2 files changed, 38 insertions(+)
 create mode 100644 package/rtl_433/0004-Fix-overflow-in-Acurite-00275rm.patch

diff --git a/package/rtl_433/0004-Fix-overflow-in-Acurite-00275rm.patch b/package/rtl_433/0004-Fix-overflow-in-Acurite-00275rm.patch
new file mode 100644
index 0000000000..057bf9cf64
--- /dev/null
+++ b/package/rtl_433/0004-Fix-overflow-in-Acurite-00275rm.patch
@@ -0,0 +1,35 @@
+From 37455483889bd1c641bdaafc493d1cc236b74904 Mon Sep 17 00:00:00 2001
+From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
+Date: Fri, 18 Mar 2022 08:09:15 +0100
+Subject: [PATCH] Fix overflow in Acurite-00275rm (closes #2012)
+
+[Retrieved from:
+https://github.com/merbanan/rtl_433/commit/37455483889bd1c641bdaafc493d1cc236b74904]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/devices/acurite.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/devices/acurite.c b/src/devices/acurite.c
+index 6879e52da..4f3e83eb3 100644
+--- a/src/devices/acurite.c
++++ b/src/devices/acurite.c
+@@ -1318,15 +1318,15 @@ static int acurite_00275rm_decode(r_device *decoder, bitbuffer_t *bitbuffer)
+ 
+     // Combine signal if exactly three repeats were found
+     if (n_rows == 3) {
+-        uint8_t *b = bitbuffer->bb[bitbuffer->num_rows];
++        bitbuffer_add_row(bitbuffer);
++        uint8_t *b = bitbuffer->bb[bitbuffer->num_rows - 1];
+         for (int i = 0; i < 11; ++i) {
+             // The majority bit count wins
+             b[i] = (b_rows[0][i] & b_rows[1][i]) |
+                     (b_rows[1][i] & b_rows[2][i]) |
+                     (b_rows[2][i] & b_rows[0][i]);
+         }
+-        bitbuffer->bits_per_row[bitbuffer->num_rows] = 88;
+-        bitbuffer->num_rows += 1;
++        bitbuffer->bits_per_row[bitbuffer->num_rows - 1] = 88;
+     }
+ 
+     // Output the first valid row
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index d1c28adbf5..8326caedb2 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -20,6 +20,9 @@ RTL_433_CONF_OPTS = \
 # 0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch
 RTL_433_IGNORE_CVES += CVE-2022-25051
 
+# 0004-Fix-overflow-in-Acurite-00275rm.patch
+RTL_433_IGNORE_CVES += CVE-2022-27419
+
 ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
 RTL_433_DEPENDENCIES += librtlsdr
 RTL_433_CONF_OPTS += -DENABLE_RTLSDR=ON
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
