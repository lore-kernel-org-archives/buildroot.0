Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA652C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 22:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AFBE437B7;
	Fri,  5 Jan 2024 22:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AFBE437B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ca2TheXJ93R; Fri,  5 Jan 2024 22:55:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CF3C43791;
	Fri,  5 Jan 2024 22:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CF3C43791
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62CB41BF3D5
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 22:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BD044225D
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 22:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BD044225D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VSMQCyEWAb32 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 22:55:46 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 385F142250
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 22:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 385F142250
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F52CE0002;
 Fri,  5 Jan 2024 22:55:42 +0000 (UTC)
Date: Fri, 5 Jan 2024 23:55:42 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240105235542.44b08b20@windsurf>
In-Reply-To: <20240105194900.2400237-1-bernd@kuhls.net>
References: <20240105194900.2400237-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704495343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELHwWoHbl3fBds7oTunaWC9L3Y8iyo0wHz1x8S10+Js=;
 b=Zr921PXfDgrtojPccaT+sVqJqrsjYSKJbsGL7AkVGIcssP7NzAlOcNVGAv1V74FLe0TjqH
 DK0rCDFBVHeezzu0h78XUsK+HLHePw4JHeckPSCdz6wl3NwgqnSUGjm3LuVCYlVVrG6sO+
 5dP1PqSTf3E7SH+HhL0wL/gykofBP+Gx5ME7ZJBA4JxRAgFJbem9l2q4TPWBSnOrLcTTgr
 vNEaWxrCA26bSDgVU5JOvXgGcUobmuvsbNkycyHZhLjJdXhyUAAPpAhlbZs76aVj1opW7i
 /GYjGjln7So841J7xTyIEGYTL8ce0Z6H3h4rNbGKoGSmnhhsCxy9Kk1VDLYTVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zr921PXf
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.3.2
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
Cc: Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  5 Jan 2024 20:49:00 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2023-December/000741.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>  package/mesa3d/mesa3d.hash               | 6 +++---
>  package/mesa3d/mesa3d.mk                 | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

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
