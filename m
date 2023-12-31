Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B88C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 09:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C68160783;
	Sun, 31 Dec 2023 09:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C68160783
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JhnNdZxH0hMX; Sun, 31 Dec 2023 09:26:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41FAA607C0;
	Sun, 31 Dec 2023 09:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41FAA607C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF5BC1BF40B
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 09:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9453540471
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 09:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9453540471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yyryiXyA2cQJ for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 09:26:02 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B725E400FE
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 09:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B725E400FE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5707DB0055A;
 Sun, 31 Dec 2023 10:25:52 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 31 Dec 2023 10:25:52 +0100
Date: Sun, 31 Dec 2023 10:25:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZZEzoC30PnpTgqLa@landeda>
References: <20231228152657.488457-1-antoine.coutant@smile.fr>
 <20231228152657.488457-2-antoine.coutant@smile.fr>
 <ZY9Ej76T9DYHuLe3@landeda> <20231230190019.434e1b4b@windsurf>
 <ZZBzIdHGdJufQNWn@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZBzIdHGdJufQNWn@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704014759;
 bh=VAHpR/fFWXzeprqJ32kKhQ5Bbzp5GB9A0mqvMZNXdow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MuxbsWESGA1jqol7d/eHjS0qKKkjMZcOIfvoAHL9m5C2PUhkBEEdBKugINkxWRMKN
 mR9LLtM5QG7GexqKQ1mw6eEm6M3rKfUnMe/Csfu7v434Yx29L7/AzXZPO1lMg+ZnAN
 C2g5un3Mp96gKToHoyvL3B39O3nszBxZCsWCR/3qgKKgU3bSAvTXfp3sCDxBg2iUH/
 CIXreAq26oiueAunCglMNIscOGgFuM7+39PWUH42J+HiMb/DKzZoRzXt9IWWmGWlK7
 e3nizWu6cEWN4Qu6/as/AHd+w5JDvHKbPhB9cxote6LYUtxOwonOggFujnrNZRBxm4
 DmKGOGNCfF0qQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MuxbsWES
Subject: Re: [Buildroot] [PATCH v2 2/3] package/ripgrep: bump to version
 14.0.3
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, sebastian.weyer@smile.fr,
 Antoine Coutant <antoine.coutant@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 romain.naour@smile.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Antoine, All,

+James and Eric fr their previous work on the rust side

On 2023-12-30 20:44 +0100, Yann E. MORIN spake thusly:
> On 2023-12-30 19:00 +0100, Thomas Petazzoni via buildroot spake thusly:
> > On Fri, 29 Dec 2023 23:13:35 +0100
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > Note that I also encountered some hash mismatch on some Rust/Cargo
> > package recently, and BR was falling back to sources.buildroot.net. I
> > did not have the time to investigate at the time (I was looking into
> > another issue, and didn't want to enter an infinite recursion of
> > problem solving quest). And now, I don't remember with which package I
> > encountered this. But yes, it seems like we have a reproducibility
> > issue.
> So, I tested with commit b7938d2, i.e. before the rust version bump, and
> ripgrep already has a hash issue:
>     ERROR: ripgrep-af6b6c543b224d348a8876f0c06245d9ea7929c5.tar.gz has wrong sha256 hash:
>     ERROR: expected: 6f1d4a8b653ce48d59ad777288b1257cbda607db29db19d031b7e622c60526f8
>     ERROR: got     : 9d9769e45ffe6089f58bc19fa39dd6b6299aa0c3ad90508d21dfa27a3d3416d5

I took some time to try and pinpoint the issue. Alas, I have no clue,
just more questions.

I first tried to reproduce the original hash for ripgrep, i.e. when it
was converted over to the cargo infra, commit 342fd3e735. But that fails
to build because of an unrelated issue in the package infra, which was
fixed a few commits later, e27a700f3e.

And on that commit, it fails to reproduce a valid hash here: the hash I
got was again something else totally:
    ERROR: got     : 37d14c1eecb24e5b921c3b0e8a22ed93501db6f7aa4d0732d6be03dfc8647f77

This is very troubling. My system is a Fedora 39 recently installed on
my new laptop. What about I try and reproduce on an older system that
was current back when ripgrep was converted? So I used that old Ubuntu
16.04 that lies around, and there, miracle, the hash for ripgrep, on
commit e27a700f3e, does match what we expect!

So, can that machine get us a proper hash for ripgrep on master? Nope;
    ERROR: got     : 9d9769e45ffe6089f58bc19fa39dd6b6299aa0c3ad90508d21dfa27a3d3416d5

OK, back to square one.

So, can our (current) docker-run wrapper help us? Back to commit
e27a700f3e, which is known good on ubuntu 16.04, but bad on Fedora 39:

    ripgrep-af6b6c543b224d348a8876f0c06245d9ea7929c5.tar.gz: OK (sha256: 6f1d4a8b653ce48d59ad777288b1257cbda607db29db19d031b7e622c60526f8)

OK, so what, now?

As a reminder, commit e27a700f3e contains the core infra fix just after
the conversion of ripgrep to the cargo infra. Here's a little summary of
what happens

                            e27a700f3e      master
    Ubuntu 16.04.7;
      - native              OK              KO +
    Fedora 39:
      - native              KO *            KO +
      - ./utils/docker-run  OK              KO +

*: hash 37d14c1eecb24e5b921c3b0e8a22ed93501db6f7aa4d0732d6be03dfc8647f77
+: hash 9d9769e45ffe6089f58bc19fa39dd6b6299aa0c3ad90508d21dfa27a3d3416d5

So, we have two issues:

  - the cargo version has an impact on the vendoring

  - the build environment has an impact on the vendoring.

On my side, further investigations will probably have to wait for next
year... Notably, I'll try and see what diffoscope points out as a delta
between those various tarballs...

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
