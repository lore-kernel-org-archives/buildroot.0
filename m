Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1516EC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 20:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DB864158B;
	Fri, 29 Jul 2022 20:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DB864158B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yWiljw-VRI4o; Fri, 29 Jul 2022 20:50:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61EC34154D;
	Fri, 29 Jul 2022 20:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61EC34154D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D1D11BF35D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 579B381C58
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 579B381C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id llkL-iDtkrwA for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 20:50:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F409681C2F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F409681C2F
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 20:49:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d054:eb09:eac4:da7e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 88B1713F895;
 Fri, 29 Jul 2022 22:49:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Jul 2022 22:49:52 +0200
Date: Fri, 29 Jul 2022 22:49:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20220729204952.GB1554632@scaer>
References: <20220727221217.1072588-1-arnout@mind.be>
 <37264d53-47f9-b2dc-955d-12e5960b4477@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37264d53-47f9-b2dc-955d-12e5960b4477@grenoble.cnrs.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659127796;
 bh=J0SvySbL7tBVfW0QWUaptpSvU+yanY5ttdoiCYAeEjU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qm+Q115AN7aAkMeigU+4VlAdPoyIf0QRvpX1vhgxiYEawBdSL6mlZGhiIPiRF249M
 7gisohOSFVjCuKic3Wr7tlDPXAkpB2SMI4Em9U92607n9LbvtvFb3g8yQCaeH7IlJi
 aMDrmZzduGR/Nm9Yv0tuvcVZruekWyns51LHm2KnYcMoutjpxk/bpT/oUWjtieG7UA
 H8IN4mwmHUKAY1vIhJ+IYVm90uJPPQVMW3OzdAP8UIhIq9peZBreU0bD8wA9wa8qvz
 iC22j5VoLgrKxDz9L+5kHQGKlZM2jTfK1f2FO9lJjV+Dk0L+pxVeM2C1723yNIws+w
 /yKwh+KVvROpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qm+Q115A
Subject: Re: [Buildroot] [PATCH 1/2] docs/manual: introduce "Integration
 topics" chapter
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
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Edgar, All,

On 2022-07-28 09:54 +0200, Edgar Bonet spake thusly:
> On 2022-07-28, Arnout Vandecappelle (Essensium/Mind) wrote:
[--SNIP--]
> > Create a new chapter "Integration topics" with an introductory blurb,
> > and move the SELinux topic under it (as a section rather than a
> > chapter).
[--SNIP--]
> > diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
> > index b5cc044805..8ba0c76d32 100644
> > --- a/docs/manual/manual.txt
> > +++ b/docs/manual/manual.txt
> > @@ -38,6 +38,8 @@ include::common-usage.txt[]
> >  
> >  include::customize.txt[]
> >  
> > +include::integration.txt[]
> > +
> >  include::selinux-support.txt[]
> I believe the above line (selinux-support.txt) should be removed from
> manual.txt.

Good catch, I've fixed that!

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
