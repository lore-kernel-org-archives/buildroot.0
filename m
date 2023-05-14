Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD18C7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 14:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60243400D6;
	Sun, 14 May 2023 14:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60243400D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fKxr7tJD6D6O; Sun, 14 May 2023 14:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 382AF41F1A;
	Sun, 14 May 2023 14:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 382AF41F1A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 351BC1BF5A4
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 14:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EFB840487
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 14:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EFB840487
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pBxJjQT_dPy9 for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 14:03:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 171F1402F4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 171F1402F4
 for <buildroot@buildroot.org>; Sun, 14 May 2023 14:03:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 47CFFB0059B;
 Sun, 14 May 2023 16:02:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 16:02:59 +0200
Date: Sun, 14 May 2023 16:02:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20230514140259.GG2582048@scaer>
References: <20230130144655.1193660-1-maxime.chevallier@bootlin.com>
 <20230130144655.1193660-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130144655.1193660-3-maxime.chevallier@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684072984;
 bh=zeFaaUIpdP95lHVsLjfaDqdBf/NsZwOoRqnqe+YUOtY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e5pHHjpXadLUlTLE730PUDBwzRpgBDtnz4nuimqlj32S+b7zCj8uD57HXMm79xjRu
 48+U0GQzZN/fwweVqlU/RZpsvGUAZIUmYm3dfICYWhsqRbZgyDwX5OMlLQMGUBPtex
 nneSVF6rr02wptfKQ6zpCI75zXBdQovDEIhalIP+/hLivAs7S3P3z8d9wiQlKDDWvH
 d8BO/+cfx/MROQutLLGQAGWxMHXmeGCkYuSGDpclZFAARDOCneFQWESBEwhT4UjvvE
 BjdeBOe0audHr2MTxZ3sH22z3/FGWF1n7zUJ1yhQZkx/cLIoxunc9nuCH7TuKQfenc
 dXuMJclSv1Mtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e5pHHjpX
Subject: Re: [Buildroot] [PATCH 2/4] package/libtracefs: new package
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Maxime, All,

On 2023-01-30 15:46 +0100, Maxime Chevallier via buildroot spake thusly:
> Introduce the libtracefs library, that used to be bundled with the
> trace-cmd tool. This library is now used by several tools and libraries
> such as trace-cmd and rtla, and is used as an interface to the ftrace
> kernel subsystem through tracefs.
> 
> This package tries to install libraries in /usr/local/lib by default,
> hence the redefinition of the "prefix" variable, so that the library
> gets installed in "/usr/lib" instead.
> 
> The same applies to the pkgconfig handling of the proved Makefile, which
> installs the .pc files in the /usr/local area by default, hence the
> redefinition of the pkgconfig_dir to either the correct directory within the
> staging area, or to empty value for the target to avoid installing the .pc
> in that case.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/libtracefs/Config.in     |  6 ++++++
>  package/libtracefs/libtracefs.mk | 35 ++++++++++++++++++++++++++++++++

Missing hash file.

Otherwise, I have the same comments and questions as for libtraceevent.

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
