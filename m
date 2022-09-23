Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBFAC04A95
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 420544104C;
	Fri, 23 Sep 2022 21:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 420544104C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W9LjPAjGosof; Fri, 23 Sep 2022 21:34:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64C2B40220;
	Fri, 23 Sep 2022 21:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64C2B40220
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1CFA1BF337
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E07841A1F
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E07841A1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlsjNU4zXM3t for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:34:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4503341959
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4503341959
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:34:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6AC61100005;
 Fri, 23 Sep 2022 21:34:35 +0000 (UTC)
Date: Fri, 23 Sep 2022 23:34:34 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220923233434.2d67b993@windsurf>
In-Reply-To: <20220921210119.12451-1-fontaine.fabrice@gmail.com>
References: <20220921210119.12451-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663968875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JAM6X3vscxb4cRttMLdSyj7Z4sK6iBsjeu9hJqZr5V4=;
 b=iSWHnIqPDUhVVbAcpEkQp9vrFHXcJc3ZDgRXzzfKTz9cqyFj+xpb13gcHDpIgnzBUhthfA
 MU95VL0RprJStG+6bVkEtkMPXUzjbMOgWXGbCvUvS/pI0X3zsACh37/jG0A3Y2V4C3jpGb
 wP3xRpqK/byY41cARUhFEirO5twsYAU402stlZCn8pzI6dBaN7bociFJvPeulcpWA68xBZ
 AJFusSYD245a7mm15CcR4eSKWV18K3Rw+XZ/sXe+VNnuKBxEv34+oU79lEUKJOm4QLhBsn
 PpMVbUhmu6fHcESSRDk6hwhLbBozIK7KPMFt1S/XLlH4Bg8ybvCvWCWcw69DSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iSWHnIqP
Subject: Re: [Buildroot] [PATCH 1/1] package/libffi: bump to version 3.4.3
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

On Wed, 21 Sep 2022 23:01:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of license file (year updated with
> https://github.com/libffi/libffi/commit/41d0851fc545ff1ffd8377236d193268c8a10740)
> 
> https://github.com/libffi/libffi/releases/tag/v3.4.3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libffi/libffi.hash | 4 ++--
>  package/libffi/libffi.mk   | 2 +-
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
