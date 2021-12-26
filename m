Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65EAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 15:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62D4860D79;
	Sun, 26 Dec 2021 15:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlfmdjerG_MY; Sun, 26 Dec 2021 15:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C20E260B8C;
	Sun, 26 Dec 2021 15:12:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF2BC1BF2EA
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE24E402E1
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2FhZ8YESC9Ux for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 15:12:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFC0640108
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 15:12:15 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id j18so27427784wrd.2
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 07:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EVNBzeBE+D2Ua2hRs8DjhSxUzucevzmwJyNi/rsYHNw=;
 b=HEBVaAp9VaEN0dqFfuFgCjWnplVeVz/R6i2LiQAOTemeM76X3gkB9nSq2mKEzkfnT5
 DW/ror4tMEjCV1JaOKNp1E4PE+3x+MmPJ0LF6nKbPQsaw2pt23YYOtDw3VwLHB//a+k0
 5q9VXY4gbHhyxVfp9kZhJqZBaRVkcNATM4s5B4DUcmO9bphsDRGPh8N3xAsWv6xvpI9k
 ojh2ytCxvoYsmxX0+l/DxlDak/d1qjm4lWK3C8sadvp216fFzAmHy8VavSOZQfEFUj0e
 UgFgc1vZ9bXB5TCfy+ui0HbRufwJOC9tSOOKBAR+7ozZeom33xOy5cSnQEwn8CT0+TzB
 5Mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EVNBzeBE+D2Ua2hRs8DjhSxUzucevzmwJyNi/rsYHNw=;
 b=oZes4cVFPgqTjPKrEg1WhM9X7eUZL/isBW8LVwrkD/MtrgdXvSkQHxOWLZqw1Ntrv9
 GKkj9Kv0S13bdbIdXCnwam5dgV01bZI302l2YCZwuZv0jz3CAde0ho91mOtmFxFtKoJi
 w+/NmmqqTq+/dfuTrxwxzNd8XWRYfaL4hRSroZSyKLbRP8fPSFpW9M3fSlaGs4WdRo4F
 YtHv5Mh8+dToPWkhLoSWsfInRgE38uADqlFRBquv5tPiSS05cBGnjiSt/Kfavv9xzLiw
 43UzRICWmgcul/X83dXR0fBp0ZTaaNJjoabkcMIFcWC9uKvw7Rfwb7DvRFvHa9j5cj5g
 MI2A==
X-Gm-Message-State: AOAM532wesm3Yk+nb/ncE1qk202x5BlxINsBx0KO+yW0W8fnHlQWA/v+
 JFUFlQBS6P/wOVbUlEyQZomdjSPVZh0iFw==
X-Google-Smtp-Source: ABdhPJxv2GYvQa02dMYHym2sDCaXuw8WS8laRftwFrWmzF1JxWwZ05txlU/8XLEg0OoS6tKxmbheXg==
X-Received: by 2002:a05:6000:168c:: with SMTP id
 y12mr10488407wrd.409.1640531533637; 
 Sun, 26 Dec 2021 07:12:13 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id s22sm16546775wmc.1.2021.12.26.07.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 07:12:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 16:11:12 +0100
Message-Id: <20211226151112.674069-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: add openssl optional
 dependency
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

openssl is an optional dependency since version 1.5.2 and
https://github.com/linux-pam/linux-pam/commit/b3bb13e18a74e9ece825b7de1b81db97ebb107a0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-pam/linux-pam.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index e309f6a5a4..789dcf5c7b 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -42,6 +42,13 @@ else
 LINUX_PAM_CONF_OPTS += --disable-audit
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LINUX_PAM_CONF_OPTS += --enable-openssl
+LINUX_PAM_DEPENDENCIES += openssl
+else
+LINUX_PAM_CONF_OPTS += --disable-openssl
+endif
+
 # Install default pam config (deny everything except login)
 define LINUX_PAM_INSTALL_CONFIG
 	$(INSTALL) -m 0644 -D package/linux-pam/login.pam \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
