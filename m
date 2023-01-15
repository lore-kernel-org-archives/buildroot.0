Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B09BC3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 10:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C06760A8C;
	Sun, 15 Jan 2023 10:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C06760A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hKClkGc4KvHV; Sun, 15 Jan 2023 10:52:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C13E760A9F;
	Sun, 15 Jan 2023 10:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C13E760A9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 553211BF4D6
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 10:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34A66410C0
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 10:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34A66410C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnExHwYP2RBB for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 10:52:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 668B0410BE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 668B0410BE
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 10:52:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BC48F5FFA0;
 Sun, 15 Jan 2023 11:52:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 15 Jan 2023 11:52:14 +0100
Date: Sun, 15 Jan 2023 11:52:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230115105214.GG199036@scaer>
References: <20230113225425.3301420-1-vfazio@xes-inc.com>
 <20230114221718.01e97481@windsurf>
 <CAOrEah5_BQzsLnHYkMGvpSR=MxeqTeDkmbKNAQOOJ6eRXreg-g@mail.gmail.com>
 <20230114225821.4edc5530@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230114225821.4edc5530@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673779941;
 bh=tI5LXW+852A4KZ2vm7ZpV8VDmEGVUBbnPCwx8FFGzww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BcaIf3ngOXMFabxWcj8kBe75Ic8vCTefH2sxCFk26gpnhwr4ReCmSX9jJynEo9Mu1
 04GANp6u7prAHCrBf9VpSbHw9FKaVlta/gGncqme/hHAfDbMRsQTaAShKeYmoRlr8K
 7yoiMSid/VfP+LPuNln+MrUjZarBbgY5MERckYk+MIVdmGoLCKflRMR5hmifBdsUZR
 iba1N2pPerP2fVVVvO1U7brgZr6h83Uo7OcsMvkeE3UVU6/A0flIZ6yJoXGp7SjuSf
 VWoMksaFT3DrpCFWV3JxQFZeEO3qu1A2deP7nFyqEYyAURNBj78w+WNlTliqmfOZyP
 1ZwEABkwSZudQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BcaIf3ng
Subject: Re: [Buildroot] [PATCH 1/2] package/ipmitool: backport fixes for
 registry issues
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 Vincent Fazio <vfazio@xes-inc.com>, Vincent Fazio <vfazio@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-01-14 22:58 +0100, Thomas Petazzoni via buildroot spake thusly:
> On Sat, 14 Jan 2023 15:33:06 -0600
> Vincent Fazio <vfazio@gmail.com> wrote:
> > replies below (i hope, i haven't tried responding to ML emails in gmail)
> It's almost good, except that gmail adds one extra > on the first line
> of each paragraph of your replies.

Still, I haven't seen Vincent's reply on the list...

> > > So in the current Buildroot situation (before this patch), the registry
> > > is always installed, correct?
> > >
> > > Correct, but with a caveat... as of the version bump to 1.8.19, the file  
> > being installed is broken and the tool actually won't work.
> 
> So the current ipmitool in Buildroot is broken. Could perhaps separate
> a "fix" that could be backported from a large improvement that allows
> to not used the registry?

It was I who asked Vincent to add all the patches from upstream with a
single commit in Buildroot.

Indeed, my reasonning was that they all pertain to a single issue: the
package is broken because 1) the registry URL is now incorrect (it
downloads an HTML blob instead of a plain-text description) and 2) the
build is not reproducible (as the registry can change on a whim).

Furthermore, even though the registry is currently installed, it is of
no use because the file is not in the format expected by the tools, so
I think it is accetable that we make installing the registry optional,
and that the option does not default to y (although I would not mind
if it did).

> > All upstream patches have been accepted into mainline. The commit hashes  
> > in the patches are the mainline commits
> 
> Thing is we don't which are "upstream patches". If the patches are
> upstream, you can do:
> 
> Signed-off-by: John Doe <john.doe@foobar.com>
> Upstream: https://github.com/some/where/commit/12456abc

I usually am content with just a git-formatted patch, with the actual
history in proper reasing order:

    From <HASH> <date>
    From: author....
    Date: date...
    Subject: subject...

    Commit log...

    upsteam-sob...
    [john.doe@foobar.com: backport from upstream]
    Signed-off-by: John Doe <john.doe@foobar.com>
    ---
    diff...

thus we can indeed check the commit hash at the beginning of the patch
and check whether it is part of a new upstream release.

If the patch had to be tweaked, then;

    From <LOCAL_HASH> <date>
    From: author....
    Date: date...
    Subject: subject...

    Commit log...

    upsteam-sob...
    [john.doe@foobar.com: backport from upstream HASH]
    Signed-off-by: John Doe <john.doe@foobar.com>
    ---
    diff...

> This makes it very clear that it has been accepted upstream, and will
> help someone who will do the next ipmitool version bump.

But yes, as long as the information is there, that's still OK.

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
