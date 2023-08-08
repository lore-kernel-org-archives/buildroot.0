Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370BDC001E0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 22:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E519B8213C;
	Tue,  8 Aug 2023 22:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E519B8213C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flvnuDWa0_vJ; Tue,  8 Aug 2023 22:21:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28A5582179;
	Tue,  8 Aug 2023 22:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28A5582179
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E73141BF3A3
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1FAA4175E
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1FAA4175E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uc82C6vcIkCG for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 22:19:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48F9C40987
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 22:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48F9C40987
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AF04240002;
 Tue,  8 Aug 2023 22:19:22 +0000 (UTC)
Date: Wed, 9 Aug 2023 00:19:21 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230809001921.044bc7e1@windsurf>
In-Reply-To: <20230808184917.4929-1-dalang@gmx.at>
References: <20230808184917.4929-1-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691533162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0I1FRmWvrPeePn5KOpaGCX2qhb7rtvlmuuZL6T+9hJI=;
 b=T+1Qde5WSnP9YeQUnyOUhzTFjVvPoGzFYrBXe6v0OmDAixrBCL/SWvTnPTmyKuLYgvpxrM
 FY5G5QLIvvrCGx6s9SZzby5CP6H8m20CJopVREzbjCngG5+0LsMdldedzL/CjT20ORk7Cl
 8vsqrHDOcldwIFaSQ/1YBNn8QDWXxqqsE0BuCCLjwidFt8dA/LNzVpPIEmO36pFQBiChM5
 B6bm3MIeWu2OMAcqtYejNAeE6PU76hzSqr76sFb839mgYGWX5i+FGY1M5JqkWo09hczWRn
 7GGL88/UANeCzCFA0wlrkZK6kp88YuDANll8MxwtL9aFE05Yc1tQj8KHnrB8Cw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T+1Qde5W
Subject: Re: [Buildroot] [PATCH] package/yajl: add CPE ID
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

On Tue,  8 Aug 2023 20:49:16 +0200
Daniel Lang <dalang@gmx.at> wrote:

> yajl_project:yajl is a valid CPE ID:
> https://nvd.nist.gov/products/cpe/detail/CD8C46A4-151E-4DC3-BCE8-4C322E9E10DB?namingFormat=2.3&orderBy=CPEURI&keyword=yajl&status=FINAL
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/yajl/yajl.mk | 1 +
>  1 file changed, 1 insertion(+)

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
