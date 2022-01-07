Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF01C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9907360810;
	Fri,  7 Jan 2022 18:53:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NV1w5xBVsaZ3; Fri,  7 Jan 2022 18:53:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0057F60803;
	Fri,  7 Jan 2022 18:53:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 382871BF317
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3080A81386
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qOYpFTYVdl6 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:53:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04C5D81383
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:53:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3BACD200004;
 Fri,  7 Jan 2022 18:53:10 +0000 (UTC)
Date: Fri, 7 Jan 2022 19:53:08 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: azxxza22 <amrtmoh2006@gmail.com>
Message-ID: <20220107195308.282518bc@windsurf>
In-Reply-To: <20220102181525.9494-2-amrtmoh2006@gmail.com>
References: <20220102181525.9494-1-amrtmoh2006@gmail.com>
 <20220102181525.9494-2-amrtmoh2006@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] hash file added
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

Hello,

On Sun,  2 Jan 2022 20:15:25 +0200
azxxza22 <amrtmoh2006@gmail.com> wrote:

> Signed-off-by: azxxza22 <amrtmoh2006@gmail.com>
> ---
>  package/nodogsplash/nodogsplash.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/nodogsplash/nodogsplash.hash

This should be part of the patch adding the package.

> diff --git a/package/nodogsplash/nodogsplash.hash b/package/nodogsplash/nodogsplash.hash
> new file mode 100644
> index 0000000000..da059a854d
> --- /dev/null
> +++ b/package/nodogsplash/nodogsplash.hash
> @@ -0,0 +1,2 @@
> +md5 edafdd4ef89218261f29a9074891cf7a nodogsplash-v4.5.1-br1.tar.gz
> +md5 cbbd794e2a0a289b9dfcc9f513d1996e COPYING

These should be sha256 hashes, and there should be a comment above that
says:

# Locally calculated

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
