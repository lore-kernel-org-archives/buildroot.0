Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A925C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA060818C0;
	Mon, 15 Aug 2022 09:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA060818C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDKi6eb2DzCL; Mon, 15 Aug 2022 09:53:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1DA681749;
	Mon, 15 Aug 2022 09:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1DA681749
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DA291BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 095B360D62
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 095B360D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXM7E8r7-rSp for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:53:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC39460BCA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC39460BCA
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:53:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7ABC16013E;
 Mon, 15 Aug 2022 11:52:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 11:52:56 +0200
Date: Mon, 15 Aug 2022 11:52:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220815095256.GT2854108@scaer>
References: <20220813093627.369221-1-ju.o@free.fr>
 <20220813125424.6caa746b@windsurf>
 <e0634cb156656205a84bc7ecce8a9412@free.fr>
 <20220814202300.GM2854108@scaer> <20220815113915.33c6816b@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815113915.33c6816b@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660557179;
 bh=41gTDKtGq0dg5hhOMIuAwQKgprkQcqQ8QL6yAipJi9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=scNUKD6Prw4wE5bmhUnF6n2wgK5fxL92xEtrA4BlOmWEOFykzaRUimlMB+5Eeg5/Z
 EarIlFEHrnuHVhWZltqJVYDOY+XDLYqBJxI+zaDv7VEzEEMuBRSrXVkfb3Z3Odj7UB
 NoE3UUK80ISbPpC5c35yl2YHzWNncty/UEpho4k8NlL7gvIedaPRRYKa/dIzGsFrbN
 qyeT840jpI0HdNi3H6D7T4lieuDx179ylazUZxD4HCUxim2AyLqFZLq66THA3fODmj
 wiwT09HNSLB0aCRuou9Jtin7F3les0n5QFZyBXpDLKICztOvWxHlRm2citBJgNXvj2
 Lls9VCfXkIkLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=scNUKD6P
Subject: Re: [Buildroot] [PATCH next 1/1] package/linux-backports: bump
 version to 5.15.58
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, Thomas, All,

On 2022-08-15 11:39 +0200, Thomas Petazzoni spake thusly:
> On Sun, 14 Aug 2022 22:23:00 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > The alternate solution is not great: we could add a version choice:
[--SNIP--]
> That is the sort of solution that I was thinking of, indeed.

Then OK. We can argue that linux-backports is in the same league as the
kernel, so having a version choice makes sense.

Julien, I've marked this patch as changes-requested, while waiting for a
respin that ads the version choice.

Thanks!

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
