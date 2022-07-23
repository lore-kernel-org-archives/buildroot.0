Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2D7C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 663B24177C;
	Sat, 23 Jul 2022 16:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 663B24177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ig1ism_RpXq; Sat, 23 Jul 2022 16:41:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9F5A4173E;
	Sat, 23 Jul 2022 16:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9F5A4173E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 604D21BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EFF4416F1
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EFF4416F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgbOuk19ZKxk for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:41:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0003D4173E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0003D4173E
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:41:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5A4B360002;
 Sat, 23 Jul 2022 16:41:05 +0000 (UTC)
Date: Sat, 23 Jul 2022 18:41:04 +0200
To: Christian Stewart <christian@paral.in>
Message-ID: <20220723184104.0032a7dc@windsurf>
In-Reply-To: <20220625224224.1446787-1-christian@paral.in>
References: <20220625224224.1446787-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658594466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CfriCKE5rtBWcGsUqvv2l4hbQj2oe/cR3qY/e8ZRrug=;
 b=Mm274GiXJEr4Em2t17bFZkWDPcPYQXvDaD5mm4C+cHlzyePTtA+F4ET+qmxLG+n/mo0UEm
 ILEWitPhGuQjwN+6U6Mu+6wpswINykCmvYNveykmCQ32EuwF6UutzPLCl8QaRYV9Efl4xe
 7Kteo3Q8u0VOi7aXmCR2bcGqVEDXMN0KZ5REZuyAXE+jycVwsBbiPrk9Y8sH45c2utFd2k
 Qj6SSea9wZ6xi4e3opjIKJC7w1pGPGyCQkUKYpW8zgdKaZPNDRr0F7Mqz7LhFamyEsAneD
 G6pQSPkdULl6c15J3XLhoZUeaaiq9TEXn8s13HZly3FFauK44YVQFC3mSSqCmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mm274GiX
Subject: Re: [Buildroot] [PATCH 1/1] package/gocryptfs: fix build against
 riscv
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
Cc: Anisse Astier <anisse@astier.eu>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Sat, 25 Jun 2022 15:42:24 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Replace dependency jacobsa/crypto with a fork with support for riscv64.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/caa60874781c4077273884eb37281cc9e02ef9ac/
> - https://github.com/rfjakob/gocryptfs/issues/666
> 
> Upstream PR: https://github.com/jacobsa/crypto/issues/13
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  ...-fix-jacobsa-crypto-build-on-riscv64.patch | 152 ++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch
> 
> diff --git a/package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch b/package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch
> new file mode 100644
> index 0000000000..90e3cc262d
> --- /dev/null
> +++ b/package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch
> @@ -0,0 +1,152 @@
> +From e9b64ab75e8539a52d60ecb299fc5425f0d27dc7 Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Sat, 25 Jun 2022 14:57:38 -0700
> +Subject: [PATCH] go.mod: fix jacobsa/crypto build on riscv64
> +
> +Replace dependency jacobsa/crypto with a fork with support for riscv64.
> +
> +Issue: https://github.com/rfjakob/gocryptfs/issues/666
> +
> +Upstream PR: https://github.com/jacobsa/crypto/issues/13
> +
> +Signed-off-by: Christian Stewart <christian@paral.in>
> +---
> + go.mod                                        |  9 ++---
> + go.sum                                        |  4 +-

You're patching go.mod/go.sum, and this patching happens after we have
done the vendoring of the dependencies in the download step (an issue
you have reported already), so how can this patch work? I am missing
something here?


> ++// Fixes build against risc-v
> ++// See: https://github.com/jacobsa/crypto/issues/13
> ++replace github.com/jacobsa/crypto => github.com/aperturerobotics/jacobsa-crypto v0.0.0-20220403053904-77863254e607 // xorblock-generic-1

This I understand of course.

> ++
> + require (
> + 	github.com/hanwen/go-fuse/v2 v2.1.1-0.20210825171523-3ab5d95a30ae
> + 	github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115
> +-	github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd // indirect
> +-	github.com/jacobsa/oglemock v0.0.0-20150831005832-e94d794d06ff // indirect
> +-	github.com/jacobsa/ogletest v0.0.0-20170503003838-80d50a735a11 // indirect
> +-	github.com/jacobsa/reqtrace v0.0.0-20150505043853-245c9e0234cb // indirect

But this?

> + 	github.com/pkg/xattr v0.4.3
> + 	github.com/rfjakob/eme v1.1.2
> + 	github.com/sabhiram/go-gitignore v0.0.0-20201211210132-54b8a0bf510f
> + 	github.com/spf13/pflag v1.0.5
> + 	golang.org/x/crypto v0.0.0-20210817164053-32db794688a5
> +-	golang.org/x/net v0.0.0-20210813160813-60bc85c4be6d // indirect

And this? Why switching to a fork of the crypto library has impact on
other dependencies?


> +diff --git a/vendor/modules.txt b/vendor/modules.txt
> +index 662f0c3..9b47daa 100644
> +--- a/vendor/modules.txt
> ++++ b/vendor/modules.txt
> +@@ -5,19 +5,11 @@ github.com/hanwen/go-fuse/v2/fuse
> + github.com/hanwen/go-fuse/v2/internal
> + github.com/hanwen/go-fuse/v2/internal/utimens
> + github.com/hanwen/go-fuse/v2/splice
> +-# github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115
> ++# github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115 => github.com/aperturerobotics/jacobsa-crypto v0.0.0-20220403053904-77863254e607
> + ## explicit
> + github.com/jacobsa/crypto/cmac
> + github.com/jacobsa/crypto/common
> + github.com/jacobsa/crypto/siv
> +-# github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd
> +-## explicit
> +-# github.com/jacobsa/oglemock v0.0.0-20150831005832-e94d794d06ff
> +-## explicit
> +-# github.com/jacobsa/ogletest v0.0.0-20170503003838-80d50a735a11
> +-## explicit
> +-# github.com/jacobsa/reqtrace v0.0.0-20150505043853-245c9e0234cb
> +-## explicit

Same question here of course.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
