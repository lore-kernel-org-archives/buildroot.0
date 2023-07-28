Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E78BC001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFAFB4208A;
	Fri, 28 Jul 2023 19:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFAFB4208A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vm3_KWarZI4t; Fri, 28 Jul 2023 19:33:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 386D6420A1;
	Fri, 28 Jul 2023 19:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 386D6420A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2852E1BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D2F5415D0
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D2F5415D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRgWqvS9RCpa for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:33:26 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89435418A1
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89435418A1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90DB1E0002;
 Fri, 28 Jul 2023 19:33:22 +0000 (UTC)
Date: Fri, 28 Jul 2023 21:33:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230728213321.2839a7da@windsurf>
In-Reply-To: <20230728143840.4045371-1-bernd@kuhls.net>
References: <20230728143840.4045371-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690572803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7UBxtHBQat395YV34pGlQRGH1fIOZUhE/MP1NCCLuk=;
 b=FHBvIQG2PDPGxpxq2qcs+1O1w71rszeHSGnhyuopCmbrFBSJCgqZ4/sY9T8HdaFTvJDzAq
 GJkvAUtUtDvJq1qerJwgq2JPaXEu4sKrl7UDWOI+y4wXXeZ19wWSEO2+n2kK2dfD3xNy7l
 mWvehjxGSc8BxzW1IZahmVzmsx6N7ZQJbknHUpMaCUCP8ObGF5tBFzw8RuPWXojinjwl3z
 cUs5CJPr7/WbGR7zEyB47hD6pqbFoCqZQYxTQdsvksiMdaKmzn7HfGqwRn9Xxk7EQxRBry
 1tznJXI8AJl6u2FsMh02rYid4L4cJ8f3dUfDPRHKIbre/G3sYf5qspnRRYpMAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FHBvIQG2
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: or1k: Only define
 TARGET_HAVE_TLS when HAVE_AS_TLS
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
Cc: Romain Naour <romain.naour@gmail.com>, Stafford Horne <shorne@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Jul 2023 16:38:40 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Backport upstream patch to fix build error seens with alsa-lib:
> error.c:(.text+0x12c): undefined reference to `__tls_get_addr'
> 
> Fixes:
> http://autobuild.buildroot.net/results/525ca7fe78015168c186ffda5fa52c0edb2071c9/
> 
> The fix is included in gcc 13.x.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...ine-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch | 49 +++++++++++++++++++
>  ...ine-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch | 49 +++++++++++++++++++
>  ...ine-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch | 48 ++++++++++++++++++
>  3 files changed, 146 insertions(+)
>  create mode 100644 package/gcc/10.4.0/0007-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
>  create mode 100644 package/gcc/11.4.0/0006-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
>  create mode 100644 package/gcc/12.3.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch

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
