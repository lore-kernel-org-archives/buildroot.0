Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB888EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 11:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AC6C60FE9;
	Mon, 26 Jun 2023 11:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AC6C60FE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KP7RQiK8QpyM; Mon, 26 Jun 2023 11:17:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9090660FBD;
	Mon, 26 Jun 2023 11:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9090660FBD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FC201BF388
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 11:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 470B041600
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 11:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 470B041600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4kRUEMSCGnCI for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 11:17:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4C0D415DF
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4C0D415DF
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 11:17:19 +0000 (UTC)
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C678E000A;
 Mon, 26 Jun 2023 11:17:16 +0000 (UTC)
Date: Mon, 26 Jun 2023 13:17:14 +0200
To: Charles Hardin <ckhardin@gmail.com>
Message-ID: <20230626131714.4bef3bde@booty>
In-Reply-To: <20230620172305.4176-1-ckhardin@gmail.com>
References: <20230620172305.4176-1-ckhardin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1687778237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFKD+9oMN/GlAMO/txfpuy474Zs/OwEwlLH6RORL9xc=;
 b=NkMuQiN3fqCnXeIsD8GNfTrxeEF5Ad41kO9u0qyG1ebccka8Gqa5m0FUaQ6zoGDfNxonZg
 WxO5tRtYPGirDBtaYIGwce6XPaacCbMLl5UlCAIzVzISKBNLFgjNNSw0R1gPJG6o86g6e5
 Zj3RcDsC/Ovg3AEOV4I3ZpDQwxfC40UZ14sH6hzcGJx7GQ96Cot/8LD9VGG3MjPsPemBqy
 cAeZ0A7zj20bJp73N9uc7X+gKO7Cevtj58ttGqRNafPqB4hbEOHriRVQntdtPTus3c6zAI
 KWMyUMnxL957LWx1WQHzUOqU9PCgGzG+bkzAECRo0wKEarYhEV7tR5WkbE2gVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NkMuQiN3
Subject: Re: [Buildroot] [PATCH 1/1] package/unzip: configure with
 LARGE_FILE_SUPPORT by default
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Charles,

On Tue, 20 Jun 2023 10:23:05 -0700
Charles Hardin <ckhardin@gmail.com> wrote:

> Buildroot always enable largefile support in the toolchains, and
> thus the associated definitions are always on. This leads to a
> problem in the unzip that on a 32-bit arch with these flags being
> passed in
> 
>    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> 
> But, the LARGE_FILE_SUPPORT not being defined will cause a size
> mismatch on the comparison of the zipfiles.
> 
>     $ unzip test.zip
>     Archive: test.zip
>     error: invalid zip file with overlapped components (possible zip bomb)
> 
> Simple solution is just enable LARGE_FILE_SUPPORT in cmake to get
> an expected extraction.
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>

I verified that the problem exists using qemu_arm_versatile_defconfig
and that extraction works after applying the patch.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks for the fix!

However I have a note, see below.

> ---
>  package/unzip/unzip.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
> index 44cc2013fb..14ccedd48f 100644
> --- a/package/unzip/unzip.mk
> +++ b/package/unzip/unzip.mk
> @@ -28,4 +28,18 @@ UNZIP_IGNORE_CVES = \
>  	CVE-2022-0529 \
>  	CVE-2022-0530
>  
> +# unzip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE when
> +# necessary, redefining it on the command line causes some warnings.

"causes some warnings" -> "causes extraction errors"?

> +UNZIP_TARGET_CFLAGS = \
> +	$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
> +
> +# unzip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE when
> +# necessary, redefining it on the command line causes some warnings.

As above.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
