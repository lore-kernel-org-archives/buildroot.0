Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9B2C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13E5481DFB;
	Mon,  3 Jul 2023 19:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13E5481DFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1i4pFjd3hgjj; Mon,  3 Jul 2023 19:27:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4642981DF1;
	Mon,  3 Jul 2023 19:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4642981DF1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B229B1BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EB47606FF
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EB47606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1vOW6_X0r6Nb for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:27:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3411C60595
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3411C60595
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:27:01 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71DB160004;
 Mon,  3 Jul 2023 19:27:00 +0000 (UTC)
Date: Mon, 3 Jul 2023 21:26:59 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703212659.1c808a80@windsurf>
In-Reply-To: <20230702181727.570560-1-bernd@kuhls.net>
References: <20230702181727.570560-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688412420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCjWw+sX3hv2f/lyMYmuMCW/09MICCzq/hHDUvViMEo=;
 b=cz0qVqR/SeEtzsm6TxWq8OyShTi17ThjjUnAEYF0sbOf3Rol2DErcXUrU9lNbD7AQeGMOY
 lzy7o11J/ar0C1frxvJEHcDuOtWQN/5BIpCrw5H8yMDwqhVzxEulVtCFqWanvUVJ0jiCXD
 w/IOwHt5i56otDou3Z8EW5IGI6E4EgTs93M8EQ+EHebBIkgFnGf8uSa3Fz1/bMN7x8DnUy
 xyEYCrGNyK/Tv5342HRcotFBuMkohxQmfdCbI+ybsatGc5PPwKbUeS/8OGeQpY3Lxt0bDW
 D9mRGN9i0IVNpBIqQnVogP835Vi0MyO6vIvA43l/TdXSpFDTVmxj1IbsB53ktw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cz0qVqR/
Subject: Re: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 23.2
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

On Sun,  2 Jul 2023 20:17:27 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> http://stellarium.org/release/2023/03/26/stellarium-23.1.html
> http://stellarium.org/release/2023/07/02/stellarium-23.2.html
> 
> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  1 -
>  .../stellarium/0001-add-missing-include.patch | 32 -------------------
>  package/stellarium/stellarium.hash            |  2 +-
>  package/stellarium/stellarium.mk              |  2 +-
>  4 files changed, 2 insertions(+), 35 deletions(-)
>  delete mode 100644 package/stellarium/0001-add-missing-include.patch

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
