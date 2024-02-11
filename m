Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428A6C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 17:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21B42404D8;
	Sun, 11 Feb 2024 17:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id avAsK4d-LH8y; Sun, 11 Feb 2024 17:55:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BFD240486
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BFD240486;
	Sun, 11 Feb 2024 17:55:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9C8C1BF4D5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A651F40486
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A_lzUI8I_Sfg for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 17:54:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F27C4028D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F27C4028D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F27C4028D
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:54:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A3C1913F8B8;
 Sun, 11 Feb 2024 18:54:51 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Feb 2024 18:54:51 +0100
Date: Sun, 11 Feb 2024 18:54:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Abilio Marques <abiliojr@gmail.com>
Message-ID: <ZckJ608XA98Pfo-Z@landeda>
References: <20240204062645.3616072-1-abiliojr@gmail.com>
 <ZcDhkvk_uO8wbQoz@landeda>
 <CAEWqYrVOgiBYqYad3RDX5BfRvqF2LJxSTvdqgwQ9aVA7SWfKEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEWqYrVOgiBYqYad3RDX5BfRvqF2LJxSTvdqgwQ9aVA7SWfKEQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707674094;
 bh=VCcku8Hy6YIdV9sqoguXspy4EnG1VS6Ahdn92osp7uM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PIlXKk4CNUlF+IJBw/oTRqIDTKPTaQOOKNGKofkNJjmg7Rx83IffvroZv70QfM4CZ
 bIh8LoH4MV8/GN7n9ZTDna6tHcDdnXOqAxSqY6+AsARAwlBoI7H57KqMgWPA3mDSEl
 HdyNS43isJipeYh5gJlus0ZkXtbuu/CCC2pLFosgpan9irTwQdC6Tu1UYesBQCZ87r
 QHdwRCPTfiHkOpJ9AisIr0GkMCRDoEQVnj87JpHXADrRl4Dukn/iu66ePseQb8+BwF
 Tibzoix+6Xpa+NFloOK8F/frnXtlKUulimmVG186nc4J3sZP4DLmWLhyGPjZ6QDPiB
 CiUs0sThK8iAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PIlXKk4C
Subject: Re: [Buildroot] [PATCH] package/micropython: add support for
 manifest.py in the configuration
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Abilio, All,

[Please, don't top-post, but reply in-line]

On 2024-02-11 09:15 -0800, Abilio Marques spake thusly:
> One of the uses of manifest.py is to specify which modules of
> micropython-lib should be frozen within the binary.  For those modules you
> don't need to include the path. e.g.,
> package('os')
> 
> That's the application I'm going for. I know it seems limited but it's
> really useful,

OK, so maybe this can be explained in the help text of the new option,
like:

    Note: in Buildroot, only modules provided with micropython-lib
    can be frozen with a manifest; freezing arbitrary files is not
    supported.

along with a little blurb in the commit log, statng something like;

    We only support freezing of modules from micropython-lib. Freezing
    arbitrary modules would require some handling of absoulte paths, and
    a guarantee that the files be available before micropython is built,
    which is considered a bit too complex; an interested party can
    provide such support in the future.

And thus, would it be possible to sanity-check the manifest to ensure
that it indeed only references modules from icropython-lib, so that
people do not get the impression it works when in fact it does not?

Like, grep that only require(...) are used?

(Note: you mentioned package(...) but that is not limited to files from
micropython-lib; require(...) however is.)

> and probably welcomed by other people using Micropython in
> the next release of Buildroot.

One question I was wondering about: if a module is frozen in the binary,
then it is no longer needed in the filesystem, right? If so, should we
have a way to remove them?

> I have ideas on how to solve the path and dependency order problem while
> still using the "official" manifest.py concept. The biggest challenge is
> that currently there are no other 3rd party Micropython modules available
> for Buildroot, so that makes it all very theoretical. All solutions require
> a bigger amount of work than the one needed for this patch. Also, I would
> like to discuss them before actually presenting a patch that allows 3rd
> party modules to be frozen.

Indeed, without a few actual examples, it's going to be difficult to see
a common pattern and abstract that away. Are there any pulicly
available?

> I always try to go for an incremental approach, where I get the bigger bang
> for the buck. I believe that allowing people to freeze the official
> Micropython modules is already a big step forward. But at the same time,
> I'm new to the Buildroot project, so please advice on the approach.

The incremental path is totally OK; I even prefer it. Of course, any
limitation (such as those we are discussing) should be explained in the
commit log.

Given all the feedback in this thread, can you respin a v2 taking the
comments into account?

As for your ideas for lifting those limitations, you can just explain
them in a reply in this thread. Usually, a patchset doing the job is
also a good first step to start the dicsussion.

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
