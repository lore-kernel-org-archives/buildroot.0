Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0161C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A8264146F;
	Tue,  1 Nov 2022 20:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A8264146F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CctQwNhPyl61; Tue,  1 Nov 2022 20:46:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D024F414CE;
	Tue,  1 Nov 2022 20:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D024F414CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 291501BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB11B812CD
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB11B812CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dfwklc1M_NFv for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:45:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2B3D8128C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2B3D8128C
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:45:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EA5DCC0007;
 Tue,  1 Nov 2022 20:45:42 +0000 (UTC)
Date: Tue, 1 Nov 2022 21:45:41 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221101214541.228f9e47@windsurf>
In-Reply-To: <20221101183032.3631097-1-yann.morin.1998@free.fr>
References: <20221101183032.3631097-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667335543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l701RhuWnqviCI1pZ+irXdmZ2LpR/Z1JYlVbEsOMBVw=;
 b=eLpaEghubjeffKmA2dAIpwx1kHI89rplr0KT52UgrIEzHU/nYNzJWz6nv3jP2C3M7psuMU
 95sWNo/uMRgM1i1LhHSeui7kTn2Z2HnB+0/68xAe84ezhnwHDEciDf0j0aIQiTiz0Bhf8a
 pJL7M7Ah2cu9eOEgj5FO5qkDmszNKN7vUrtJJ1UATlDu5Fs30DrcGUgv77vnRNxrb46Hju
 RJ7rvYRSfmXVsFfmnw+hwo2jq9cADw4JwVu0Xrxa92xuNuF0We5WQqRK+R7Rc5JRafYXWC
 qSAPzwzKDoWHnGqiK3lyTYzCsMDhEpvx/OX5dyes5Xwz+xlTencFQySjUACYCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eLpaEghu
Subject: Re: [Buildroot] [PATCH] fs/cpio: don't fail systems without
 /dev/null
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

On Tue,  1 Nov 2022 19:30:32 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> We pass all our dracut configuration files via a config dir, but dracut
> insist with having one config file. Because we do not want to have to
> chose which file we pass (which would then have to be excluded fro; the
> config dir), we jsut used an arbitrary empty file, and /dev/null seemed
> to be a good candidate.
> 
> However, some build environments do not have a complete /dev, and may be
> missing entries otherwise taken for granted, like /dev/null. This is
> especially the case in constrained environments like containers.
> 
> Switch away from using /dev/n ull, and do create an actual empty file
> that we can use as the dracut config file.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/3249828364
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  fs/cpio/cpio.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

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
