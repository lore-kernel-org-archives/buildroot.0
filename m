Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3055C77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AB8F614D4;
	Sat, 13 May 2023 20:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AB8F614D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CL_ZOTR27vgU; Sat, 13 May 2023 20:12:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 918CE614A4;
	Sat, 13 May 2023 20:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 918CE614A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C03E31BF48C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A68F5614A4
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A68F5614A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJU0Po5AryvZ for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:12:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A576961492
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A576961492
 for <buildroot@buildroot.org>; Sat, 13 May 2023 20:12:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6ADEEB00565;
 Sat, 13 May 2023 22:12:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 22:12:05 +0200
Date: Sat, 13 May 2023 22:12:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230513201205.GG2582048@scaer>
References: <20230412222602.1975782-1-aduskett@gmail.com>
 <20230412222602.1975782-2-aduskett@gmail.com>
 <874joh2waj.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874joh2waj.fsf@dell.be.48ers.dk>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684008729;
 bh=uHni8enL3aaIsvL1Ti0XA+ZGqI+wxzuAx5PDE2VLRlA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VZOGrbXIzhHowVpPFWc1dfktyleH7hkUgS+qi1eH4wL7JT9iC2WXNq122xRfwYB+J
 /BBuijYY3w0O+JY8/FcqaqnbtL6/dmI4b/VDaJyxmMMTT5Cuanb8//uQlJEPe17BTv
 4rENyQ+7bUPLnwgBaw2KRBYSnTjOJ+1qNaoSCLwZeZA3qZFQ65xXVQt4BeRvkXt+Vt
 kRtWyW8sAnpgOj+9H8KXJiU4Sde9Qjzqk1slq3IjGpqm/StD+rwfzpRpDTpN2+FO33
 pviH6TTgJrU3Zkuus3cYFvu04gVVquKMB6z0PWrT4SSmzDM+c+SHod+HuQeqRDHL9j
 +KGykfD11gL5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VZOGrbXI
Subject: Re: [Buildroot] [PATCH 2/3] package/nftables: bump to version 1.0.7
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-05-12 21:18 +0200, Peter Korsgaard spake thusly:
> >>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:
>  > Other changes:
>  >   - Switch to tar.xz as the package is not distributed as a .bz2 any longer.
>  >   - Update the sha256sum of the license file, as it has been updated to
>  >     include the following text:
>  >     "Original author of nftables distributed the code under the terms of the
>  >      GPL version 2 *only*. New code though is moving to GPL version 2 or any
>  >      later which is the preferred license for this project these days."
>  >     The author has also changed from Patrick McHardy <kaber@trash.net> to
>  >     Pablo Neira Ayuso <pablo@netfilter.org>
> But the combination is presumably still GPL-v2-only for now?

I would believe so, yes.

>  > Signed-off-by: Adam Duskett <aduskett@gmail.com>
> Committed, thanks.

Since you did not push, I did. ;-)

Applied to master, thanks.

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
