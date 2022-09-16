Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361DAECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 07:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9335684272;
	Fri, 16 Sep 2022 07:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9335684272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yxB9Cwjv5RzW; Fri, 16 Sep 2022 07:29:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4B3E8426E;
	Fri, 16 Sep 2022 07:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4B3E8426E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F4CC1BF41F
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 07:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECABB41606
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 07:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECABB41606
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yGZ_YrDyXmV1 for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 07:29:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFB71408EF
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFB71408EF
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 07:29:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2E721424;
 Fri, 16 Sep 2022 00:29:58 -0700 (PDT)
Received: from debian (X72Y076X74.nice.arm.com [10.34.125.3])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22A503F73D;
 Fri, 16 Sep 2022 00:30:20 -0700 (PDT)
Date: Fri, 16 Sep 2022 09:29:49 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YyQl7euXmtQsB4+2@debian>
Mail-Followup-To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
References: <20220914140821.3158921-1-vincent.stehle@arm.com>
 <675b62b5-7999-36f2-4d73-3d65c17f645b@benettiengineering.com>
 <YyM+v4AYpVlZQFB6@debian>
 <c3cc6951-4e49-4da2-b5f5-7dd5523a3c5f@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3cc6951-4e49-4da2-b5f5-7dd5523a3c5f@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] configs/qemu_aarch64_ebbr: new defconfig
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Sep 15, 2022 at 09:07:19PM +0200, Giulio Benetti wrote:
..
> > > > +	partition root {
> > > > +		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
> > > 
> > > Here ^^^ instead is correct according to Buildroot manual.
> > > You can check it on following link:
> > > https://buildroot.org/downloads/manual/manual.html#writing-genimage-cfg
> > 
> > On second thought I think I might as well not specify the uuid at all and rely
> > on the default being 'L'.
> 
> No, as stated in Buildroot manual[0]:
> "Even though L is the default value of genimage, we prefer to have it
> explicitly specified in our genimage.cfg files"
> So you should specify the partition-type-uuid =
> b921b045-1df0-41c3-af44-4c6f280d3fae as it is now.

Hi Giulio,

Ok, I will leave it "as is".

..
> > Thank you for testing!
> 
> You're welcome and so with all the corrected points:
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>>

Thank you!

Best regards,
Vincent.

> Best regards!
> -- 
> Giulio Benetti
> Benetti Engineering sas
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
