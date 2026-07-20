Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8E8C44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 18:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBB9240689;
	Mon, 20 Jul 2026 18:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYMBglxeiZ0z; Mon, 20 Jul 2026 18:44:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFDCA4060F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784573040;
	bh=G8rXbcCikPMFtuG6ZcLf0gEfd/8zw6I75IEbuej83/8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QZBJYDWtirXVzF7EV3bofFAFP5wsEQHU5+Ldoj8E/V9fCC+gPt32d4yNpupBfS++J
	 yg0ESQB+P6h2PQRzBAbjU3FfOPpgh0k/VhqejOTfA6o4BtXFBdFOTFGUv5Wr/xpvLU
	 TzJa6V9AWh1Jw+rSyTMIGZOadOu/ozt7OUZk6nwxl21wMRCnefg6uUfgLj4KrTMhcD
	 UnN8wNTxpIuSujyECiSNVUxWrOPkQbWyWJ7JxVkVAKVA4aR2simJD6tBB+yX4S3WEe
	 PtlXk1iNPHheBTaoZa2T+HeAqmw0xRAnVVCPEAvvs+s2ScWEIvgQCYnRecreEEHUSd
	 Ml3OE/lTkqZPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFDCA4060F;
	Mon, 20 Jul 2026 18:43:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2D93DB4
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 18:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC57080B28
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 18:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pwd5RlmPxCJY for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 18:43:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D5E7380A4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5E7380A4A
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5E7380A4A
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 18:43:57 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so5738913f8f.3
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 11:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784573035; x=1785177835;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=t/usyGCg/nxh6OLi2HRFnHqIzK70SkCPt/07nKPxXbc=;
 b=V8BSTrXeHQ12t19h5nPzMRGyozp8SGyrTb/Z4yoQDIlCr7Tj7IIkiKwiVuOFB5ElRt
 YLvfZsbS0ZIBYalRHaVv3kqQHqC8To+xRrc9ddq9ajnDOSFeFK+Vs3di089ffYLvjhwU
 37c2m5bGMYLt78S7eOLf6oo6pxTyNzo+Kw4v64odXFu/K+6asBuZOUezPjsWQbK91S7V
 4t42tXiWhWxuxKK5kcD1yxtqfxj1U7mNBi5pGsc179Wn+pJGLVOMvjiYL9DWM7czUQH0
 bX2wW54Q6zswMshngnT1z2P/KY0A9MlUqZkThL9Ylb+oYcwLq/Y0TtsugejV7L5rIvD+
 ptew==
X-Gm-Message-State: AOJu0YwiySpRORbbGL8LKW44fnV6NrZcC2G7hzvzKTIkeOorHot+W7vI
 FMrwtn3v+OGchuOa85GgIb35q2EznYLSzTHJLBrIkR3iSmsyF7KWGIe8XvEDtg==
X-Gm-Gg: AR+sD12nCsJoJcBJqTFIvZ83jeKoziRXm7QQgvO4wxTzsDJMQH41fzBoOYjTcnWPI7t
 qaDYtpSOhoS80JbD41Zv3mFsFym242L9TqyN8CLTAhqsRB0fbZ8VHIoHz6DmJ5Whmk9DKpYL5WU
 dnnstbLKXXonaioiPw5Ql8lMOPXycbbdSu3gbpwsOxI9K5mIAiM4t/dDTrAAIiq4lLLlbicyHWt
 COoTxum1YvfF7i9x0kJTcihjUjK4BhGsaqnUgR4tbqj2xK69NZ2jsCQxpCB9/wTdB7UwNl9il3H
 HgzRlDUJjnRGQI5g3IekIi/bjghTIHd4ml9jWCPIEvUzhzlKKg3mrei5Q8t6u/8fziQLo8txegh
 Twp56z+88EA6NDQXg55LCw0ADo40NbL0VcabniF25Wky19u0WQ6IT8GI95sY/shVAvDpHOjddS+
 fbS+D4jnqN/rQSGBXS931iHrbGwvqp3Xg2y21YMvQupcir
X-Received: by 2002:a5d:5d0b:0:b0:47f:778a:c61d with SMTP id
 ffacd0b85a97d-47f778ac654mr6895273f8f.7.1784573035332; 
 Mon, 20 Jul 2026 11:43:55 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ed1911sm34387534f8f.22.2026.07.20.11.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 11:43:54 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad.86@gmail.org>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.org>
Date: Mon, 20 Jul 2026 20:43:42 +0200
Message-ID: <20260720184342.252661-1-francois.perrad.86@gmail.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784573035; x=1785177835; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=t/usyGCg/nxh6OLi2HRFnHqIzK70SkCPt/07nKPxXbc=;
 b=XmVO2NRFs874sd5mUTmQGNGguAbPBzNhZQCvsfacptM59QxyWcoohL8JT+8Pe+7Lsp
 4hsiniLrl435/BgePDfxS03D9macFWhKePINgrgxA7Z2NwAVZ9LWrMJ8SiQ7X+3Vuoe+
 89o4Ieu1kMN04i9oYn2LfLYapGhLrTdkHwzXCMHvbTFYwZWPWHG9hyIZe04uoySEM3aN
 ElUQPFIBghKVDH1E+69hUNr5WM/5DD2MoNOVmDM1YcX1AxhdtTn/2cCDL9RZDeqySWfl
 K+ZPVV/NUVIHVbrN9QUjqF6fCiLvBQtQrq/pPOjJx/Xbuaa32TRXhJV1G8lHWXpPP9up
 3+2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=XmVO2NRF
Subject: [Buildroot] [PATCH] DEVELOPERS: update email for Francois Perrad
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.org>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c5d6dbd8b..934209d7d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1162,7 +1162,7 @@ F:	board/visionfive2/
 F:	configs/sipeed_licheepi_nano_defconfig
 F:	configs/visionfive2_defconfig
 
-N:	Francois Perrad <francois.perrad@gadz.org>
+N:	Francois Perrad <francois.perrad.86@gmail.com>
 F:	board/olimex/a20_olinuxino
 F:	board/olimex/imx233_olinuxino/
 F:	board/olimex/stmp1_olinuxino/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
