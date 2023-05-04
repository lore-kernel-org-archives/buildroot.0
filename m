Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA12C7EE21
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 07:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F31FA41DDE;
	Thu,  4 May 2023 07:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F31FA41DDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JCwG6M-XoZsa; Thu,  4 May 2023 07:37:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AE8E41DFC;
	Thu,  4 May 2023 07:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AE8E41DFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E45F1BF3C8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 07:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4771C41DDD
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 07:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4771C41DDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qSf7va1aSCy5 for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 07:37:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C02641DBB
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C02641DBB
 for <buildroot@buildroot.org>; Thu,  4 May 2023 07:37:33 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50b9ef67f35so172177a12.2
 for <buildroot@buildroot.org>; Thu, 04 May 2023 00:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683185851; x=1685777851;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Efk8b+zhw64SYXnh0VT50L9vBEm1q+WZa4hC8QH8oo0=;
 b=hcgxchxy6g6so669Py5qMaM2cYuzXquplLdpIzUnc4dHYT/Ii//GhVAKCIyt+R+/nr
 /xnco4MXD7qg0usssRQxTy2SvI+TzExLCedxMWCXu9kjcFp/ypGX+uZVRKqs6Ow3nuDH
 TCJ42IyLO7SBCXqUk+52GUrmi5sHzxsoQlmNBYjAQqufQdPcTwumkfWSy91wpTdJ7PVc
 lIT7jPR6mjOUTM+UmDeFBzh7Q9GCWfMkLTV3pcNFQ3OnZObnGjh9UTV/0IM33zwklSzi
 ooPvLFmGo4xaa8nwwor6bt7NiaW0tNNGHqK5eDOa87P2eeF/yFa1+oNTKBZ5FbR7vt6j
 cAHg==
X-Gm-Message-State: AC+VfDxnyBn47/LXLAkJZ9QFd6yXRzElO7nG1ldbTJj1uhVVbylClt8G
 xmESWNaPwFHRpg5JYF9GV769+G3PCbE=
X-Google-Smtp-Source: ACHHUZ4/y+rq68TYlzxvLXfd2LAjTqkY/6GLaUd5+vionPaOiONkWDzh6p2JLdpZlC84cj5PZuscQg==
X-Received: by 2002:a17:907:1b0e:b0:961:272d:bdbe with SMTP id
 mp14-20020a1709071b0e00b00961272dbdbemr5684462ejc.35.1683185850760; 
 Thu, 04 May 2023 00:37:30 -0700 (PDT)
Received: from goliat.isc.local (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 u17-20020a1709060b1100b0094ecd76eda9sm18195693ejg.182.2023.05.04.00.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 00:37:30 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 May 2023 09:38:20 +0200
Message-Id: <20230504073820.16831-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683185851; x=1685777851;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Efk8b+zhw64SYXnh0VT50L9vBEm1q+WZa4hC8QH8oo0=;
 b=dNB9luldMisqNomg5kJBRbbGRdJ7hbXfFqbxiLUKMuol0eeyF+hldvRqjOw5PFvOn6
 cVrHzToqit4deoISNlRPJX1K+3oTQJZmF1kVDYq+u12ZYrRJAfbh6loksSPvUNUU6JRH
 YpYZR9n/Kli2UeyhxMNAl1BjSIUDSZzdh9lZ1xflezoCKRUR11oRerAkWxjGO0kFgX9J
 ef3Lq7MbGo7hDNqiRH6e47KJCwnTDVmX0bWBlOi/OqRbv/rUNZD2ARAK5UDQ9PNkGT3T
 RNTuhYz6gCgI9BOf9jyuYtfOfymmcPYSt+WLeOYNQPvxtQKr0ycEi3zCFW17m6VGzR8I
 yFsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dNB9luld
Subject: [Buildroot] [RESEND PATCH] package/libostree: bump to version 2023.2
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 63dfe98d80..db99b4b07b 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dd792b167693a1971c9f6e3168013d906ac035100ff6c719a3b322eb44b96f55  libostree-2023.1.tar.xz
+sha256  ceb0788755a0bff5738d44543552fbf883cf71df481baa3ca7288da7a402bb85  libostree-2023.2.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 4b17fcf391..367a833ac9 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2023.1
+LIBOSTREE_VERSION = 2023.2
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
