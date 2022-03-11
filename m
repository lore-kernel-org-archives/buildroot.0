Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2B6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 19:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB9F74185A;
	Fri, 11 Mar 2022 19:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E6MEByTZ2Lfi; Fri, 11 Mar 2022 19:27:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 116874186E;
	Fri, 11 Mar 2022 19:27:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4CD11BF479
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 19:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2450848B0
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 19:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ec0M1PKlbCfm for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 19:27:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B3AB848AF
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 19:27:38 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id x9so90808ilc.3
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 11:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dY2hxTWtUBYowlpWFw7KEzq2pNY5hTuo1mMqe8/eoUE=;
 b=eoK7yFMAJjoe2uJgY87/yHIN+gv0vb8KAvfybLrH0QPT2GwXmvO/Q2EX7qK1zY4ScW
 /42MNyFa9Do7jlmKzWlQeCif4SEFBIzbrI9xWxPTikG3ofEzOga6yrYMvDmGMy5gHGkb
 qn+/25RjIGYX1YAZsukMBmMRkFu0uDo1gFsFevavc4dsJEguWHRLEKPs8vlx+M+4Rn4/
 dmpapI21sRIU40TDkRokeif0UiYT9jCWrVPSbOkhND6Bfwbb0SxBOIZQQXR6TcXx93kZ
 O0lZofd/qQc6E09GTaKRhSkMCZaiNM49AFE/g+lOHenThjS5Xa6BvSE4p9IToOcfE3Qq
 N1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dY2hxTWtUBYowlpWFw7KEzq2pNY5hTuo1mMqe8/eoUE=;
 b=pkQn9vEW4Siv9+gB73uhhS/6oG8P09kDnNNGel9koVv/l4IUg58b+l6jTFTdOlzsRj
 5DVUUNIskUTCc//pkRXTq3otXfNzYyGcEykJGCl5yhpyu0FkQii6757N8By+z42dTxNc
 4LogvOXDXiezefjOcciHQIMWuC4RLfnF+5xN/BPC3D7amDh/oh4LFBvmH0dZanP8PraP
 8gnZMde88MyKzZ/Lffh0mx7SEAsbMtCy4rI/ycBbl4BPHkVJ2g/CDS+LfbJrkBptImiE
 583pkxYCTqhnId0b7sBe4gMnIE7nYzSvKiBj7sm89vkxo/9UrdWsoL+2t4dR0MeEuPYk
 8Ajw==
X-Gm-Message-State: AOAM530Io/nGTsF3ey6fUvRpxvGVABjr/BehnkzFHfidS14yM2TyaoEN
 90OKKn2icH7HT4m+IdXZAaXcHYtSUcg=
X-Google-Smtp-Source: ABdhPJz7sxNYhftQP2AVFhD4P+Czaz5dHAXbSgLWCxmjpfoX9VLanHs6Oe2vnaZ9sqL6JbX4hFvaDw==
X-Received: by 2002:a92:c261:0:b0:2c2:8b62:f6f4 with SMTP id
 h1-20020a92c261000000b002c28b62f6f4mr8985290ild.108.1647026857017; 
 Fri, 11 Mar 2022 11:27:37 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 q5-20020a056e0220e500b002c5ba03f8eesm4964850ilv.9.2022.03.11.11.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 11:27:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 12:27:26 -0700
Message-Id: <20220311192726.3879992-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-python: apply host platform and
 project base to pep517 env
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The _PYTHON_HOST_PLATFORM and _PYTHON_PROJECT_BASE variables should
also be set for pep517 builds as they are not setuptools/distutils
specific.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index f031bc8fae..52ce402281 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -113,6 +113,8 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 
 # Target pep517-based packages
 PKG_PYTHON_PEP517_ENV = \
+	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
+	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	PATH=$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
