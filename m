Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365C9EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 18:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3DA341829;
	Mon, 10 Jul 2023 18:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3DA341829
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6pUU3o5bXEoZ; Mon, 10 Jul 2023 18:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9396417FE;
	Mon, 10 Jul 2023 18:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9396417FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6866B1BF3AE
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EFC840B6D
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EFC840B6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id da3cfFRSTbLs for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 18:32:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24CD140B5D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24CD140B5D
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 18:32:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27DE360004;
 Mon, 10 Jul 2023 18:32:11 +0000 (UTC)
Date: Mon, 10 Jul 2023 20:32:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230710203210.6422a277@windsurf>
In-Reply-To: <20230618123214.163979-1-bernd@kuhls.net>
References: <20230618123214.163979-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689013932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SaZmDkCqhabbsY+3lMRhF+zA0ifa/T5XP/1US5V5jYM=;
 b=hzP+23QHl1eCdL7N/60Fd77mQS/ZoBEqxYVScLkcbbJXFsei8WFujNi1BhqiY7Hq8tTJxl
 X9pbmaqppZSpLfjefAuWEfzVzrBVzLdeGIK2Fi86rPxVh7zY1HEqKqyqFPZ6lIReUgW8L0
 PTv719BKzTXB6XJuoJeGqhEYR5CSLf5XaCaotPpn5k/Qv1lOy94PjIjFdk2oINC8ZFOEXG
 cK5UnMN4s95o7boLy1yQ0m6lnpJ2/qRtxEJ53nvFoIRPQ4xXzmwmOyyOhVtObk05M/jaYR
 TL4SrNnivX5TrZHdruoRom/NyUmgQ94jsaiwOV1MzcF+gDj1MLL80AkPOk+zww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hzP+23QH
Subject: Re: [Buildroot] [PATCH 1/1] package/gkrellm: link with -latomic if
 needed
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

Hello Bernd,

On Sun, 18 Jun 2023 14:32:14 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/5df/5dffba341cfe5e4d41b3c88e58d92b0747318c07/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/gkrellm/gkrellm.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
> index 2a68722663..c9748eb084 100644
> --- a/package/gkrellm/gkrellm.mk
> +++ b/package/gkrellm/gkrellm.mk
> @@ -12,7 +12,13 @@ GKRELLM_LICENSE_FILES = COPYING COPYRIGHT
>  GKRELLM_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
>  GKRELLM_BUILD_OPTS = \
>  	STRIP="" \
> -	SYS_LIBS=$(TARGET_NLS_LIBS)
> +	SYS_LIBS="$(GKRELLM_SYS_LIBS)"
> +
> +GKRELLM_SYS_LIBS=$(TARGET_NLS_LIBS)

Spaces around = needed (fixed when applying).

I've applied, even though I don't think this is the best fix. Indeed,
gkrellm uses pkg-config to detect glib2 and to get its compile/link
flags. So the -latomic should be coming from the glib2 .pc file,
instead of having to be propagated manually to all users of glib2.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
