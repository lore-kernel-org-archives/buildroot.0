Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A809C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 19:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D278415DE;
	Sun, 29 Jan 2023 19:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D278415DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G6gJyxn_peV5; Sun, 29 Jan 2023 19:03:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39C6C415E0;
	Sun, 29 Jan 2023 19:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39C6C415E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09B881BF385
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 19:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E41D5415E0
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 19:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E41D5415E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YtlX_o05Or3d for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 19:03:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50AA6415DE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50AA6415DE
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 19:03:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1F5875FFA2;
 Sun, 29 Jan 2023 20:03:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 20:03:24 +0100
Date: Sun, 29 Jan 2023 20:03:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Prasad Sankaran <prasad@cradlewise.com>
Message-ID: <20230129190324.GR2632@scaer>
References: <CANtE+cKcemOj_DTSOZ_TzuThSrXBwah38WJYM-AVH1nGTJikDw@mail.gmail.com>
 <20230121151815.GD558596@scaer>
 <CANtE+c+-9WfkPOnQ-SzNokO46cZv0PZ3Awory61kSRuMPBPNLw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANtE+c+-9WfkPOnQ-SzNokO46cZv0PZ3Awory61kSRuMPBPNLw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675019008;
 bh=ClVu13+LHd02LCBpEQ4QipaT+DfxFhRnVFdWN6+w8dw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uCFjTLFlPIb3JTb/2GKhVmphkZVY0ak2EiqYYzIf3iE0xeVIZ4oSnOpIz1cdXPt9m
 zUtktGEfo90GU4GPTZUYprq2kpgq2LhPxA72tjEBdBdFy7oINIta+4gQ9ILFZWRXaE
 sHTyVJIt3dBrtxPekl0i0PINZUZYvNVmwNQs7tCaHIjmFfQoUjWPR110A99k+a0mdQ
 U/YbdViapv1atMprP4qg7GxOILYG7nkGXMBw02Ov3Wm5pKdXwHoXgfFI4KP9dbUQWC
 QDXMRqEeuqLMp57LkUSr1OQOPFw5Xv60Q4q89UpMNRi4ZuutPlfpRM2rOTCYjt0yRW
 Wt+XWaTtqIluA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uCFjTLFl
Subject: Re: [Buildroot] Not able to build python-numpy 1.23.5 on buildroot
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
Cc: Archit Taneja <archit@cradlewise.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Prasad, All,

On 2023-01-25 21:06 +0530, Prasad Sankaran spake thusly:
> Sorry for the late reply. I have attached the defconfig which we use.

This is by far not a _minimal_ defconfig; it has a lot of packages
enabled.

Also, what version of Buildroot are you using? You have:
  - gst1-plugins-bad libmms, removed in 202.02
  - gcc 7.x and gst1-plugins-bad yadif, both removed in 2020.11,
  - BR2_PACKAGE_CURL, renamed in 2020.02
  - wpa-supplicant "new dbus", removed in 2019.11

So you are using a very old Buildroot. Please update to master and
try to reproduce the issue.

Regards,
Yann E. MORIN.

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
