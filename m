Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EC0E95A8D
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 06:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 491EA81F51;
	Mon,  9 Oct 2023 06:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 491EA81F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9eyMBHpyGsyZ; Mon,  9 Oct 2023 06:08:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 465ED82022;
	Mon,  9 Oct 2023 06:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 465ED82022
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AFDE1BF37F
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 06:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E87D682022
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 06:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E87D682022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k9FHln7sGXLa for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 06:07:59 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5FE581F51
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 06:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5FE581F51
Received: from pwmachine.localnet (unknown [188.24.154.80])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1B68C20B74C0;
 Sun,  8 Oct 2023 23:07:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1B68C20B74C0
From: Francis Laniel <flaniel@linux.microsoft.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 09 Oct 2023 09:07:24 +0300
Message-ID: <2701824.mvXUDI8C0e@pwmachine>
In-Reply-To: <20231005195612.GB2552@scaer>
References: <20231005062458.8973-1-flaniel@linux.microsoft.com>
 <20231005062458.8973-2-flaniel@linux.microsoft.com>
 <20231005195612.GB2552@scaer>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1696831678;
 bh=jeCQXvRp9/vEOo2SFVprKhzK/MSig7xj2uMlUUfrG4o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rFADPahbZKpEFHRCMg7KJX/JjmpA+qnCnfXLWBiPTdSUWgNtBIEWFWspuQ2mrmHel
 BisvMTkYWC5Dpv1Zr6t0U2bmBMafiCkLK+m6uCRpMTj3B7VN/Y52vrnFIUioUjoI1a
 sw4hKzrW7np/A/A0aW5b5K7klyGEuaBQLpJc/r1Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=rFADPahb
Subject: Re: [Buildroot] [PATCH 1/1] package/tbb: fixes hash
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.

Le jeudi 5 octobre 2023, 22:56:12 EEST Yann E. MORIN a =E9crit :
> Francis, All,
> =

> On 2023-10-05 09:24 +0300, Francis Laniel spake thusly:
> > Fixes: 74b50d553eaf ("package/tbb: bump to version 2021.10.0.")
> > Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> =

> Applied to master, thanks.

Thank you for the merge!

> Regards,
> Yann E. MORIN.
> =

> > ---
> > =

> >  package/tbb/tbb.hash | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
> > index 1caf81c5c5..085d54109a 100644
> > --- a/package/tbb/tbb.hash
> > +++ b/package/tbb/tbb.hash
> > @@ -1,3 +1,3 @@
> > =

> >  # Locally calculated
> > =

> > -sha256  eee380323bb7ce864355ed9431f85c43955faaae9e9bce35c62b372d7ffd9f=
8b =

> > tbb-2021.10.0.tar.gz +sha256 =

> > 487023a955e5a3cc6d3a0d5f89179f9b6c0ae7222613a7185b0227ba0c83700b =

> > tbb-2021.10.0.tar.gz> =

> >  sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0a=
b4 =

> >  LICENSE.txt

Best regards.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
