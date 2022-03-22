Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD5AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 17:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75A3E40C41;
	Tue, 22 Mar 2022 17:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zD2Y0iKXCkIw; Tue, 22 Mar 2022 17:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E01340192;
	Tue, 22 Mar 2022 17:50:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5CE91BF5DD
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 17:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2CDF41880
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 17:49:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sI3g18HT7SmF for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 17:49:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2909E41826
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 17:49:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u3so1392543wrg.3
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 10:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ry4TFLEKR5CK+XjUVYQoFGO01+giIoUMPyiom40ga60=;
 b=XZMCgGsZcLyDlHge64P3NwjRNQrEK4GMNCP0MJqeojy/5Gct3dDjbmFx1Wib682sfq
 8IgKkBnmraqcJr8guVUNkHShUFC83urIkJlYFmrz/HUEfyQXez38OWD69Uc4DmCeb5Iz
 B+VMuoRA3TpviriquifmjRwZcEwL5yLXX6T0PE2ShjZafZWXKnZ340s7erRDonMVWW6t
 MkRi154m1QLY3++U0/kYqDRRhX7XKrC0eYr0PhB2ijej8baVh5WIRWwRf8xiPsvr0oTX
 3BeyNWvTAKZKe2uWO5XV7NgRmBnkcTIlP+xHKwyjJb8umHTjmI8YVKHjN/jUyvdCdF7p
 fZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ry4TFLEKR5CK+XjUVYQoFGO01+giIoUMPyiom40ga60=;
 b=vk6dx2bG9yzGGE04/HD3261UY+FjMkCq3lNlgHfrSxswDrragKFGCvTkgQIXqE3WjX
 i/DxfpviBmjlsA92j7ZM9QaHemvVVQ8gouLrpS+Dts7O3z1NF6Xd/Bv2gPqx7EqLh76K
 CnB8CkIAP1xqjmNSli5crRK5zSKnUXVHztTbwhhjLEEQHYCgXOtss6yAsgOgcuOiyYgs
 OY+75J/BJCK48qavOW4WFww/IhOu6fy7wbx0HCtys2FzXYngme6pFx5p6mYXJLccCK3R
 SW5SIWlgKk26XmwNL6FD92JOR01cTcSzfCjUIBCBuTG3SGx1jfHkKlmA59c9lypT0kMa
 IaRA==
X-Gm-Message-State: AOAM533D028g1cksDYqR4o7BhSg7aN4pi5728QXLXYICVrk59dW65U+z
 zPCSdJ/eJAQrztp4SfUuPUpDbXWAsV8=
X-Google-Smtp-Source: ABdhPJwSm1VE5E4XCs956bD980r+Qda3o1MMess1ctB0Ml/ZO3w+vlyD7y+6scCoNBHvYrUtBpmDzA==
X-Received: by 2002:adf:a297:0:b0:203:d734:4314 with SMTP id
 s23-20020adfa297000000b00203d7344314mr23502885wra.562.1647971397170; 
 Tue, 22 Mar 2022 10:49:57 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a5d4579000000b00203ee633c2asm12503622wrc.1.2022.03.22.10.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 10:49:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 18:48:39 +0100
Message-Id: <20220322174839.2189015-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322174839.2189015-1-fontaine.fabrice@gmail.com>
References: <20220322174839.2189015-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/jack2: explicitly {dis,
 en}able opus and readline
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Explicitly disable or enable opus and readline which have been added by
commits 055cf588427b40533da74d16df1830e483c5618e and
f658b1934f91e8c416fd7519c9f7e3ab86dca076

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jack2/jack2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 127c99eed1..6939aac9a6 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -21,10 +21,16 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPUS),y)
 JACK2_DEPENDENCIES += opus
+JACK2_CONF_OPTS += --opus=yes
+else
+JACK2_CONF_OPTS += --opus=no
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 JACK2_DEPENDENCIES += readline
+JACK2_CONF_OPTS += --readline=yes
+else
+JACK2_CONF_OPTS += --readline=no
 endif
 
 ifeq ($(BR2_PACKAGE_JACK2_LEGACY),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
