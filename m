Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8B0C4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 12:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44B9340941;
	Mon, 19 Dec 2022 12:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44B9340941
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmQMbrjLwM3M; Mon, 19 Dec 2022 12:18:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DC474092B;
	Mon, 19 Dec 2022 12:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DC474092B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D17281BF267
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 12:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACCB660881
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 12:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACCB660881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sD0elttukKik for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 12:18:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBE4C607D0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBE4C607D0
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 12:18:43 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so6229475wmb.5
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 04:18:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c6aSmH30MwxYcMtx9SzJq4qP5egL2Vso9fbifkH/AyE=;
 b=49F+HszW+TG3a7Ld3u61IxDPIe0FXcMt4erQfqus+mS3I4FE7UwGUUiHbVehBvp1qD
 HQsUhKSRN7fMo+xf+RNFb1zlvDbtNadQ+XtRriCgYMctN88ezMtU8wDKoVI/YUFhZWYk
 jKdTkDO1aMTxRoyfp/Cfo0UOPtDDiqqEtHpw0A9X78bH9T79HCLc2GQy8ZAGloB3sViw
 O6wKLpw6g6mt/cTrrqJ3s6fO4Q6FAnWVzNWHp/DZVZsVhz1Cmsiz8o6eIhKrZwalQ/wu
 n9t5mJPlMovPYcYNSJIRYgi2nB27PKxHRgto2k8E4skbLo4gXrZFStd0bhId89S5LWxE
 Qj2g==
X-Gm-Message-State: ANoB5pnxNI8TweELtjaZ3nQVgnxxCuu5pOxDHwzJnsByNtHDgz22QYHY
 gai85zS5Je8FidvyU06rDma9gxtTS7X1mwKCNApq0MPsLFaylBYx/tANBr173JOYE1/Y93kJKEl
 GFweBkU3Kk11BW+L9L7VPlci0PbxWsngkErY5hmua/ygUnmqqCS2wrHIhPvTFfifFI10hG4ydPp
 bX4eI=
X-Google-Smtp-Source: AA0mqf5/ll/4O0PQDARb3IdqtZGFF6kmB//6kmBnTRPnQ3ErXZhW5OCfxb+vTsDB6dDpDYNpyozD0g==
X-Received: by 2002:a05:600c:253:b0:3d2:17a5:17fe with SMTP id
 19-20020a05600c025300b003d217a517femr25836311wmj.18.1671452321624; 
 Mon, 19 Dec 2022 04:18:41 -0800 (PST)
Received: from fedora.. ([188.252.220.249])
 by smtp.googlemail.com with ESMTPSA id
 u1-20020a5d6ac1000000b00241cfe6e286sm9817489wrw.98.2022.12.19.04.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 04:18:41 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 19 Dec 2022 13:18:38 +0100
Message-Id: <20221219121838.1833159-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sartura.hr; s=sartura;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c6aSmH30MwxYcMtx9SzJq4qP5egL2Vso9fbifkH/AyE=;
 b=0bMWHiXottFZpl+Qn80taeiyzPsoDiY7QzZ3038Sx2AonUhMG74SpE0aqGHF8QzJpn
 1qAznB+v8qk2Gx+Ihh6ZDugvzpM+V1owbsAbT5sOHPI1tgr5/14x1+zOKVnUdqG5hRcU
 FrGmO83zamB4L9Yjk6Qa1a2A3uoRs7Lv3+/LDcNpWQ+gu4SLxJHt2bRv4u18Kw+FBQr5
 XzjiIFWYeDdl/CNMgIHutP8ZzXIitqtOsU9kLbMMeMoo/AIOFJsVvOtTIO3mMc1Ne1Tn
 pwLJfpPZFJ7viXmXE8RBBKg45cFiIQUwYvUQGzbewYSof1WCjF/VBUTvM6laUWfHnueb
 xiaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr
 header.a=rsa-sha256 header.s=sartura header.b=0bMWHiXo
Subject: [Buildroot] [PATCH] package/hostapd: enable 802.11ax support
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
From: Robert Marko via buildroot <buildroot@buildroot.org>
Reply-To: Robert Marko <robert.marko@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>,
 Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hostapd has 802.11ax support, however its currently disabled by default.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 package/hostapd/hostapd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 4420142fbd..8981d9247e 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -53,6 +53,7 @@ endif
 ifeq ($(BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS),y)
 HOSTAPD_CONFIG_ENABLE += \
 	CONFIG_HS20 \
+	CONFIG_IEEE80211AX \
 	CONFIG_IEEE80211AC \
 	CONFIG_IEEE80211N \
 	CONFIG_IEEE80211R \
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
