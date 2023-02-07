Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17D4C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EAD3418B1;
	Tue,  7 Feb 2023 17:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EAD3418B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qrr3O6wSlGAn; Tue,  7 Feb 2023 17:29:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C117418B0;
	Tue,  7 Feb 2023 17:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C117418B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5FCF31BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F05F61054
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F05F61054
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oiORH6W287qM for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:29:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 174C661030
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 174C661030
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:29:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CADDF13F854;
 Tue,  7 Feb 2023 18:29:02 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 18:29:02 +0100
Date: Tue, 7 Feb 2023 18:29:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Graeme Smecher <gsmecher@threespeedlogic.com>
Message-ID: <20230207172902.GO4124@scaer>
References: <20220509190650.1348657-2-gsmecher@threespeedlogic.com>
 <20220519160214.214701-1-gsmecher@threespeedlogic.com>
 <20230207163803.GI4124@scaer>
 <aa2d5bd6-f826-1dec-2286-d66838419690@threespeedlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa2d5bd6-f826-1dec-2286-d66838419690@threespeedlogic.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675790946;
 bh=xNYyJtludevRUgSDm+qhOD/aJJ+G7BLPVNFes9stCPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sKpes0jYUQa4hOVbGH9S5XsKKTf4xJaLVQVeBUa4pTDTC7Bh5w2duZl5UwvMyE3gq
 M8YV1l11Bxa54AhFPNyjkv56f5nhUYHE7YSc97vh7gFgMJrbkW2JC8QagEcunUZBaH
 4RBe+excpfHa+aBAVo6CPyC2DqX6ajkeTCp9m60Cih+IJjCe3hesmfjFbpu+6cLtah
 49hYP4Hs8rDL4NSYfx2qsdltPpShOyiv7km4C11d2/FKM53qLSF/isKjdI7xHRg3XP
 bOopOjgMZ6OgjmHptTJttS//oa0kDeJfiOfHaWw64NamCWBa1sVQ9LNNGCRp/uKHM9
 yuqh1xown18Ig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sKpes0jY
Subject: Re: [Buildroot] [PATCH v2] package/python-orjson: disallow build
 when using musl.
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Graeme, All,

On 2023-02-07 09:14 -0800, Graeme Smecher spake thusly:
> On 2023-02-07 08:38, Yann E. MORIN wrote:
> >On 2022-05-19 09:02 -0700, Graeme Smecher spake thusly:
> >>The python-orjson build bails as follows when using musl libc:
> >I could not reproduce such an error wit the following defconfig:
[--SNIP--]
> This patch is obsolete. I used to receive orjson build failures
> associated with musl on a regular basis - they have tapered off since
> mid-2022.

In the meantime, Thomas has bisected the resolution to that commit from
James:

    2cbf1e4d3a1a package/python-orjson: convert to use the python-package infrastructure

The commit before, it fails to build; with that commit, the build
succeeds.

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
