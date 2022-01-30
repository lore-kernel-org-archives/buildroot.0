Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A10AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 21:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF86660E89;
	Sun, 30 Jan 2022 21:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMrnue3RcdUg; Sun, 30 Jan 2022 21:10:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3121460E82;
	Sun, 30 Jan 2022 21:10:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22FCB1BF4DB
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1138860E82
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9GTryMmQknAw for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 21:10:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B1F660AD0
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 21:10:36 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a13so21634589wrh.9
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 13:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3N6rb6T0vSDZUG2Tf3Ve9M4SlSNUnsaJ3B3PKIbPxDo=;
 b=U8j2RJKhZdcwiAK5Aw+D8tlhLOEYX5QN7R4nzEGl8ycs5atzFHntYsFhhuONL8tH34
 a8TcwE767ybakm5z7wpum22ZnQimCY2uoH9UV9EjMgUMBfa/nTN1l95VUxbZPPcnwpAb
 kisnRP65zEiajJEkSYY6C2Djy7hwJtdn32dV0OHNRj8KZvcHF4DhdaUl2LJ8FLtNEVcC
 TI/Nyrd0bMlmhZVoTRr1Lfwv+EaYgpTaw3qfBtpCclGp9Ke96hZUynzNdScv2Uk/8bc2
 85zYUeovMuLTlX5Aq1giQUpgL1W5GxSsw3PQIHwV1QBSh2hcXbWNvdlay3WxF1T1ARS5
 lbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=3N6rb6T0vSDZUG2Tf3Ve9M4SlSNUnsaJ3B3PKIbPxDo=;
 b=h6crBgilj8Ol4I938AqXEL3vU/eQ0nR/Cun2r3Q5bme4EEgkXSCzO6Auqga+wfKZ1w
 SF9SctzGA7NosSxLBWLttqdKFjsnMDBbVEUTuUgzDw5RTn5+O2wJL3BAlwyzNruqxXIN
 p53qZrvNzAbxsMpGTLdnVx01w31dOG99Uyx1BFmNijdEuQYd67MGj4FX3f92DMt3MjQD
 Watuwf3UXGZdZ6e6CM8U7FrKJ9L4zMY0msM48PHKOq/jbYivKeBTiHp57x6MJB8cokRh
 OL0MdzLSdQ4ltKM7sxlcjS6tqL7QfEFfhAUNDi2+WVxyr8V64mjth+rZD9wkmZQc1J2P
 YWaw==
X-Gm-Message-State: AOAM532r09GgNOjyEeY/vba9vqSSiLqEwK7ntbSfUJ2UqPT9I8dWbmz9
 +KsdAGTEqrmegXTStelW2tcXQvMPvPo=
X-Google-Smtp-Source: ABdhPJzWR/UiUoMIFCX3Lk9BQe1Fh+ZFraIF9818oKQE5AXEd3ar+cBZKnGuJbvbbP3GlOeuhStp6g==
X-Received: by 2002:adf:ffd2:: with SMTP id x18mr14556456wrs.672.1643577034615; 
 Sun, 30 Jan 2022 13:10:34 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:c0a1:357e:1881:7513])
 by smtp.gmail.com with ESMTPSA id p7sm7541911wmq.20.2022.01.30.13.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 13:10:34 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 22:10:33 +0100
Message-Id: <cover.1643577025.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] linux|uboot: fix build with host-gcc 10+
 for older versions (branch yem/yylloc)
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This two-patch series aims at side-stepping the multiple symbol
declaration in older Linux and U-Boot, where the infamous yylloc is
defined more than once.

Like we have a fix for the perl timeconst issue in linux, do s similar
tweak for yylloc in the two packages known to be affected, Linux and
U-Boot.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      boot/uboot: fix build with host-gcc 10+
      linux: fix build with host-gcc 10+

 boot/uboot/uboot.mk | 6 ++++++
 linux/linux.mk      | 6 ++++++
 2 files changed, 12 insertions(+)

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
