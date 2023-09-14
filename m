Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B2DEEAA77
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF567612E7;
	Thu, 14 Sep 2023 21:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF567612E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7p5XhNGLlsRC; Thu, 14 Sep 2023 21:04:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E154F612CF;
	Thu, 14 Sep 2023 21:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E154F612CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E7161BF368
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17E3E83A37
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17E3E83A37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iWqbL-PpwGr7 for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:03:02 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 925A083A0A
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 925A083A0A
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 6B0985C2479;
 Thu, 14 Sep 2023 23:02:58 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 14 Sep 2023 23:02:58 +0200
From: Stefan Agner <stefan@agner.ch>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87cyykv62q.fsf@48ers.dk>
References: <8ea671337eeee89169fec537dc0f4eca9e2a51ca.1694636470.git.stefan@agner.ch>
 <8734zgwpkb.fsf@48ers.dk> <84c4978a7989662a720f5e0f9e0cca24@agner.ch>
 <87cyykv62q.fsf@48ers.dk>
Message-ID: <7a8bdce8aec8f95c3039172cf02ab7d9@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1694725378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i3Ah6A3h3CFjzlX401NLzTw3EILR8CN3+AtI0TBMBLM=;
 b=Op3aGRyreRhBatp/1Y5CrpNPXQtddYFm5EwugeYy5C/DhSRNUG/u15iwdJx2HPJn2bi1Yj
 J0PLtMXy/G3Z2JxzU2McMO2PgeAY61lu2Ewvmt4cUjDnGh0Sw6kHakMpp7h53COsWzrtYa
 3hJDPJrcJl/+G4YsyUff1V0n5ZxjfFo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=Op3aGRyr
Subject: Re: [Buildroot] [git commit branch/2023.02.x] package/go: bump to
 v1.19.13
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
Cc: dominique.tronche@eviden.com, christian@aperture.us,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2023-09-14 22:43, Peter Korsgaard wrote:
>>>>>> "Stefan" == Stefan Agner <stefan@agner.ch> writes:
> 
>  > On 2023-09-14 20:57, Peter Korsgaard wrote:
>  >>>>>>> "Stefan" == Stefan Agner <stefan@agner.ch> writes:
>  >> 
>  >> > go1.19.13 (released 2023-09-06) includes a couple of bug fixes. In
>  >> > particular it fixes a bug introduced in with the update o v1.19.11
>  >> > which broke http using a unix socket addressing.
>  >> 
>  >> > Signed-off-by: Stefan Agner <stefan@agner.ch>
>  >> 
>  >> Committed to 2023.02.x and 2023.05.x, thanks.
>  >> 
>  >> I take it that this means we can again drop the recent docker-cli /
>  >> docker-engine fixes to workaround the HTTP header issue?
> 
>  > By "recent docker-cli / docker-engine fixes" you mean the bump to
>  > v24.0.x? Then yes, those can be dropped.
> 
> No, the backports of the workaround for the new go behaviour, E.G.:
> 
> https://gitlab.com/buildroot.org/buildroot/-/commit/d0ab8a869dbc5724a758f9777cafc1e12a343786
> https://gitlab.com/buildroot.org/buildroot/-/commit/ff72ac444311f45028381207df65d6538a7b12c8
> 

Oh I see, wasn't aware about those two commits.

But yes, from what I can tell, they address the same problem and are not
strictly required anymore.

>  > Or in other words, the version of Docker CLI/Engine present in 2023.02.4
>  > works fine with the new Go version.
> 
> OK, I will revert the two above commits then again.

Perfect, thanks!

--
Stefan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
