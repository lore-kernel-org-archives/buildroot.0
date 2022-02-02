Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B43FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 20:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29F2C4156D;
	Wed,  2 Feb 2022 20:42:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4txJeln5Gfnv; Wed,  2 Feb 2022 20:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52A77405C8;
	Wed,  2 Feb 2022 20:42:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA1641BF346
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 20:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6BBE400D3
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 20:42:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cgejKNtdwOKK for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 20:42:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 522F540499
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 20:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643834531;
 bh=cHbgOcNnhLw9/B36JMrPk+MInSmAcsMvcZ8r/D1FP4k=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=S2ab7lmCMQ4bvPQI9d2OQlo5+hYsbj6MfBXszCwoOt0ijnc6tev6i2EYO7NDcpaVK
 7ElmFcHvT+06OegzENT8PVQjDhrcP3ep0R18DLD8UvufPY9eiaIf0j4Do4ITHNwQlr
 kX1a/wyAR+o9ThXjJCtjVdvqw+PfXV5RYFlydYCg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.145]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU5R-1mbN4a0GcV-00ec1N; Wed, 02
 Feb 2022 21:42:11 +0100
Date: Wed, 2 Feb 2022 21:42:10 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220202214210.0a2483e6@gmx.net>
In-Reply-To: <d6ff992c-a84c-d335-3ddb-2122f7c744dd@mind.be>
References: <20220201232203.333403-1-giulio.benetti@benettiengineering.com>
 <20220201232203.333403-2-giulio.benetti@benettiengineering.com>
 <d6ff992c-a84c-d335-3ddb-2122f7c744dd@mind.be>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:IHVDXvbLvXm8OwryaepA70AqO3oy89amhgdknn4cEyVrop+UoiZ
 6C6/d7XaBZO64V25ncQpkNFmfg9ZlhCCqwwtUSRGZ3xIUzBIzM17WNIXMQOp4y9aZazqhWm
 Nq7402HwdFMWhnzUpD9cTuB4cbQrnHufDOyX7rhWl0f/8xdv+kE0h3en3IdMz222XTDoLO5
 MYFuPf2x6o7juo2K693zg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1mn1zrndpNc=:ooPjIxI/Ibxa0m3DNda0mA
 Bsgwp2k0Fp0I8loPLZC3CJo3B/WGT8bTIoG8Xkj80HwCpgSAqCr5lLgzpdZtxTRZ3+lNptGwd
 avjTiCQTen2qRbjSBj38KeHFvQnA0ldrcZLU+ETkMe9kbJnHs3nqXjmwdpeoXq8OuJcVPdiLO
 dC8C19yNolfQyOkdRWL/whpokPBAwCKCWnBX9aZg03V6xLIVqSXCmyzZoQySXxIzHOzpk/pM8
 jxm+YwIMc36zbmYowWIHLqTS7/4PFKyjBBRoGt+0BFxoA3DwkZR2wdY/SluySzZcrc6ST+kTQ
 zsR62Vo9CIXJGxKpkQR8GpXu+qwo8uoJ9xU0CFDvMFbvjQkRZLFsPt+OYlsRexVjhoTxEZIsC
 vO+55R2fNunjwsa7CHjAv824yAdC2Rtiw6ZsGgRDDOVAfSACDmznDTBO7fjt9NPlHIVQ8j6rh
 jmLacwovKZSZ6ghqDMUdyDQ2pJRXAqcC567aP7j4ulYUHdyxOk7HCLlvjsZnJICdXf3qipUZh
 lhgw6lP2GaWb/lA4N89mrYxHVDqhvwEOowD6v2LIcvC541Nv3IIoK/NXuq7HVxM59Wct4XH9R
 hM2MYJL8/HhfHyQr1wu5tjuF5BzHoINf4ECGU08tmCTqJ9/I+9g7YYc28fyJbJ//NGYbm7dfq
 8dHeMGh4Sz9zljDAZwtZRG6tBGyQm5pLy+yINO6Q/TrFL/u8od0fXCH/X/EkJbdZu3Rok4PUh
 5ODsRUJw0K+E7vTCrCsVs66ljoZwbVXcKBrBnOoBiZywikdcE0bXWC6mVkEQxDYHY7us54gYs
 46/HyLBqNLYlBTjRQ/Q9WIb/hPxUObnfF4iuq5wHJwu9lq6jBj/Dk12JhixLCNd9DmBxbWzKa
 gsJxZZ+n3l9IQKbCnFFZoyE4lEbtwrx86nuItHze7hvG/PCmeOUPGSgUIvmzsmeOATJNBhaYo
 tjSaJXdw/nX21/TKTZJpU+4qK5180OaDhPJWHq4MS90gm75yOPRN/asmfjwPWX3V+J4tToYIR
 dlE7VsTM19oWmtDhFc31S7aIh/z72OtLLCbose0YXlBHTp5k7lLmTIsBDWUY3qgh3EAsVdfLg
 mxdpCb0359yYfU=
Subject: Re: [Buildroot] [URGENT 1/1] package/util-linux: fix host build
 failure
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout, Giulio,

On Wed, 2 Feb 2022 08:41:34 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 02/02/2022 00:22, Giulio Benetti wrote:
> > The UTIL_LINUX_FIX_DISK_UTILS_COMPILE workaround is needed for host
> > building too. So let's add it to HOST_UTIL_LINUX_POST_PATCH_HOOKS.
> > host-util-linux is used a lot, so this patch fixes a lot of future
> > builds.
>
>   Darn, I tested that, both with and without BR2_PACKAGE_HOST_UTIL_LINUX set. I
> don't understand what went wrong in my test...

The raw support depends on the available toolchain headers, see e.g.
package/util-linux/Config.in:

	config BR2_PACKAGE_UTIL_LINUX_RAW
	        bool "raw"
	        depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
	        help
	          Build a linux raw character device

Or according to [1] '--disable-raw' for the host build should do
the trick too...

Regards,
Peter

[1] https://github.com/util-linux/util-linux/issues/1577

>
>   Anyway, applied to master, thanks.
>
>   Regards,
>   Arnout
>
>
> >
> > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > ---
> >   package/util-linux/util-linux.mk | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> > index e59ef7dadc..5a4ff64d01 100644
> > --- a/package/util-linux/util-linux.mk
> > +++ b/package/util-linux/util-linux.mk
> > @@ -41,6 +41,7 @@ define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
> >   	touch $(@D)/disk-utils/raw.8
> >   endef
> >   UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
> > +HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
> >
> >   HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
> >

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
