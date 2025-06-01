Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115B3C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C53AC41D9B;
	Sun,  1 Jun 2025 10:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yBEm_A9on5As; Sun,  1 Jun 2025 10:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E175D41D97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E175D41D97;
	Sun,  1 Jun 2025 10:39:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC15F222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91E2240443
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Pwua-JJEgfB for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:39:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E6D5400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E6D5400AB
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E6D5400AB
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:39:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F1BA1F433;
 Sun,  1 Jun 2025 10:39:40 +0000 (UTC)
Date: Sun, 1 Jun 2025 12:39:38 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20250601123938.6ceacb39@windsurf>
In-Reply-To: <20250601101305.3198541-4-roykollensvendsen@gmail.com>
References: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
 <20250601101305.3198541-4-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefgeehieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvtdelgfduiedtgffgkeelieektdeifefhleehfeevfeekhfetudduffetgeevgfenucffohhmrghinhepqhhtrdhiohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduieemvddthegumeekfhgskeemfegsvdejmeduvdgvieemsggttggrmeekheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduieemvddthegumeekfhgskeemfegsvdejmeduvdgvieemsggttggrmeekheelpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprhhohihkohhllhgvnhhsvhgvnhgushgvnhesghhmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsu
 hhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhgvshhsvggvvhhgsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748774380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=En7kF721wNgQYJ7HIA1pEXuHwF/DnhDxKxIqQIXXANc=;
 b=hZQWWjQJ6aC9kzcgRiah0j8HqtMOZ0NBdWUJSPOM9lCl5cAU8xM2KGiJ7fpljTPwRn4d3A
 yJr2Rlai22di5Ds+vH+buRYwYgwUQPt5PiQNxt5v9sk+XXR+YaUAVwzqr160RlYwFi1yeb
 5PFf/yc8WXXsl85MZ5B+naFlcmiRyWwcjcO8ELRKmwVbE4XRsV12fK9l6i8kmpu/F3VOSo
 RnrW24bgbcmjMeEE6M9UAsLC5By+i97lqZZaKoLfmf7bz38kLamWGz1a8KhSsVWF890iFr
 9SxF4R9tF9OSqUYuRos/MaYkUE021lCyGzBRWIzsYcaVoDFJVVXagNVyuliaIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hZQWWjQJ
Subject: Re: [Buildroot] [PATCH v2 3/6] package/qt6/qt6tools: fix designer
 build failure
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

Hello Roy,

On Sun,  1 Jun 2025 12:12:57 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
> index 8fff08b3e6..5828715aa6 100644
> --- a/package/qt6/qt6tools/Config.in
> +++ b/package/qt6/qt6tools/Config.in
> @@ -14,6 +14,17 @@ config BR2_PACKAGE_QT6TOOLS
>  
>  if BR2_PACKAGE_QT6TOOLS
>  
> +config BR2_PACKAGE_QT6TOOLS_DESIGNER
> +	bool "designer"
> +	select BR2_PACKAGE_QT6BASE_GUI # https://code.qt.io/cgit/qt/qttools.git/tree/src/designer/src/designer/CMakeLists.txt?h=6.8.1#n41
> +	select BR2_PACKAGE_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n64
> +	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n64
> +	select BR2_PACKAGE_QT6BASE_WIDGETS # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n64
> +	select BR2_PACKAGE_QT6BASE_XML # https://code.qt.io/cgit/qt/qttools.git/tree/src/designer/src/lib/CMakeLists.txt?h=6.8.1#n182
> +	help
> +	  Graphical tool for designing and building Qt user interfaces
> +	  with a drag-and-drop editor.

Same question about the designer. What would you want to have Qt
Designer on the target, in the context of Buildroot? That you might
want it on the host, why not, but on the target? Or does this option
actually builds it for the host, despite qt6tools being a target
package?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
