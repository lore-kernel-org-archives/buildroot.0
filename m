Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A0EC6FA83
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 10:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B069260E17;
	Mon, 26 Sep 2022 10:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B069260E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gaq9fDrr1E6k; Mon, 26 Sep 2022 10:01:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF85E607CE;
	Mon, 26 Sep 2022 10:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF85E607CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F0381BF28B
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 10:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A4DF607CE
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 10:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A4DF607CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72g0zju9hqIV for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 10:01:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7847A6068A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7847A6068A
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 10:01:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D6CEBE000A;
 Mon, 26 Sep 2022 10:01:08 +0000 (UTC)
Date: Mon, 26 Sep 2022 12:01:07 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Message-ID: <20220926120059.1c0c677b@windsurf>
In-Reply-To: <3124822.5fSG56mABF@harderbit>
References: <20220913174039.182887-1-thomas.claveirole@green-communications.fr>
 <20220925214700.5e222e95@windsurf>
 <20220925215340.43f64019@windsurf> <3124822.5fSG56mABF@harderbit>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664186469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fFiSqCru2hZzaZ0o50MJ7cxxAlgqGygE5P+uHbY21Yw=;
 b=fLYmKpk2g4cUNlHb6EY/M7qGbxCKqH47+r2KcDxrR8GKiApfkhz2ri0Pxh39IQqSq2OiaM
 qVbYV+613eX7KPrEZ337W9TAPZlKQfSkJUSwAUUCF5wKCoCLGZ3/BvUC+IOOckiS5S4Bxr
 NhyU02xTnXgpq82msdBE3Gv/hNTwn3FQKYQcwygvz6YJT1xW1uM26xwiDUkKpIXJxhmgRc
 sbtjP+kgdI+if9bRVq6jdHAbm55E5LKsdchk0qfmbogoYdT6VZvqkw3Qa1OySgODOwcg+N
 UUNwIU/2jPOWt2LxlhTr0oS2ujzaYyWe+J1y2DTMftc4wR34vnJy3qSt2cZxDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fLYmKpk2
Subject: Re: [Buildroot] [PATCH 1/2] package/nodejs: introduce
 BR2_PACKAGE_HOST_NODEJS_COREPACK
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Mon, 26 Sep 2022 11:04:38 +0200
Thomas Claveirole <thomas.claveirole@green-communications.fr> wrote:

> > Replying to myself: "corepack enable" does not download stuff. [...]  
> 
> It sounds good indeed.  To be honest, all this Node packaging gets a bit over 
> my head and I am not sure how it works exactly (the whole JavaScript packaging 
> ecosystem just looks crazy to me).

You're not the only one with the same feeling :-)

> I thought that using host-nodejs to compile JavaScript packages was a new 
> Buildroot policy, but apparently according to [1] and [2] we prefer to stick 
> to precompiled JavaScript files?  If so, I will send a v2 patch for the vuejs 
> package (... when I find some time.)
> 
> [1] https://lore.kernel.org/buildroot/20220919114617.67d80b53@windsurf/
> [2] https://lore.kernel.org/buildroot/20220924170516.4a0323dc@windsurf/
> 
> (As for my opinion, should it have any relevance: I also prefer that Buildroot 
> relies on pre-compiled files, at least as long as it cannot do some vendoring 
> for Node packages.  Downloading stuff outside of Buildroot's download system 
> is quite annoying.)

So, as explained in
https://lore.kernel.org/buildroot/20220919114617.67d80b53@windsurf/
(which you pointed above), if we want to build from source these JS
stuff, we need two things:

 - Be able to use a pre-built NodeJS on the host, because adding a
   dependency on building host-nodejs from source is really too heavy
   to build just a few JS files. I have submitted yesterday a RFC patch
   series that implements this.

 - Be able to vendor JS dependencies. I already started working on it,
   and it does work with npm, but my test package (forge) only
   provides a package.json to describe dependencies, so they are not
   locked and therefore not reproducible. However, it looks like many
   other packages, including vuejs, provide a pnpm-lock.yaml, which
   apparently allow a reproducible fetching of dependencies. Which is
   why I got into what pnpm is, and how to install it, and got to your
   corepack-related patch :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
