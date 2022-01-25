Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58279C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 17:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1D0860B2F;
	Tue, 25 Jan 2022 17:01:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dfhx2Zvozvdm; Tue, 25 Jan 2022 17:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23D4860A7E;
	Tue, 25 Jan 2022 17:01:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A52281BF34E
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9277A401D2
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ViqKgwfuzHYh for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 17:01:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 209DE4013A
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 17:01:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:40e2:478e:9a26:9cef])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C07BC5FFA7;
 Tue, 25 Jan 2022 18:01:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643130084;
 bh=mGewLpBufef/Rjmm5mpqdhm5PVdq8hCM36lP2f0voVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CMbQhgzZ4P0FG+asYbhEove3ehVvikHm2cghZb6yJgPlxz/s7yZgLWmP899zbL+/r
 4mKeVAaW631AYFsdhyZLe8ql3UipQrPqVxahoq5P7fUtv4Pue7GIk2NSD6BLeadPjr
 oXV4wqvkvHnOmOEtxfOdlMOYOJKVGUZ1LsABq/mT6BRWsHN+43EaAa5iljr1MOLPzf
 6XWYp3iyUgPP09aB+iUUNzzOQJqNmn2TO1rFU2aQdE4OztWBKcLIjD7e9vOoMlnOU7
 uipXRbOwqDlVbAqd691SZUrjIA0hRaJWcXre5AUzwRELb8isIL3I1eA3tB+mlt+q8o
 aDIU+sRWSwv/g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jan 2022 18:01:21 +0100
Date: Tue, 25 Jan 2022 18:01:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220125170121.GB457876@scaer>
References: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
 <20220125075817.GA457876@scaer> <20220125101125.6974b8bf@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220125101125.6974b8bf@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 00/16] Bootlin toolchain updates and x86
 updates
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
Cc: Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-01-25 10:11 +0100, Thomas Petazzoni spake thusly:
> On Tue, 25 Jan 2022 08:58:17 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > Thomas Petazzoni (16):
[--SNIP--]
> > >   arch/Config.in.x86: add "newer" names for several Intel x86 CPU
> > >     variants  
> > I was wondering if we should expand the prompt to include the fact that
> > they are deprecated, or specific to gcc versions before 4.9... But
> > whatever I tried was ugly or confusing, so I just left it as-is.
> Originally, I was hoping to simply remove them, and add
> Config.in.legacy entries for these options, selecting the new ones. But
> alas, before gcc 4.9, the "new" names didn't exist.

Yeah, I was wondering why we would not add them to legacy, then I read
the commit log. ;-)

But in the end, I believe legacy should be doable, albeit a bit ugly.

In legacy (only two entries used as example):

    config BR2_x86_corei7
        bool "corei7 has been renamed to nehalem"
        select BR2_LEGACY

    config BR2_x86_atom
        bool "atom has been renamed to bonnel"
        select BR2_LEGACY

And then in the choice in arch/Config.in.x86:

    choice
        bool "Target Architecture Variant"
        default BR2_x86_nehalem if BR2_x86_corei7  # legacy
        default BR2_x86_bonnel if BR2_x86_atom  # legacy
        default default BR2_x86_i586 if BR2_i386
        depends on BR2_i386 || BR2_x86_64    # [0]

    [...]

    config BR2_x86_nehalem
        bool "nehalem (corei7 for gcc < 4.9)"

    config BR2_x86_bonnel
        bool "bonnel (previously: atom)"

    endchoice

    config BR2_GCC_TARGET_ARCH
        [...]
        default "nehalem" if BR2_x86_nehalem && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
        default "corei7" if BR2_x86_nehalem  # Legacy fallback
        default "bonnel" if BR2_x86_bonnel && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
        default "atom" if BR2_x86_bonnel # Legacy fallback
        [...]

This is a bit ugly, but a minor inconvenience. Note how I wrote two
different prompts: it's just for illustration purposes, we'll need to
settle on one or the other (or something else).

[0] this dependency is superfluous, as the whole of arch/Config.in.x86
    is already conditionally included with this same condition from
    arch/Config.in

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
