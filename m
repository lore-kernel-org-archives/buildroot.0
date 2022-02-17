Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A52C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 17:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0128A4183E;
	Thu, 17 Feb 2022 17:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E7iL3jRzuL1a; Thu, 17 Feb 2022 17:36:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54DBB41751;
	Thu, 17 Feb 2022 17:36:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 338691BF322
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 17:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2064F41751
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 17:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EQ3wgSdyKKKx for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 17:36:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CD5F41742
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 17:36:16 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k1so10291533wrd.8
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 09:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Paq6XAanjFfASOJZHHyABvkm7VErvVc3rRh1ZWUbseg=;
 b=JVayM4Detv/wd5z+myMBLSnQPiHUC2M+mWiEaLFPCy2FcNhmmOXpsK9MJAEEoq2gP9
 m1CD+cOy7D6vuXl/3dcXf9P6RNNOXePShdqIwAGffj45dZqrNov7VrOkyoUbAcgHUgbQ
 gwfNleDqPsg16PMif1oGR3tj6b4zW4A1ZCScS2W0Xgg/FS2+c6Dbj0jARH8tC3IqcKLx
 1jGnvqgwiSuDGPZNvNO3lWaxcHKHjuqd2FJHp6iiePAMK823h9ICe4nLYXTRgWfe3FCZ
 2shtloWRAPY8Hd8vFmidI2M+ftSzXmb4C0UtAoDAHHB1qnRYwHyy9z6kk9qTML1jgC0q
 5Dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Paq6XAanjFfASOJZHHyABvkm7VErvVc3rRh1ZWUbseg=;
 b=zPLVtfZz6DjfUk0oEClBueidwvswB2u5FUwOhBjRSukoJ0pfySZEIrm00Ks81XPcPL
 ruikWKvDmkc6gaGJnyShqg9ZobdAK/5ElxVSl+Puu8Dg62C5HhlFd27a0iqnE+30ENAu
 g+6JlY7HcQquUn/LUHuvKs4/fA3VXJ2vA49qgjQUgJka4L509/n54Rd/dSazT+T9fU+V
 cZnBFi7rDuuF8fc9fVvRaMzPmThmc4we4hgNxOU3HIpaxlvDc/BICliYsMzusxwcUnDU
 ILXco5cteYI5jVrZBCS9TiAtovaLzAsCBkWCisSNSbxY4eX7EAExyCQO1MrQe7omQNgu
 LfQQ==
X-Gm-Message-State: AOAM5320IfrXWSyzXLg1XOx+k1nyM3zB2gNcpPY9HBXEMbNBiTLju4Ie
 wBQxLtia1mixwNNHar8p3kIrROh4ruk=
X-Google-Smtp-Source: ABdhPJwOHmXr99R2F+yGkQGgj+VN6jshlTZhTT2nHTxxp17H1stByzMGL+WgX/QbrpoSEstVnF6CWw==
X-Received: by 2002:adf:ec10:0:b0:1e4:b3e3:2ef8 with SMTP id
 x16-20020adfec10000000b001e4b3e32ef8mr3090661wrn.183.1645119374384; 
 Thu, 17 Feb 2022 09:36:14 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id d12sm30640671wrx.47.2022.02.17.09.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 09:36:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 18:36:26 +0100
Message-Id: <20220217173626.553951-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/urg: don't override URG_CONF_OPTS
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

URG_CONF_OPTS is wrongly overridden in a conditional since commit
d0433603e3c7de5a0d7d6a434b4cb45ef5e5b533

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/urg/urg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index 86b7ec2c17..476f36299f 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -18,7 +18,7 @@ URG_CONF_OPTS += \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
 	--with-sdl-exec-prefix=$(STAGING_DIR)/usr
 else
-URG_CONF_OPTS = --without-sdl
+URG_CONF_OPTS += --without-sdl
 URG_CONF_ENV += ac_cv_path_SDL_CONFIG=""
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
