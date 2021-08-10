Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2B5C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 19:16:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D6826056B
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 19:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D6826056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6167440384;
	Tue, 10 Aug 2021 19:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YpEGLA-wE4ir; Tue, 10 Aug 2021 19:16:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 572BA40385;
	Tue, 10 Aug 2021 19:16:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52E671BF951
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 19:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4256583299
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 19:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 93N0blBA8C3O for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 19:16:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D746831E7
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 19:16:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bc21:5bf8:172d:5380])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 04309780368;
 Tue, 10 Aug 2021 21:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628622993;
 bh=1WDgFyluWOq5SSbHJbOpqtTyMOCFsYWa7z4pPWq2gbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KCt6xsN14MctjN8G5qpTtQMoYOFkiGOIT9bm7VN/fSY45YRg4+UXteTx60Tl5wK/U
 rU5W5njHDaVV/UA2L7EStQPoZz803dvgGjaZPXjICNIzaY9tDWWGRvUF6f5ck4QAMW
 wODZ77tBn2KCyfDJ4XXlCLYCdABgmdoxS3UjQraXxWHBhsBsgQLDLbYEdDHYqU+i1X
 MSfO5SQMX0DGmOHF6q3hyMc8piFwU8akG6+RWEX2fR7Hj16h7+Ni2rbNUu7nZ2/KUj
 RaLym3eCpdGQkwe78cMFdeBo3iunF6et02pr9x1BPvyFSY6s8z7dev4CVoUgp0TZLX
 f8WoNBD5b3yoA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 10 Aug 2021 21:16:24 +0200
Date: Tue, 10 Aug 2021 21:16:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20210810191624.GS27036@scaer>
References: <CAFSsvmpnjAFHs6SxcgLe1=smtJes=4f=qm2wi7W9D8qcC+kYEg@mail.gmail.com>
 <878s1ezzle.fsf@oc8242746057.ibm.com>
 <CAFSsvmpxdF3s-OBcPwMJw8Fp=6wGNib+7YddWoWELCKztEVn_Q@mail.gmail.com>
 <20210807120420.GC27036@scaer>
 <CAFSsvmqHjEoN4r5Atj0jDMLr-CcY8SyQ1C=FYg1hywKrrn=2GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFSsvmqHjEoN4r5Atj0jDMLr-CcY8SyQ1C=FYg1hywKrrn=2GQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Buildroot, S390X,
 and gobject-introspection build error help
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alexander Egorenkov <egorenar@linux.ibm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Adam, All,

On 2021-08-09 09:22 -0700, Adam Duskett spake thusly:
> On Sat, Aug 7, 2021 at 5:04 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > If I look at the git history (ellided for brevity):
[--SNIP--]
> > There are only 10 commits between a853a5d7..f9975537, and only 2
> > non-code commits on master after the merge.
> >
> > Adam: would you test that we update the prelink-cross version in
> > Buildroot? At least updating to the version as used by OE would seem
> > like the minimal, and then maybe check if we can update to master.
> >
> Yes, we can update to the latest in OE.
> No, we can't update to the latest in master, as it doesn't build prelink-rtld,
> which is super weird.

I have to admit that I did not understand this latest part... So, Had a
look at the history for prelink-cross, and it seems that master is very
close to the old svn tree from before Mark Hatle adopted the
then-orphaned prelink project.

So, the branch that we are interested in for cross-compilation is really
not the master branch, but the cross_prelink branch.

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
