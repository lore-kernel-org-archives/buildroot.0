Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E487C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 19:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1C6460C2A;
	Wed, 28 Dec 2022 19:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1C6460C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9wqwvlfk_DDH; Wed, 28 Dec 2022 19:53:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4167560C29;
	Wed, 28 Dec 2022 19:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4167560C29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D085C1BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8FC1404D8
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8FC1404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m0BeyqvW8ntd for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 19:52:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AECF40002
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AECF40002
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 19:52:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CC2221C0006;
 Wed, 28 Dec 2022 19:52:52 +0000 (UTC)
Date: Wed, 28 Dec 2022 20:52:51 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221228205251.57bc787d@windsurf>
In-Reply-To: <20221228184248.3757329-1-giulio.benetti@benettiengineering.com>
References: <20221228184248.3757329-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672257173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AY+8jyQZLdqHb7sLfAyq01w+0+mAc1NEjQwPY7q3u/8=;
 b=WzzRr0me0xx0imSeERwcs0gzSmjk9PS+xzrvfI3Hoog/wL1Z/bJfChiQc+/GOZyhd6wc5F
 C8NaNA2Y98GS1jSYlCYinlT3t0sbF2NJB7rV2SCwj4kfiWgD0yb2ovXjHrL6b5s3qkB3+U
 WwhfgK0PcAnK5OXkzQGLnoK/otkhGqBrpvK9RMjRb2DwX9IzxtcFmUTXTjq0du/03ZIFqk
 UXU9mUu/cKp5pWxW3inl3AoH2dHrk1TqCTZKEG3SE1AlT3XX4AUWu4UCozzf/ZLL/jDUIS
 enkQYIwavy5MQoFYMreWsXQpXxslH8N1cXv2SI6Pg6KaxVe+snbmtaDADR1tmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WzzRr0me
Subject: Re: [Buildroot] [PATCH] package/rtl8723bu: bump to 2022-12-28
 version to fix build failure with Linux 6.1
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

On Wed, 28 Dec 2022 19:42:48 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Let's also drop local patch[0] that has been upstreamed.
> 
> [0]: https://github.com/lwfinger/rtl8723bu/commit/dde7bddfddddb7212f2d9671391e2096d770c449
> 
> Fixes:
> http://autobuild.buildroot.net/results/cc8/cc84b5f62ca59572f0f52086f157acc0409c03f5/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...uild-failure-on-PowerPc-architecture.patch | 47 -------------------
>  package/rtl8723bu/rtl8723bu.hash              |  2 +-
>  package/rtl8723bu/rtl8723bu.mk                |  2 +-
>  3 files changed, 2 insertions(+), 49 deletions(-)
>  delete mode 100644 package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch

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
