Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9E3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 20:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEBFB818C9;
	Tue, 23 Nov 2021 20:56:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0B_amTYOtwEw; Tue, 23 Nov 2021 20:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14F2D818A2;
	Tue, 23 Nov 2021 20:56:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D6DB1BF3A8
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 20:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 873A840487
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 20:56:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTpMXCf7JMrQ for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 20:56:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AB4A4047A
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 20:56:55 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso242824wmr.5
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 12:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ASPHgnvGYiHW7yZthu2EtOfVhWqtwCbUdXovTZz20w=;
 b=g8gDNfVlObTR3+5v93jnWwJGUtFznRN2lVnx5tCW4kSmLIvd4o/oQc6slyimGrBRYZ
 7dzYUjL33SnK0fbvORiuk9Gep/Pr8N0t/9sLXeGMIC6X2Vfz8d2lC5rreUbVqy7U/vv2
 0pI6A3Y/LXzMADDUl2lgLJ5mOfzsybzmGV+mRmtJsnBhgNNaWkC+V4ZHJfgzod0hjOuJ
 A28tctZ0m1iiDl2pV136ivAI6vnrdRXoQg6lV/mOPBS4F4sLNMhLzQWoLrr8cWUnhlGi
 MsTBK7Pda1xE/WtZQ5NalJRkJoNyQLOzj4iU4NcmQQCrRudRVALKRetTU8vPilkSmeMK
 ajiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/ASPHgnvGYiHW7yZthu2EtOfVhWqtwCbUdXovTZz20w=;
 b=AbkRVdnsX/wGyK6j/QkioD14FyGt+uJCaarThe/bb7fHyrBchdimW7Xvh6zqmABeFV
 Y3bm9xtH51Rq/B1UI4bQtFb87nEFpdZdKokzzkAwcT6k1v+0zdHj+AsSxMvgDI3KBy/7
 fULIchOC0c/hKIWrHWJApG0mdjN9/EZIlQu7hC8QycLLYoOfjD2bss4u3By6lGkEYaKx
 iLmwqCQ7ZhC5W/BjcdICcPTVnaS2PdBWzhwpiZO1o3EuQpZCxqRPSWAKrEkxHTLg1kLJ
 iffWUVlpUjusAmm2Q8p8VdXUAEDbkn10n2EWMMsbzhivyfKG9bihriP8PkTrLslbbxNX
 9cfg==
X-Gm-Message-State: AOAM531Rcd62/+yMIH6IAPAc9qf9gRwvBpho+adlMkq148WGuUd0n6KL
 /3fFCMJ+BFysx0VYUxWc0PCth2gnHlHt7A==
X-Google-Smtp-Source: ABdhPJxD0c0bqt3WtZtVg/5IfekotiYYexsds8INIumlU0gsDnIALi+cy0NGYTvebnCM1F+4mHqdTw==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr7413660wmk.50.1637701013818;
 Tue, 23 Nov 2021 12:56:53 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:b92e:f94:7d9a:74f6])
 by smtp.gmail.com with ESMTPSA id c11sm4170296wmq.27.2021.11.23.12.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 12:56:53 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Nov 2021 21:56:37 +0100
Message-Id: <cover.1637700992.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] support/docker: document the use Gitlab
 registry (branch yem/docker-gitlab-registry)
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This two-patch series changes our Dockerfile to directly use the Gitlab
registry, and drop references to the Docker hub, as we no longer use it.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      support/docker: don't use sudo to build
      support/docker: drop use of Docker hub, use Gitlab registry

 support/docker/Dockerfile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
