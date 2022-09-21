Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095CCECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98E18415CB;
	Wed, 21 Sep 2022 20:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98E18415CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vRpkdb522Umh; Wed, 21 Sep 2022 20:20:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D0C6415DB;
	Wed, 21 Sep 2022 20:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D0C6415DB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1EC21BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF2EE415DB
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF2EE415DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LkIruByF_4qc for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:20:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F5C4415CB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F5C4415CB
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:20:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 88911FF805;
 Wed, 21 Sep 2022 20:20:10 +0000 (UTC)
Date: Wed, 21 Sep 2022 22:20:09 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220921222009.0dd4ff1e@windsurf>
In-Reply-To: <20220918130735.295874-1-fontaine.fabrice@gmail.com>
References: <20220918130735.295874-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663791610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F6mBl+BQzZxuy7WKqnJhUgr+ciYnM6l03GlsOIk6IV0=;
 b=Ulhsf9Sw3lIVNEKhoRj0S51sKdJpwa3U6XCxCBVktxRtJjEXR9eEN9fe3ueZivSMAcQP59
 nk3HkszuKwKjrbemDPJ7n8WZ0uzmbejRP+LB3/mMmc5Y83EAdJrMc+D/267D0iRE0larKZ
 cHe08S742vq7GjprqNyXZJ6Ct7vS8M0zZjb+LR3pxEqhd0Vr/XBWN0q2fFfET5Jg0HS5x/
 NNaB/nThfLXiqlgy02Xdfa0R5hHFVCW0kG/NQFJqnLbQybH2ACBZrdKAelfRaokpfLQHBU
 iYjUPRmXO5wqbCIzW7jjyKKWrmgaB2mWNy+UiMBtR+gcvkTpIblmeuqDRtC/Vg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ulhsf9Sw
Subject: Re: [Buildroot] [PATCH 1/1] package/i2pd: bump to version 2.43.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 18 Sep 2022 15:07:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> https://github.com/PurpleI2P/i2pd/releases/tag/2.43.0
> https://github.com/PurpleI2P/i2pd/releases/tag/2.42.1
> https://github.com/PurpleI2P/i2pd/releases/tag/2.42.0
> https://github.com/PurpleI2P/i2pd/releases/tag/2.41.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...pd-Fix-the-build-with-LibreSSL-3-5-2.patch | 27 -------------------
>  package/i2pd/i2pd.hash                        |  4 +--
>  package/i2pd/i2pd.mk                          |  2 +-
>  3 files changed, 3 insertions(+), 30 deletions(-)
>  delete mode 100644 package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch

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
