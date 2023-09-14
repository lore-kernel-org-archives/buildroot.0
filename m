Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB34DEEAA6A
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 19:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27CBB41E83;
	Thu, 14 Sep 2023 19:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27CBB41E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rg10iABFLYM3; Thu, 14 Sep 2023 19:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3686741EAD;
	Thu, 14 Sep 2023 19:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3686741EAD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F079F1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C99DA41854
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C99DA41854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xtk7k2RCk-r6 for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 19:44:41 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D104C405F5
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 19:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D104C405F5
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 62DAE5C1E3E;
 Thu, 14 Sep 2023 21:44:37 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 14 Sep 2023 21:44:37 +0200
From: Stefan Agner <stefan@agner.ch>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <8734zgwpkb.fsf@48ers.dk>
References: <8ea671337eeee89169fec537dc0f4eca9e2a51ca.1694636470.git.stefan@agner.ch>
 <8734zgwpkb.fsf@48ers.dk>
Message-ID: <84c4978a7989662a720f5e0f9e0cca24@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1694720677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MjFgY/xvbFBcxUzUgih5sLxaSQ/fcN6je74ZfoS6OQQ=;
 b=T6jpHFL69f91H9NtwafzuKLtbDxMjTl7eBEWxASqHThKflwgBIAk9GhAKNVYFZVQfPxrBJ
 rgIvYvaSmxrtHXUjgn3Dr7fJga3P5odQ0LKZ4ojcPlSHk2Wx0Neo5CxDUB1kZ0jpuT3MRs
 vHOzKR0qACdIFL7liTnU3XKAYW9JSK4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=T6jpHFL6
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

On 2023-09-14 20:57, Peter Korsgaard wrote:
>>>>>> "Stefan" == Stefan Agner <stefan@agner.ch> writes:
> 
>  > go1.19.13 (released 2023-09-06) includes a couple of bug fixes. In
>  > particular it fixes a bug introduced in with the update o v1.19.11
>  > which broke http using a unix socket addressing.
> 
>  > Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> Committed to 2023.02.x and 2023.05.x, thanks.
> 
> I take it that this means we can again drop the recent docker-cli /
> docker-engine fixes to workaround the HTTP header issue?

By "recent docker-cli / docker-engine fixes" you mean the bump to
v24.0.x? Then yes, those can be dropped.

Or in other words, the version of Docker CLI/Engine present in 2023.02.4
works fine with the new Go version.

--
Stefan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
