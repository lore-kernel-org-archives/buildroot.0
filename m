Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64EFC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 22:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AB11401AD;
	Tue, 26 Jul 2022 22:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AB11401AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XlqzrG8Qi8UW; Tue, 26 Jul 2022 22:15:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54B9F4018E;
	Tue, 26 Jul 2022 22:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54B9F4018E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7ECB61BF311
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58084408A6
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58084408A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hKIDKuzNPZrH for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 22:15:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7581408A7
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7581408A7
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 22:15:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 92D6D200006;
 Tue, 26 Jul 2022 22:15:36 +0000 (UTC)
Date: Wed, 27 Jul 2022 00:15:35 +0200
To: Noah Huetter <noahhuetter@gmail.com>
Message-ID: <20220727001535.337c533a@windsurf>
In-Reply-To: <20220427131400.223113-1-noahhuetter@gmail.com>
References: <20220427131400.223113-1-noahhuetter@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658873736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQmgEghYFxtgLPgsH0l4NNBLIxhSDuhv5gavlv4KVmI=;
 b=nQ4Oy+ZsVWnd4xWx0T9z5uQ4u7AjbmcGALZt5CeYUtFeBJi3IEJoKFiD7PtmhWbCUVBJTz
 drdp9jkW3jtD41fTZ3JwKi2h4CMmldE0s8uFLYNGUxRa9i0g777eLXmnKB+oR2WQPoNbVJ
 QJdm5Gs12uYikWDS1Wsagi5H1+Vma1JJ4ylhq/m5q/4WhH5N+lYEFDA/wHOLRCifmMXkrU
 82z02GWGAEYKnrtrUBo44TvgIaHoXQBBUCEyUb7p+C4U32Uz2nwqbn/LI5zo3cy8u8+NiE
 fK74KjV8Vhgl6vyocI/VLxw05QB49rtz8KAkmM7Z7w3Tj4Smc/YlzQUMn334qA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nQ4Oy+Zs
Subject: Re: [Buildroot] [PATCH 1/1] boot/opensbi: introduce
 BR2_TARGET_OPENSBI_CUSTOM_MAKEOPTS
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
Cc: Alistair Francis <alistair@alistair23.me>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Apr 2022 15:14:00 +0200
Noah Huetter <noahhuetter@gmail.com> wrote:

> Signed-off-by: Noah Huetter <noahhuetter@gmail.com>
> ---
>  boot/opensbi/Config.in  | 6 ++++++
>  boot/opensbi/opensbi.mk | 3 ++-
>  2 files changed, 8 insertions(+), 1 deletion(-)

Applied to master after changing the name to
BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
