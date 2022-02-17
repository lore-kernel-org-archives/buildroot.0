Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7C4C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67D7B6F761;
	Thu, 17 Feb 2022 21:46:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7OhV3NFuBVdB; Thu, 17 Feb 2022 21:46:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF9736F756;
	Thu, 17 Feb 2022 21:46:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8A321BF37A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B526D4163E
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:46:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LUz4jaxJxfan for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:46:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00B1941507
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:46:02 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so4992069wmq.3
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 13:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M1Bu3F3f9/1CU672OFae7ggFNo9y9izY9AG2F59Jgrk=;
 b=Gv4zrMcgg15cuuTAsR8jM3tX8IsczPJ+vUP4rdVV4ptrnl0sb2KGkBwm6YS3B3EzQr
 18cwUeSoQmrBNP5esP1YVEWTZuuFFG/ANechhRheLClRU8qGUGn5pKUn8ckSn/MyOs4e
 Tmp6z66iRNLapUi0p5wpDNYb2VCRwqyiSxDxr6Hr6uLD64X+G56ADVT862/jGOWoF+Se
 mBx+5XCvOtFAsC0EM0M3dCxJA/5QYO7l+HO+hQBA+AWC1eUB6JJhCjcoM+jC/862Ja9j
 MTM6ZXOn56YbS2rd7kbT8hlX2mg7Beih1mwE+xTwR5TIgp5ibRTWodD/o7BUtV3w5qcC
 yuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M1Bu3F3f9/1CU672OFae7ggFNo9y9izY9AG2F59Jgrk=;
 b=FQ3aH+rg5TGlo9NOfZ4H7+URuSYAAOt6EKtlz/9p9FM2edOu3E3UqN34CQJs14XsZa
 3N2UfcpOyKi+mGMwlY9lK8ZWZszpxeN0Pe2x06pr+HfliJfphpin+LYgUuZ/lGRqeqJl
 lNCQgPONniYrgeW5lJDnBMuEEmXbE+mQFmBg6ChmgZCFRqEywC/iszaUOPamyWcFqteq
 4wJ9GNEI7VbKrg6tLmyRPe8p04f2p5fkuoReAzLA8xTnVhirfOIhHb1u1ljJ5BwfhQAM
 CHYUZREXqBtos/vGUrW8Nt2NO3YOy2d4AhvE1kqWV89YN7Jqu10k2M6nQzc1LeOTYAWH
 Xcyg==
X-Gm-Message-State: AOAM532iEHwAJEreZLOufRRvlnIcJZcFBeMV/1WPQuE9Un8QMdEXkftQ
 rPh/yJKErIrmhunZtjR7D+5LlmuXbQ4=
X-Google-Smtp-Source: ABdhPJykhnBFNNYHqnBSr0MBdIabZ4KfzXw6GDLz6qW7Zj+mzhuG1fZR91VH1TVDR4aePJ/frA7hoA==
X-Received: by 2002:a05:600c:ad0:b0:37b:b989:faaf with SMTP id
 c16-20020a05600c0ad000b0037bb989faafmr7793307wmr.167.1645134361008; 
 Thu, 17 Feb 2022 13:46:01 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id r2sm29561488wrt.65.2022.02.17.13.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 13:46:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 22:46:12 +0100
Message-Id: <20220217214612.555680-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/perl-netaddr-ip: don't override
 PERL_NETADDR_IP_CONF_OPTS
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

PERL_NETADDR_IP_CONF_OPTS is wrongly overridden in a conditional since
commit 86658b0b18719c93fca359be65904ff366be9985

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/perl-netaddr-ip/perl-netaddr-ip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.mk b/package/perl-netaddr-ip/perl-netaddr-ip.mk
index 4824b4e9ee..c4885715b4 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.mk
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.mk
@@ -12,7 +12,7 @@ PERL_NETADDR_IP_LICENSE_FILES = Artistic Copying
 PERL_NETADDR_IP_DISTNAME = NetAddr-IP
 
 ifeq ($(BR2_STATIC_LIBS),y)
-PERL_NETADDR_IP_CONF_OPTS = -noxs
+PERL_NETADDR_IP_CONF_OPTS += -noxs
 endif
 
 $(eval $(perl-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
