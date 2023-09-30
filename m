Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F726E77377
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8E8C41C59;
	Sat, 30 Sep 2023 16:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8E8C41C59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iln_skqGAeEN; Sat, 30 Sep 2023 16:28:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9A3441D7F;
	Sat, 30 Sep 2023 16:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9A3441D7F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D876E1BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B40F260A5C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B40F260A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifh9nxg_KwlC for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:28:22 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9248D60D58
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9248D60D58
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40652e5718cso28186515e9.3
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696091300; x=1696696100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0cOXdN8w6uRHY7hMWm8NAWsGS3k0drcbXVvOD3MR6u0=;
 b=AKwU0/5mUhwhNDiN8WxR7NIuj/5N3aF9cj8+NUs7FT2mqt9AfkNyACxwsA6I7GgZ33
 NSBZi0bXg9x1woGo8jOVtOoBq2f7vz7mm0yiTbowWNtQX0gBx7jDomuq9B9qHZa1fwPE
 ctvQl2PkwGNHBbovdmdGJ5v8oAYbq6eh5klFa1V4cXJ16EUa6a1mKwz9YKPdmSLr4XGW
 HNvH+4k1Iur+s0QEnUZwwA2nxZCErTEr3rJDA/H2rO6M124J2vfEsDhOPtNfE5o/ZCQs
 r9fzZ/Jvyq6wl2uRUyzJP+t0PiSYlLQHrfe/+SViEBTaAov81G0c0oyB/ep25Vk/+ptx
 fMWg==
X-Gm-Message-State: AOJu0YyedeCmpIXSFwJ/Ny/dNNs7F0t8rS7G1fR4ovwjDa4nJMYj48IY
 phuEBRaxEZtXxPys41pLurmqiQhjkho=
X-Google-Smtp-Source: AGHT+IGWOTfV9XkPWasR5u4QOi0Zx6Dj/iH7xhu+XZ+OGFrwYB/aDk7avZPqmjdLbN5k3NEynxWwfQ==
X-Received: by 2002:a7b:c5c7:0:b0:405:3ab9:eb07 with SMTP id
 n7-20020a7bc5c7000000b004053ab9eb07mr6894656wmk.20.1696091300415; 
 Sat, 30 Sep 2023 09:28:20 -0700 (PDT)
Received: from scaer.home
 (2a01cb0404ad0b00e4d10b92e94d73af.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:e4d1:b92:e94d:73af])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a05600c298100b0040586360a36sm3702081wmd.17.2023.09.30.09.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 09:28:19 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 18:28:19 +0200
Message-Id: <cover.1696091295.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696091300; x=1696696100; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=0cOXdN8w6uRHY7hMWm8NAWsGS3k0drcbXVvOD3MR6u0=;
 b=b/czAbEiN0RBZn5FpDNS+Y4NA+Q/6Gwyin2RP5CbSZIjAHASRvvElCdSXlJ1EPgTTN
 Zc4iQYEDF1mJIfbh/asolFbR5bhYTF7BclEv7V3CanJ0z8xkjm3q8lWQP0yWgjgaW3LD
 Pq0eisqab8IyJsPvUvBe8gzQbU88AwkIHSjqdKE3AWiF+Ns2HrZwdY8Ci0vegSVC/uDi
 29I5aC++6RTYYvJl+rgHdySTxKlnGQcfIywixB9WEnTTU9UP/8YsVlhnK2UWV93CaYUW
 +uc7y9mwlnzoGBUvOWGArqzp1UoTTv1Hzk/o1hnXWHi5DF4yIKD2/QhHOFXKX0LpNTeo
 dQjg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=b/czAbEi
Subject: [Buildroot] [PATCH 0/2] support/runtime-test: extend graphic
 testing for weston + flutter (branch yem/flutter)
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This little two-patch series extends the runtime tests with a helper to
allow easily testing that a graphical application properly renders
something, and converts te weston test tousing it,and finally extends
the flutter test to use it.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      support/runtime-test: add helper to test graphics rendering
      suport/runtime-test: extend flutter test to check rendering is happening

 support/testing/tests/graphics_base.py             | 39 ++++++++++++++
 support/testing/tests/package/test_flutter.py      | 33 ++++++++++--
 .../flutter-gallery.service                        |  1 -
 support/testing/tests/package/test_weston.py       | 61 ++++------------------
 4 files changed, 77 insertions(+), 57 deletions(-)
 create mode 100644 support/testing/tests/graphics_base.py
 delete mode 120000 support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service

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
