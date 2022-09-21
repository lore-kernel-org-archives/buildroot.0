Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA87C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 18:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EE9961062;
	Wed, 21 Sep 2022 18:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EE9961062
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtlDcPS7jHLM; Wed, 21 Sep 2022 18:10:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8181B61033;
	Wed, 21 Sep 2022 18:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8181B61033
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D98C21BF3FC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4A2782EF0
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4A2782EF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZc51nK0Nqye for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 18:09:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67794823E3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67794823E3
 for <buildroot@busybox.net>; Wed, 21 Sep 2022 18:09:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1D325240004;
 Wed, 21 Sep 2022 18:09:46 +0000 (UTC)
Date: Wed, 21 Sep 2022 20:09:46 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220921200946.1f76e202@windsurf>
In-Reply-To: <20220920190345.3688752-1-francois.perrad@gadz.org>
References: <20220920190345.3688752-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663783787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sMXqEXfkw+T2XxgWfWCqAJYQ5oaAx301/JWnfds3p4Q=;
 b=YdTSwuZEWJxnKXPa89wD8UPfC7KWS4LweyBkbdcgZ0lU28mCZAoT7KT2OaEJiVgHFj5IBN
 FK9lhpj/sxlJxaTTYISLj0rUooMe+KcdbEaTBOw9HZWwfwVXXPz8fQ6qK4OoLy3EW8duww
 1MtZ0yuLL18DEYXyRQcAHVQ2iXuarA8O6fvXgUWwUVq7kaqXZs79Ry6p6Mo6ZZowSqSIqz
 ZXmJ4TkJhB57IFRFpTZqRsL4aps82FrmhGJc86KrY3lxVzsnes0WdzuoEdNN00oZWI0Ufq
 LPHdJHW3gG1BdpPhLO2w5pMw51Wc0jaUso1MSCfrbgg7XL7KjjBilq30SH/Kpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YdTSwuZE
Subject: Re: [Buildroot] [PATCH] package/pango: bump to version 1.50.10
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Sep 2022 21:03:45 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/pango/pango.hash | 4 ++--
>  package/pango/pango.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
