Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3EAC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30C0441E3A;
	Tue,  6 Feb 2024 15:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30C0441E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EalCqlU5lAH2; Tue,  6 Feb 2024 15:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7491141E11;
	Tue,  6 Feb 2024 15:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7491141E11
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F0291BF298
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7644140527
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7644140527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJg51u2ybRhZ for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:10:56 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A1EC40189
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A1EC40189
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 91F2113F8B5;
 Tue,  6 Feb 2024 16:10:52 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 16:10:52 +0100
Date: Tue, 6 Feb 2024 16:10:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ismael Luceno <ismael@iodev.co.uk>
Message-ID: <ZcJL_Fie7-Xwy_Cg@landeda>
References: <20240206145353.19868-1-ismael@iodev.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206145353.19868-1-ismael@iodev.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707232254;
 bh=QOhxwqSaWZkFaa+pDfAxm+8AUdSro16uxALJ7dNi+nQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XxXtdggP/0gqsBzna6IWWKPiGiFgKFVtWXuaFW5S1xzqyk2KG3NglHPEbgleS2lnm
 64WO5KMrKRnSrjG/pjUODNc+XsdLNKrAZ5nPrA13742jCZ6y8SqUoJrG3hK2yDV1PT
 WpHV2oQBD1+PWo6YNzikq8hc1ganKZy/5JnPvDduyn8ORfXHM1/SXlTGjrzRUDlI6j
 u8rSt7TZ1Er65yxsTOaAiF8Pfp5ep5wQSzbSMo/FeoDNcE+LPHRMub/8EZr5ocExAN
 gHsOR4eRf69AAS70JSgpR1JCEJOUP2UXTQ0nYaQNUlE9ZgxcJWwpsTzY7YJmYALrUH
 hCka5bDh8ciIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XxXtdggP
Subject: Re: [Buildroot] [RFC PATCH v2] docs/website: Add Makefile to
 pre-generate the website
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

Ismael, All,

I'll do the rest of my review in this new iteration! ;-)

On 2024-02-06 15:53 +0100, Ismael Luceno spake thusly:
[--SNIP--]
> +${DEPLOYDIR}/%.html: ${SRCDIR}/%.smu ${conf-files}
> +	mkdir -p "${@D}"
> +	tmpfile=$$(mktemp) && \
> +	${AWK} -f incfile.awk $< | smu | tidy -q -m > "$$tmpfile" && \

Don't use pipes, otherwise we can't catch the failure of any
intermediate command. For example, if we can get the awk script to
properly fail in case of error, using pipes will not allow the Makefile
to catch issues.

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
