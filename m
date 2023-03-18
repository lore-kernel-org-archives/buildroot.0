Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4186C7618A
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 22:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A7D140472;
	Sat, 18 Mar 2023 22:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A7D140472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5nx6SH931Eac; Sat, 18 Mar 2023 22:21:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD724408DD;
	Sat, 18 Mar 2023 22:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD724408DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EB3A1BF2FF
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC3B560E36
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC3B560E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LuAEvEebKSEM for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 22:21:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A552060E19
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A552060E19
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 22:21:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9D7221C0006;
 Sat, 18 Mar 2023 22:21:32 +0000 (UTC)
Date: Sat, 18 Mar 2023 23:21:31 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230318232131.7da5dfe5@windsurf>
In-Reply-To: <20230317101031.2357806-1-james.hilliard1@gmail.com>
References: <20230317101031.2357806-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679178092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DuNdsRLePB1BUFluFmvD4hyYR6wVld5cGdkQds2aczE=;
 b=WC0jMlAhqQLbhgHKiEd22lGPhrN5mpS0v4LYz2wQDUqLTqPN8s+rKOjkoVpL5Yl6l4OeSK
 NrTq6Uc5rSBanFnzt2b52SmkWfhupx+qJP6eX8JQlBdcWDb+lM7AB4TqvlxJTNPpzZB4Fl
 jaoy9UCIZgCW9TprnVScuvDBcEbas7IBsmltrZtV8ayKMlmNqSy0xH2/QTaUWDrLut2L4g
 HbB0wOT1y8qPbM1UgRxkiuh7aZAAuGP5nt1nCdFGWrbHtWAhugTiX40Z6QnW3nW5ggjo3y
 td0ECw3dydJrLFmtP2H+Lil9K+HxY2dYmlfsiunI1KDTFhwRzwbR4QTAoiOKxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WC0jMlAh
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.68.0
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

On Fri, 17 Mar 2023 04:10:31 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Link to Rust 1.68.0 announcement: https://blog.rust-lang.org/2023/03/09/Rust-1.68.0.html
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
