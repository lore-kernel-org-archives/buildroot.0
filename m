Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6C5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 21:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 263A460F1F;
	Sat, 28 May 2022 21:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FT1-M64WHyT0; Sat, 28 May 2022 21:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3513A60EC5;
	Sat, 28 May 2022 21:46:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F3541BF5A0
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 21:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 871DF42597
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 21:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gwQJiWipRgqx for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 21:46:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 258B842581
 for <buildroot@buildroot.org>; Sat, 28 May 2022 21:46:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:882a:25de:8723:774f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7E27E19F57B;
 Sat, 28 May 2022 23:46:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653774375;
 bh=kx8RhG3wY/8G8mwCD/5M9UVIVmERSlgV2P++YxUvrx0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KwW0w211e6D1XOFO4Eb16iNAiGqQPp1egRYg/V4XMv9QyB8ycWnSwznsoDRN3QmQh
 qROKqWck0x1X2JPToodLsYJes+7EOcXekF6JLOzQc/TQbHnQJq+LhnffJNsPtdr0Rd
 zg2Ku2S1s1kmvkvy3VhLJQh1LRd98qaefMBN4KjQlPh8MSx4ZwmOGyxvBbWahGOmqL
 0tmbcA/8CPHSI4WIG/AdoxIijuTJOPZMZ1zVKBMSO21Q4OFmTBUw9EG3/oTxUEubMT
 wkL8r6YGfZBCJEXTiFxkYj9LvoMh1XvPXB5+MFPznDUK8xpiugwlkzQAA+vSa0w9UA
 jZaPTot885S2w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 May 2022 23:46:13 +0200
Date: Sat, 28 May 2022 23:46:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220528214613.GN301044@scaer>
References: <20220205222331.3432353-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220205222331.3432353-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] docs/manuali/makeusers-syntax.txt: add
 caveat for upgrading
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

Arnout, All,

Title:  s/manuali/manual/

On 2022-02-05 23:23 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> With the change of the range of UIDs that is generated from the
> automatic ID (-1), it became apparent that there is a potential problem
> with these automatic IDs when upgrading: they may have changed, which
> means that persistent files that exist outside of the rootfs suddenly
> have a different owner.
> 
> Add a caveat section to the manual, as well as an explanation of how to
> work around the problem.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  docs/manual/makeusers-syntax.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
> index 3d1013f447..cebc6240ae 100644
> --- a/docs/manual/makeusers-syntax.txt
> +++ b/docs/manual/makeusers-syntax.txt
> @@ -90,3 +90,17 @@ This will create this user:
>  - +shell+ is: +/bin/sh+
>  - +test+ is not a member of any additional +groups+
>  - +comment+ is: +Test user+
> +
> +
> +=== Caveat when updating Buildroot

I changed that to:  Caveat with automatic UIDs and GIDs
(because that's the real cause).

> +
> +When updating buildroot or when packages are added or removed to/from
> +the configuration, it is possible that the automatic UIDs and GIDs are
> +changed. This can be a problem if persistent files were created with
> +that user or group: after upgrade, they will suddenly have a different
> +owner.
> +
> +Therefore, it is advisable to perpetuate the automatic IDs. This can be
> +done either by adding a users table with the generated IDs. It is only

'either' is spurious here, I think, so I dropped it.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +needed to do this for UIDs that actually create persistent files, e.g.
> +database.
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
