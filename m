Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592ADC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05CF640BE9;
	Thu,  3 Nov 2022 21:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05CF640BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B_k2U3Ch6SxS; Thu,  3 Nov 2022 21:24:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4078D40BC0;
	Thu,  3 Nov 2022 21:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4078D40BC0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A95FE1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 921FD61065
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 921FD61065
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqhiztIhAteD for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:06:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6747560AAC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6747560AAC
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:06:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 47C7460004;
 Thu,  3 Nov 2022 21:06:28 +0000 (UTC)
Date: Thu, 3 Nov 2022 22:06:27 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221103220627.70329f56@windsurf>
In-Reply-To: <20221103143642.2186317-1-james.hilliard1@gmail.com>
References: <20221103143642.2186317-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667509592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPR8DCloIhGC5UgY+YL+XaFxwcAQ2ZeAMowzhjWodRE=;
 b=bs8kyQHVXr94NITxv6HSa7xguMJla+Xo0JdQ8rCtfZDokE/lR38LktxhQMMREWoqwEJ2fz
 BkFApb2TMk0Gug1mMPA+ZHJXoWIORYv2qUe3HEMgM3PdLFfugSfIsty9/A/c4rDSGt8niQ
 6aqH4iVDG0qLy+PC8UbtleYJXrtLqxITgcSi67HUdqAifmVNTYyWBueFNflTZaamtXr1ri
 hwkvZwZXj7YXqqG8S3uppI5srmxmo72phmdLnTUVzYMz4b30NIFRjUbhoAsU/XzHKSNQH8
 dZc717jags3DRadYmYQ4oHWzkwLPqw56XMH1V0GUwA+qxb8frCMTP2dQGtqfrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bs8kyQHV
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to
 version 3.0.0
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
Cc: Falco Hyfing <hyfinglists@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Nov 2022 08:36:42 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pymodbus/python-pymodbus.hash | 9 +++++----
>  package/python-pymodbus/python-pymodbus.mk   | 6 +++---
>  2 files changed, 8 insertions(+), 7 deletions(-)

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
