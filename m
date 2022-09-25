Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F40C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 19:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13B29813D1;
	Sun, 25 Sep 2022 19:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13B29813D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhSc0Au-PS6m; Sun, 25 Sep 2022 19:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A0FB8138B;
	Sun, 25 Sep 2022 19:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A0FB8138B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F13F71BF577
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 19:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C85FA8138B
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 19:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C85FA8138B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTroxodeofCC for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 19:53:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95E3B81328
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95E3B81328
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 19:53:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2475120009;
 Sun, 25 Sep 2022 19:53:41 +0000 (UTC)
Date: Sun, 25 Sep 2022 21:53:40 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Message-ID: <20220925215340.43f64019@windsurf>
In-Reply-To: <20220925214700.5e222e95@windsurf>
References: <20220913174039.182887-1-thomas.claveirole@green-communications.fr>
 <20220913174039.182887-2-thomas.claveirole@green-communications.fr>
 <20220925214700.5e222e95@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664135621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zHcjUZJCRYEJBxSACsWg8cQ8Yg6v6pFW2ZwMBOH1FbA=;
 b=kCCk5F9vN8vVytDHVao1CtwsV7H7/K4tKQXyFV0x0A49Zbuk1lP5GmE0574CPjiuHjmqvF
 +9xIGsTM7FA1Q7zf7jWepFYpf1IBCeA5bglPFDD18ir7YCEhUNp9A6ISn4KN3pYmzW2GT1
 CZ3xLC/XSk6LE2Sk57i3DpRO6fX/Kd1tAp0HkkfoO5wEq/fqg6pex17dlmYfpE0byCXk5H
 CEmuDY2eXuqET8jsdZXvQIgxcvFZ9dVqgYQonF4WcvtyLER42A7c2uewzADVdS4okBPE73
 BduYToGnCc0ZciWVz4MHPIXVf54DqPJaxty4jKBGE6aFMGGZY9scI6UqvU0UJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kCCk5F9v
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

On Sun, 25 Sep 2022 21:47:00 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> So is "corepack enable" download extra stuff? If so, it's not great at
> all to have this executed as part of the installation step of a
> package. Or is pnpm shipped as part of nodejs, and that simply installs
> it?

Replying to myself: "corepack enable" does not download stuff. I tried
in a Docker container with no network access, and it did this work,
which apparently consists in just creating a bunch of symlinks.

So that sounds good.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
