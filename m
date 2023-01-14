Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A048C46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 22:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92D8F408AC;
	Sat, 14 Jan 2023 22:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92D8F408AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FzmGrp1Dk4L3; Sat, 14 Jan 2023 22:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C281340592;
	Sat, 14 Jan 2023 22:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C281340592
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B9C21BF3AA
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 22:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3541A81F3D
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 22:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3541A81F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECp337CY3ljD for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 22:35:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05BFC81F37
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05BFC81F37
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 22:35:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 268D420002;
 Sat, 14 Jan 2023 22:35:05 +0000 (UTC)
Date: Sat, 14 Jan 2023 23:35:04 +0100
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20230114233504.587e3eef@windsurf>
In-Reply-To: <DB6P190MB0488622C1D557DF4C5083A4F9FFD9@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
References: <DB6P190MB0488622C1D557DF4C5083A4F9FFD9@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673735705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cn+HU3YDZi31905ye9BJ4gf+oeObUKVZwIzTybcKuu4=;
 b=Z/FsZW6+VaZ6l2ybMRIPb1jtqlMGaZphe6z0L1JfLw6wtyn3BT8lf2+h2NTU6V/t/qedTj
 cNH5C0b1OqzYtAU8DU+9+J7MBVri6msg8xbrYf+xDNAt+iIw3DYCDaLyc23IKKOKaygTwH
 RRMEANuGe8XhQGH5CFBuo+D2mhJ/ydjb9ObcN9cKWqltW1pQ/j5g53jGIpWZHzHQtTQDTu
 USL6sOCaxDqmIP1jK19xYToQGVWbqzI0b6oO3hF8fW+nED5PJzJslFu37PPYja8jYEqHrd
 tbgahjHbW4XS21Er+8JnuEMHa6tAXuF/Bw74HcPd7crCZkCOHA3K2mi/e5fJrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z/FsZW6+
Subject: Re: [Buildroot] [PATCH v2 1/4] package/at-spi2-core: switch to
 https download
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 12 Jan 2023 09:22:07 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
> Changes v1 -> v2:
> - No changes
> ---
>  package/at-spi2-core/at-spi2-core.hash | 2 +-
>  package/at-spi2-core/at-spi2-core.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
