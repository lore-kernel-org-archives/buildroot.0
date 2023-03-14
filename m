Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DEBC6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 09:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DD5B61057;
	Tue, 14 Mar 2023 09:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DD5B61057
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ecBwdqkYwK-k; Tue, 14 Mar 2023 09:52:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B43DD60A77;
	Tue, 14 Mar 2023 09:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B43DD60A77
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1CC81BF3EB
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 09:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84B988140B
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 09:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84B988140B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j6dijzVU8VBb for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 09:52:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E537B80ED1
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E537B80ED1
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 09:52:53 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id u5so15969591plq.7
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 02:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678787573;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jTbV669TmOC53nmVdSLRUsB7fNV1j0qTEslXuZn4EMQ=;
 b=KJtKQ4Wxv0V+epcDYODKtBoe7D5PDDEmJI7a2ioo8pOCQz3g1Mgif0JeFmbttE63el
 IG3V37pJ8w8LggADazLp7enpPWf7IRnXOo3vEvDf5j0ommTEYSQkRWVgEiJIQ2XrTLiZ
 d3u14ik8XpGaYKymmezkWsbDO3+cCjaQcdBgaEVffaNBPf8/Km99eWG6pejkhDNjalcZ
 Z2NDCfEINAmzT/uaWgvGbOUf5T0VSDouzd9/j6MngObeYJjMfNX9ANcd6bM13zW7lHOZ
 LgRgCn5u97iBGRE0Ba9m0kzck0iaQ1mxIrZrQMvXE4tswxAGY6xRNPTMJ3K6QcXaX5dR
 KclA==
X-Gm-Message-State: AO0yUKU+szOf6CUqpF/C2aD7RsFto9rqSoFSuekzbahd3+0I74jfSYaO
 KXQIT+9urZ2vez95PtNwl39LAgKMElo=
X-Google-Smtp-Source: AK7set/x/wNDeJzltAfKXAXhvji58Nc4xofD0UkgKSFrUsl44v2DZmtuvY0Zn3XM9umMW6nK5ws+Qg==
X-Received: by 2002:a17:902:a9c6:b0:19e:872b:e844 with SMTP id
 b6-20020a170902a9c600b0019e872be844mr30442809plr.40.1678787573132; 
 Tue, 14 Mar 2023 02:52:53 -0700 (PDT)
Received: from debian.. (subs02-180-214-232-19.three.co.id. [180.214.232.19])
 by smtp.gmail.com with ESMTPSA id
 km8-20020a17090327c800b0019aa8149cb9sm1358783plb.79.2023.03.14.02.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 02:52:52 -0700 (PDT)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Date: Tue, 14 Mar 2023 16:52:32 +0700
Message-Id: <20230314095234.284584-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678787573;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jTbV669TmOC53nmVdSLRUsB7fNV1j0qTEslXuZn4EMQ=;
 b=g/ZyT6eY9QIZcetl5ZJpqBqQQrCWG4zfjDCBmlyUdlJgimx2WEZBB+0OlGjA7CK8ap
 CjuOcFUT2BPgxkotFxWQYSz/jRRsv9SMnfFykSM8UG/LnFD/TAhN9CK5Vn22fsBGeZPp
 vHfrDspLXlXYJ17R9RYUvBmLCsLXMgAy3wsFoBjrnf9iH5L84JBTKfLtIOeQsYvxby2o
 aD47ekL6mLqSN++lgcwYml2bOY95+hZioLPrcU3promWPzvtp1iYCKTtwldmKr6N46N2
 hgEaqtVqIUfoPt+n8E/H/Rq+A/JF2+hPpmfEiCVqfc+edp6c7DG/SYijJ5yYiYgDefAI
 Jdkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=g/ZyT6eY
Subject: [Buildroot] [PATCH 0/2] git version bump
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Git 2.40 has been released on March 13, so here is the bump.

The actual bump is in [1/2], whereas in [2/2], add DEVELOPERS entry
for Bagas as package maintainer.

Bagas Sanjaya (2):
  package/git: bump to version 2.40.0
  DEVELOPERS: Add entry for Bagas Sanjaya as Buildroot developer for git

 DEVELOPERS                                    |   3 +
 ...avoid-redefining-system-function-nam.patch | 109 ------------------
 ...undefine-system-names-before-redecla.patch |  55 ---------
 package/git/git.hash                          |   2 +-
 package/git/git.mk                            |   2 +-
 5 files changed, 5 insertions(+), 166 deletions(-)
 delete mode 100644 package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
 delete mode 100644 package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch


base-commit: 27ea8958e1595a92b92f7057bcf005db0fa363f1
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
