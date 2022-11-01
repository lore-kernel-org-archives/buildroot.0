Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C22FA3743
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 10:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57AE181338;
	Tue,  1 Nov 2022 10:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57AE181338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_c1FbnG3vsn; Tue,  1 Nov 2022 10:15:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BCC381311;
	Tue,  1 Nov 2022 10:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BCC381311
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CDD61BF2B3
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 10:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11CA181311
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 10:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11CA181311
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ff89aeaC5wML for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 10:15:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DED08130B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DED08130B
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 10:15:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:50d3:260a:b461:e6c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A581119F5BC;
 Tue,  1 Nov 2022 11:15:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 01 Nov 2022 11:15:07 +0100
Date: Tue, 1 Nov 2022 11:15:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221101101507.GG1058960@scaer>
References: <20221031213926.50d3c778@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221031213926.50d3c778@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667297714;
 bh=DEhKLtAOgsN3ruptFyzMsroHExpwk3uNqFAG/TZpj3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sGYmfVwJ6rOb3+fblCgo7osSU77cMWC1D5fvBk8HpwuEKC+jYjbWlprsI+tWz5dNb
 vO09EdnZoMjnqmp32Zde1BIDyCwtt400LWh5WUMV5lW8mS8htRAr0Z2UX5Zv4PIR/h
 Tuw1GQb0if3UyT4ly63yNnqMx+/Dnjhxe/0RqbnAXNym0QsXx/APmOXcQFDikQHsAe
 M8vN0CWQmA2nBdqRWgDNqBf7W9OpyZChPHeokksguAlYDSq4GaeyhOupWu3H5Foh4o
 cw4FDpl8uMlTQLbfW+gl7B0t2qVKImHSUIK31x7hmskczKgqTEbjM+Mvn17CeJmCz7
 PW/SEI6xmfsPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sGYmfVwJ
Subject: Re: [Buildroot] NodeJS, qemu wrapper and ELF interpreter fun
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
Cc: fesc2000@mailbox.org, "buildroot@buildroot.org" <buildroot@buildroot.org>,
 oliver.kasten@trsystems.de, mail@jens-maus.de, f.rogall@gmx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-10-31 21:39 +0100, Thomas Petazzoni spake thusly:
> I finally took some time to investigate the NodeJS build issue that
> occurs on x86-64:
>   http://autobuild.buildroot.net/results/4f2/4f29c5e663b5d01af20d671baf6504332b8c1f7b/build-end.log
[--SNIP--]
> After adding some traces into this function, I was able to understand
> what happens:

Great explanations, thanks a lot!

> We see 3 possible ideas to resolve this problem:
> 
> (A) Change the behavior of Qemu to not fallback to unprefixed paths:
>     when -L is passed, all path-related system calls should see the
>     paths prefixed by the -L option.
>     Issue with this is that this change is unlikely to get accepted by
>     Qemu upstream. And there might be some side effects we have not
>     really identified.

I am very skeptical of that solution...

> (B) Create an empty $(STAGING_DIR)/etc/ld.so.cache. We have tested
>     this solution and it works: it gets used instead of the host
>     /etc/ld.so.cache. Because $(STAGING_DIR)/etc/ld.so.cache is empty,
>     there's no libc.so.6 match, so the target ELF interpreter goes
>     through its normal library location resolution logic, which falls
>     back to trying in /usr/lib and /lib, which works as those paths
>     ends up being prefixed with $(STAGING_DIR) by Qemu.

You'd also need an empty /etc/ld.so.cache.d/ maybe.

I was looking at the manpage for ld.so, and it has an option to disable
looking in the cache:

    --inhibit-cache
        Do not use /etc/ld.so.cache.

However, we are not calling ld.so directly, so we'd need to pass it via
an environment variable, but there's no such environment variable that
would allow disable the cache.

I'm afraid an empty STAGING_DIR/etc/ld.so.cache might not be enough, but
I have no fact to back this gut feeling...

> (C) Pass LD_LIBRARY_PATH pointing to $(STAGING_DIR)/lib and
>     $(STAGING_DIR)/usr/lib in the Qemu wrapper. This works because
>     LD_LIBRARY_PATH paths have precedence over paths given by
>     ld.so.cache.
> 
>     This is the solution already used by the GOI qemu wrapper in
>     package/gobject-introspection/g-ir-scanner-qemuwrapper.in, and
>     which was suggested in bug
>     https://bugs.busybox.net/show_bug.cgi?id=14366.

We know this has been working pretty well for the GOI wrapper, so if we
were to use LD_LIBRARY_PATH, that would make for consistent wrappers.

> Any opinion? Or other ideas?

I would go for the LD_LIBRARY_PATH solution, if at least because it is
consistent with the GOI wrapper.

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
