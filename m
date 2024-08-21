Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A470DC52D7C
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 07:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0250460730;
	Wed, 21 Aug 2024 07:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWHyFqq5jBIr; Wed, 21 Aug 2024 07:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5B6B60AD5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5B6B60AD5;
	Wed, 21 Aug 2024 07:12:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD0001BF38B
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 07:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B45C60AD5
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 07:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nL3R09w4NEvW for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 07:12:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7546E60730
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7546E60730
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7546E60730
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 07:12:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 271E713F8A7;
 Wed, 21 Aug 2024 09:12:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Aug 2024 09:12:14 +0200
Date: Wed, 21 Aug 2024 09:12:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <ZsWTTvL0qv6By7lK@landeda>
References: <ZsS52zTjT0Ca9twG@waldemar-brodkorb.de> <ZsUKCVcZheIlzo00@landeda>
 <20240820233250.3293444a@windsurf> <ZsUSEXO-x4RnuiZG@landeda>
 <29b5f7df.5240.19173962677.Coremail.tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29b5f7df.5240.19173962677.Coremail.tianyuanhao3@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724224339;
 bh=gcfBQLuxVq2q1GNi+suz36Bv4UUVSJ8oNqkPub6K4zM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qg0OtgIz5CZvK3m3rBrMO36ck6jwVZkVaH4DDxHHr2f3nn//LLNOye6WmQd6HqBpI
 MzBIZU8qeHIBMX0ke2tcj5jrDyi4n53p3sS8AeD/1dPJ0Ufkei4J2oAC4hPLv5FSYJ
 XCme+n7hebVZC4ww66W8kWoaH/C4Oowq71n4/QIHumvelIBqpu4u4aRrYSdn9AgEju
 7v3Nh8wH2gaq+3CubDJnVRs+wQFnOjIuLi/hgcb23jVi14Ju50rK/VvK6YReZ1EreA
 NzmNMgW8RTfERK9YlT79vuA/msaMvefDUwgg6Sco3Gl3Ea+ZoLy9GI0sdZsOYi4lF8
 /1v1EDJUiR8qw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qg0OtgIz
Subject: Re: [Buildroot] [PATCH] package/docker-engine: fix runtime problem
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yuanhao, All,

On 2024-08-21 14:18 +0800, TIAN Yuanhao spake thusly:
> At 2024-08-21 06:00:49, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >On 2024-08-20 23:32 +0200, Thomas Petazzoni via buildroot spake thusly:
> >> On Tue, 20 Aug 2024 23:26:33 +0200
> >> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >> > On 2024-08-20 17:44 +0200, Waldemar Brodkorb spake thusly:
> >> > > +	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)  
> >> > As far as I can see, this is an optional feature, and is not strictly
> >> > required:
> >> >     https://github.com/moby/moby/blob/master/contrib/check-config.sh#L235
> >> > So I don't think we should forecfully enable it.
> >> On the other hand, Waldemar is encountering the issue while doing a
> >> simple "docker run <container>", which seems to be like the most basic
> >> thing you would want to do with docker. So if CONFIG_USER_NS is needed
> >> for something as basic as starting up a container, I believe it's not
> >> really an optional feature?
[--SNIP--]
> In fact, USER_NS is optional for runc, but mandatory for crun.

OK, but still, for docker-engine *itself*, USER_NS is optional, as we
can clearly see in our runtime test that does not enable USER_NS and
still succeeds at running containers.

And indeed, our runtime test uses runc, so it kinda makes sense that it
works.

But then, if that's crun that needs USER_NS, enabling USER_+NS in the
kernel config should be done in the crun package, not in the
docker-engine one.

Thanks for the feedback!

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
