Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB65ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 21:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47D88829AF;
	Fri, 26 Aug 2022 21:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47D88829AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kywTOC4Xhk4l; Fri, 26 Aug 2022 21:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D605982948;
	Fri, 26 Aug 2022 21:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D605982948
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5244B1BF860
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 21:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 355146079D
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 21:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 355146079D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CuAP9v8ZGUf1 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 21:07:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC47960769
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC47960769
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 21:07:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0751319F736;
 Fri, 26 Aug 2022 23:07:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 26 Aug 2022 23:07:12 +0200
Date: Fri, 26 Aug 2022 23:07:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Johan Oudinet <johan.oudinet@gmail.com>
Message-ID: <20220826210712.GE37358@scaer>
References: <20220322160725.636205-1-johan.oudinet@gmail.com>
 <20220822141205.GC2167049@scaer>
 <CAJtjsKZtjXnqki4+yPdkdLNcVa+4kOfmybk-_5yxA8497r31-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJtjsKZtjXnqki4+yPdkdLNcVa+4kOfmybk-_5yxA8497r31-Q@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661548035;
 bh=nNOzwgNK9HtbXDxHYSS5XOZmWjl3nWtsLVQzHLpymBM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EYoEND0cungjHgxDeI84SVyU7mHemROG/hNVWKaCZu5XbcRh5fO4b6wA8lk7ITnuU
 3hy57o5rxyYyw4GGP6/wGcpPy6dAWAI73KkcDZ+1oPKmqn+Z7Jd7ynhXAbgNEeRenK
 UPT8GEbraB63x2w7Tyme/ej0EgENXkX8GcoNCinXysUvpb5Wvjb9WxDLQTdwPNlLcz
 1l3XMztEcyxxpUErd0IfZNkFI1IPDyAJsOC/J2F9T3zcC06PeU0iMxAz4YQGetEbiW
 6MljHqHNzt5VrszLM6bXTLBiRq5+Gtyi61qyck4x3UyCYVrV1otLVUGX8lQ0V8kC7C
 1VwlsloqBZQYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EYoEND0c
Subject: Re: [Buildroot] [PATCH] package/forge: new package
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

Johan, All,

On 2022-08-26 16:11 +0200, Johan Oudinet spake thusly:
> On Mon, Aug 22, 2022 at 4:12 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Instead, you should grab the sources from th github repo, have the
> > package depend on host-nodejes, and build the pacakge with $(NPM) build.
> 
> Thanks for the suggestion. I didn't know we could do that in recent
> versions of buildroot.
> It is indeed a much cleaner way  to handle npm packages, even though I
> don't like the BUILD commands to download the dependencies.

Yeah, this is indeed not nice, but there is nt much we can do for now.

If we get a good nderstanding of how npm-based pacages work, then we can
look into introducing a download post-processing script, like we have
for go and cargo, where the vendoring is done as part of the download
step.

But I don't think I could spot a similar (mis)feature in npm...

Regards,
Yann E. MORIN.

> I've uploaded a new version with your suggestions.
> 
> Best regards,
> -- 
> Johan
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
