Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BC3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 29 Apr 2022 07:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8AAD83FFA;
	Fri, 29 Apr 2022 07:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wG-tnQyNJygr; Fri, 29 Apr 2022 07:34:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD2BC83415;
	Fri, 29 Apr 2022 07:34:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE6251BF380
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 07:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA6B260597
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 07:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BUMs0ME9tNBX for <buildroot@lists.busybox.net>;
 Fri, 29 Apr 2022 07:34:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74783600CD
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 07:34:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 104981BF212;
 Fri, 29 Apr 2022 07:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651217640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29wHoW3vBjExaYjDfBfULXW8V3gRYavC5eOWWxolpYE=;
 b=JxMuw1KEYyDyJmQRq85r2uuyb7n5IKLvGBDjg+U7RGy6M0CtSIOuIoRs1ZZ+GHDlZvKbST
 kbHslrErI8U+apa+lB51UD/5Izq6fJuL/KGuXkHomToDd6tZonZiu6ibL0eXBT8RahsWIH
 4HfTlU49VoGyVh/5VVHYEcG8asBr7IvxHOgwwcAPxSYc0iepIvFQAnGQpN6XRBId7IWt0S
 Bh01fbEawmgQL+QJ2/vlsn1o0JZGUetOxbAa9hRn6HXNfJY/sS5PP1ZUXArm/tGq+Fg9M1
 G+7Jej/XElOcu5Pp9+DVt28ZUykJjhXxLfmAD40SQUC0LouNyeTyD60GgMTr5w==
Date: Fri, 29 Apr 2022 09:33:58 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220429093358.55e406a5@windsurf>
In-Reply-To: <CAPi7W80-tGgUc_PibQtzVpRbKNz1+RmXqkALF5x_ZScEgAM=ww@mail.gmail.com>
References: <20220427205057.4044072-1-fontaine.fabrice@gmail.com>
 <20220428234527.3c5bb3b9@windsurf>
 <CAPi7W80-tGgUc_PibQtzVpRbKNz1+RmXqkALF5x_ZScEgAM=ww@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/numactl: needs atomic
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Fri, 29 Apr 2022 09:05:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > However, the key thing is that the build failure
> > http://autobuild.buildroot.org/results/e225cb83dae390d9dc543d4da85c52180efbd40a
> > has thread support disabled, and when threads are disabled, libatomic
> > is not built, and therefore BR2_TOOLCHAIN_HAS_LIBATOMIC is false.
> >
> > However, I don't see anywhere in the numactl build system where
> > -latomic is passed. Does it build on architectures that need to link
> > against libatomic to get atomic intrinsics?  
> 
> Linking with -latomic is done thanks to 0002-link-with-latomic-if-needed.patch.
> This patch was added to fix the build on architectures such as sparcv8.

Ah, I missed that patch, thanks for pointing it out!

> However, I don't understand why the build fails on microblaze without libatomic.
> Are we sure that microblaze really supports atomic without libatomic?

I explained it in my previous e-mail I think :-)

It fails because the configuration you're pointing to has threads
disabled, and when threads are disabled, libatomic is not
built/provided by gcc. This is properly handled by
BR2_TOOLCHAIN_HAS_LIBATOMIC being false in such configurations.

So basically, your patch is correct (IMO), but the commit log isn't:
the problem isn't Microblaze specific, but would happen on any
architecture that needs libatomic to provide atomic intrinsics.

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
