Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21ADEB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A42B61450;
	Fri, 14 Jul 2023 10:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A42B61450
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRCL3DVyvfYz; Fri, 14 Jul 2023 10:22:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B927B61425;
	Fri, 14 Jul 2023 10:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B927B61425
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 845771BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 506D7841B0
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 506D7841B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8J9dszB2VKt3 for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:21:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49C41841AC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49C41841AC
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:21:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDD051BF204;
 Fri, 14 Jul 2023 10:21:42 +0000 (UTC)
Date: Fri, 14 Jul 2023 12:21:42 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230714122142.0f29dec1@windsurf>
In-Reply-To: <20230713215350.473429-1-james.hilliard1@gmail.com>
References: <20230713215350.473429-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689330103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=68RsngElfSJqS/jnkzPXpIWgcwsAoaWaRHz3U7kRpB0=;
 b=X31MZEdp/iLBaEVZ1MpwIT4d/Sk3DwbL/gOB6VYPxwK27iRerbb4W1aDtMJ6S309Fk1kZG
 ikLvkdTY9mJF0QD/Miu79PiR5xmOx6s3CpmICpbo4JXvqJ2Qw7lRk7Gltefu3IsTv3ZK8v
 QwGSHGSXj2+yPsbOnh9VrflNXyZYZnAT7EaLNRp4wP27nBDNj0jVnaoF/1pgq7jZqobJk8
 YdBraLe3klNp6LzXvfm+Jq5fQe/g2nLUir/cZXILOI3wsNhMPXuTf/AzB0X6zMG3meD+po
 7IvJGpCS2o4G8wlWaBitpVLwUYdJ5N3wTKi+aqRyE5xbJZSV6ieMcgpFmGq3gA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X31MZEdp
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.71.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 13 Jul 2023 15:53:50 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Link to Rust 1.70.0 announcement: https://blog.rust-lang.org/2023/07/13/Rust-1.71.0.html
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/rust-bin/rust-bin.hash | 252 ++++++++++++++++-----------------
>  package/rust-bin/rust-bin.mk   |   2 +-
>  package/rust/rust.hash         |   6 +-
>  package/rust/rust.mk           |   2 +-
>  4 files changed, 131 insertions(+), 131 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
