Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE00C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75C154023B;
	Thu, 17 Feb 2022 21:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWyPZpAqqX0r; Thu, 17 Feb 2022 21:45:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 888BA400D8;
	Thu, 17 Feb 2022 21:45:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DF181BF37A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 190CC400D8
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:44:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2LGLwbdsJUf for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:44:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22BAD400C6
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:44:51 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so7210471wme.1
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 13:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GbmT4HQEOd6ZcHh1z1+nOjyqpLWrIoLYQGdJ7uZlU4w=;
 b=Zqmu3gdNhHkgntM9Nk2azJOYmK1y0QxVLo51NJHf80KsbjtKKnBP9w02ESwgiAShbt
 6UpukbK9CbcwcS+BqOUISOEK9UAAfMgn9iJNOZu2YPw5ml4Hv3s7xR9PiC8NcuL3Iwrr
 hAnIgEPfSR5LLsTZZUbCNuHSdOlkLeBUIfBTtBW8Cg5qv5wGjsNZ+Xn0ONYpkZz//KiM
 DpKIefcELovOumtQuonDXQ6mQGnSEl8BTfZX+vQppIDFJGatS0JKvFIcpEwxQcThSCf3
 X/ZA21jejOdMJW+J6zn6fURxuvsy4hTvU4b5jD6Nhz+H5WB79TruKL3qDRscUi1LSA7s
 ojtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GbmT4HQEOd6ZcHh1z1+nOjyqpLWrIoLYQGdJ7uZlU4w=;
 b=429bwa2cgY5H9m+m4/RE8AtpK1Egqvhfv3PUFDlLiv35LcawPaoR08dgCtOhPd1P2S
 ftSagRb6Rc0bcCkM7rjJA7g8klCpnsw44dO3mZKkxiqsUOeQv08LsOkyWN91EhjqQl69
 t4aXTeWBVniiaihYdTxpO4TG9iyIVStv2nKa6ShgMA0t2KPgdtSNWLu484MEfR24q9AM
 vlT5u1H7OohYWS3Vk4b9vB/rQvY03UNEqtCYkC/uIfEZLd1CzvMFH87Z/QcMupQ2gfhJ
 hPHMOtfqFmtau8JBZw9DwW6DIxJzGvZ+V40Bd+v0vRUkoWhkq048O4rkRp2ZhEqOJvnk
 Gbyw==
X-Gm-Message-State: AOAM532S8BI6ZshJi7l1ZZMuJLZINSklTbWyUtqjyOi1nQFGr1bSiQZU
 4B3x1mhsjBCUlqK9F/fgoRIPbCi4KYk=
X-Google-Smtp-Source: ABdhPJweGGyOj2vqky8kguVl3g3jMpQpWf2BC/J9JJGHHrVO0MY1XVD5lDwIKFWziQAN4J1Ieg0D6A==
X-Received: by 2002:a05:600c:4f03:b0:37c:b58:9c35 with SMTP id
 l3-20020a05600c4f0300b0037c0b589c35mr7608700wmq.118.1645134288876; 
 Thu, 17 Feb 2022 13:44:48 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id s6sm2492099wmr.43.2022.02.17.13.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 13:44:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 22:44:59 +0100
Message-Id: <20220217214459.555586-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pcre: don't override PCRE_CONF_OPTS
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

PCRE_CONF_OPTS is wrongly overridden in a conditional since commit
9b28d48012c33b37d33101991fa042f9fc9d76eb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcre/pcre.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index c85f6717db..59750c28e7 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -18,7 +18,7 @@ HOST_PCRE_CONF_OPTS = --enable-unicode-properties
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 # pcre will use the host g++ if a cross version isn't available
-PCRE_CONF_OPTS = --disable-cpp
+PCRE_CONF_OPTS += --disable-cpp
 endif
 
 PCRE_CONF_OPTS += --enable-pcre8
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
