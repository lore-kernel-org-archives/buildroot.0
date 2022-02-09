Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D01C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 19:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8887B401E9;
	Wed,  9 Feb 2022 19:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8YGaoDCQwMZm; Wed,  9 Feb 2022 19:53:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C42E84027E;
	Wed,  9 Feb 2022 19:53:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E0FB1BF422
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B6C982F84
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAYmryFx3ahp for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 19:53:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3797381C58
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 19:53:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3CA091BF205;
 Wed,  9 Feb 2022 19:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644436380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jwh2WsN1lt0T5UDyob52nDkeh/PVPbSAXMWnqGh6Hy4=;
 b=Tmy9YxwhGulphEKWIWzrDOs1rIX0VHRwR83/QUs6mCsOud1Rk1W6Q0SEyujjrVTY+XUwya
 pJwRBZV/7uqli6dthDoApnT6I71TKXiBue+QQjf4bYnb3qprrP0z7wAjykSUfNTljynN55
 mC6BV87YHe9DTbzHBXfnaogUlZt+OQ9/A6UJOmfXIe6aYTSNiOC4igr51zlljxy8JBRVM3
 sE7ycuARuWDmFxW+uxrGOgRM2RjnZK52rB9vO4g3OPyfkROHG0tar0T1LcIBxAqsFre/1J
 vPmtEAsWx4GEN4WkQLFEv8FkiLfr9FJ7nzf5ZuJnNxlpKvKmGJZls9BeTor0mg==
Date: Wed, 9 Feb 2022 20:52:59 +0100
To: <yann.morin@orange.com>
Message-ID: <20220209205259.725e17c2@windsurf>
In-Reply-To: <9354_1644422930_6203E712_9354_383_11_2d5b77c2a90cf722e007a5bf3ed4227d2bd1fda6.1644422916.git.yann.morin@orange.com>
References: <cover.1644422916.git.yann.morin@orange.com>
 <9354_1644422930_6203E712_9354_383_11_2d5b77c2a90cf722e007a5bf3ed4227d2bd1fda6.1644422916.git.yann.morin@orange.com>
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 9 Feb 2022 17:08:43 +0100
<yann.morin@orange.com> wrote:

>  $(2)_DOWNLOAD_POST_PROCESS = cargo
> -$(2)_DL_ENV = CARGO_HOME=$$(HOST_DIR)/share/cargo
> +$(2)_DL_ENV += CARGO_HOME=$$(HOST_DIR)/share/cargo

But, but, then, how is:

PYTHON_CRYPTOGRAPHY_DL_ENV = \
        BR_CARGO_MANIFEST_PATH=src/rust/Cargo.toml

currently working?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
