Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1191BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 13:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 902F442204;
	Sat, 18 Dec 2021 13:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pSOtIMzERQul; Sat, 18 Dec 2021 13:23:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E95634201F;
	Sat, 18 Dec 2021 13:23:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 036DB1BF59F
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 13:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E659460E75
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 13:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LbwA4Wq40AVs for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 13:23:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D49460E6E
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 13:23:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:788a:3424:5325:e3c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3B5A613F814;
 Sat, 18 Dec 2021 14:22:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639833783;
 bh=Zz9cV5ItjZOrvb40wgILJFN3pYLtGg69cMiU7OWVcg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iqg15b0fLa1G03A3fAohAnIIJgjh4UoGRXSWEuG1BbY7nmUxAjzbRsCVCXK1OcN38
 w2uH5iFs+o2IoSSsLbcI4SjDd82sD6iT1s5S4NOs6KK20+YKYlBREHo25ClevkMpl0
 DEconBxYscRDmM4kVrbaZ+i4eqzvxYszvMR0XLCMsZheCNXBMkYUvMu67yTVvmEAhd
 9cCHVtfnhqAAqvMDdjCjJaBF97u+/lZE6GpfAqopqLVudF3I492ii62n5uRdXGzlsA
 7QrDWhTl0GGEfSJV7tqmyOdSq8BVZ6BuchhyjLpf1KOd5MfgOqKNQS/snkcJhq8WbL
 NIUBnNS3Yjqeg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Dec 2021 14:22:58 +0100
Date: Sat, 18 Dec 2021 14:22:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <20211218132258.GK2603@scaer>
References: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
 <20211215180021.274991-3-thierry.bultel@linatsea.fr>
 <966fe55d-c5d7-7f5a-63ec-f68be64a38c6@mind.be>
 <f5028ffa-5461-ae87-ad4c-227605361ddf@linatsea.fr>
 <28def8c0-8d05-015e-e9b2-a25b31d9237b@mind.be>
 <32989bcc-4244-07fb-f544-cdc382dfc4c3@linatsea.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32989bcc-4244-07fb-f544-cdc382dfc4c3@linatsea.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/3] fs/dracut: new fs type
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thierry, All,

On 2021-12-17 22:50 +0100, Thierry Bultel spake thusly:
> Good idea. But dracut generates a gzipped cpio image.

That the cpio is gzipped is unfortuante, because the kernel will again
compress it as part of its own compression (whem it is used as an
initramfs, IIRC).

> Maybe, instead, the
> "cpio" and "dracut" options (exclusives) could be but in a "Initial RAM
> filesystem" menu.

We already have such a filesystem:
    fs/initramfs/
        "initial RAM filesystem linked into linux kernel"

And this one is tricky, because it hooks into linux/linux.mk with manual
and custom dependencies (see linux/linux.mk@571). I am not 100% happy on
how this is done, but we can't really have better...

So, I think that having dracut be an option of cpio is the easiest way
to go...

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
