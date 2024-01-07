Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8031C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 20:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66086605B3;
	Sun,  7 Jan 2024 20:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66086605B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BbysMqdeAE01; Sun,  7 Jan 2024 20:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B314C606A0;
	Sun,  7 Jan 2024 20:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B314C606A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F2E51BF361
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 20:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77B76606A0
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 20:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77B76606A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mscxr9P5ni8y for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 20:03:32 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E25B4605B3
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 20:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E25B4605B3
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.186]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mr9Bk-1qsVom3oCU-00oJj0; Sun, 07
 Jan 2024 21:03:27 +0100
Date: Sun, 7 Jan 2024 21:03:25 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240107210325.2712e100@gmx.net>
In-Reply-To: <ZZqUtsil3DTT20FN@landeda>
References: <20231205235919.510051-1-adam.duskett@amarulasolutions.com>
 <20231205235919.510051-4-adam.duskett@amarulasolutions.com>
 <87msth1ofj.fsf@48ers.dk> <ZZqUtsil3DTT20FN@landeda>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:brxMQunCy95bHYWxpcl0EbtMZR5NaDv9IokQDr3zIOY58ktSh2D
 hTsea9JQnOZPpzLt8l/wigZQdqCFG1HLx8gRGJKYnhJE3it/3ieHhOtJjPVu3Edh5JVpSDu
 qyWcQdJjDxLz8hGPDKqt1t6dB1DI72poNWq/8vKv3dl5AN514VPqaJnWAIdsfhrateBsW2Y
 VwQzwosiSuNC/rhAmlvow==
UI-OutboundReport: notjunk:1;M01:P0:mozrllY6jg8=;GOYuzrnH7wQxeTe+rpIHPVHaRD7
 C+uN/XIW5bfyweL8XiYm3tJ0XY/QEsdczptD493UjEsyPUrWwvTizLK228AWaB4b5W2Sr82qB
 EUHZ04CKZMlauT+NaN9gvo8a3xuRI2D/Gl0/UyQOojjOFYd4up4ogMDAcs9dFcdHSbknRGVbP
 1G56lZeu9G8KJATwnqZM3+jaPzIzvY+eufwZG7XMwvLcFBTy1D1M/iaLvh28SslVuWiuGVQSN
 FD+V5U9lBn7eX9euRxAUzNAz51PmwlzrisqcTfCxFyuNllFaxgjxBVzE/KAjP7CL2Y72yWN5C
 1CkA+7p+8abr7bcL2RjVHTOP9+BcrP0NP+pTX98aM8LfLEHRP4NTNykOvCRfLnqQIPAbfSjW4
 g7j+zkse6SthCcbTmaf1zWp3MIilAH7AhGlol+jfjEJJfaO0w+SblplwlWGi3P+c4k7RkNY62
 lh+DeWyLVCbQMhbCWR45PN4j1Vg2GE4EarhU+lc4swecyFuY5D3ZCCRl+nqik9EPO2I0RTTVv
 VTfWKStDJ0uljHtFQgwRMMEIRDhqaF5KCq7XlwhpZulxF0kcIQptTuko27JreJQDmmyYin07M
 OhtgG9zaD1HzUY6pyEk1/N9Nz64bwuwek9igx8Wv0g4JWT4MfsBd9z8TNdfB45zrUlwII2qMj
 eGJEQR/ks1PD02EajLZEoWnkUoH+/BtOv4cdSgbLgaWEdTjnFeLOdZbnAegMGfE+3KM81Iv9B
 8ge4Lo9pT78pjZYM573iroiUPpt9/VLN3GkDCQiP9+It4grm756UxECYOGcLjU8apbqi4+HZc
 W9BRN5BcaAQ9UggWXDvm+2hyXiHnkFAZjD/uRs2GeJkrO+wa+fmyzI3nRGpO5Zznym4n6Pt2O
 6swXjQpbRASygCfBgT/FarD4JukenX4PG2HeQn0jRPr4K+qe9c+FwBJDyrrfByYvlrJz+4syi
 Gzin4wE7SF3vdFCoTLT40HInw8c=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1704657807; x=1705262607; i=ps.report@gmx.net;
 bh=oBsiakuZClu5K2XAVeCUEx3vTXH9A3zcaucWF3HHPcA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:
 References;
 b=tvo6Lv9jfWRwxKZ8vcMf7DdIZcrHHolQNgeouINUnXvMUyp6GT4uyn1wYg9QnBRP
 6I0ff/+VrdPBKaoIpiHj4n7soZfaFykYIErds6vjIP39Xa4Cz0LuGyJw4/C7vBCfG
 EGO1Dzt59eET4ip8aJpPiBY2BDJxaplnrnmztLrqumqny5r8DLlooPz+5Kq+G48XX
 bdNa7r+k61ema0d+TKSFuPuFCX1QLxu2M7hOGYAS0zA7PoCYewE6L+/CGAe/1dHbW
 bjgFK8qao/DHPy2lUVX+SXOKa1ndtmUmyzlQqNyXL/GojzHvV85n8KJRq4XNmTjEu
 xC53Vvjd4v9AzzFCWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=tvo6Lv9j
