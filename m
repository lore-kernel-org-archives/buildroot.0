Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86C8ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 18:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ADF840911;
	Wed, 21 Sep 2022 18:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ADF840911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LKGLZbZVn7Ck; Wed, 21 Sep 2022 18:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D1B5404F7;
	Wed, 21 Sep 2022 18:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D1B5404F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5111BF3FC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28EC7818C4
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28EC7818C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ICtkBSVf_tP for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 18:24:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A591081420
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A591081420
 for <buildroot@busybox.net>; Wed, 21 Sep 2022 18:24:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B04641BF204;
 Wed, 21 Sep 2022 18:24:32 +0000 (UTC)
Date: Wed, 21 Sep 2022 20:24:31 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Nicola Di Lieto <nicola.dilieto@gmail.com>
Message-ID: <20220921202431.1bc460b9@windsurf>
In-Reply-To: <YyqrLXMZrKPwqr11@einstein.dilieto.eu>
References: <YyqrLXMZrKPwqr11@einstein.dilieto.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663784672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wp8hepfvTLYlCi+oUePntAQDAEXahKJMjHUfuOlRZ4w=;
 b=nS0ifvvEL6evlyKnMpsu2auuD+rwMl4GX0hcFQbJ23MOj0YCyO76bMMZ6nxeifZMXN+sof
 xhRHdSf8sfbcRpd1Ca4pMsJmtUaKD0r05jqVW8+eQzYfHRKQGzJ7qd+XEHEWb3gHYeU1aE
 TznXe+2QqPvYm1KxQP3VjPCTxVP3BpxEAZirECXRFlMTh8yQNGob6IgPCJPSS/ZQtTdGGu
 VbXJS+t5IUv7NyajXbLIy/x5lXjMfY8XVSrqSc1NOgBohDiX6/12m5kJVsBaanjHKkMjCs
 uBC1TI+pkvyVazI3UkA25xWnidl12t1CkycxbDdBjnMC9yS+nIcXY8R7S/pkrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nS0ifvvE
Subject: Re: [Buildroot] [PATCH] package/uacme: bump version to 1.7.3
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

On Wed, 21 Sep 2022 08:11:57 +0200
Nicola Di Lieto <nicola.dilieto@gmail.com> wrote:

> includes https://github.com/ndilieto/uacme/pull/61
> fixes http://autobuild.buildroot.org/results/8fa4f0d2821796be312b366be2f095be07dd7b1e
> 
> Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
> ---
>  package/uacme/uacme.hash | 2 +-
>  package/uacme/uacme.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master with a slightly improved commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
