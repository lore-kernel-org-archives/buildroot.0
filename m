Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF35CC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91BDB405D7;
	Wed,  5 Feb 2025 10:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gfu0_mt84Epm; Wed,  5 Feb 2025 10:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EE25405F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EE25405F3;
	Wed,  5 Feb 2025 10:13:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B38C312A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97D26405BB
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NxKHDG-4Wieh for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:13:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E48E7405D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E48E7405D7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E48E7405D7
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:13:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16B1D43419;
 Wed,  5 Feb 2025 10:12:58 +0000 (UTC)
Date: Wed, 5 Feb 2025 11:12:58 +0100
To: Ayoub Zaki <ayoub.zaki@embetrix.com>
Cc: buildroot@buildroot.org
Message-ID: <20250205111258.46556bcd@windsurf>
In-Reply-To: <20250102133358.226719-1-ayoub.zaki@embetrix.com>
References: <20250102133358.226719-1-ayoub.zaki@embetrix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejvdejvdfgffevteeiffdugeeiveeliefgffetfeehhfethfeuleefkeejgfefvdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegrhihouhgsrdiirghkihesvghmsggvthhrihigrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738750379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x1M6SrsTzgF8qX+82EVnL1J+M+EP0BhzBdOmOBTv+Qg=;
 b=Eeyuyi62HvicvaV7jpMajczw51jmiMcWx6Ci9BGFni9s5q+R8d+fn+TLfyoxI8WnCq94lT
 Pwq0Xe00OxnHANgEJYyMI33fYq7QepS6NMLO8hwu96Q4MaRSmYrVh6KpYNJYt6m/bTl6FM
 IGKUhfclmExhX0gRUktW0tGoia8UuNZaP3GAn7qizzGesZkJVlVz+SwnHzQgqznpGUIhl0
 MZ2YxpFAw8T4PK4Z5JxtbCc+YcJX4d/jjX+WK6k+/upOelu5QmrvDjy5JnYEguTz9Ci2Zb
 6UxGD3ZDykkvTK9ekajdM8xjbw5pXKz81nKIRgRYU883ZPsTRUdCfvbSdcmNFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Eeyuyi62
Subject: Re: [Buildroot] [PATCH v2] package/bmap-writer: add initial package
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

Hello,

On Thu,  2 Jan 2025 14:33:58 +0100
Ayoub Zaki <ayoub.zaki@embetrix.com> wrote:

> Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>

Thanks for your patch. I applied it, but I had to fix a number of
things. See below my different comments.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 381bc9f490..2e66e3d8a7 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3447,3 +3447,6 @@ F:	package/quazip/
>  F:	package/shapelib/
>  F:	package/simple-mail/
>  F:	package/tinc/
> +
> +N:	Ayoub Zaki <ayoub.zaki@embetrix.com>
> +F:	package/bmap-writer/

This file is alphabetically sorted, but you had added this entry at the
end of the file, which isn't good.

> diff --git a/package/bmap-writer/Config.in b/package/bmap-writer/Config.in
> new file mode 100644
> index 0000000000..d65eda918c
> --- /dev/null
> +++ b/package/bmap-writer/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_BMAP_WRITER
> +	bool "bmap-writer"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_LIBARCHIVE
> +	select BR2_PACKAGE_LIBXML2
> +	help
> +	  bmap-writer is a command-line utility designed to efficiently write
> +	  disk images to storage devices using block mapping (BMAP). It serves
> +	  as a lightweight alternative to the Yocto BMAP tool, specifically for
> +	  embedded systems. Unlike the Yocto BMAP tool, bmap-writer is C++ based,
> +	  does not require Python, and focuses solely on writing an image.

These lines were too long. This is reported by "make check-package", so
I rewrapped them.

> +	  https://github.com/embetrix/bmap-writer
> +
> +comment "bmap-writer needs a toolchain w/ C++, wchar"
> +	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/bmap-writer/Config.in.host b/package/bmap-writer/Config.in.host
> new file mode 100644
> index 0000000000..d5bfd62f0a
> --- /dev/null
> +++ b/package/bmap-writer/Config.in.host
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_HOST_BMAP_WRITER
> +	bool "host bmap-writer"
> +	help
> +	  bmap-writer is a command-line utility designed to efficiently write
> +	  disk images to storage devices using block mapping (BMAP). It serves
> +	  as a lightweight alternative to the Yocto BMAP tool, specifically for
> +	  embedded systems. Unlike the Yocto BMAP tool, bmap-writer is C++ based,
> +	  does not require Python, and focuses solely on writing an image.

Same: lines too long.

Also, this file was not included anywhere, so it was useless. I added
the necessary include logic in package/Config.in.host.

> diff --git a/package/bmap-writer/bmap-writer.mk b/package/bmap-writer/bmap-writer.mk
> new file mode 100644
> index 0000000000..bbe4eb1078
> --- /dev/null
> +++ b/package/bmap-writer/bmap-writer.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# bmap-writer
> +#
> +################################################################################
> +
> +BMAP_WRITER_VERSION = 0.0.3
> +BMAP_WRITER_SITE = $(call github,embetrix,bmap-writer,$(BMAP_WRITER_VERSION))
> +BMAP_WRITER_LICENSE = GPL-3.0
> +BMAP_WRITER_LICENSE_FILES = LICENSE
> +BMAP_WRITER_DEPENDENCIES = host-pkgconf libarchive libxml2

Missing

HOST_BMAP_WRITER_DEPENDENCIES

> +
> +$(eval $(cmake-package))

Missing

$(eval $(host-cmake-package))

(which means you really didn't test the host version of the package).

I've applied after fixing those different issues. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
