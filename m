Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDA6C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 08:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69B7160E53;
	Mon,  6 Jun 2022 08:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kqrOYkjP-MfI; Mon,  6 Jun 2022 08:51:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8C5360E2E;
	Mon,  6 Jun 2022 08:51:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B67E1BF39C
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 08:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07BE940546
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 08:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zZ-7kAD002Bt for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 08:51:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 778054010C
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 08:51:18 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id e66so12368828pgc.8
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 01:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ICn9aOciNJmJCYuMloU5zXm8+K/zzU+oxZvsN/wrddY=;
 b=C2QaSVyfrTzOrqnvxVGRh3xQOw3PgNJRsDvrF02BdhaE1qZK2oc1Rx4okN2HyiZenU
 AMb6bd/21VrC7hdqU+gqS/730zVFrSWDV3zKFhsBACVUmFVpi3U+FRIObIq5gKbqIEX4
 z1MLYkEbN/a2zurCyiGICCZXL/bNRZI35JQiWrIhYayk1EbxW/RNzlEulYzoBSH3Rxpp
 aJsvpmNc95LieZ/bxsMBPZBc0+Z0a50FJfuH699qn0R8beSSYWCIZ0RlHgRR0/f33+Pz
 9RImBN3dBLVCbDyFJMuBEJZBPHtOCdA43XwgDtAU8oBvw97kI72iuaPW7X0m6VK7dZIX
 TAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ICn9aOciNJmJCYuMloU5zXm8+K/zzU+oxZvsN/wrddY=;
 b=jfOIpz8ObE1CGcmWJo3JT9z4bnr/EV4nqWZZb0+DFmi+YxjGo55QcNdPbH76Fj8zhm
 RmNQ5dlWQ9TdwgfRyxy0meMlgbeVXlG1B9jMqdB9uyiSYcRI6rC8oP/Q4OYuQzVqgcm6
 3km9phTQYiVIRVSgDQq38B70JP7gd9oamyVEgkTsEi9dg6tZKdP2WQIGTxLeWx1ZazTY
 jIbI7fbuFabv5XVbVaNtcBuemLi9n3lFoZAW6+QFuWpeZAcnqJ+7wwRhG5pddxVe6XH6
 Yn07Bqi/El7sp+OFbVDh+nEzRZh5P7fnvFrL3EnHz2SfxCNw809jVLd0LAHMldoWR8aN
 bsdQ==
X-Gm-Message-State: AOAM533wAAGg7WgsO7G7FcLOVF+h7952IJxYmckpPKXe+v6xd36Ymqwh
 tyfxD/29EnIC5xkpHHSbQ02uwiDS/6Q=
X-Google-Smtp-Source: ABdhPJxmRLQ3Qs8avKFSDK5r7VJe8w+eS/Rd936PrN//uQIuisyc91DEoaC4k1LlAisU7fQjAfenXw==
X-Received: by 2002:a05:6a00:130e:b0:51b:c19c:44b0 with SMTP id
 j14-20020a056a00130e00b0051bc19c44b0mr23406283pfu.21.1654505477114; 
 Mon, 06 Jun 2022 01:51:17 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a170903020200b0015e8d4eb1f6sm9975253plh.64.2022.06.06.01.51.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 01:51:16 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 18:21:06 +0930
Message-Id: <20220606085108.1628288-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] powerpc utils and librtas bump
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When investigating an autobuilder failure I discovered new releases of
both packages, and they seem to build fine with musl so I removed the
glibc restriction when bumping.

Joel Stanley (2):
  package/librtas: Bump to v2.0.3
  package/powerpc-utils: Bump to v1.3.10

 package/librtas/Config.in                | 5 -----
 package/librtas/librtas.hash             | 2 +-
 package/librtas/librtas.mk               | 2 +-
 package/powerpc-utils/Config.in          | 5 +----
 package/powerpc-utils/powerpc-utils.hash | 2 +-
 package/powerpc-utils/powerpc-utils.mk   | 4 ++--
 6 files changed, 6 insertions(+), 14 deletions(-)

-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
