Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A35C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 20:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1454D41687;
	Sun,  5 Jun 2022 20:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ab_LIZC8Sgch; Sun,  5 Jun 2022 20:26:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E57A141634;
	Sun,  5 Jun 2022 20:26:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D2061BF3A8
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C33841634
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzb2GKm8lO2o for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 20:26:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27F0941612
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 20:26:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 137A0200002;
 Sun,  5 Jun 2022 20:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654460768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7jOJ16+S8QXtXY2/I3BpR7e/u7F7zvF/Vj9XlTLbwY8=;
 b=gR50s6fnydTywBLhHbG5jFTi8Is8R8N+RG4QBm6t0esfB5OAl8FYB/P/JV0Y4qEPVdNAHn
 j4cRXHunup9f785VkozVPhaRlN3/9ySrTbW1tpYTVI+VnmtKGig+rmkIW/tfxVPgnbfuZL
 lh22AXpnI2IHuwoNo0BSvRQ8/71Gu0JnDZsZqzz6DD1cghqjRJqgT2Vs49h/vVhuKlz8Bt
 Fmx1vVfZ8hhnCRT0N9r9CkQ0nDn8UA6YiVezoFsK+mftb+jWuI7bRKnQGitxq3A9ENrtNt
 3AI4BtevF8x85HxeKa8eidu/WhEdCrVXcrizCORoNqyNwLNQFIznwZ7BB2vAbw==
Date: Sun, 5 Jun 2022 22:26:07 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220605222607.4f1c4428@windsurf>
In-Reply-To: <20220604115458.7914-2-heiko.thiery@gmail.com>
References: <20220604115458.7914-1-heiko.thiery@gmail.com>
 <20220604115458.7914-2-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/rauc: add option to
 enable/disable streaming support
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
Cc: Andrey Yurovsky <yurovsky@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Jun 2022 13:55:00 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> RAUC 1.7 introduces streaming update support. Make this configurable and add
> required dependency to libnl.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/rauc/Config.in | 13 +++++++++++++
>  package/rauc/rauc.mk   |  7 +++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/package/rauc/Config.in b/package/rauc/Config.in
> index 1170e50845..fe029c73ca 100644
> --- a/package/rauc/Config.in
> +++ b/package/rauc/Config.in
> @@ -40,6 +40,19 @@ config BR2_PACKAGE_RAUC_NETWORK
>  	  This option enables support for updating firmware over
>  	  the network using libcurl.
>  
> +comment "rauc streaming support needs network support"
> +	depends on !BR2_PACKAGE_RAUC_NETWORK

I found this comment to not be very useful, it's pretty obvious that
streaming will only be available with network support enabled IMO, so I
dropped this comment and applied to next. Of course, I can always be
convinced differently by you or my fellow co-maintainers :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
