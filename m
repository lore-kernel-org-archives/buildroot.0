Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31F1C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98660408C9;
	Sun,  6 Aug 2023 14:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98660408C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HiI1XZgQJ9Jr; Sun,  6 Aug 2023 14:27:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85CBE410A5;
	Sun,  6 Aug 2023 14:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85CBE410A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 249E61BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4C8B8187F
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4C8B8187F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ygTzEuflws-0 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:26:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F77F80DD0
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F77F80DD0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EC76FF802;
 Sun,  6 Aug 2023 14:26:21 +0000 (UTC)
Date: Sun, 6 Aug 2023 16:26:20 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230806162620.2eb42bf2@windsurf>
In-Reply-To: <20230802120150.564860-2-thomas@devoogdt.com>
References: <20230802120150.564860-1-thomas@devoogdt.com>
 <20230802120150.564860-2-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691331981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2faSMvtFoQ4jgzt46eY0UtJ1nUcP44ccULTghyX7YU=;
 b=O4n8d3cQ4Yg0HoIshmR6kVMT9hA91gvSXjVf+m7BS6h9mT6V/euwXa+mwqeqvX+JjP2Ye8
 S3Kyt45amH1Vhu3eO9sl9EJ1rfs8uf6rxWIT3HnrbP9lucxaVDhZ5mHCnSJrhfApdfpZDn
 wguwyc2EwFTyEVNRwSaehk3e+E7zailjGywCd4NlwOiswR8dExUMlw3hPg0DBswtCxaSuo
 LGRvFpkXaTzJBUdD+c/LR+VwALvf3ev0Hj5TG+SkGrBIqvpB+JOt1PlklQzKGVBewvgKIn
 LFdmxNf8y+pG/+weO+OPv4tZMFDKZyCkx719so8KzbjaJBjQc0Q9IIJpkCEUBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O4n8d3cQ
Subject: Re: [Buildroot] [PATCH v2 2/3] package/webkitgtk: add http/2
 support by using libsoup3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  2 Aug 2023 14:01:49 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> Support added in 2.33.2:
>   https://webkitgtk.org/2021/06/08/webkitgtk2.33.2-released.html
>   "HTTP/2 support when building with libsoup3."
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
> v2: no change
> ---
>  package/webkitgtk/Config.in    | 10 +++++-----
>  package/webkitgtk/webkitgtk.mk |  3 +--
>  2 files changed, 6 insertions(+), 7 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
