Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096B9C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4C8281B9D;
	Tue,  1 Nov 2022 22:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4C8281B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i9VRqgSHRCzZ; Tue,  1 Nov 2022 22:25:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9D4881A30;
	Tue,  1 Nov 2022 22:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9D4881A30
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7E41BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 394AD408B2
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 394AD408B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTig4AnnX7lt for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:25:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FF034062A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FF034062A
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:25:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0A5E4FF809;
 Tue,  1 Nov 2022 22:25:08 +0000 (UTC)
Date: Tue, 1 Nov 2022 23:25:07 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20221101232507.4e01edd4@windsurf>
In-Reply-To: <20221018183724.2377-1-heiko.thiery@gmail.com>
References: <20221018183724.2377-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667341509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GPQs8gj4G2RgUyqE5kqqG2/BkJEXkPCpfCSKka5Xbw0=;
 b=X//hBYsuY5WS6P6JHZL4pBqCA2Bb/X/rTXd0knTFtywGbGQCvCkwtDIzf+CNXywUU+YsZ/
 J1DtxqFaEEAA6f910TKhzuUN6AbxJ6MX0gM227HchNkzOorKEfrjRs5DkuPHBFEgnUy4q8
 oZuu7PI5EJagSbEvKbhtnai3NK+D8HJ1kCqw9toq5iwuodxO/tTji0Yt3sivNwTFH+cOTR
 KkOKNNHHEK0kQ0sYc+zzX17U04cqdNrLpITJX0hsOlE8NMFj81sx3vFqvYdo31QZAs/uA8
 F83wE3jM/LRI1hnpnAZoXyuDTRj3t4z0Srga/4T5e/RAoR9FbUrG/Mu1I6DzUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X//hBYsu
Subject: Re: [Buildroot] [PATCH v2] configs/kontron_smarc_sal28: use U-Boot
 2022.10
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
Cc: Michael Walle <michael@walle.cc>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 18 Oct 2022 20:37:24 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Add BR2_TARGET_UBOOT_NEEDS_GNUTLS=y and BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
> since this are dependencies for building mkeficapsule u-boot tool.
> 
> Change the offset of the rootfs to left enough space for the U-Boot that
> has increased.
> 
> Cc: Michael Walle <michael@walle.cc>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  board/kontron/smarc-sal28/genimage.cfg | 2 +-
>  configs/kontron_smarc_sal28_defconfig  | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

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
