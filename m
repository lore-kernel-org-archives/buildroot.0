Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EEFC19F4F
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 15:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A485C60BEE;
	Wed,  8 May 2024 15:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGqll_vfkC7K; Wed,  8 May 2024 15:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B26F760BF4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B26F760BF4;
	Wed,  8 May 2024 15:26:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD92C1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 15:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98B5881EFD
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 15:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUxlpqHGQ19Z for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 15:26:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 724E281FFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 724E281FFD
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 724E281FFD
 for <buildroot@busybox.net>; Wed,  8 May 2024 15:26:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.127]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYvcA-1s9DC33JY0-00Uug4; Wed, 08
 May 2024 17:21:11 +0200
Date: Wed, 8 May 2024 17:21:11 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240508172111.1fadde15@gmx.net>
In-Reply-To: <Zjk7W9fZXDBusRc2@landeda>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506210440.323ccb15@windsurf> <Zjk7W9fZXDBusRc2@landeda>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:tRTrU/nBejp75MsGBGLr2YWGbAQJX++tv9jfq7SU1Y7WxC9T69W
 UwncaaCQaGdCH6cUntJmwCX97kGc9/dLkt+DlfL3QkfPqQioA07J5VIu8rqzOMldRCPTxa3
 dJOKcwubsYR+jTYl6IcdWN+8aLnQFzJaw38ZpE1Jh1XA9+IBSaig4/xHwsYty3cccE0NjaB
 GIz9lg4oEF+jyuvX1mbvw==
UI-OutboundReport: notjunk:1;M01:P0:adejPTwK5+I=;MquL8U3sSeRHRP11KobHNsEyXhS
 UWrLu2yhDavFQTMTbiOCN5jg3//hDqG6xhz6xhG1uuGuHShfZ0hBaEpQP1fo9DOVdGI2D15CW
 bK4AVPc6rrr5Lef/7TYW0kpwMMERvgskj/0Jf7QxLUJqqRQePxLTzb7Pz4qIMegDFwJaYq8fF
 rmd3kPbVvYAYNoLFB6trmPEuE7q1JGGLpNMFwAzry+PmKT4iZqAiwTev9rijaAaPY9eFJX+Pr
 8+ctQoGZcpXqyXgCZX4UATDS9zahAhHdt7iwj8NnFvww1L1HGqH90kgU9Iows0os3DrsUcoxB
 rQfJJdkuo3atRa7/RfPq0XmpkM8SK1QD7cUc+m0zExdw6ld4lRHyQJUdpUBnAGD/HjIB6N4RV
 I81x+0kY9QCrWkfJ66K/mNK/z36kJ/d9MBJOlXbaWm1sTPOEWUtoF3YJFMhPBibeNi9+gCaVZ
 d6akmFy20+cvyJ7DudU4eWA4lty4ejzw+fLBT0PJwB8osLzBxvuloLFvGtueInrC3zimLg7D8
 5jvwbKIEVNesOWb9UPCmW3zKXDLzck+D0r83O+eT7ZeaBnbB9sZOJ5T594D8Y9Eruj0NxQWwJ
 AzCN405ZzCKA1iyOK11EvUqw2EwwSIqlSWWjEo9dl1tlznF0vHkRp0KStiSbvlC3h5mYzph3m
 N7U6SZIV9SVqzSF+fFcSceS8zDD6rk5v0YfNrXRlaLqg/Kt6cSnHebm8h7eAIEef2aIyYUiUp
 R5xg0l0u/YYEHY7YW2OuQaBNNMygzbsQRfiaLAhL/QecEmuEXRJVw74NTOv07wd+bsB9ecdJ1
 jni2eg29tghom6fZtlgm2XMMIMGJ2mxDxGpj3u48/HOJw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715181672; x=1715786472; i=ps.report@gmx.net;
 bh=PcnoFbYA2XbHp9hrIP/SLEMh9XQdMwkJ4Oit7KZ6wzI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=WodixWXZcq9TYAxCUmkJD1/BHEslGJzbuOtmNcO33t/m8M5n76QqR9UZQZJm9KBw
 C7Ny8/zGdZ83f04pKoYKjxxZicnSToz9B1QqZEOkRznCphxdsfe62j0lK4GrugvXq
 FZhOVCK3PxP1xr9t2906/D7fO8Dn70wCwCOPuCbx2jOL3NThjdD3IVFJtQygr/S0p
 aoCfXQwV5j6WhX+zbWjEgzXdMSVkfK9CeD8heENUdTqxVwOJ6MCoKgPVl70ylMjsZ
 /EGTjEVSB5WS7AGKmCbM3rIjePtcpnpdsvoPvO1EHc5A3aRLcPSo2ImzXozecL6Ih
 LJ/XDjLVP9UlBdz/BQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=WodixWXZ
Subject: Re: [Buildroot] [PATCH v1 0/8] support/kconfig: bump to
 linux-v6.9-rc5 version
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
Cc: buildroot@busybox.net, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann, Thomas,

On Mon, 6 May 2024 22:19:39 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Thomas, Peter, All,
>
> On 2024-05-06 21:04 +0200, Thomas Petazzoni via buildroot spake thusly:
> > On Mon,  6 May 2024 16:45:43 +0200
> > Peter Seiderer via buildroot <buildroot@buildroot.org> wrote:
> [--SNIP--]
> > > The kconfig version dump itself:
> > >   - support/kconfig: bump to linux-v6.9-rc5 version
> > So this commit without the next two leads to a broken situation,
> > correct? (Note: this is not a complaint, I agree with them being split).
>
> Except they should be reversed: the new commits can work with the
> kconfig we currently have, so it looks like it should be OK to do the
> required changes before doing the kconfig bump.

A solution for the two remaining patches working with the old/new kconfig would
be nice..., will test if it works for the escape problem...

Regards,
Peter

>
> > > And two 'real' changes due to kconfig language changes:
> > >   - support/kconfig: reference environment variables directly (remove 'option env=')
> > >   - package/openssl: move libopenssl/libressl source statemetns outside of the choice
> > But don't we have this situation of source statements inside a
> > choice..endchoice in other places?
>
> Toolchains, skeletons, init systems, jpeg library, linux extensions, and
> indeed openssl.
>
> > I remember Yann saying that this was
> > a problematic change for us in the upstream kconfig code.
>
> Yes, so given that there are two problematic changes:
>   - source statements in choices,
>   - environment variable direct expansion,
> I wonder if it makes sense for us to update our kconfig infra...
>
> Regards,
> Yann E. MORIN.
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
