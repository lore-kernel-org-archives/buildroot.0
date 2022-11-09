Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54F1C4332F
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 14:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E18554173B;
	Wed,  9 Nov 2022 14:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E18554173B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCzqce3T95PG; Wed,  9 Nov 2022 14:42:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1297416D2;
	Wed,  9 Nov 2022 14:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1297416D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E41DB1BF33C
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 14:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6E01416D2
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 14:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6E01416D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uwlinKSUuaKN for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 14:42:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40BCD416C9
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40BCD416C9
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 14:42:49 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2E3C7240011;
 Wed,  9 Nov 2022 14:42:43 +0000 (UTC)
Date: Wed, 9 Nov 2022 15:42:42 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221109154242.082e2709@booty>
In-Reply-To: <20221109091214.65185-1-neal.frager@amd.com>
References: <20221109091214.65185-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668004966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yIjS9eoBAX59zQF9+H/oP5bXq4Agf1y4CrZ+Qz1K1e8=;
 b=K3pOiqYq08CIRt4+SmUpa5FZO3p+E51yMwhrIttEYGEOB8C6Y5ZHhOOn+6itw5SEmwy/LW
 wN2O0gdKhJDsYk7orQSjhTuxxaxKFQBw6Wp+Q/NZglN/vx14ECBkuyzGZ5jvJL3toVy3X0
 1zOIJBg7vDx6NsaGA5T86J0DSngdicr8QadjDcup4TEwBFJWxB5CT/TdAhtm14kdL24PWd
 uj0bbMPZdbmznbwgKv8KdfcOOf0kZxlMkTm2MjgeIjQv9JTr5U+wOdhK9hMXYdd1En4GbR
 Df5QBoszCxkhpyoJGjp96sU+kbLI6qmQpM61lh/6KIvmA5wtJ0tpTc3lDCa9lQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K3pOiqYq
Subject: Re: [Buildroot] [PATCH v4 1/2] package/versal-firmware: new package
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: terry.oneal@amd.com, kris.chaplin@amd.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Wed, 9 Nov 2022 02:12:13 -0700
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds support for downloading versal microblaze firmware binaries.
> These are necessary for booting Xilinx versal devices.
> 
> The location of these binaries is temporary, and will soon be added to the
> Xilinx firmware repository.  The temporary location is using the same free
> distribution license as the Xilinx firmware repository.
> 
> Once these files are available on the Xilinx repository, this package will
> be updated to the new location.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
