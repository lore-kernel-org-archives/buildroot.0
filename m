Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC197C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 15:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61B3F827BB;
	Sun,  4 Feb 2024 15:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61B3F827BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hF0aZ8Sb433V; Sun,  4 Feb 2024 15:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EA0B827C6;
	Sun,  4 Feb 2024 15:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EA0B827C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94BB41BF47A
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66024400D1
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66024400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gTlngp2o_4Pt for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 15:22:53 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25939400B9
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 15:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25939400B9
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51109060d6aso5123025e87.2
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 07:22:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707060171; x=1707664971;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kpCVGeW0lRKX7hImuT+OwGqo6xiBsRkQbWg6JOmM4K0=;
 b=ODvhr7sXLXYaWafzDhF37O+vmQM92KpLmQBwf0/WqK2FtDLL6C0XVZaUqFOFLNfIum
 NVIq+/YjK1xMdz2QfnE4nKAGzXRbc4BW054bLIQ6bX8bp0viS2u8bQ7vOc8hSQG+dh2h
 LwCRXNpgpzczMxRSUteFExCNRHDKPzdRKCNjlsTUgPIr2Yw9RXQKVx5nBrWxXV78uJez
 8o0plC6iQ+Y434UGHnYtVv9D4mJ91nleWapk0yWsi9iBLp2iRLQNtzQjXfYbSoM1bhvC
 1xuNo7jeO2os20yRiX3p9YHuICIP//bTTKRIuGb+h783LwD7poG+C7pvqAcE3sN+3/od
 1/Sw==
X-Gm-Message-State: AOJu0YzgypCiTDxARKvu6O68fLAYib6xPSCTzuzom2vE2TVHNjp0QruQ
 j2xcebplE8U58rit3DRrj3DzhN3Iedq2xuQUeDnlU/jCXAXxk+E9dd+Ta0zFTzQ=
X-Google-Smtp-Source: AGHT+IGPzDpnbnoR42CTb2dI5eEMsYJPJ0YqA8uSzBV0KGnPO1B5AEJFe9ohONT29c5ZmzI3rt76KQ==
X-Received: by 2002:ac2:5f97:0:b0:511:4cb7:396b with SMTP id
 r23-20020ac25f97000000b005114cb7396bmr831713lfe.8.1707060170681; 
 Sun, 04 Feb 2024 07:22:50 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVmsVUxkL9QfgiGEYSBYOgMNz9H38RMHI6+2fmKYGnEcGwxCivtH6T1AUZnB5Qc0GHm5snVziJneAy872Hx235XbmkwtebYygmX7Fi0d6VbZ18A/tb/bfLQwcjAwazaG22T4B+quuQ=
Received: from landeda.fosdem.net ([2001:67c:1810:f051:9566:1ebe:e5dc:dd49])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a17090699ce00b00a36c6b0485asm3224773ejn.103.2024.02.04.07.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 07:22:50 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 16:22:49 +0100
Message-ID: <cover.1707060159.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707060171; x=1707664971; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=kpCVGeW0lRKX7hImuT+OwGqo6xiBsRkQbWg6JOmM4K0=;
 b=AaZRI1NiPml9ITL5Wp4rDYz3eO8xrt6p7sdcLNAKygPgHEvIanm8+eS0hlTViYeiLY
 9kLEZ6g9K9MnwqY6C3Jxicl9g5cG2ezxLlkOlyQoMzAggZ1aGvVKRLKne1vdwuPFltjI
 ZJ8TAkM1c45uEfWffz7EdQnndDZeVPFrzGfnvL6fcO9Deo6qUeCvedkCZ8vO72AKkcAO
 l8B95PKfAfQ/YDEvZmRLPR0PbxPRH8UIQ/YFT4Rf/k1MLdkE/jOd0YQjI85mhBsMW8sH
 b0rr6bqt9w27xpG3Zrk4JuZiClbrLDQ662I3Yz/a+AIvWLler9rv4czA93e2FgQ4Bdqn
 HZ/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AaZRI1Ni
Subject: [Buildroot] [PATCH 0/4] utils/checkpackagelib: check CPE variables
 (branch yem/checkpkg-cpe)
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This series removes superfluous CPE variables that are set to their
default values, and eventually adds a check-package test that ensures
none crop in back in the future.

The first two patches are from Fabrice, from his initial attempt at such
a check. Thanks!

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Fabrice Fontaine (2):
      package/containerd: drop CONTAINERD_CPE_ID_VENDOR
      package/libcurl: drop LIBCURL_CPE_ID_PRODUCT

Yann E. MORIN (2):
      package/v4l2loopback: drop _CPE_ID_VENDOR
      utils/checkpackagelib: add check for CPE variables set to defautl values

 package/containerd/containerd.mk     |  1 -
 package/libcurl/libcurl.mk           |  1 -
 package/v4l2loopback/v4l2loopback.mk |  1 -
 utils/checkpackagelib/lib_mk.py      | 59 ++++++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+), 3 deletions(-)

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
