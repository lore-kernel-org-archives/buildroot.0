Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EEDC25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45C5F40520;
	Tue, 16 Aug 2022 20:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45C5F40520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTojmCXLj0hB; Tue, 16 Aug 2022 20:42:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6903A404C8;
	Tue, 16 Aug 2022 20:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6903A404C8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A4A71BF2A2
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2EFD404C8
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2EFD404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y70MAQWzyxFE for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:42:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CEAB4010D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CEAB4010D
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 20:42:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A7E5B240003;
 Tue, 16 Aug 2022 20:42:43 +0000 (UTC)
Date: Tue, 16 Aug 2022 22:42:42 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220816224242.42a23d25@windsurf>
In-Reply-To: <20220816162626.GQ2775145@scaer>
References: <20220815214815.2234201-1-thomas.petazzoni@bootlin.com>
 <20220815214815.2234201-2-thomas.petazzoni@bootlin.com>
 <20220816162626.GQ2775145@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660682564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eh5AS4Rq+AwrK/ZDO54WM3v0ZIF8cTqrhZXwgwjMoOc=;
 b=jCC85JhS8c8yTC5dVhHH6cQyvwWE0VLdvqYNFJ5wFuG+HDc4g5OKrUQWNtfNZ7+POtoSyd
 TLo5/WisPYU//VNjwq4FeswxkGyZRPAuXZVJgrQPD4u+AA51cC65nePpALh9xD3Nszeq3T
 ISnd3ZcyvB6C2YY9Rd3v7G0j2UgLjGUx01qE1p2oyUyKClYWygT8M0wFJOoPJkv1gAPp1w
 LRVfcsgtdtsjIWkN2uwSR7D/MspwNigvdbNN2T+ba7IdKlkYCQdXXHnsC/YO6SdCC53/ye
 ezJqsHb9yO0NReuLaOVxsmlXpLb7JtqIcWIzax9SMy/GMS1CVVqnkZ1T3I90ZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jCC85JhS
Subject: Re: [Buildroot] [PATCH 1/3]
 support/testing/tests/package/test_python_boto3: use ext2 instead of cpio
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 16 Aug 2022 18:26:26 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> >  class TestPythonPy3Boto3(TestPythonPackageBase):
> > @@ -7,6 +8,17 @@ class TestPythonPy3Boto3(TestPythonPackageBase):
> >          """
> >          BR2_PACKAGE_PYTHON3=y
> >          BR2_PACKAGE_PYTHON_BOTO3=y
> > +        BR2_TARGET_ROOTFS_EXT2=y
> > +        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> > +        # BR2_TARGET_ROOTFS_TAR is not set  
> 
> BR2_TARGET_ROOTFS_TAR is already unset in TestPythonPackageBase.config,
> so disabling it here is superfluous.

Ah indeed.

> But this will however still build the cpio archive, because it is
> enabled in TestPythonPackageBase.config.
> 
> We can disable it with:
> 
>     class TestPythonPy3Boto3(TestPythonPackageBase):
>         config = TestPythonPackageBase.config.replace('BR2_TARGET_ROOTFS_CPIO=y\n', '') + \
>             """
>             blablabla
>             """
> 
> If you believe that it is acceptable, I can fix when applying. Or we can
> continue to uselessly build the cpio archive, which does not take very
> long to assemble...

I think we can continue to uselessly build the cpio archive. As I said,
my long term proposal would rather be to switch all tests to use ext2 +
a hard drive. We still need to define an image size, but at least we
can a hard and clear error if the filesystem no longer fits rather than
these weird errors caused by initramfs being partially uncompressed.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
