Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A46C369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73B71607D8;
	Sat, 19 Apr 2025 21:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTTN6ZpAb9Yk; Sat, 19 Apr 2025 21:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6D44607EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6D44607EC;
	Sat, 19 Apr 2025 21:40:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F4AE22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70BF6812D0
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGDq20XZM8Vg for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:40:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 55650812D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55650812D2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55650812D2
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:40:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DC6642DF9;
 Sat, 19 Apr 2025 21:40:48 +0000 (UTC)
Date: Sat, 19 Apr 2025 23:40:47 +0200
To: Vasileios Amoiridis <vassilisamir@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250419234047.2a5f229f@windsurf>
In-Reply-To: <20250403224419.26193-1-vassilisamir@gmail.com>
References: <20250403224419.26193-1-vassilisamir@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeiudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepvhgrshhsihhlihhsrghmihhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745098848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KwePLDJHseMJtxybQz+q2TT4/SemFou9l2L6QxO0ybo=;
 b=mmnpd9jrJOa1476QC+25QyR2T0TUDAGE//AlaS/N4di8AqoPxGahdshluBl0RfKKVM139W
 GXqee8QCJyv8TrOqweNZd5HR+SHtAxGxHuu+W9ndgwx5go1mrcHcuePCeuqGx2uGVF5xbI
 OLQWxIjJKWhGsvk/wXqNrvvrXLKyfLRPRy69Re5Fd0Fh2AcSlD1DrI+jdWc3+DINe20l0N
 vfSoWfTSHvOtqbNBlzJxNnZaB8lxSD7oCXfxtiEw880D15FX6dV5iVxvmO58NND2LbfUCz
 9nf/c1voYvuSCY335MnJH4Q6igJQ5I+xlZ/5M4mFxUnz618DCKJTBETVm3zxig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mmnpd9jr
Subject: Re: [Buildroot] [PATCH v4 1/1] package/linux-tools: use
 PKG_CONFIG_LIBDIR in perf make flags
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Vasileios,

On Fri,  4 Apr 2025 00:44:17 +0200
Vasileios Amoiridis <vassilisamir@gmail.com> wrote:

> After commit 440cf77625e300e683ca0edc39fbc4b6f3175feb ("perf:
> build: Setup PKG_CONFIG_LIBDIR for cross compilation") in the
> Linux Kernel it is needed to add PKG_CONFIG_LIBDIR in the
> make flags to avoid warnings from the Kernel, such as:
> 
>         Makefile.perf:207: Missing PKG_CONFIG_LIBDIR,
>         PKG_CONFIG_PATH and PKG_CONFIG_SYSROOT_DIR for
>         cross compilation,
>         Makefile.perf:208: set PKG_CONFIG_LIBDIR for using
>         Multiarch libs.
> 
> Signed-off-by: Vasileios Amoiridis <vassilisamir@gmail.com>

Thanks for the patch!

> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> index d67318571a..1526652ce4 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -20,6 +20,7 @@ endif
>  
>  PERF_MAKE_FLAGS = \
>  	$(LINUX_MAKE_FLAGS) \
> +	PKG_CONFIG_LIBDIR=$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig \

However, this value is incorrect I believe.

Indeed, linux-tool-perf.mk.in is cross-compiling perf for the target,
so pkg-config should look for cross-compiled libraries... and here
you're pointing to natively compiled libraries installed in
$(HOST_DIR), so this is not correct.

I'm not sure what the correct fix is, as PKG_CONFIG_LIBDIR is passed
internally in our pkg-config wrapper, it's really just the kernel
Makefile being over-zealous here. Maybe we could play with the kernel
accepting a $(CROSS_COMPILE)pkg-config, and have such a script in a
private directory, added in the PATH when building perf? Another option
is to define PKG_CONFIG_LIBDIR, replicating what our pkg-config uses as
a value.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
