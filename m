Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D350C0015E
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 20:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15D1E60E4D;
	Wed,  9 Aug 2023 20:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15D1E60E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nHsK0jsEhNX0; Wed,  9 Aug 2023 20:56:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 425F060757;
	Wed,  9 Aug 2023 20:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 425F060757
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A85241BF3EB
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76B9A408FD
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76B9A408FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uF5A1e90GStP for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 20:55:55 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42EDD408F7
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 20:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42EDD408F7
Received: by mail.gandi.net (Postfix) with ESMTPSA id B19511C0004;
 Wed,  9 Aug 2023 20:55:51 +0000 (UTC)
Date: Wed, 9 Aug 2023 22:55:50 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230809225550.56b0d16f@windsurf>
In-Reply-To: <20230809202204.GD421096@scaer>
References: <20230808003527.1469175-1-adam.duskett@amarulasolutions.com>
 <20230808003527.1469175-4-adam.duskett@amarulasolutions.com>
 <20230808195621.1c5d4242@windsurf> <20230809202204.GD421096@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691614552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UUEx6W3o0+Uwi+Mleo9QAjZo2OZuhim5PIf16h3A7TM=;
 b=bWNU36CPs0SiudTxziDUW29oDb/r8I2nPQxqNOIH3jgVks3RCDoYnN3Bok6JG+m0rQ7t6S
 wRotXb4+hj3DkRarWZ46v3rcJr5YbSIoFQ/9Y4tMzEa+QFMVIZOncDo4/2boLY7tA7deCF
 RWkSlcmW6aXjN+0l0I/vHqSKjh8HDK38J5JlM+zS9y1oR65ZBp9EE9J/Spu+VZ5VIAjX/8
 y2jSehWccVqj5JkTMK8yA9d5P0AfNuc5ydq3sYnrBfDjdy7UzDH+diPcpvRbU908akAUZm
 17qaYn5xs1frtx1WvSokWNNSWWY0iQpjB18rPs+BbguQvoKsVMvk2kxw6/lTGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bWNU36CP
Subject: Re: [Buildroot] [PATCH/next vRFCv2 3/3] package/flutter-engine: new
 package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>, buildroot@buildroot.org,
 Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 9 Aug 2023 22:22:04 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Well, we do not redownload an archive if it is already downloaded. This
> is what this test does: skip the download if the archive is already
> present lcally.
> 
> We have the same test package/pkg-gemneric.mk line 190:
> 
>     if test ! -e $($(PKG)_DL_DIR)/`basename $$p` ; then
> 
> and in the download wrapper, line 67-onward:
> 
>    67     # If the output file already exists and:
>    68     # - there's no .hash file: do not download it again and exit promptly
>    69     # - matches all its hashes: do not download it again and exit promptly
>    70     # - fails at least one of its hashes: force a re-download
>    71     # - there's no hash (but a .hash file): consider it a hard error
>    72     if [ -e "${output}" ]; then
>    73         if support/download/check-hash ${quiet} "${hfile}" "${output}" "${output##*/}"; then
>    74             exit 0
> 
> So this test does exactly the same thing.

Indeed, makes sense!

> Yes, this is a very good work overall, for such a complex stack.
> 
> We've been discussing this series on IRC, too, and it looks like there
> are missing pieces. Adam will correct me where I'm wrong, but here's
> what I understood from our discussion:
> 
>  1. flutter-engine is a set of libraries that implement the runtime,
>     this is what this package will provide, and flutter apps will have
>     to select it and have it in their _DEPENDENCIES;
> 
>  2. there is a package, flutter-sdk-bin, that provides a compiler to
>     compiler flutter apps into Dart code; we'll need to have it packaged
>     as host-flutter-sdk-bin; flutter apps will need to have that in
>     their _DEPENDENCIES;
> 
>  3. there is another package (which one?) that provide 'flutter', an
>     executable that is in charge of starting flutter apps on the target.
>     It looks like flutter-pi is such a package, but there might be
>     others.

I think this part (3) is called an "embedder" in the Flutter
terminology. flutter-pi is one. Another one is
https://github.com/sony/flutter-elinux. See
https://medium.com/snapp-x/flutter-on-embedded-devices-7070b5907b91. 

> So, if I understood everything (far from granted!), the sequence is
> about to look like this:
> 
>     flutter app source code
>         |
>         v
>     flutter-sdk-bin to compile
>         |
>         v
>     Dart code
>         |
>         v
>     Target in /usr/share/flutter/app-name
> 
>     flutter-pi or other
>         |
>         v
>     Target in /usr/bin/flutter
> 
> Then at runtime on the target:
> 
>     $ /usr/bin/flutter app-name

Thanks for this summary, makes sense to me.

Do we want for the whole thing to be submitted to merge anything, or do
we want to go ahead and merge flutter-engine first? I'm fine with
merging things piece by piece.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
