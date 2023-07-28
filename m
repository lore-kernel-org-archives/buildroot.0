Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902C7EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 21:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B0E0614F1;
	Fri, 28 Jul 2023 21:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B0E0614F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XnEQ2yOcFN3G; Fri, 28 Jul 2023 21:02:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A288614DF;
	Fri, 28 Jul 2023 21:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A288614DF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE3811BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87786614DF
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87786614DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RnPdxSAYPvMy for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 21:02:08 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CE5B60E3C
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 21:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CE5B60E3C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F5E6FF804;
 Fri, 28 Jul 2023 21:02:00 +0000 (UTC)
Date: Fri, 28 Jul 2023 23:01:59 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230728230159.6440c601@windsurf>
In-Reply-To: <20230528113042.585399-1-dario.binacchi@amarulasolutions.com>
References: <20230528113042.585399-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690578125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjXYjxVzuZuGKrQMVa0bOqlTLvP99oj3TxpQs4AS51o=;
 b=bZ+Q0efFVYkDg8tYfySyGWqZfEk9rHx3hKz9uekTSVfwKtnxS0QtvzOnUY28WiNnyZEIXy
 PqsrFgqKfPshrdAHRM4F+MeFZsc1aB8MHWewjDv3i9sb8I7yYROR3W6XTBpMkxjRIcElLc
 ax5MbE6z6gzLbtPqaGnFYJMLl2afhNQcRZ+jYtihkwNfHm/id/pbxitOemA1PE8TxQnCQt
 HORIGhHv2ymkDuttD/HUUa3jtJHocQhl0wWTuSFovYl3QiwKtkF9H+WUGKsMzEA8d4YRuz
 ZS4zcAdvZDJiStPnOr+uutB+znLb80dS/lsHlx01mzUFLCPO0VYzku3yDqvsNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bZ+Q0efF
Subject: Re: [Buildroot] [RFC PATCH 1/1] package/automake: include .m4 files
 of autoconf-archive
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

Hello Dario,

On Sun, 28 May 2023 13:30:42 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch expands the number of usable .m4 files by including those
> contained in the autoconf-archive.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/automake/automake.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/automake/automake.mk b/package/automake/automake.mk
> index fd7933dd74f9..fc235784641a 100644
> --- a/package/automake/automake.mk
> +++ b/package/automake/automake.mk
> @@ -34,5 +34,6 @@ $(eval $(host-autotools-package))
>  AUTOMAKE = $(HOST_DIR)/bin/automake
>  ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
>  ACLOCAL = $(HOST_DIR)/bin/aclocal
> -ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR)
> +ACLOCAL_HOST_ARCHIVE_DIR = $(HOST_DIR)/share/autoconf-archive
> +ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR):$(ACLOCAL_HOST_ARCHIVE_DIR)
>  export ACLOCAL_PATH

Could you clarify the motivation? Do you have a specific case for which
this is needed?

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
