Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC544C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 679D66FB1F;
	Sun, 18 Sep 2022 10:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 679D66FB1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w3vvQU2zx3FS; Sun, 18 Sep 2022 10:03:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BA0C60E25;
	Sun, 18 Sep 2022 10:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BA0C60E25
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6191BF328
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 584E681AF4
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 584E681AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TSmaTk9BN3nS for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:03:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48B1B81491
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48B1B81491
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:03:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 439A81C0002;
 Sun, 18 Sep 2022 10:03:39 +0000 (UTC)
Date: Sun, 18 Sep 2022 12:03:38 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220918120338.3833d283@windsurf>
In-Reply-To: <20220826135503.20612-13-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
 <20220826135503.20612-13-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663495419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KXQ8rs29LE/TquIRUNKMIEWPnveFj84KNAh/Tf2jPA0=;
 b=EXjzCAtB1ZyVON81KBh9GQbYSmsnBZuxP3kuUVo5akB8KQA8WmgEIJwEfDXg4fYfNnD3TD
 PFvqqgC5B6rGu8mQwXMnIi+h86kO/TllgWnkxBH2IOVeNe1fTgZBfCoJwDeUwJYIjLDAGK
 MmB5CGwUyRfias0YxPczvOLxaSPXl9cmC3XZQB+nIuCkRYdf5Fq9pVMkBF5ZyPyqzFVWhx
 GoEFqvaRCvOvLRzvLfm5F+QhrUg4G63WC155KXMO8/u5ygmu7as7qCZWqSH+mLuwYqDxTH
 +VShohkFdh8KV3acy1IRM0w51xlsvwhyjv6kxtpiqYEvOLqV8+oFIagakrGsLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EXjzCAtB
Subject: Re: [Buildroot] [PATCH v4 12/29] package/qt6/qt6base: add linking
 to libatomic
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Aug 2022 15:54:46 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> This patch might not be necessary for qt6 but I can't find anything
> indicating so, Yann E. made the original commit for this on qt5 so
> he might be aware of current necessity

I also imagine that linking with libatomic will be necessary, but
before applying a patch that does this, I would like to have some
actual evidence. There are currently only two build failures for
qt6base in the autobuilders, and they are not related to libatomic
issues.

So for now, I'll mark this patch as Rejected, but we can obviously
revisit if we get a confirmation that it is indeed needed.

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
