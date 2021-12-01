Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1DDC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 07:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 517E5605B0;
	Wed,  1 Dec 2021 07:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sJAfKFJU5YDf; Wed,  1 Dec 2021 07:28:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A98A16058D;
	Wed,  1 Dec 2021 07:28:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BA651BF32A
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 07:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6679540322
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 07:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dMYFT6EEkWwu for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 07:28:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DA9940321
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 07:28:48 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso21469783wms.2
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 23:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xL/bF21gM8+V0ulcgQQrtt2lim/NrpqkI15Ktl0vf3I=;
 b=VqG4t5NfoDvrnmGLjrP41qq1u5oFd+7whuyktKCWSge3TUS+uIfwURk2hNp9qMs/VW
 3TGMcm0cAWGTadh97OR3Wkzny+Cab912cmc2DHk70PgeYJ2CpWX8dPSrLNPYqLynxX4w
 cTtHG0uPZgT1Yj1ZNmv46QtecsHpTER0kzEqBD1kZt/wGg2EQ2XurNBbblnRXMowRBpm
 U5qhONtVww9gmdTapHNOHWI58kODeTLf92sJfnaEeyFTsx1Koe6ARAIWkpiU/AMYVlhw
 wRI5/jAsE/S7AvEqc5M786TyKZizv+Wmh55ebV67U+BNDpmWi0EDzcER51yzg8GxBF+y
 SNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xL/bF21gM8+V0ulcgQQrtt2lim/NrpqkI15Ktl0vf3I=;
 b=aJoq6r/elR5tRK1evCb2Kh+U+z+jTaL7YyA3C5JDh4CqkPt5BOr0gb5dpn55CHzmDz
 HEh/Cb54ZUntXzx+AOwfyd0vXKbVNdbMfWRSoMOXU9RS+G4mLLPVpePqCLZRdAelfbBk
 3w3SEq7c1NNnHay8R6iX0Wq9UBulQnVO4UC7oJX611//uQjBvWun5SVf2s2luqOPhA8e
 B+awxW1K7ZFJVoYNaOTH4rTfbFgBQUoTwhXRI+KXXsQSj87P20IeVAfbOymFLzQ2PHBB
 p7m9O3YTl/YmaRo5fkkAjRwuqmDmZgKcEngm9QLFg6S1miDC2ZGEFOzGethhAQjkceaK
 B/OQ==
X-Gm-Message-State: AOAM530lDqIRkl2EBCSr5PTx5cSsE7mZu2Hb0UnmpcYNSZkoA8zOeYok
 K35Baz2ZK1QoGs3VqCmBPU3Kf2ZSLzTPvw==
X-Google-Smtp-Source: ABdhPJyvFgP8OJ2BcfqQqsSKujzPp7mCoWvPBA5ojuKI20gOPEyDXmVUIW27WahYtwkJSn8PAVXZHw==
X-Received: by 2002:a1c:448b:: with SMTP id r133mr4913265wma.85.1638343726947; 
 Tue, 30 Nov 2021 23:28:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id o9sm18581770wrs.4.2021.11.30.23.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 23:28:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 08:29:02 +0100
Message-Id: <20211201072902.565955-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-web2py: drop spurious spaces
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious spaces added by commit
7c0fab65aae632fc820edbe570c40f93c765dd64

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-web2py/python-web2py.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 910efbe617..5ea46fbfd9 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -70,7 +70,7 @@ endef
 # So, we just need to create the directories used by web2py with the right
 # ownership.
 define PYTHON_WEB2PY_PERMISSIONS
-	/var/www/web2py  r  750  33  33  -  -  -  -  -
+	/var/www/web2py r 750 33 33 - - - - -
 endef
 
 $(eval $(generic-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
