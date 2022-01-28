Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4C5C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 17:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23D046112B;
	Fri, 28 Jan 2022 17:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPO9Jr2eLyAU; Fri, 28 Jan 2022 17:33:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16E1D60BFF;
	Fri, 28 Jan 2022 17:33:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 939381BF3B8
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 17:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E23360BF1
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 17:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SCy_LeBCoO_9 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 17:33:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8586460BFF
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 17:33:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id m26so2528369wms.0
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 09:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O9jKVk+oehDEkDztgcbCLR5UpKzuYBnj6FJRAglZpLk=;
 b=CI2TeU0n+iOvZGxEpBMvwPZsI5LOhtqyAuSAlPSFA3hGfhoIW4auCK0GDV//jZnl1R
 UoBOy6ipzoDUAyL1AY8k1fYAnDt3ZdIWGlYcvn87PDYwQdRNXnmfOAUmE/zfhnGButWL
 9jpcAfm/d2h2SCe1yVCKah4+ZZ23KIiflYyNdt8atEgVLz3qUL5CyesVd1VVbq1aTDw9
 m+7y7BzYzjp6ngUlxJWhjwKxIQc2M+h2ABmXvA5Efy6ZbnRlSz4frTPNAuNrR9Kais2D
 4vuzvPXOb70Ja5czsapMetgju6bKWy+bsyN0EAlpdpmZu/SjA9jERnC61Dt2m17oszPF
 ZFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O9jKVk+oehDEkDztgcbCLR5UpKzuYBnj6FJRAglZpLk=;
 b=uSPBUCMT4w3itNfntDmkKn0OGbTDEsJvxFORMDhJtFOJcDprw30Nu+X+jEfHd1zCmG
 YTcoS88bnYHh1oA7Idn1SJgzkORRpojFn/RRmRMEOEG1ZBDrkvqmrFHf9dnkanwnjTEe
 9lVYmiaRo/qHfGWtpL9c+nv6Qi1lNtbMbbtxCFZXQvtVZSsBqXbAhlySV2DmBVYST0Kx
 g8V/9ikl9SE58EfsTymR1Tu47hXrv5Mh/YKOS1mNX5OQDno2XOJ6qKtBW2ysXB/p/0Pn
 J5mH3i1msIlaYsi7HqBrQfbiCqP/aEXYBBg3zIH7tiH5qs6l8sOyDi3SgkHjCiiVj+2O
 myNw==
X-Gm-Message-State: AOAM530bUTb/QfK/b2feXlLvGdKq8UbY748cMzL06QJBp4JvfbmHKXYs
 LZmjj5FSl0tOw1BaceULEdbPHLCKRyw=
X-Google-Smtp-Source: ABdhPJx2a/AjlgzjH4aCfPvLiZIZ4xMm/fT+CbG8wEmFOgkUFjmBfLDj47nj3MLng79Jb3/ZV6KXRw==
X-Received: by 2002:a05:600c:3392:: with SMTP id
 o18mr17045128wmp.59.1643391230530; 
 Fri, 28 Jan 2022 09:33:50 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id az16sm2377286wmb.15.2022.01.28.09.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 09:33:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 18:32:04 +0100
Message-Id: <20220128173204.2483569-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/midori: drop select of libsoup-gnome
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

libsoup-gnome is not used by midori since bump to version 9.0 in commit
42f19d49fb2da891be9266a2f843292d24847f18 and
https://github.com/midori-browser/core/commit/0c2d8f0ea61f20476542e861bc1772a878a54d32

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/midori/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index d98d7cb161..715295e5a6 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -41,7 +41,6 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_LIBPEAS
 	select BR2_PACKAGE_LIBPEAS_WIDGETS
 	select BR2_PACKAGE_LIBSOUP
-	select BR2_PACKAGE_LIBSOUP_GNOME
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PYTHON3 # gobject-introspection
 	select BR2_PACKAGE_SQLITE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
