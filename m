Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27ADDC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 11:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A37FB41553;
	Mon, 22 Aug 2022 11:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A37FB41553
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y-PysZww-3SP; Mon, 22 Aug 2022 11:20:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 389D940918;
	Mon, 22 Aug 2022 11:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 389D940918
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71BCC1BF418
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 11:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59E0D60DDF
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 11:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59E0D60DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4E68XkB3tNG for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 11:20:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEA9E6058F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEA9E6058F
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 11:20:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:961:575d:b2ff:71eb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 76E8060133;
 Mon, 22 Aug 2022 13:20:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 22 Aug 2022 13:20:11 +0200
Date: Mon, 22 Aug 2022 13:20:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220822112011.GB2167049@scaer>
References: <20220822100433.3998253-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220822100433.3998253-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661167213;
 bh=iukh3LvyE7BmDMfFZWUE2lDu6Vodr1FLvSBnHqhTGTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mB4rgttRw0H7NDKkb7VmsSJvE/U6KQdN69kxMIGz+UYZg8igLIdfEu4mhCWwf52xB
 jo7bKRp+Pj1jafj+FppP51mB+wNereUkJzwEylZ+bsG4nlC63sHDA4KJzee3GpDe4o
 MLtW5fkk/tb2Pcn0BaFISwVOn3S+RF5a2nCfGI3Vr4zLltUsYIoQ7bi1txi2tOoobQ
 HAE+Ii2FYhcus4ITqXYGrJsrHO17mtICBvz3g/lY7MhsgujiilRHxAySTdhbi7Kj3h
 Yud0GEg5dMXviUwZSMUQG85Oslj8m6cqspoJNp7CjdTDp5ZX8gI/q4w6HW80qr7I3r
 2LunZkPBeo4Jw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mB4rgttR
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pyinstaller.py: revert
 mode back to 755
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

James, All,

On 2022-08-22 04:04 -0600, James Hilliard spake thusly:
> This was accidentially changed to 644 in:
> d752f73b0c0e4ba50738cd1e7f4472f61fce9089

Indeed, I forgot to revert that when I applied your earlier patch.

Still, I think it does make sense to keep it as 0644, because this is
not an executable by itself, and we call it explicitly with our own
python interpreter. Besides, it is not supposed to be used outside of
our infra, so it is not expected to be a standalone script either.

So, unless we notice failurs in the autobuilders, that we can attrribute
to the script mode, I'd like we postpone applying this patch for now...

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  support/scripts/pyinstaller.py | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 support/scripts/pyinstaller.py
> 
> diff --git a/support/scripts/pyinstaller.py b/support/scripts/pyinstaller.py
> old mode 100644
> new mode 100755
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
