Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C10ECAAA1
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 07:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA53540893;
	Mon,  5 Sep 2022 07:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA53540893
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K0b690VXRvSQ; Mon,  5 Sep 2022 07:02:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCAA040650;
	Mon,  5 Sep 2022 07:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCAA040650
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6979B1BF334
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 07:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20ADF40146
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 07:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20ADF40146
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iz11UQywoWAc for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 07:02:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B500C4012E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B500C4012E
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 07:02:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D9CD2000F;
 Mon,  5 Sep 2022 07:02:20 +0000 (UTC)
Date: Mon, 5 Sep 2022 09:02:19 +0200
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20220905090219.47aaf9ca@windsurf>
In-Reply-To: <20220904201429.1480971-2-geomatsi@gmail.com>
References: <20220904201429.1480971-1-geomatsi@gmail.com>
 <20220904201429.1480971-2-geomatsi@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1662361340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4Pdq3F65cKhNmXEG5aA2bG02LsbnFB8jH4lYIuuLB4=;
 b=mmIWbtZljm96VgIR5mvd7WKqtm5U1Ta0t8w0G2SwI6yf3ahh2mG6wZRiJ1aNxv/T5JNQf6
 OWL8ioG2TiO3cNfIq7+nmOczQiRCWE5LWyXCnCgyVb/a4RNZ3RJ735EHmeXub31tX2tKvl
 zhu9TrFe/jfh5bUCygqEg04zd7k8BzUF2k3Afgeyt7cREcn/4ZKQ/547YrvwTq2oTZM5Hh
 W8PVUL60oPiqrrxb5pgM4tgCaxlVsExMxnkpeT2UwOB3qva511uxJs78zEwF9aydYFfP4S
 SDEU/2/MFLpwbIsOEnWfqI51kmzwF5z94BwszrHmwJFstC4emtFQjEJGPjUZMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mmIWbtZl
Subject: Re: [Buildroot] [PATCH 1/2] package/hostapd: disable build with
 static zlib-ng
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  4 Sep 2022 23:14:28 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> Static linking fails because both hostapd and zlib-ng define functions
> with the same name 'crc32'. For now do not allow to select zlib-ng as
> zlib provider for hostapd in the case if static libraries are enabled.
> 
> Fixes: http://autobuild.buildroot.net/results/9901df820d3afa4cde78e8ad6d62cb8ce7e69fdb/
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  package/hostapd/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
> index f4206ceea5..3a88a9d276 100644
> --- a/package/hostapd/Config.in
> +++ b/package/hostapd/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_HOSTAPD
>  	bool "hostapd"
>  	depends on BR2_USE_MMU # fork()
> +	depends on !(BR2_PACKAGE_ZLIB_NG && BR2_STATIC_LIBS)

Thanks for your patch. However, we generally don't like to add such
weird dependencies. Instead, we prefer to fix the actual problem:
hostapd/wpa_supplicant should probably not define a crc32() function,
but use some other naming for it.

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
