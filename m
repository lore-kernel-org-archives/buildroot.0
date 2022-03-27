Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F4EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 19:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10CD0408F8;
	Sun, 27 Mar 2022 19:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJPRwazs9jYK; Sun, 27 Mar 2022 19:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5EAC4017B;
	Sun, 27 Mar 2022 19:41:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BE3D1BF386
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 19:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A23B410E1
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 19:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-5MiK5wcCdM for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 19:41:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18EC6410AF
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 19:41:18 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d7so17480225wrb.7
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lzNU4yR94tu6/9lNYYo0DRICn718gh3hFiHTW7DeCVY=;
 b=WRSc1X4OIXBly6qEAyYpmj31tbdlRFVjXleUEwiDZpv4kLhtMFaaRtvULOvjVFYA7r
 Ba/+aCB560bQeW1v7hUhfkZ3mPPalQiWgQKWfGyj8TW6d6ZPbtey0jcjwXwFWws0wNvZ
 To41n7Ufqu//Qgmb2qdXfGXavt7YX080vmHP6uhkRBjx7dBpfJSlpPVRA1tEoKR+xb1n
 +qboirCqvdPWGCdtoVzJOAOF0eZMkqYaP29+mb79paL+YtgNk95jUcHypc7wjxjoKCZT
 M3AdLCvNip6JJf/gYUlw3pcVTrtFSCEoY5nkdUMn5KCRcp93RCb5pVA0V95SB99cBrO2
 3Vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lzNU4yR94tu6/9lNYYo0DRICn718gh3hFiHTW7DeCVY=;
 b=MhpSDL2X692s8FnyLHUYZWc1JYlMvGQReinDUKttz4/SwDbeADQ7tIX4V+bRq4bwNl
 7fFLg+tLRK4SVpuRfXMYLbNP8yp/lhSuN2XjEsanPfDABxG29+qXdVZlyB5uFwS51Mbq
 YD+BJLecsLlIrMR/5uvrCNdvz8lBcDeLlRylgQ0b9EBoUTxCgkVIb2uIWdmRAurrwVwR
 8JZiaGUBOSbkgWE6m5LSieU0YjFkU9tJOXjj4xrnLjyAZKOqFOGe9HAH18/p7E+YqitW
 hyT8iu+y+AOsEQurqxEMi3lFr0GKoO+SrnA5ocILxr9XsZO4nsgNAWw/hHEq97oKDhcp
 QJ2Q==
X-Gm-Message-State: AOAM533da9xaj2ckCVWvLJ/tmbMd8+ajB68HUqOc3RELVTo+zvDfdmYT
 0bHvp7ZeZNb98EzQZmAlrE3cB4sqBFk=
X-Google-Smtp-Source: ABdhPJx0OaYbq+qCCOIGCFQANsWI3EowOK+Ru/q6yB/0i6QGCn8Fd0i5FF+Otkb9eWcOmNdvGsqM3A==
X-Received: by 2002:adf:914f:0:b0:1ed:bb92:d0cc with SMTP id
 j73-20020adf914f000000b001edbb92d0ccmr18462779wrj.297.1648410077144; 
 Sun, 27 Mar 2022 12:41:17 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a5d53cc000000b00205a0ee9c74sm7433049wrw.89.2022.03.27.12.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 12:41:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 21:39:55 +0200
Message-Id: <20220327193955.1277972-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/opus: enable custom modes
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

Enable custom modes to avoid the following build failure with jack2
raised since commit 618a23100fe5ff54b90ada1a8f23453f6c5a77dc:

Checking for header opus/opus_custom.h   : not found
The above check failed, but the checkee is required for --opus.

It should be noted that before this commit, opus was silently disabled

Fixes:
 - http://autobuild.buildroot.org/results/b1c050ccd6152c43a6da5f5d2174c3cc0dc2ff3e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opus/opus.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 3fb2d5d65f..4f816df477 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -17,6 +17,7 @@ OPUS_CFLAGS += -O0
 endif
 
 OPUS_CONF_ENV = CFLAGS="$(OPUS_CFLAGS)"
+OPUS_CONF_OPTS = --enable-custom-modes
 
 ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
 OPUS_CONF_OPTS += --enable-fixed-point
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
