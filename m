Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D812C83F26
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 20:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9A74614AD;
	Wed, 30 Jul 2025 20:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXQaTbz0O2wq; Wed, 30 Jul 2025 20:32:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA352614AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA352614AB;
	Wed, 30 Jul 2025 20:32:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9198012E
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83D68614AD
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5lwYxdVHHLBF for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 20:32:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::235;
 helo=relay15.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56833614AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56833614AB
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56833614AB
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:32:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08CE6442D0;
 Wed, 30 Jul 2025 20:32:29 +0000 (UTC)
Date: Wed, 30 Jul 2025 22:32:28 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
Message-ID: <20250730223228.036ad445@windsurf>
In-Reply-To: <20250708215011.1213438-1-aperez@igalia.com>
References: <20250708215011.1213438-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeitdejgeekgfeiheeiudelhedvveejieelieevhfefgefffeevgeegheettefhhfenucffohhmrghinhepfihpvgifvggskhhithdrohhrghdpghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegrphgvrhgviiesihhgrghlihgrrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlu
 ghrohhothdrohhrgh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753907552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dP5ALArdTk2f0goRDu6v4osgoYZXycabN0nuiiuuolI=;
 b=hOZ/KAzBQLAu0WwZoZ7iCkm8C3cv7R389lanlscErC8+ny/fxjKlW8kWb0101NwtSweEs4
 kDj504LgT/eLX+B9IstiM0w/a24LkyjsQry/mtRsZoxwCFh5P8K32EzOL/xR+CIVG+GkRr
 6svx1EYrC5/I/XoD8ARYP52tfPl6QWbryfrCRkJhdQ0jW9mXUvKhpiIxBqw+TWJIBpwWkV
 +aDdnRyRO9IN9NRrwnLWBJ8Di6fwVf1tpDqNVwXZmiA4whnzizX56ABaXN7oX19CsJyGTp
 SjGuhIjTzR8o9GMs0yzAJP6TrfccqbscV65kAQw9KkvG+5cnWYF0aDO9u10qpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hOZ/KAzB
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.48.3
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

On Wed,  9 Jul 2025 00:50:09 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This bumps WPE WebKit to the 2.48 stable series, skipping over 2.46.
> 
> WPE WebKit 2.48 and 2.46 highlights:
> 
> - https://wpewebkit.org/blog/2025-04-11-wpewebkit-2.48.html
> - https://wpewebkit.org/blog/2024-wpewebkit-2.46.html
> 
> Release notes:
> 
> - https://wpewebkit.org/release/wpewebkit-2.48.3.html
> - https://wpewebkit.org/release/wpewebkit-2.48.2.html
> - https://wpewebkit.org/release/wpewebkit-2.48.1.html
> - https://wpewebkit.org/release/wpewebkit-2.48.0.html
> - https://wpewebkit.org/release/wpewebkit-2.46.7.html
> - https://wpewebkit.org/release/wpewebkit-2.46.6.html
> - https://wpewebkit.org/release/wpewebkit-2.46.5.html
> - https://wpewebkit.org/release/wpewebkit-2.46.4.html
> - https://wpewebkit.org/release/wpewebkit-2.46.3.html
> - https://wpewebkit.org/release/wpewebkit-2.46.2.html
> - https://wpewebkit.org/release/wpewebkit-2.46.1.html
> - https://wpewebkit.org/release/wpewebkit-2.46.0.html
> 
> Fixes the following security issues:
> 
> - From https://wpewebkit.org/security/WSA-2025-0004.html
>   CVE-2025-24223, CVE-2025-31204, CVE-2025-31205, CVE-2025-31206,
>   CVE-2025-31215, CVE-2025-31257
> 
> - From https://wpewebkit.org/security/WSA-2025-0003.html
>   CVE-2024-54551, CVE-2025-24208, CVE-2025-24209, CVE-2025-24213,
>   CVE-2025-24216, CVE-2025-24264, CVE-2025-30427
> 
> - From https://wpewebkit.org/security/WSA-2025-0002.html
>   CVE-2024-44192, CVE-2024-54467, CVE-2025-24201
> 
> - From https://wpewebkit.org/security/WSA-2025-0001.html
>   CVE-2024-27856, CVE-2024-54543, CVE-2024-54658, CVE-2025-24143,
>   CVE-2025-24150, CVE-2025-24158, CVE-2025-24162
> 
> - From https://wpewebkit.org/security/WSA-2024-0008.html
>   CVE-2024-54479, CVE-2024-54502, CVE-2024-54505, CVE-2024-54508,
>   CVE-2024-54534
> 
> - From https://wpewebkit.org/security/WSA-2024-0007.html
>   CVE-2024-44308, CVE-2024-44309
> 
> - From https://wpewebkit.org/security/WSA-2024-0006.html
>   CVE-2024-44185, CVE-2024-44244, CVE-2024-44296
> 
> - From https://wpewebkit.org/security/WSA-2024-0005.html
>   CVE-2024-40866, CVE-2024-44187
> 
> As for build system changes, the minimum GCC requirement gets raised to
> version 11 [1], the ENABLE_SPEECH_SYNTHESIS option is now enabled by
> default [2] and needs handling, and Skia (bundled with the sources) is
> now preferred on little-endian targets.
> 
> [1] https://github.com/WebKit/WebKit/commit/682ac4ba74c53d0cd488c7a595096224a9abb036
> [2] https://github.com/WebKit/WebKit/commit/10381a8de938024f31935184af470ccbce0b22d9
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...d-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch | 44 +++++++++++++++++++
>  package/wpewebkit/Config.in                   | 11 ++---
>  package/wpewebkit/wpewebkit.hash              |  8 ++--
>  package/wpewebkit/wpewebkit.mk                | 27 +++++++++++-
>  4 files changed, 79 insertions(+), 11 deletions(-)
>  create mode 100644 package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch

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
