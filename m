Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE07C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 12:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 933594191E;
	Sun,  7 Jan 2024 12:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 933594191E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EuK4xE2ufd5Z; Sun,  7 Jan 2024 12:10:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE95D41803;
	Sun,  7 Jan 2024 12:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE95D41803
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 522121BF310
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 12:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28A4C4032A
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 12:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28A4C4032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 04-bDgqi93f6 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 12:10:36 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 917724015A
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 12:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 917724015A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9F5F5B00539;
 Sun,  7 Jan 2024 13:10:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Jan 2024 13:10:30 +0100
Date: Sun, 7 Jan 2024 13:10:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZZqUtsil3DTT20FN@landeda>
References: <20231205235919.510051-1-adam.duskett@amarulasolutions.com>
 <20231205235919.510051-4-adam.duskett@amarulasolutions.com>
 <87msth1ofj.fsf@48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87msth1ofj.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704629434;
 bh=1htOdt+DI8dQ7BNUWxHnuX0Iv0YcH/5d/mZP5ITJ7Gw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z9/JDTaG6E0SRRR3zTvXOLUB+WZYTy7Nb+tesogyjP3KvXG1lLRksM9qAG2RpQLVE
 G7IZd7aGrmdgmoUI3NRRMjXS3337hBMhQIKXcVsnTLt3qyL6/QQwe+kFohA+O6j8K/
 qYBA82N0fYhAiB066xW0QYdtAMRs5uPmI27ZmI6m2kuqT7O9ThIZUmLDCKOWHokq5B
 oJExg4jNzn1fu7ilAWqiu6Y+xi+iHUXlv96BGCaGG7U6/PscXTgXPyGhchciVgtQ8d
 sibPtgW9ZqlOsLVFwKjSiU5EpMtwHH1j9tZMMTGjyX57uvO/uqUhOftCkAmJmP2Fzz
 u8jdPFNKLM+sA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z9/JDTaG
Subject: Re: [Buildroot] [PATCH 3/3]
 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch: New
 security patch
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-01-07 10:29 +0100, Peter Korsgaard spake thusly:
> >>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:
>  > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
>  > ---
>  >  ...veral-defects-found-by-Coverity-scan.patch | 61 +++++++++++++++++++
>  >  1 file changed, 61 insertions(+)
>  >  create mode 100644 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
> 
>  > diff --git a/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
>  > new file mode 100644
>  > index 0000000000..1719769872
>  > --- /dev/null
>  > +++ b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
>  > @@ -0,0 +1,61 @@
>  > +From a1c48b91cd1cf1e9bf7077709b69f4bfd4c4abc7 Mon Sep 17 00:00:00 2001
>  > +From: Sandro Mani <manisandro@gmail.com>
>  > +Date: Tue, 5 Dec 2023 16:38:48 -0700
>  > +Subject: [PATCH] Fix several defects found by Coverity scan
>  > +
>  > +From: giflib-5.2.1-17.fc39.src.rpm
>  > +Upstream: Not submitted
> 
> No upstream and no CVE? Where does this fix then come from?

I was a bit sloppy when applying that one, indeed. As the commit log
mention, it's taken from the Fedora 39 source package, and I believed it
was enough reference.

Looking at that source package, it matches the patch named giflib_coverity.patch
and the Fedora dist-git for that patch date back to 2020-02-17:
    https://src.fedoraproject.org/rpms/giflib/c/df94d26a07ac8772b3380f4e5b4145daa7bf65e1?branch=rawhide

As far as I could find, it has not been submitted upstream, and upstream
looks like it has been pretty mothballed for a while now; last commit
was on 2019-08-17:
    https://sourceforge.net/p/giflib/mailman/giflib-devel/
    https://sourceforge.net/p/giflib/code/ci/master/tree/

I could not find any associated CVE:

    https://nvd.nist.gov/vuln/search/results?adv_search=true&isCpeNameSearch=true&query=cpe%3A2.3%3Aa%3Agiflib_project%3Agiflib%3A5.2.1%3A*%3A*%3A*%3A*%3A*%3A*%3A*

Looking at the code, I doubt it is a security issue, in fact. It's
probably just a memory leak, as the free() is replaced by this function:

   79 void
   80 GifFreeMapObject(ColorMapObject *Object)
   81 {
   82     if (Object != NULL) {
   83         (void)free(Object->Colors);
   84         (void)free(Object);
   85     }
   86 }

So, Object->Colors leaked, but I don't think it was a "security" issue.

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
