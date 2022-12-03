Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECE4C352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 18:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C94074046D;
	Sat,  3 Dec 2022 18:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C94074046D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PR3egHL0ZdEu; Sat,  3 Dec 2022 18:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEA1140363;
	Sat,  3 Dec 2022 18:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEA1140363
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB50A1BF232
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 18:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A522740363
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 18:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A522740363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bm7EevxUlbK3 for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 18:14:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F39840351
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F39840351
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 18:14:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0ba:9ce3:3496:4e04])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 31FEAB005FA;
 Sat,  3 Dec 2022 19:14:02 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 03 Dec 2022 19:14:01 +0100
Date: Sat, 3 Dec 2022 19:14:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221203181401.GE3302@scaer>
References: <38529777-79a9-dfb5-ec42-b7c37e617281@gmail.com>
 <20221203155247.428cb5a1@windsurf> <20221203160506.GD3302@scaer>
 <20221203182323.30a07da3@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221203182323.30a07da3@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670091245;
 bh=pfPU5MrAZU7NCYI5sW45OL5j6TfnMyLhnLlg9snwQdo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qiShTY9i41X0iu8zRNLHdkOp9o9DT5ByZGzlqwir6wrAGqJFO7KqyK2hJLKqKd/b3
 abaVrAegLSoXCbm7vypv4QW8r63W45mEp7Fif8PDErklEvj7m/NfpPs4OGRSJsRlXe
 tKbviM8jnCQOrF1Vyj2fNIgrl7z5u657GA7W/EZmBqRE+Mn1JgMMdxFfziFlU5Y/Jh
 iR9kGClIzVjMqe2ZJapa1liA9ETHPBjH2PS4/xzX9xZF8KrTNAsKmVp8TU/ogw++Cm
 l0u9vR+ldoaI027fk9Y2aH4ntrPjbU9Qk0NuRd5PcNFdKPTt1vUZCqBd9wGWqDr+U3
 kM1fjsob4gTHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qiShTY9i
Subject: Re: [Buildroot] <PACKAGE>_SOURCE with <PACKAGE>_SITE_METHOD = git
 can result to tar.gz with mismatched file extension
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Buildroot Mailman <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-12-03 18:23 +0100, Thomas Petazzoni spake thusly:
> On Sat, 3 Dec 2022 17:05:06 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > Yann, thoughts? (1) seems easier to me, I don't know if the benefits of
> > > (2) are really relevant.  
> > I think the only meaningful solution is to go for (1): detect and abort.
> > I too do not think letting packages each request a different compression
> > would be interesting...
> > If we believe that gzip is too slow/big, then we can think about
> > switching to another scheme globaly, but that's orthogonal...
> Actually, (2) would have an advantage: it would allow to migrate from
> one compression to another package per package, instead of requiring a
> flag day where we switch all VCS-fetched packages to the new
> compression.

Sure, but we already need a flag-day when we actually change the way we
generate the archives from VCS checkouts:
    5b95a5dc27c0 support/download: change format of archives generated from git
    c043ecb20ce6 support/download: change format of archives generated from svn
    c92be85e3a29 support/download: make the svn backend more reproducible

Having a flag-day is not too bad, as we can quite easily script the hash
updates...

So, I still believe we should not allow _SOURCE when _SITE_METHOD is one
of our VCS backends.

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
