Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22424C433EF
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 17:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8232440868;
	Fri, 31 Dec 2021 17:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lI9ZCfb42-AZ; Fri, 31 Dec 2021 17:28:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BED34403CA;
	Fri, 31 Dec 2021 17:28:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA38B1BF399
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 17:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E022E60D64
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 17:28:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ZvLq_dLxCHh for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 17:28:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF14860C15
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 17:28:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3FE565FFAC;
 Fri, 31 Dec 2021 18:28:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640971721;
 bh=wyxjqrMeFHL2F7NpyrPnnAlcJYK/nz+Jq0bRecOuPfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OSbPcbQGLNgLYCOZNAqqkXy6Qc3CM9dyGQtKBTM7yRhIBP57DZuatdf5OKmG+1hE9
 1nMQ7JE4Z50ULPetdwE93RekRbcRc9ZvVQT/SM6KrBFiTWLs1xJABDvxDZXy/4sjCW
 uestipxpJJLP5/pPH6aLD0Z8kOrS8YtZlADhf4KDFsExF84KBfeTE+ibQe2pKVoWc3
 fF8Tv3ok078jnWjgiiw1mvRc4tOhwU8d35ljH8SqATxxjg9hsG4/wPGVUJKFsf7iz9
 a66JXZfosqT64zUY5X5S9ERn3MahNRubhubFhuyJWm+q/EKfFPWrgASoySTuiIQ0rx
 TnfulxeYNMniw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 31 Dec 2021 18:28:32 +0100
Date: Fri, 31 Dec 2021 18:28:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211231172832.GL3390456@scaer>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
 <04d568a84678569e4aed9a17d0609009271e146f.1636810092.git.yann.morin.1998@free.fr>
 <20211230214505.6bff001f@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230214505.6bff001f@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 13/16 v2] core/show-info: report whether a
 package is overriden
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
Cc: Vadim Kochan <vadim4j@gmail.com>, eeppeliteloop@gmail.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-12-30 21:45 +0100, Thomas Petazzoni spake thusly:
> On Sat, 13 Nov 2021 14:28:24 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > The show-info output can be used in quite some ways, like to assess the
> > validity of the current configuration, like a production build in a CI
> > would do for example. One such assessment would be to ensure that no
> > package is overriden.
[--SNIP--]
> I did not apply this one, because when you set <pkg>_SITE_METHOD =
> local, then <pkg>_OVERRIDE_SRCDIR will be assigned, but the package
> isn't really "overridden". It's using locally available source code, as
> part of the package definition itself.
> 
> So I found that advertising this package as "overridden" was not
> semantically correct.

Indeed, I'll see if we can easily discriminate the two, to really report
overriden non-local packages.

Regards,
Yann E. MORIN.

> I'm of course ready to discuss this, and see other arguments :)
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
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
