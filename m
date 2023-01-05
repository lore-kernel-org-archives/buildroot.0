Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F347C3DA7D
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 13:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26A568216C;
	Thu,  5 Jan 2023 13:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26A568216C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3VATwCmxZiPU; Thu,  5 Jan 2023 13:41:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 532238215F;
	Thu,  5 Jan 2023 13:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 532238215F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26AF61BF409
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F06F8215F
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F06F8215F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f0hRLZbl3sIr for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 13:41:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A92CE82133
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A92CE82133
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 13:41:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.51]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MeCtZ-1ociVJ0Rfj-00bL05; Thu, 05
 Jan 2023 14:41:38 +0100
Date: Thu, 5 Jan 2023 14:41:37 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230105144137.08b6da05@gmx.net>
In-Reply-To: <20221229102954.2785314e@windsurf>
References: <20221219213343.26475-1-ps.report@gmx.net>
 <20221229102954.2785314e@windsurf>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:oUgkESh+Xw1K2HQ7ZvW7s5doCG7JP6Uxig1PtWqu3zq8VYjS7za
 p/k7st5ZqMfuEJgREuD6GyF0PaWAdTI7cNOiVq6/mtqrZ6td7FBmjUBxpOmFruLyH7E9D1M
 xeoQAUX07mkexxPqxU8BrzTGz4KFcpFei2F/fyCm2B/nT+ddiuHTdinKS1i6e2JP5xzieGF
 0e75cdD37w2iwVrdrbOhg==
UI-OutboundReport: notjunk:1;M01:P0:QAUAvPV0+kQ=;Vh+4pMXt8C1ra12Gjs8TRzc5FT0
 RWiZlfm2qO0ahra3Rmq613aMteUGQzBCdKfLMXfJPlZYFkst99k1AwbVd4cwFIC3Rao1aZKvp
 NT3+w7QYzQUnxVho/sZC+54uiw5BhKA+/zUAoDV2ra+Aey6eln/H/JcgE09oxgIBg6U3PJ7J9
 k7fMfGbBeViV3EUgCWIGMv5u0S8u7rBnVcAfRVk2pbLBrusy3jpXGol556PxtbZO4VrxdyvkV
 3/WVW7fXc3zhiUuuoqdGKziJJJiorz0KSYLYDU09KBQKBYefbZLEcuAzazYvzo1kdNnCPN7+K
 YDa9XwMe5xddVCadgwHJe3L9tYPwShm690vk2RWYqh9XVUAe+CO5zVU1UChw7J38S6hSZD73k
 yt8Bheqdftg0tJg8ND/4CqmBRHos4lBI7mxZv0bHZ3A48AIJ/Zd/nOymU4nKxQQQ8+FT6UNly
 VpZ9AMNzqNjyOkphRUMDBPbNVZijWY+7lJ39ad4Cw9Ef3j6CS70GF7OcYU41G+OjGEVetcyom
 /xzmJatlWAUIZz/qTdvkJ3HuSIzcvrzywXfYD860oL36h7I0nLtzvcBduroncS1J8COoNa+KG
 GhDx6lw3GtNWDxtM2kzC2bysFv5AYgr7hDUgvyTnzbmYw2UMFq/DMCp2beN+dzuQqIkC8w34X
 jToz5Z7PYFdqkeiYAGJ66YxaTbqlkABIlDN7ZEFB7omUi6v7v0A8JV0LBNL2ZfBz4zOKgcrSp
 twr6c93I6dbsFbbSX1wKnnlc3Zi6oDz5J24XxDWUCOZN5IYa58NNXGntolpntzvFJVmhzZ8k+
 H6EKCfd3XQNqDkgZDhEQbu1GKTSI5YeSR4iFedSZ+YyIru+1Wg3c7ZKn8bb9daI9WMn0tN9O8
 FkZoz3eBTFBdH97mH8RjC9qU/wV2RTRbK+aCK+mJqgAtiXjb1qHf2ZBzpwpSiSdVLxnKBIiG6
 JNXqkbDyOjTPEpZ5qPkS42stAhY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1672926098; bh=VHDJ0Yd93/9czY3WlPfwRm0o3mnuV3vxShBHx1gn628=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=OmeZcgd49WTJOde0f+fX56yCmGHOmN4wp1d/MxRFtK1B8jUTyZe5R30MblavBcwfh
 qrG7wtsQ3pHezj2dyWcY3gDUr/ckwks2LvERndpNBKaJr9prWlbSpla1y/WVe+rg+7
 cZR7ehCKYLtTOlwz2TRcMjNQzLIozso8grMbcqQ3GPKG+k1yqcbZ+ZapSCYW99DsYM
 uexlgCK+Lhf9pJVflrI8r2SyjcJOYGPHu3iVl52F2SSTj45HBSMcjaudMzHjk9oSHh
 3eZ92BLUELrPJt9Fr8HUSwGaiv9KMlw3+jWpg13gTQO/po32OriWfNZasWaIDBdeC0
 wfUMuoDF5w0SQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=OmeZcgd4
Subject: Re: [Buildroot] [PATCH v1] package/perl-image-exiftool: new package
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

Hello Thomas,

On Thu, 29 Dec 2022 10:29:54 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
>
> On Mon, 19 Dec 2022 22:33:43 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/Config.in                                  |  1 +
> >  package/perl-image-exiftool/Config.in              |  8 ++++++++
> >  .../perl-image-exiftool/perl-image-exiftool.hash   |  6 ++++++
> >  package/perl-image-exiftool/perl-image-exiftool.mk | 14 ++++++++++++++
> >  4 files changed, 29 insertions(+)
> >  create mode 100644 package/perl-image-exiftool/Config.in
> >  create mode 100644 package/perl-image-exiftool/perl-image-exiftool.hash
> >  create mode 100644 package/perl-image-exiftool/perl-image-exiftool.mk
>
> I've applied to master, but then later realized that you had not added
> an entry in the DEVELOPERS file for this package. And you actually
> dropped your entire DEVELOPERS entry a few months ago.
>
> So what do we do? You submit new packages, but you're not ready to
> maintain them? :-)

Sorry, not enough spare time (and interest) at the moment for regular buildroot
contribution, but sometimes some quirks develop out of private and/or customer
projects (if you prefer only maintained packages it is fine for me to drop
this one)..., nevertheless I take a sporadic look at the mailing list ;-)

Regards,
Peter


>
> Thanks!
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