Subject: Re: [Buildroot] [PATCH 3/3]
 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch: New
 security patch
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 7 Jan 2024 13:10:30 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2024-01-07 10:29 +0100, Peter Korsgaard spake thusly:
> > >>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:
> >  > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> >  > ---
> >  >  ...veral-defects-found-by-Coverity-scan.patch | 61 +++++++++++++++++++
> >  >  1 file changed, 61 insertions(+)
> >  >  create mode 100644 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
> >
> >  > diff --git a/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
> >  > new file mode 100644
> >  > index 0000000000..1719769872
> >  > --- /dev/null
> >  > +++ b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
> >  > @@ -0,0 +1,61 @@
> >  > +From a1c48b91cd1cf1e9bf7077709b69f4bfd4c4abc7 Mon Sep 17 00:00:00 2001
> >  > +From: Sandro Mani <manisandro@gmail.com>
> >  > +Date: Tue, 5 Dec 2023 16:38:48 -0700
> >  > +Subject: [PATCH] Fix several defects found by Coverity scan
> >  > +
> >  > +From: giflib-5.2.1-17.fc39.src.rpm
> >  > +Upstream: Not submitted
> >
> > No upstream and no CVE? Where does this fix then come from?
>
> I was a bit sloppy when applying that one, indeed. As the commit log
> mention, it's taken from the Fedora 39 source package, and I believed it
> was enough reference.
>
> Looking at that source package, it matches the patch named giflib_coverity.patch
> and the Fedora dist-git for that patch date back to 2020-02-17:
>     https://src.fedoraproject.org/rpms/giflib/c/df94d26a07ac8772b3380f4e5b4145daa7bf65e1?branch=rawhide
>
> As far as I could find, it has not been submitted upstream, and upstream
> looks like it has been pretty mothballed for a while now; last commit
> was on 2019-08-17:
>     https://sourceforge.net/p/giflib/mailman/giflib-devel/
>     https://sourceforge.net/p/giflib/code/ci/master/tree/
>
> I could not find any associated CVE:
>
>     https://nvd.nist.gov/vuln/search/results?adv_search=true&isCpeNameSearch=true&query=cpe%3A2.3%3Aa%3Agiflib_project%3Agiflib%3A5.2.1%3A*%3A*%3A*%3A*%3A*%3A*%3A*
>
> Looking at the code, I doubt it is a security issue, in fact. It's
> probably just a memory leak, as the free() is replaced by this function:
>
>    79 void
>    80 GifFreeMapObject(ColorMapObject *Object)
>    81 {
>    82     if (Object != NULL) {
>    83         (void)free(Object->Colors);
>    84         (void)free(Object);
>    85     }
>    86 }
>
> So, Object->Colors leaked, but I don't think it was a "security" issue.

Matter of judgment if a (very theoretically) denial-of-service/out-of-memory is counted
as 'security' issue ;-)

Regards,
Peter

>
> Regards,
> Yann E. MORIN.
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
