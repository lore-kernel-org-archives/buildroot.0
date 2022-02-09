Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87968C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CE5A40567;
	Wed,  9 Feb 2022 21:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4We-EDxgNRm; Wed,  9 Feb 2022 21:56:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F7A84056E;
	Wed,  9 Feb 2022 21:56:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1B711BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF05A4013B
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jNY65qrl8wgg for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:48:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A97A94063F
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:48:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A3AB71C0007;
 Wed,  9 Feb 2022 21:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644443281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WuMafsPE2TmodJsihyqtbWHTS79XY8jKOhOch0FPd6Q=;
 b=KUO05bbi90bwFLAfE7zOZHAIX+K0LXcxYJ69cVIEoHYNtt3gKY+HxQXUxQfgmT8tgyu58Z
 IyeEIWl9r+q/nslPvF09I5H3+k7pd8ajXDx1kIc7KQiGuNapaslQXPaMKuYg8EshFARH5a
 FdyztCNbIVGsG0dFifdELq6IUt9aeLgbjowIBOBdVPUtSSRxY3iZ0bDkq/fm6GRIxsEUSf
 MY0VOX1LEczbtDcDOeUwVZ0us/BBh79jhGg4b/qoQcZOL8IMvw8JDq8f49Ax4DupdBLGra
 +0nVQ9F3TYkT4CLhFeNE/K/ez//58MGtA5cItgdf5jUZngIjKTaJ0kEb6xJclw==
Date: Wed, 9 Feb 2022 22:48:00 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220209224800.7717a488@windsurf>
In-Reply-To: <20220209205527.GD2249818@scaer>
References: <cover.1644422916.git.yann.morin@orange.com>
 <9354_1644422930_6203E712_9354_383_11_2d5b77c2a90cf722e007a5bf3ed4227d2bd1fda6.1644422916.git.yann.morin@orange.com>
 <20220209205259.725e17c2@windsurf> <20220209205527.GD2249818@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5 v2] package/pkg-cargo: allow packages to
 define download environment
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
Cc: yann.morin@orange.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 9 Feb 2022 21:55:27 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > But, but, then, how is:
> > 
> > PYTHON_CRYPTOGRAPHY_DL_ENV = \
> >         BR_CARGO_MANIFEST_PATH=src/rust/Cargo.toml
> > 
> > currently working?  
> 
> Because, its the name implies, it is a python-package, not a
> cargo-package.
> 
> Yeah, I got puzzled too. ;-)

Aah, yes. Indeed. A python-package that builds Rust stuff. I wonder how
it's possible for me to forget this, after having spent so many hours
on this particular package! :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
