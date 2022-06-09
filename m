Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CD8C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E911A84277;
	Thu,  9 Jun 2022 20:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZD9W27bQoDPq; Thu,  9 Jun 2022 20:30:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 294E08426D;
	Thu,  9 Jun 2022 20:30:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 292481BF35E
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 177E4409C1
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qXSsvQpPWVw for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:30:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E6EF40327
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:30:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B61C21BF20B;
 Thu,  9 Jun 2022 20:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654806649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zn+A0ZWxvcYQeLiWwqE0Jlqkmtav1i6unxb+BgZ0TDo=;
 b=oRjhU/LaGyFPt77vJFBkuS/p7pI0ka+5QE1UPOT2h2JIlJD/40nEMBqnDoNBb9zcbK3VMP
 yL1UlrCR3QDKeusrnnc20mxfN2JLzutHx29tl6YClqxKWpi79fE2xlNTN6uleoSXZn4PMT
 CVFsNXgAujB6M5e4q27DHZpO3Fs8l/woUc467Twmg1e3aHQiMsrrYfRBI8Cxi4YVzn9yuQ
 WMa1DfmNqgZAkfCzU4gl3y1Zw6BZJaVCOVrldrWKA9EJW7Lj1YV3RNVlTjF+xc7+mTpF4q
 qPlPx5z0AnSfJpNQWxz6BNEm9FMrUcMbKPSLVEB9mSVdYxd06AZVp88qiUWLmQ==
Date: Thu, 9 Jun 2022 22:30:48 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220609223048.43d00358@windsurf>
In-Reply-To: <20220609195005.5641-1-heiko.thiery@gmail.com>
References: <20220609195005.5641-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/kontron_pitx_imx8m_defconfig: add
 BR2_TARGET_UBOOT_NEEDS_GNUTLS
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

On Thu,  9 Jun 2022 21:50:06 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> With U-Boot 2022.04 gnutls is required for building the hostool
> mkeficapsule. Thus the BR2_TARGET_UBOOT_NEEDS_GNUTLS config is needed.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754543
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  configs/kontron_pitx_imx8m_defconfig | 1 +
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
