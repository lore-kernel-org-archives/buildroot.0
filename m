Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E18BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 04:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D030D40474;
	Tue, 10 May 2022 04:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pLIdz6z21Ure; Tue, 10 May 2022 04:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA527404AA;
	Tue, 10 May 2022 04:46:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66B311BF977
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 04:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E65B40158
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 04:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vENoAxou3wc1 for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 04:46:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C14224012F
 for <buildroot@buildroot.org>; Tue, 10 May 2022 04:46:40 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id i66so4847201oia.11
 for <buildroot@buildroot.org>; Mon, 09 May 2022 21:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UYWFGqAbW7yC1dDZWeEAP02sKe9UO1XT7U9GXmuWsG0=;
 b=AvqXQ0HD2B7zMnU74tC5/+I88yv703jdqsZ7dx897EXUzoTomiAQB0YaBIZyyfbLFd
 o0ZIikbDFb+rLiXilXrt42GkGiTMWjCbGzm75/WCstBodQmRkNADq8ojQWdkzixlUH/4
 WRs4RH+VS/fHFC+ZgpLBh9SS/dUQk/vv9GNQjGB7K2DIH5g5GMDeajL5swyo0r6WspDZ
 Vtxomp2076HowZ3Tl/W2ZoLgowLCvEV/NbrSsWFNhSInzRli2c6P+x7HpHqGxx2kH3Gd
 X7urokezzFQkm0orZ+b0oAoUUtMGvRGOfClMiJ8QxK1gniHJt+Pehve9y9+n2/XSnwKZ
 U8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UYWFGqAbW7yC1dDZWeEAP02sKe9UO1XT7U9GXmuWsG0=;
 b=qOIgFUtzwkM/NFYfjOFt0VRo1QKC4gg+y/0vIIepzwTpoywa0b0KsgkuGWNbKFf+8O
 WnmMFAJTPutcIvHIZ9cEzUGqSiZxMUI0lfQ6Cr/KN95T0k3HxMY6t6UGsvV4UCoiExk7
 AgDcGCcvhLS+T4PRGkjC5SPnnxDKWKO50JI2GKNra/SgD6X7AAUGdXzHF6pNul3nUwtW
 QpJQ47yz8L5ETuhm7sdHWNUDBv4DeAQAWnhKB8A7Wd2vO64hEctmkM0A6e2NH+mdaBP2
 5eDH0gwzAjUC9rmtXpM/nCLBS+taPCB8LXyenYN2OsQc9dLzcD818S51lydIxiD6GVav
 QZkw==
X-Gm-Message-State: AOAM530hHQQZ9IxXJif6jp94I53O7CVhig34pkzshqBezJg/hbhV3/6z
 se2WpAjiS/MZo0t14M3vAom+3zDgE40=
X-Google-Smtp-Source: ABdhPJyvlUlHs+3u3E+0/ccecsmonSmJWqYip/i6UzxH/RFyPG1Pd3yn7LuOxMrIEK3tfMUuMUFEjQ==
X-Received: by 2002:a05:6808:178b:b0:326:d02b:3add with SMTP id
 bg11-20020a056808178b00b00326d02b3addmr3442540oib.34.1652157999568; 
 Mon, 09 May 2022 21:46:39 -0700 (PDT)
Received: from james-x399.localdomain (71-218-126-237.hlrn.qwest.net.
 [71.218.126.237]) by smtp.gmail.com with ESMTPSA id
 n2-20020a4ad622000000b0035f068e16aasm5791742oon.5.2022.05.09.21.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 21:46:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 22:46:36 -0600
Message-Id: <20220510044636.3061290-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/git: fix build with iconv
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Our libiconv shouldn't need the ICONV_OMITS_BOM workaround.

We also need to correctly set the iconv path so that we don't use the
host iconv path.

Fixes:
 - http://autobuild.buildroot.net/results/027/027602a750fd0989f9861773a2c4672667590acc

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/git/git.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 0127ba5129..981a238acb 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -49,7 +49,8 @@ endif
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 GIT_DEPENDENCIES += libiconv
 GIT_CONF_ENV_LIBS += -liconv
-GIT_CONF_OPTS += --with-iconv=/usr/lib
+GIT_CONF_OPTS += --with-iconv=$(STAGING_DIR)/usr
+GIT_CONF_ENV += ac_cv_iconv_omits_bom=no
 else
 GIT_CONF_OPTS += --without-iconv
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
