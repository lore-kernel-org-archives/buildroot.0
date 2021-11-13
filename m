Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24461C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:01:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 989196113B
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 989196113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62D618176E;
	Sat, 13 Nov 2021 17:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xKgoKmtGwo26; Sat, 13 Nov 2021 17:01:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1F2881766;
	Sat, 13 Nov 2021 17:01:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D00A31BF299
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC9BA6066D
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbFqEuAT-dMz for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:01:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE00D60668
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:01:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 60D1D1BF209;
 Sat, 13 Nov 2021 17:01:17 +0000 (UTC)
Date: Sat, 13 Nov 2021 18:01:16 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211113180116.003dc22c@windsurf>
In-Reply-To: <20211113125620.1981211-4-bernd.kuhls@t-online.de>
References: <20211113125620.1981211-1-bernd.kuhls@t-online.de>
 <20211113125620.1981211-4-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 4/5] package/x11r7/xlib_libxcvt: new
 package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 13 Nov 2021 13:56:19 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> diff --git a/package/x11r7/xlib_libxcvt/Config.in b/package/x11r7/xlib_libxcvt/Config.in
> new file mode 100644
> index 0000000000..b8ff361713
> --- /dev/null
> +++ b/package/x11r7/xlib_libxcvt/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_XLIB_LIBXCVT
> +	bool "libxcvt"
> +	help
> +	  libxcvt is a library providing a standalone version of the X
> +	  server implementation of the VESA CVT standard timing mode-
> +	  lines generator.

Even though we don't have it for a lot of X.org packages, having an
upstream URL at the end of the help text is a good idea. I've added a
link to the Gitlab repo for this project, which looks like a reasonable
homepage for the project.

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
