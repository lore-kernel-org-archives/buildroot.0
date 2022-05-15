Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDABCC433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 09:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69AED40A6A;
	Sun, 15 May 2022 09:04:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CmfXNFZusEtZ; Sun, 15 May 2022 09:04:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 909F240A65;
	Sun, 15 May 2022 09:04:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4FF1BF588
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 09:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 659CC60F5C
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 09:04:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PzG8xxVzJ_Tz for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 09:04:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E9BF60F3F
 for <buildroot@buildroot.org>; Sun, 15 May 2022 09:04:44 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 n6-20020a05600c3b8600b0039492b44ce7so7051639wms.5
 for <buildroot@buildroot.org>; Sun, 15 May 2022 02:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gbkaxl3ZFkGSHtGyY6EWfPPJ85rwONY7Adlf7MzBfVM=;
 b=GMoZGMx1hve8uqReu4cXbQtzhwoDpWi1DXgLkfcqUT5DU4VdQ2YEP4ET8wGxoyy/xu
 N3ku4QAaD/D8+jRReYY4+dUwdtXA2DVBBa0a88xrDlj+vIXEC1Lnc4LoFjps0pRRwba+
 0ClnZOgR03F7ymiBkujbE8bmS5pmvzSm67CEvhOxFRB5hG0CfEdtQcWd36ZQWQxNktwy
 26a7HFa/KkwYtCBXURpIT84ENuDupQltM6NnAx5ZrIlcPk7c2VGwIYetEOw8y4C6fkul
 jE/ElCoBEMgVkFnjgHf/jq2qNXRd6bLvlHmcfPSc5hw6KY9bclHTXvPuOOpgGzdJe12W
 oxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gbkaxl3ZFkGSHtGyY6EWfPPJ85rwONY7Adlf7MzBfVM=;
 b=pgedXjTPDVskqpXySCbQaBU+qWNT8bLaZYbBVRdbxsQ4u/o602+v2AaPjKXsEXbIyN
 RIHLu4Q2IMa5vO5SjKIPhiB4x4ib/X05V0v9vaTx/PIQerb4T1Zb3aJNjpNjjMkWWWzE
 VQxtWWYxnf6GsmMM0wJh40OMo0Hw8bNYfPcq9zQEp/76W8ZYFG1e35S035Rc8ypJaBjt
 Yo0+N8NCtI0pps3sW67nSVzcseLefkjfTEHbmH253Y2Nj7jStSVK+6njEqtqrnbGu8L0
 M6W2iAlfmMNHBZGBkDxkXEEvirIGXVzoLNG9+AerRGQfjr7DPPZdx4FQlocJ6oXbP4OU
 kTJQ==
X-Gm-Message-State: AOAM53338DR3wp42D+CW67Nns7qgF6+JesFUd5o+c3n3gSqwYzeCRnrU
 MXBlFPIhQ1op7OtyjYLJvfRFDfgFEcg=
X-Google-Smtp-Source: ABdhPJxUOYVd456HAhL0xYlroGY+h6QODtpyQYSxtWTdWBeldxKntviQK19uXj6x7xj4hQx8JjTMxw==
X-Received: by 2002:a05:600c:19cf:b0:394:96c4:8959 with SMTP id
 u15-20020a05600c19cf00b0039496c48959mr23082973wmq.9.1652605482387; 
 Sun, 15 May 2022 02:04:42 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o28-20020adfa11c000000b0020d03c14b9csm1889736wro.1.2022.05.15.02.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 02:04:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 11:02:28 +0200
Message-Id: <20220515090229.395668-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/2] package/glibc: can't be built with Optimize for fast
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

In file included from <command-line>:
./../include/libc-symbols.h:82:3: error: #error "glibc must not be compiled with -ffast-math"
   82 | # error "glibc must not be compiled with -ffast-math"
      |   ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3d91f3685ae6c3e1f765d419ea2c0da4cb0eb3be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Force -O2 instead of disabling gcc

 package/glibc/glibc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 7b46ad42c3..45155fdc28 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -118,6 +118,11 @@ ifeq ($(BR2_nios2),y)
 GLIBC_CFLAGS += -O2
 endif
 
+# glibc can't be built with Optimize for fast
+ifeq ($(BR2_OPTIMIZE_FAST),y)
+GLIBC_CFLAGS += -O2
+endif
+
 define GLIBC_CONFIGURE_CMDS
 	mkdir -p $(@D)/build
 	# Do the configuration
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
