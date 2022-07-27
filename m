Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED0AC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 19:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D29041615;
	Wed, 27 Jul 2022 19:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D29041615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_-Zqryf2UPs; Wed, 27 Jul 2022 19:19:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BA88415FE;
	Wed, 27 Jul 2022 19:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BA88415FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F25C51BF3C6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA76F40122
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA76F40122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-MjIxqNPt08 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 19:19:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2529400D8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2529400D8
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 19:19:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2464:a3b6:9580:87a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 471CAB00712;
 Wed, 27 Jul 2022 21:18:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Jul 2022 21:18:56 +0200
Date: Wed, 27 Jul 2022 21:18:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220727191855.GA1265196@scaer>
References: <20220727071557.3434892-1-james.hilliard1@gmail.com>
 <20220727071557.3434892-2-james.hilliard1@gmail.com>
 <0b33098c-cdf6-d59a-0ee3-fc9821de53ba@mind.be>
 <CADvTj4qO6bzEjEG4Hs8Cy9McBqs0Vj4Pq37ZTw+h468OeCZLvA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4qO6bzEjEG4Hs8Cy9McBqs0Vj4Pq37ZTw+h468OeCZLvA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658949544;
 bh=B8uNsFrUz8fTek8ASuQD9CGe/ifkDPwBBzYeLAkioVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eMMu9wZOnQRMBkDUSJNv5qnx023TWURGJV0QrGm6LWxpegFlq1OJ/6y5JxfowVz/o
 a6PPNe52sOtxEKNzy+cI1v0OxyWCyx1/Pwrwd6axBR/cf3NpMhTuOVISOyqzv2PXID
 vtDgCiyU5jv+Z0/JJl3qofJhgybzpgbjioq+JA8Arl3dVBTdrWg1ehybblBANJq2/I
 3OSYcQ0QtzuAVf9NIH8vP4ZHBZVwSrYQMAUhNpF25aNH0vcCSy5IbpjGdDTS1BTsca
 BYNBinklTacOSqIG9A0YGgBqEOdEM25RK7I4jjdG5HBRR1O8gbkS0bCETXwje5+GsX
 A9bNUtTQYfEJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eMMu9wZO
Subject: Re: [Buildroot] [PATCH v5 2/2] package/pkg-meson: use meson to
 build/install packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot <buildroot@buildroot.org>, Norbert Lange <nolange79@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-07-27 12:33 -0600, James Hilliard spake thusly:
> On Wed, Jul 27, 2022 at 5:08 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> > On 27/07/2022 09:15, James Hilliard wrote:
[--SNIP--]
> > > We need to set --pkgconfig.relocatable so that pkg-config files are
> > > not generated with absolute paths which cause issues with per-package
> > > directories.
> >   This still doesn't explain how it is related to using meson rather than ninja.
> > Are you saying that when calling ninja directly, PPD work perfectly fine, but if
> > it's installed with meson, it doesn't? Then I'd really like to have a little
> > more insight into what meson does to break it.
> Well, the issue seems to be that without --pkgconfig.relocatable meson install
> messes up the paths during install due to generating absolute pkgconfig paths
> while ninja doesn't.

But does that actually causes any real issue and build breakage?

For the non-PPD case, that should not be an issue, as the HOST_DIR (and
STAGING_DIR, below it) are constant throughout the build.

For the PPD case, we have a prepare hook that fixes the paths in all
text files, see b06294e9897e (core/pkg-generic: fixup all PPD paths in a
generic fashion). So this should be covered.

For the SDK, there is a script that does something very similar to the
PPD case, so again there should be no issue.

What is it that you actually want to achieve with relative paths, that
is currently broken with absolute paths?

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
