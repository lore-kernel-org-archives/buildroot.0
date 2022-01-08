Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30602C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6921408BB;
	Sat,  8 Jan 2022 17:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jAx0r6ghvpEq; Sat,  8 Jan 2022 17:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E9A5408B6;
	Sat,  8 Jan 2022 17:35:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC3DF1BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7B6D81494
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nEgTxY8aFufr for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:35:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF9BF81493
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:35:42 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so2657105wme.0
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 09:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Urte8Vjp+Ve6BzX6DDbHUXyfqqMPMqWiSpEoIiB1Yvc=;
 b=gyR+hCcoTatDiyroeuOMQ7m0LL9W4KIaYixreGPT9mLco+B0IvlItI+zfnd72Z5fZO
 t8LbCHpXIJfx/A5PrKPgrqhHBwI8WCSmJeFEKY70ldQAGkfPJzyQJXScfc4kexFruUFY
 9aKZj7k4Z535Myp5+3h24JOVnXuKujZuiqroH0nYv0CSZiJaFKpqqMOl8XWUbp1F+RdF
 Fej6m1vhWAlDiMqLdFnFxJSZcVifPEWPxCdn+wymQc28+ljGqxZ1CpVEOJXRC61rPDf8
 BMfRywobjTkuRRjEbVTPOsMAKtc7mZQhWT+XacKinkGYVbnw2yEzr2F4avfwEUX6/Bgi
 AH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Urte8Vjp+Ve6BzX6DDbHUXyfqqMPMqWiSpEoIiB1Yvc=;
 b=PTyo8PgUcxL9aCvy1mZZRR6z8uXLCATN3JAE4O7btW/3JRU+d0rzxXxloU5OL1p1dU
 uP34pyfTEaVI6eMKLLZxxEpttbLoMA4eTKsG7l79tgVfCzhkqzoZ73tgouNmGELV/ZAV
 BBWoo2FiFkumFf03DGRmJwle3LyNCcEl4OfzHIw1s8HIbBJ4+YuRUzNrH4idSmwLw0ul
 MbdStK/CxvQ9UDIIIrw1SOIkUBnhgI+yIq2gGUyafrww+4XKFXjvFrMKlJiMyz/o7HMh
 EyXNPd1o84UGi6xh60zpyzNIBHK1yago3iac9+pqRDIFw3MFtVvjTcRD23jE/ok6W45Y
 XYQQ==
X-Gm-Message-State: AOAM530sH9mTHVrnP3Xrz12vz5okRTgwzdjZOUVZjlHw7SvtuLcD8EIb
 F7R/M8hicFALNlpLYJPaPTJd0q777To=
X-Google-Smtp-Source: ABdhPJxrNVPPlR9100MZ2rCUjNUhDor58JpVIzVCn1WrJUMSynX+XddGvhP9xMwndFrGKl+/zdkvtg==
X-Received: by 2002:a1c:7214:: with SMTP id n20mr15501262wmc.118.1641663340977; 
 Sat, 08 Jan 2022 09:35:40 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:4919:b1be:c8bf:308d])
 by smtp.gmail.com with ESMTPSA id g18sm2383931wmq.5.2022.01.08.09.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 09:35:40 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 18:35:39 +0100
Message-Id: <cover.1641663315.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] core: fixup PPD paths (branch
 yem/ppd-fixup-paths)
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Andreas Naumann <anaumann@ultratronik.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Louis-Paul CORDIER <lpdev@cordier.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This series builds upon previous good work from Andreas [0], Louis-Paul
[1], and Adam [2].

The second patch is the core of the change: rather than have multiple
hooks that each cater for different types of files (.py, .pc, .pri,
.cmake and so on), we jut do what we already do in relocate-sdk: we just
look for all text files that have a PPD prefix in them, and replace tht
with the cirrent package's PPD.

The third patch ensures that we can build reliable filrs lists, so that
files we tweak in the infra are not believed to be installed/modified by
the current package.

The first patch is just a little formatting cleanup.

[0] https://lore.kernel.org/buildroot/20200217212350.29750-21-anaumann@ultratronik.de/
[1] https://lore.kernel.org/buildroot/a339f273-33f3-f232-eac4-6e50427abf6d@cordier.org/
[2] https://lore.kernel.org/buildroot/20220106171720.12857-1-aduskett@gmail.com/

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      core/pkg-utils: properly indent per-package-rsync
      core/pkg-generic: fixup all PPD paths in a generic fashion
      core/pkg-generic: apply post-prepare hooks before monitoring directories

 package/pkg-generic.mk | 45 ++++++++++++++++++++++-----------------------
 package/pkg-utils.mk   |  4 ++--
 2 files changed, 24 insertions(+), 25 deletions(-)

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
