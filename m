Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B90C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 18:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B6A5408E5;
	Sat, 22 Jan 2022 18:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oBt-ev2mIt1a; Sat, 22 Jan 2022 18:13:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96D72408E4;
	Sat, 22 Jan 2022 18:13:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2FBD1BF2C2
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A9A2408DF
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HMrKgh4gmtSx for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 18:13:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62A6B408D3
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 18:13:46 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a13so5875259wrh.9
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 10:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P49eOIYY1dYJ4eMwT85Yl9PfedI25/873xoEBVq/cXI=;
 b=ZLpDYjFzTW7pOWyTQJG6GVWtphEqwnx286cMtOwi2OaaiXOOa2XD59a6P3Kgoi+Z+w
 Sosy7KOqnwXBb1VCiLoKtEKQT0Aruz64UG2kKG2ld24ANYjl0qr5EasYuTH/Mv6q3nhZ
 SebSICxvzDc6on7LqlZF4hOoOvpyBZnmNS170V/uw6bnCzeERkWSS6xRMWOLUAhCxFeo
 WH0z8lewuAh8ITKjAGW6n6uFFkHbFJArLB3AkBKVYNUAiyBDArrVdHMjmo91OONmPl/K
 Mk3aNEKVYEFeSMCyZGQDjJrk66vWTDDxPp15ToNqm45FyIWbc0IR/ajX1WJbcRhX2MN1
 M9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=P49eOIYY1dYJ4eMwT85Yl9PfedI25/873xoEBVq/cXI=;
 b=gQYmb1/Ds81Nj5wkcD1kBSlEhKKL4rlHSBop8CKmAQ849XHQU8Xi0pz7R0tbae93iB
 7YyDhXUrixM0183LZsjUQ+8jGcDrWT4L/ApZgODCDe4PFb8ZAJeAiEyVMahbgjl851S/
 /Mg27iZ45X/E71WOhv4NhrgTdlVEkEidyI1PxW2gpIHHIKlVSj66sZ8DmCj6HI/cKTob
 hpHE8O7E5d3/AGZJHga2vP65F8DzwO9nFP2emBhHUDBcE4K4aYsG4bqjjqaE2QGZDE49
 jwvWjU7NFXQ2jhb52Zlh7zSGmP7M1+wnChKABzbbB5W2yvppX60iqjlbMIL2h1ucySvn
 R2bQ==
X-Gm-Message-State: AOAM532d0e9tOjNGIbHt6IN/N0zZ5NjjztEmxKCFCRWPQQ1io6PsEkQu
 com56NMkg5c82HrIMCGNvLYGdkYEK9c=
X-Google-Smtp-Source: ABdhPJyTRtVDko3AusBdO66bZmJwAiOvxmeT8EzOi6OReMp2hsVi5drtdChDPqyH40DiZypiQCERWw==
X-Received: by 2002:adf:e445:: with SMTP id t5mr8251768wrm.537.1642875224538; 
 Sat, 22 Jan 2022 10:13:44 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:8038:e8ec:605a:7149])
 by smtp.gmail.com with ESMTPSA id j4sm10761902wrq.81.2022.01.22.10.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:13:44 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 19:13:43 +0100
Message-Id: <cover.1642875217.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2 v2] core: fixup PPD paths (branch
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

The first patch is the core of the change: rather than have multiple
hooks that each cater for different types of files (.py, .pc, .pri,
.cmake and so on), we jut do what we already do in relocate-sdk: we just
look for all text files that have a PPD prefix in them, and replace tht
with the current package's PPD.

The second patch ensures that we can build reliable files lists, so that
files we tweak in the infra are not believed to be installed/modified by
the current package.

[0] https://lore.kernel.org/buildroot/20200217212350.29750-21-anaumann@ultratronik.de/
[1] https://lore.kernel.org/buildroot/a339f273-33f3-f232-eac4-6e50427abf6d@cordier.org/
[2] https://lore.kernel.org/buildroot/20220106171720.12857-1-aduskett@gmail.com/

Changes v1 -> v2:
  - use --binary-files=without-match, as this *considerably* speeds up
    the fixup  (Arnout)
  - rename the python fixup  (Arnout)

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      core/pkg-generic: fixup all PPD paths in a generic fashion
      core/pkg-generic: apply post-prepare hooks before monitoring directories

 package/pkg-generic.mk | 47 +++++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 24 deletions(-)

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
