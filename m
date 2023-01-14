Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD96C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 20:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE29941525;
	Sat, 14 Jan 2023 20:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE29941525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5plQwQ0sGGmG; Sat, 14 Jan 2023 20:04:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC08B40362;
	Sat, 14 Jan 2023 20:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC08B40362
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E2161BF3D8
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B9124048A
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B9124048A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ycLkbz7yla7z for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 20:03:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1136440004
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1136440004
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 20:03:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 467CAFF806;
 Sat, 14 Jan 2023 20:03:23 +0000 (UTC)
Date: Sat, 14 Jan 2023 21:03:22 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20230114210322.3b85acbc@windsurf>
In-Reply-To: <20230114104832.12702-1-heiko.thiery@gmail.com>
References: <20230114104832.12702-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673726604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uH4de8/tc+EVsWa4grq9ZMVdj/lsLIaFksvw9lQ0SHE=;
 b=KC/Vt9PPu2KLgJiZu6N7GgfOxR9dW7xUgQ0GHUNZnJerJ8w8x2gkvnH8xDCHXk+lF6AnW4
 +j8576U8a3CbZnhlFCpBr9d7qgEStIylP/Is6EPwHXdrj+tm7PkvYGjnLhEEctlXgzs2Z+
 ZCoUhthFkeqCKCZz6B5A2wlypdeI/f2Z/Kt+3i0DBYK1KuNuKueejJNi4yWShyYPtE5E6u
 YIWp7j63qy3sQE7rbNf18xorCA/N4h/BQofKfmS9HNK6xB5WgQPRjJko5vmcUs/Qcklwqb
 h5tamwjpLR7E+uYlhp/9tMzRk6RGPM55cG9cLH2faiWzJuRHmpQRhHSjGm/zIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KC/Vt9PP
Subject: Re: [Buildroot] [PATCH 1/4] package/libyang: bump version to 2.1.4
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
Cc: Jan =?UTF-8?B?S3VuZHLDoXQ=?= <jan.kundrat@cesnet.cz>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Jan 2023 11:48:30 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/libyang/libyang.hash | 2 +-
>  package/libyang/libyang.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
