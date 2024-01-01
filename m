Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E944CC4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94F874368D;
	Mon,  1 Jan 2024 21:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94F874368D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xiRfP0RKzx5A; Mon,  1 Jan 2024 21:22:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 926A94357F;
	Mon,  1 Jan 2024 21:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 926A94357F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 153AC1BF37C
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A582D435C4
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A582D435C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8-70eHU7bljz for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:14:58 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CB1740A4B
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CB1740A4B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89A1BE0003;
 Mon,  1 Jan 2024 21:14:56 +0000 (UTC)
Date: Mon, 1 Jan 2024 22:14:55 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101221455.412dcaf0@windsurf>
In-Reply-To: <20231230204325.1219272-1-fontaine.fabrice@gmail.com>
References: <20231230204325.1219272-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704143696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G7VenrE3XJgXEX1N0nbFfTvM7VNJG3ic/ZI3K9widzI=;
 b=LBofk4RZ3g2GsppB6paVahM+lN3iyFBRtJ8PaY14SB4izMoS0KXNC/b8R7vGNMvxOdVlok
 Pacpqn25gys7bmB3NJ+YnPb8p4hS+DzeqgMeN+BxZ/khClQd1ahFM8Rg5yoU1rV4V5+lE5
 JZaFR+yLVeXBYhqzptEn99QZnidkzdd4DomfFm4dQCJtXqwQ5MxlUsCLjD3A1P87dN2es1
 mRKjHae2Ca6ZyP2YroQ+oW7Xfsxh0laI0VPTSzFydOAiV0aCMfxP7BoD6f6FUYfNUmcgRr
 VbTQR+lG3cGVMpNEpKGv6aanJzVKIRjmXZGuscMX+9KWc3NRQsPYFWYTF8w8qQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LBofk4RZ
Subject: Re: [Buildroot] [PATCH 1/1] package/libseccomp: bump to version
 2.5.5
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 21:43:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/seccomp/libseccomp/blob/v2.5.5/CHANGELOG
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libseccomp/libseccomp.hash | 4 ++--
>  package/libseccomp/libseccomp.mk   | 2 +-
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
