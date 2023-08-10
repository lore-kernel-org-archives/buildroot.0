Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A137C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 20:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3AC141811;
	Thu, 10 Aug 2023 20:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3AC141811
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80ITPGQ4QUcQ; Thu, 10 Aug 2023 20:13:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E3EE40940;
	Thu, 10 Aug 2023 20:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E3EE40940
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D5AD1BF5DF
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D907840940
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D907840940
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id paLoqqSwdHv0 for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 20:13:28 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74B8D4093E
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 20:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74B8D4093E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A1841BF204;
 Thu, 10 Aug 2023 20:13:25 +0000 (UTC)
Date: Thu, 10 Aug 2023 22:13:23 +0200
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>, James Hilliard
 <james.hilliard1@gmail.com>, Adam Duskett <aduskett@gmail.com>
Message-ID: <20230810221323.52f6f896@windsurf>
In-Reply-To: <20220203192858.6E46582628@busybox.osuosl.org>
References: <20220203192858.6E46582628@busybox.osuosl.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691698405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88hlg6Z6NI0v4jm9I3UGihQi6sVovtTGkgFhXAjw/0Q=;
 b=QtsDXnhpZzLS5d50QoX2t2hj5pVoBwOEgtERBq3kMp9JnBxqepWetH95FzkzWcDbqXd3eC
 oBF3Kj1PzH3i2J3rGNUAmlw1EMD3x2nAT0uXvj54tSZYVuHnj8ev8GWHi2sveoi7ctvQXT
 wxZnXoJxL6uQSPeZK7q6axn/dr7QdhKVIPYUXuNdJmgH4YoAQSjkcQrOQbk8MTfSOyShre
 iax7vGqwk7/3PKVTpRSDR9yyfCU51aNzpCLfZ/nU2wvr3Cw1Ku7iiA6MA1iXITURj7biV4
 WhY/Cc7tevL1yrxj1mkNyy123oyDdCTxyjQBqhbSF1mz559JIENEwk6dMegRLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QtsDXnhp
Subject: Re: [Buildroot] [git commit] package/qt5: bump packages to latest
 kde submodule versions
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James, Arnout, Adam,

Since all three of you have been involved in this patch, I have a
question below.

On Thu, 3 Feb 2022 20:27:27 +0100
Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=5770a645a3a49a3f0f02972131a4ff5283b4c11e
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> This points all qt5 packages to the latest kde submodule versions
> available at https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
> 
> There is no 5.15.8 release of the kde-maintained modules, no release
> tarballs and no tags. Instead, there's just a rolling maintenance
> branch. We take a snapshot of that branch and call it 5.15.8, to match
> the latest qt5webengine release.
> 
> We need to remove some patches applied upstream already.
> 
> qt5location has mapboxgl as a submodule, which is not included in the
> gitlab-generated tarball. Therefore, use the git download method with
> submodules enabled.
> 
> We need to pin qt5 packages not available in the new upstream to the
> previous 5.15.2 version.
> 
> We need to set SYNC_QT_HEADERS for all qt5 packages in the new
> upstream as headers are only copied in release archives which are
> not provided in the kde upstream.
> 
> Instead of calling syncqt.pl, update the MODULE_VERSION in .qmake.conf
> to 5.15.8 and create a .git file so to trigger headers sync during
> configure.

So we're no longer calling this Perl script in QT_HEADERS_SYNC_HOOK:

>  define QT_HEADERS_SYNC_HOOK
> -	$(Q)cd $($(PKG)_BUILDDIR) && $(HOST_DIR)/bin/syncqt.pl -version $(QT5_VERSION)
> +	sed -e '/^MODULE_VERSION/s/5\.15\.[3456789]/$(QT5_VERSION)/' -i \
> +		$($(PKG)_BUILDDIR)/.qmake.conf
> +	touch $($(PKG)_BUILDDIR)/.git
>  endef

Therefore, can we drop the dependency on host-perl in:

ifeq ($$($(2)_SYNC_QT_HEADERS),YES)
$(2)_DEPENDENCIES               += host-perl
$(2)_PRE_CONFIGURE_HOOKS        += QT_HEADERS_SYNC_HOOK
endif

which is just a few lines later in this package/pkg-qmake.mk file?

I noticed today that host-perl was a dependency of qt5base, and I was
like "meh, why is it a dependency", and it seems like this dependency
is no longer needed.

Could you confirm?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
