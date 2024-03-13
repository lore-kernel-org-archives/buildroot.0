Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D680DC54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA11141557;
	Wed, 13 Mar 2024 09:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sHbby5FO1ABv; Wed, 13 Mar 2024 09:16:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53D4D4176A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53D4D4176A;
	Wed, 13 Mar 2024 09:16:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FC8F1BF842
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F14B4813F2
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEaKmD2YPcCV for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49C1A8137E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49C1A8137E
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49C1A8137E
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:41 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-512f3e75391so4952577e87.2
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321279; x=1710926079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zt6IYjmqSN4JfQWA2ND0DcKk8uLqloOTGwKa+ZjNFPc=;
 b=K4OBrgj8TE2nbqTigmQtORKfJcWRbaOn3afp1bZiKBj/iE/IWzwyYQRpJR39XgEPWl
 4Olh6D5tpwcYnO/b+H99WrO/KDByGi9rJ5QOYWFb/LjyELpdouvrwa12M5yY0Ss3fyQu
 6erZIxncoPHqUYbqwJCRkMXGoLRIYWT/lcL4htwzCNVsSWI8/L2RtZZuM5U+1avHvbgv
 7Mco9iWn69JNICxzG7UtkynoaSc+hnkrwTG0oticYO8cidQ4pl3LYjebRFm9b2oPFsfh
 9oonfCALhbV9mkSqPNsLy5N9JEczFBzVMbVL6JGs7k1fvEp5hkuciVnV5wXOwgf8y17T
 hxCg==
X-Gm-Message-State: AOJu0YwDNI2PxG35ixlgGggQc7pT08E+Yyl3GGKh8S0jubZDQWnBwdkU
 bhboA+Lrt5kdyZ54R+z3m4T54zr0fFwwps4BStTfsM4deN91Pna2pFwq6o31b2g=
X-Google-Smtp-Source: AGHT+IF30D3s35wWOL89a4avrPyyL1MGtN1kcLjgf+xjr7Nccx9ItmH0Zl/1hzkQPDxZucg8suw7vw==
X-Received: by 2002:ac2:48b9:0:b0:513:a2ec:2a79 with SMTP id
 u25-20020ac248b9000000b00513a2ec2a79mr2748824lfg.66.1710321278902; 
 Wed, 13 Mar 2024 02:14:38 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:38 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:14:12 +0100
Message-Id: <20240313091412.20865-31-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321279; x=1710926079; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zt6IYjmqSN4JfQWA2ND0DcKk8uLqloOTGwKa+ZjNFPc=;
 b=Yk7PR8RS48btSm/8fH3iMGo3EYJmVwSY/lxpfZ46nLdhpsSe0sw3xcYHtDrXTwSmj3
 gv7wlC3t2jOCIFjgh4yr4sg6ZOzsZ8lkU1rtoI6GLbb37ubVszOkxk4nh1SdG5nVhX/8
 HuYd6Ortke65gJNGObQmoDl3aahmakRpWNoj+K7CIEFoDS2Vt9GOAZEh7wNGm9/Prgqy
 4O/jlsfy8qIfeVJDcSrhkn8wcUHcmQGj+yhpvf2PHuvJhS0wIExGe/iQT4kjziNzeEYY
 epTd03+NnckXaE8mjJBxlMd0CRuI/PvwmsCQNNXVElrSfRgKIG6ok7qgXsuS/mm0cFsA
 wzRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Yk7PR8RS
Subject: [Buildroot] [PATCH 31/31] package/whois: disable busybox whois
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/whois/whois.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 5a85bea35..c338e080c 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -42,4 +42,8 @@ define WHOIS_INSTALL_TARGET_CMDS
 		BASEDIR="$(TARGET_DIR)" $(WHOIS_INSTALL_TARGETS) -C $(@D)
 endef
 
+define WHOIS_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_WHOIS)
+endef
+
 $(eval $(generic-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
