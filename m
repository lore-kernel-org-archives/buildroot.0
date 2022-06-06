Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F5DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 18:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5293B82B3E;
	Mon,  6 Jun 2022 18:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6u1bjsetX7Fz; Mon,  6 Jun 2022 18:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AE12828F2;
	Mon,  6 Jun 2022 18:43:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCBB11BF2E3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B665341496
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRc8EAGPrKZl for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 18:43:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E25F410E6
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 18:43:37 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id 2so11038115qtw.0
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 11:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Cz3rBqmJs1ICCKIMUfdA2HzsX3NZL5o7DD2DoCI9XE=;
 b=hVKt8ndPnkS1DVyPV+1ZpwWRdl51z2MAE0/FIi3cMR9dmLlDNrsnucZiGqQ5M3DqhD
 TqMrY2cCI6qcXXP1d8XNGIvFArHVn0yqFomGvEOqqf39zA49YqyQto9c+1F0DOFC/x8r
 7zWaYJRwVLixqGYeuvtgXBkoIMWT10LAprX3SUK2iz+TyiVZNRYiFFgN1R1e0N0013ue
 aBuBEaCffIUbNY5USnNK9ogXScdMT7NzPKX46YKGTf+mgPJRn3Ak+evlhwV9dGbzOl4s
 y7MqO4GGyaAq7qA6c45bswMcIq8InXoT+pt3aOyDPbKvGLi8n71mEhidgdtQv/qnGW4M
 hCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Cz3rBqmJs1ICCKIMUfdA2HzsX3NZL5o7DD2DoCI9XE=;
 b=XEnQgCRh3CfG3mfQfA8Azry9g/aqcN1PgonMfq7IXkx1CrQJlEhDb7no9O2bM1RRuB
 t4w53rsrQm6eT7yY2I37gBbYdViYqqb8HqSw6RgeT4nr4pX6MiKKkVWd6IUQQemx9m9e
 LFY41k7HS5l+dg2t6wG/4fyFUlHVbrJszXTG1QuVa8LrjohBszRyA9GWD8401rOp3VyK
 Cf0QRfOeaeHRL+nwu83qcBI3DrQw6DGO3r6wAuI7ZGLqIpsqxWECUfxTsI/3fPNma1u+
 rI7pNaLJY9hBlqyz52vOGN2GSZdDY3+YhOGSWU6vbnfNQfYEP+DEST0RutDZcfZ2q10M
 xvRA==
X-Gm-Message-State: AOAM533lDdXUHSXE/+Yk4pPPivce+mJj9O5WSUJ8Ahi/Uw9PUq9qb52g
 r6aF3hFD30RH5oFMDRieRHc=
X-Google-Smtp-Source: ABdhPJwg0BuQ6/ACAhxT4P99URfrqIgrZmmjkl9nBQp+xSJW0CGJN0ZhCmqPYRRyTwWj/8ykBK4/bg==
X-Received: by 2002:ac8:5956:0:b0:304:d85d:f16 with SMTP id
 22-20020ac85956000000b00304d85d0f16mr16929733qtz.606.1654541015982; 
 Mon, 06 Jun 2022 11:43:35 -0700 (PDT)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a05620a291000b006a6bb044740sm3584880qkp.66.2022.06.06.11.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 11:43:35 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Mon,  6 Jun 2022 20:43:18 +0200
Message-Id: <20220606184320.8210-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] LTP compilation fixes for buildroot
 toolchains
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
Cc: Cyril Hrubis <chrubis@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Li Wang <liwang@redhat.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Martin Doucha <mdoucha@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

this fixes 2 compilation failures of KVM tests reported some time ago [1].

Kind regards,
Petr

[1] https://lore.kernel.org/buildroot/YofzKdQAUOnR2gSW@pevik/

Petr Vorel (2):
  kvm: Fix compilation on x86
  kvm: Fix undefined reference to __stack_chk_fail()

 testcases/kernel/kvm/Makefile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
