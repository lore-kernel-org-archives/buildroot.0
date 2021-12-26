Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A834FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 16:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 217C340120;
	Sun, 26 Dec 2021 16:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9W9kMGMXJhXv; Sun, 26 Dec 2021 16:21:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F06140347;
	Sun, 26 Dec 2021 16:21:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A16651BF2BF
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 16:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9125E40286
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 16:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SK6sNo-GA5Ck for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 16:21:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB32F40285
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 16:21:54 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 k66-20020a1ca145000000b00345fa984108so1505560wme.2
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 08:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0vrE/ZGv45lCovAHwBte2lJedMRc4iJkjcwLMB1aKZ0=;
 b=how+NvlKkZFfsw9OpiQQEwSl1i6ZxZ6oKLHV3OEdh7Q2rJAK3HO7YxUNtKCJ+n0rfE
 WhxLp1JrSISDiAKWDfZVnO6aF4Y1zYC4lu3oZyb3nQmbgynQNhjRAajdi+ixhmItSpw7
 00o2ZYVMnR7DE8Uwv8w/Iti4g0jofcdc5uXJh8P/Ygx9sLX8pu43JOtkS+H+BlKJYqRa
 YrIja4I5IavPgFcf9a+ZrmLllic90rsaZpRNPkoMdK0hfkOrhH7Hqz1qQltjhqwCKGoM
 HRsG1QDxtoOcLAkKwo/jJCMAX3Yn8qQH5rv0D1uAx/idVwLVdJyQPkUxo4LVPk8TWjXa
 BbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0vrE/ZGv45lCovAHwBte2lJedMRc4iJkjcwLMB1aKZ0=;
 b=wDl3xG+3Q1HesCcCup/nj9oWBO2hI5IYsho1YqwLdImE5q0jP1JDF+srYKY1N3DcV1
 t4SK9rDesJLHJMzq683WhXcK4RsQh1npmFnVmIBVdaQHcXwQUrf2ij4aCRrEoO2hLsHP
 VuSsU/JXLDdrItn1zNQAz7KeVJBjrglpSGdfln10Tf0WOYyhEXzbt1rn6of8PoLXnqGa
 o9b51RweHS3SSAp6n5gZjlNHHOxi8eUa9xCuwW+QAjcwAHDicWa5RqJHV1AP44JywVhH
 q0VZroKgQjFIrNGjP2/eGiOL+s+4IlJN6kpe0FBM6PMcPAaO06UnbysIccSDxVcqNWSM
 4ToQ==
X-Gm-Message-State: AOAM533ERcvjc5osM4Ie6Z9ms3Z92ZBnFVDgivFy4VhKSiODglcRhDP/
 Q/NEMgGNByLMRiY4sLH7r8cI6Le5m2bwfw==
X-Google-Smtp-Source: ABdhPJy0/s9IE/YKxXOJv7fsf9v0dbisqLdXZ5iCaSUrk+OM5FGG9pAw2TjT4r5W6auvNpJnF3oWHw==
X-Received: by 2002:a1c:20c2:: with SMTP id
 g185mr10648352wmg.115.1640535712747; 
 Sun, 26 Dec 2021 08:21:52 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id z5sm12740310wru.87.2021.12.26.08.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 08:21:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 17:20:56 +0100
Message-Id: <20211226162057.1052161-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libseccomp: add s390x support
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

s390x is supported since version 2.3.0 and
https://github.com/seccomp/libseccomp/commit/02030ce9920181bc1058990ecaefaa754de9ad3a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libseccomp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
index d3b4bb8192..da1d9008e6 100644
--- a/package/libseccomp/Config.in
+++ b/package/libseccomp/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc
+	default y if BR2_s390x
 
 config BR2_PACKAGE_LIBSECCOMP
 	bool "libseccomp"
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
