Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D1DC001DE
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C86F3418FB;
	Wed,  9 Aug 2023 21:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C86F3418FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rMBxlqN16v3E; Wed,  9 Aug 2023 21:43:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA0A1418F1;
	Wed,  9 Aug 2023 21:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA0A1418F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4FF21BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D695418AC
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D695418AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBdRtDR-_LH8 for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:43:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61619417A9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61619417A9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E4071BF204;
 Wed,  9 Aug 2023 21:43:35 +0000 (UTC)
Date: Wed, 9 Aug 2023 23:43:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230809234334.6208c0d3@windsurf>
In-Reply-To: <20230809211935.3589420-1-bernd@kuhls.net>
References: <20230809211935.3589420-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691617415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qUEfk4EH9rRYui26MVhT7k8viFK4neDDdbRNDyoaXOI=;
 b=XxU2zT+YSVB/sL3sWICfpLbcvnrrXy9kxEX4pWsoeu8+6rIrI41WQFO4V2k3ySGkVP9Mv6
 8IqayP+mKoesh0SJ2CBnEuHUmtBR20cSul5lQoGiWUo7p2QkERwRwwIARrNcEk23kirk//
 PioHKvaEZE5fZUzESXAoCJhpe5WQyWyoETfpmxwMRO2HVaGOelvZpyBpvhcig6IlRWegGI
 iCr1zALd4X5Bgi78hRHx9mBEWCr4DGODJ+0is+PtQ4iuJ6/friMKOc+nsVrIzkEVn8211G
 pK51TcD+vD00L1xD0ZL4/O7Qbv53AD1DLKL4QKPr4tjaMJfyvljshPDCxEvG+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XxU2zT+Y
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-imagedecoder-heif: fix
 build with gcc-13
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

On Wed,  9 Aug 2023 23:19:35 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...de-missing-cstdint-to-support-gcc-13.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/kodi-imagedecoder-heif/0001-include-missing-cstdint-to-support-gcc-13.patch

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
