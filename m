Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99160ECAAD3
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 07:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DDC56FB71;
	Mon, 19 Sep 2022 07:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DDC56FB71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01VYsuJLigym; Mon, 19 Sep 2022 07:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C034460BAC;
	Mon, 19 Sep 2022 07:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C034460BAC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 939D91BF38D
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 07:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ED4560BAC
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 07:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ED4560BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5CrqSO_MXUA for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 07:51:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D45360B89
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D45360B89
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 07:51:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso4008600wmq.2
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 00:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=LQWJJh4KzaCF0cMxnv5dMbX5n0WMCVpQChSxaMFksXI=;
 b=GUfGBQUOme8d8Fushzn7bTaBcfcHzBMnfJjP5vDPVl0xtR1MkRX9LhffKyo+kRNQf6
 vpOX0komYz+CyW+n2hQRZTSUH3ZI84AC4XgJw8vkjhueZMWetmkpdZVAIRX9bCaPweCv
 U18nILCni516w9XrvZCjMt5hvoocguox9AF96Gay3rxZOqRNmN/e5t7/AiHDPuab9Sxw
 8uP8KPRE1pnAvXcvmTb5ALHuyS6Yb7T54uCiO64JBVGI6F2n1iqujox/KWUZTYAk4VIK
 dfnESEYafgm8QPALRiyX3dsWpzJATVDSg/qXaQMV1F9FLyYRSlNPmn4IB3axJZHuJwEy
 Wn6Q==
X-Gm-Message-State: ACrzQf2otA/Q+TRUatKTI2oaRecVvSk2ylgTNAEZUdXGp07koUCFCm5D
 xH7OJy7fIsvRMKQJA8KmKIwF65lRz4Qp04OKLQ7yxkPr
X-Google-Smtp-Source: AMsMyM4ml6C+mG56anNd8b3fI1DlXbnkdaki7Po6s+QXs8fhG8SZW9ppdjxGzRD6oov6kPFQp9sK2J+IgiEVzW37fP8=
X-Received: by 2002:a05:600c:3d0c:b0:3b4:c481:c63b with SMTP id
 bh12-20020a05600c3d0c00b003b4c481c63bmr6564560wmb.147.1663573889080; Mon, 19
 Sep 2022 00:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220511114003.162006-1-joel@jms.id.au>
 <20220511114003.162006-2-joel@jms.id.au>
 <87sfkofyc9.fsf@dell.be.48ers.dk>
In-Reply-To: <87sfkofyc9.fsf@dell.be.48ers.dk>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Sep 2022 07:51:17 +0000
Message-ID: <CACPK8XdLWYvKoVZ_B7Tf=yLY7fErzu-=wP1uE_3EKctxds2KeA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=LQWJJh4KzaCF0cMxnv5dMbX5n0WMCVpQChSxaMFksXI=;
 b=Ng8SbSOeIdvOYodfuuxj3eejhVaSLJ8yOcEdIUtZIa3L4ERViPDwCbS+cTWN2X7lcb
 rEiQTG85XIRpdI803oa3Wfm8sA12QzBKDlzbh7HLLpJtmK+P1B1Nk8y9zfPG7XsuMBv5
 mB5hEWFIH+1IXsgbyJIJmmj5+LWCC2HXtKr9I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=Ng8SbSOe
Subject: Re: [Buildroot] [PATCH 2/2] package/go: Fix link failure on ppc64
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 18 Sept 2022 at 16:21, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Joel" == Joel Stanley <joel@jms.id.au> writes:
>
>  > The autobuilder has been reporting build failures for golang packages
>  > such as moby, containerd, and docker-cli on powerpc64le:
>
>  >  net(.text): relocation target _savegpr0_28 not defined
>
>  >  http://autobuild.buildroot.net/results/a4aab952acca33577822daf9541c25ccb8e68e60
>  >  http://autobuild.buildroot.net/results/07dab4c21074d9f2cfba5020eac1d07e630fa3e9
>  >  http://autobuild.buildroot.net/results/e37af28b6ea2293a5a8a3bb1a5c123bd465ff5de
>
>  > Backport the upstream fix for the go compiler, and a dependant patch:
>
>  >  https://github.com/golang/go/commit/9c9090eb1da540c7d757df0c60423319a28759d3
>  >  https://github.com/golang/go/commit/caa46312eeca1275ce22ecf8985ca31ef8de7883
>
>  > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Sorry for the slow response. As far as I can see, this was fixed in go
> 1.19 and backported to 1.18.4:
>
> https://github.com/golang/go/issues?q=milestone%3AGo1.18.4+label%3ACherryPickApproved
>
> I also haven't seen any autobuilder issues since we bumped go, so I
> believe this is fixed and I have marked the patch as superseeded.

I agree; I mentioned this in reply to the patch that bumped us to
v1.18.5. Thanks for following up.

Cheers,

Joel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
