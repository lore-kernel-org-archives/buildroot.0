Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33E7C4332F
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:01:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06CE7611C0
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06CE7611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C041C402AF;
	Mon,  4 Oct 2021 15:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xbpCYoLUtcUX; Mon,  4 Oct 2021 15:01:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9EB0402DD;
	Mon,  4 Oct 2021 15:01:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D9371BF2CE
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0E0460BCB
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tWgoQrCFLJq9 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 15:01:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9FA460BBE
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 15:01:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 73FC513F8B1;
 Mon,  4 Oct 2021 17:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633359683;
 bh=FWAw4W9sawM+zxhzwEG7FSSol6t58DoP6ZJjbjNP6bI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r7FsJLPon7WhCg1pLqeu0rxC7uLkRmtffQpZLpTAx1gb7QF6n7kp7/GdVz5sSEwfU
 JDexJG3zPhudFVzjmCWKhHG7TqWPekvjUZBVFAhiF9F+cH/ZZv0GVuHeqUD3dY1u0T
 5Of4aS6BtyEQa7dYBUTDh0iow3azvKq5baT/jKdPRDDkfffWhYuVBc7YB8OYAXHqNL
 xcPuLLOf7De4WMdRUGGw23KroUxK9l7ViBOrH/559WrOZnw4qYe5ujSNVZkrrVulyz
 ryQ8BHtca5crISPgUBZvtv9CZ4SAsIub3LlLqTiSbOATRhZqbZ6Y7h+ShDyu3Y1YiX
 dO8AbQDSJmNjQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 04 Oct 2021 17:01:13 +0200
Date: Mon, 4 Oct 2021 17:01:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211004150113.GB1504958@scaer>
References: <20210918124739.GN1053080@scaer>
 <20210919005154.461600-1-giulio.benetti@benettiengineering.com>
 <87h7dxj9mr.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h7dxj9mr.fsf@dell.be.48ers.dk>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/mesa3d: fix build on m68k
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, Giulio, All,

On 2021-10-04 13:46 +0200, Peter Korsgaard spake thusly:
> >>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
> 
>  > To build mesa3d for m68k we need to pass -mlong-jump-table-offsets CFLAG
>  > since 'switch' blocks are pretty wide and lead to build failure. This way
>  > 'switch' blocks will have a 32-bit addressing by default instead of the
>  > standard 16-bit. This can be done only with m68k gcc version >= 7.x
>  > because gcc flag used to fix this(-mlong-jump-table-offsets) is
>  > available only from that version on.
> 
>  > Fixes:
>  > http://autobuild.buildroot.net/results/60c4653c2a93125edbdd0beb43cd47301643464a/
> 
>  > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>  > ---
>  > V1-> V2:
>  > * add gcc >= 7.x dependency to Config.in as suggested by Yann Morin
>  > * improve commit log according to Config.in change
> 
> ..
> 
>  > +# m68k needs 32-bit offsets in switch tables to build
>  > +ifeq ($(BR2_m68k),y)
>  > +MESA3D_CFLAGS += -mlong-jump-table-offsets
>  > +endif
>  > +
>  > +MESA3D_CONF_OPTS += -DCMAKE_C_FLAGS="$(MESA3D_CFLAGS)"
>  > +
>  >  $(eval $(meson-package))
> 
> Does that really work? mesa3d is using meson, not cmake.

Apparently, no:
    http://autobuild.buildroot.org/results/26a/26a97e080c49c42c06ed59ec6a9d51d81b0ab882/build-end.log

Damn, not sure how I let this split through... :-/

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
