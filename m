Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074BEC3ABDD
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 07:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77E4F83C40;
	Fri, 16 May 2025 07:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1qbhzUbUPxr; Fri, 16 May 2025 07:05:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80D8F83C44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80D8F83C44;
	Fri, 16 May 2025 07:05:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 64F14185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 487644176E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHfjP-GlogbK for <buildroot@buildroot.org>;
 Fri, 16 May 2025 07:05:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BBD1041762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBD1041762
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBD1041762
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:05:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B274E43B85;
 Fri, 16 May 2025 07:05:50 +0000 (UTC)
Date: Fri, 16 May 2025 09:05:48 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <20250516090548.1e689598@booty>
In-Reply-To: <20250515203739.1238211-1-giulio.benetti@benettiengineering.com>
References: <20250515203739.1238211-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefhteetieegleelhfelueelgedvgfdvjefhfffhudeuteegledvheevffevkedvnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdhkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdhlfihnrdhnvghtpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgr
 dgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747379151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jsZ6SliqDr8oOz6mum0GvcQhPVOYSGUG8f1KYgRp+Ok=;
 b=PRDeMLgahU0UD78pTG7GD/D6iCBPGrqrKW9+gg0puHHuHH2SyQ3UPWpXKgIhGr/xlvkPTt
 xCBK6iVSCwj0cTAaDCo1D4bHgMp4Oc7WKMczHCLMc13623VS4ghlktA1PsDOijgmWT0h90
 njApHlrGJWVgD4PCIJjXA8uH1+9b/xd4U1xIGTrcr5/RnoDNlTHr7Sk4hqnQ12ZT5+lOf2
 G9o5ZKu3NZFNpy6YtFLQWc873fodwg2ybdPNDKMcpDfg6uCypKVC0ojyAPVAbepyUm3J/1
 GmirVvvGE6ml1KfFJ14EX7PBmGOXEAZoG7e5Vs+gDzyA9S54smT8eHV2AbG+6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PRDeMLga
Subject: Re: [Buildroot] [PATCH] Fix building with Linux 6.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Thu, 15 May 2025 22:37:39 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add local patch pending upstream to fix build failure with Linux 6.14.
> 
> Fixes:
> https://autobuild.buildroot.org/results/065b9afc1c6f9f5561547b12171269adc8c12275
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

The Subject should have a "package/rtl8188eu: " prefix.

> diff --git a/package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch b/package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch
> new file mode 100644
> index 0000000000..a05a760d22
> --- /dev/null
> +++ b/package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch
> @@ -0,0 +1,33 @@
> +From 0363681349f683050bc9a265db8310e8c4eb6534 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Thu, 15 May 2025 22:32:48 +0200
> +Subject: [PATCH] Fix build with Linux 6.14
> +
> +Commit:
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7a53af85d3bbdbe06cd47b81a6d99a04dc0a3963
> +adds argument "unsigned int link_id" to get_tx_power(), so let's add it to
> +cfg80211_rtw_get_txpower() according to Linux version.
> +
> +Upstream: https://github.com/lwfinger/rtl8188eu/pull/464
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + ioctl_cfg80211.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/ioctl_cfg80211.c b/ioctl_cfg80211.c
> +index 270cfce..04434fa 100644
> +--- a/ioctl_cfg80211.c
> ++++ b/ioctl_cfg80211.c
> +@@ -3240,6 +3240,9 @@ static int cfg80211_rtw_set_txpower(struct wiphy *wiphy,
> + static int cfg80211_rtw_get_txpower(struct wiphy *wiphy,
> + #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
> + 	struct wireless_dev *wdev,
> ++#endif
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
> ++	unsigned int link_id,

The patch looks OK otherwise, so with the subject line fixed you can
add:

+Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

However, as the upstream maintainer Larry Finger passed away last year
[1], I don't think those out of tree drivers will be maintained in the
future. Some fork might appear, but an option to seriously consider is
to just deprecate and then remove this package in Buildroot and
recommend using the rtl8xxxu driver that is in mainline Linux.
package/rtl8188eu/Config.in already recommends the mainline driver for
kernels since 3.12, which was released 12 years ago...

[1] https://lwn.net/Articles/979419/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
