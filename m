Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76962CA0FF8
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3304740399;
	Sat,  2 Sep 2023 07:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3304740399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8hKbxvPXjyV8; Sat,  2 Sep 2023 07:41:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8341B40A4E;
	Sat,  2 Sep 2023 07:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8341B40A4E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49BF31BF861
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E5F94012B
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E5F94012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OOXvVEcK2DWh for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:39:37 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1500F40489
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1500F40489
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD02FE0002;
 Sat,  2 Sep 2023 07:39:34 +0000 (UTC)
Date: Sat, 2 Sep 2023 09:39:33 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230902093933.429dcc3c@windsurf>
In-Reply-To: <20230901144836.425829-1-thomas.devoogdt@barco.com>
References: <20230901144836.425829-1-thomas.devoogdt@barco.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693640375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WhukHWL1avHUHSxgXe5SErkKyQ2+WdHST7e+JSW1mnY=;
 b=ChBCGRsYLY8KXPnNW6ub83EauPhKs10HaJq0Xo3fcvV0/X2E8O3C2KqlubyzKldMLdwWOI
 SANuHlYWFJj7TULPZ9q+AOqw4w7/6sFti00xK7HzZswjdNDctK7Eq1Uolqw9VcOD9NZmsr
 E9lDSSKIEHipoOAapv2yrPrf5sC3h39UbrxpPpqRPJzUauZ3I7JTco8G/4uCqi9r8JxdI+
 vsGQvZdqGcym1zr3/qe98N3N+SpCx2lZfV+lFodC75Uno5os325xwh3cmiuTcGwXhbg3u2
 V3VOjYiKgBWGlqI1NW4TWZ6UpEx8R+KOItoIkwEevLOnSyt1cPtULKMcErthFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ChBCGRsY
Subject: Re: [Buildroot] [PATCH v1] package/lighttpd: bump to version 1.4.71
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  1 Sep 2023 16:48:36 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> Changelog:
>  - https://www.lighttpd.net/2023/5/10/1.4.70/
>  - https://www.lighttpd.net/2023/5/27/1.4.71/
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>  package/lighttpd/lighttpd.hash | 4 ++--
>  package/lighttpd/lighttpd.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
