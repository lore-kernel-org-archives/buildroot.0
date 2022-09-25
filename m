Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFA4C6FA82
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 08:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CF7C41781;
	Sun, 25 Sep 2022 08:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CF7C41781
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aPa9U9yqARU5; Sun, 25 Sep 2022 08:27:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 491504177A;
	Sun, 25 Sep 2022 08:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 491504177A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 584371BF4DD
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16C4F60A80
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16C4F60A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sDBWS1YmWAei for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 08:27:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 668D260773
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 668D260773
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 08:27:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5FB3424000B;
 Sun, 25 Sep 2022 08:27:15 +0000 (UTC)
Date: Sun, 25 Sep 2022 10:27:14 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Alexandru Ardelean <ardeleanalex@gmail.com>
Message-ID: <20220925102714.163869b8@windsurf>
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664094435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JBhW0wgAO0r5tl8G2rgWDzRuePJnTgDZ23PXNyn+m6A=;
 b=X20RaoW3tfdqHUYR/DqIMb8QBBy6Qd9K0vfN7rUZZbKJTvk7L4R9IiBtAPstsOy1Jmjzz7
 KwOuBrD1nrHye3lmIUmaR/ZoTBey/4cvg41bzwHsoGv6AuhpAmKE2vp1NQhpLMj9uEx+uo
 km0oJeUJpfAZQGrZ67r6oBeaEbvVStZSYs74kZABJmRCYGPIYBBbLQhlQywlYhbIxb/UNT
 Ki2OgpLrJJEfII1ZSew1tRP0vmsDNLLca/Pl/184nG69wEt4anOF8DwppEtoyD2vpUWD7v
 VMRObQKu4x3CW83EdXG/KaXOJmX9ewJdzaoaMjSToo19dvPeewaeszl7f5htow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X20RaoW3
Subject: Re: [Buildroot] [PATCH 00/13] package/nodejs: rework cross-building
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
Cc: fontaine.fabrice@gmail.com, aduskett@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexandru,

On Tue,  9 Aug 2022 10:56:51 +0300
Alexandru Ardelean <ardeleanalex@gmail.com> wrote:

> Alexandru Ardelean (13):
>   package/libuv: add host-build
>   package/nghttp2: add host-build
>   nodejs: remove v8-qemu-wrapper stuff
>   nodejs: fix 'Duplicate v8 target errors when cross-compiling' error
>   package/nodejs: add host-{c-ares,libuv,nghttp2} to deps
>   package/nodejs: provide {CC,CXX,CFLAGS,CXXFLAGS,LDFLAGS}_host env vars
>     to target-build
>   package/nodejs: don't install nodejs host-tools
>   package/nodejs: rename LDFLAGS.host -> LDFLAGS opt
>   package/nodejs: impose dep on ia32 libs/compiler if target arch not 64
>     bits
>   package/nodejs: add host-zlib depedency to target package
>   package/nodejs: fix ARM build with VFP3 instruction
>   package/nodejs: add a hack to cross-compile 32-bit targets on x64
>     hosts
>   package/nodejs: build host-nodejs only if we're installing modules
>     with NPM

So I finally took some time to look into this, and managed to get
NodeJS to build, but keeping the Qemu logic. Here is what I have pushed
to the Buildroot Git repo:

  https://gitlab.com/buildroot.org/buildroot/-/commit/f85e2cfc6e587d50b86f49b28469eae58a2ea2c7

  Just renumbering an existing patch

  https://gitlab.com/buildroot.org/buildroot/-/commit/5708c5b04f09f49a99c2c9d7a1894d24bce6a3e7

  Your patch to fix the duplicate v8 target error, just slightly
  improved by me.

  https://gitlab.com/buildroot.org/buildroot/-/commit/cf0ddc89705af989393b1601bbf57d567a9a1b13

  A patch from me which is fixing the issue with the Qemu approach.
  Basically, since the bump from 14.x to 16.x, one call to a tool that
  should be run under Qemu was not done through the wrapper, causing
  the build failure. With this fixed, NodeJS builds just fine with the
  current approach.

  Even though I dislike having to build Qemu, it is what OpenEmbedded
  is also doing to build NodeJS, and we don't have much choice as we
  need those tools to have the same bitness as the target.

  https://gitlab.com/buildroot.org/buildroot/-/commit/ec5589611ad79664bc5bf238cc786a65458f3c93

  Your patch to not install the extra tools of host-nodejs, as they are
  no longer needed: we use the target tools, and run them under Qemu.

  https://gitlab.com/buildroot.org/buildroot/-/commit/1facb09b94bf806b301868539185c0ff9ddffee2

  Your patch to no longer build host-nodejs as a dependency of nodejs,
  unless some extra NPM modules need to be installed, in which case npm
  is needed.

So here, NodeJS now builds/runs fine. Could you check on your side if
that also solves your problems?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
