Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78B1EE4992
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 20:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A4E283AAD;
	Fri, 18 Aug 2023 20:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A4E283AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OSWm9u4EziRW; Fri, 18 Aug 2023 20:03:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ED5F841BE;
	Fri, 18 Aug 2023 20:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ED5F841BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACC001BF33F
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 20:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62BBD841BA
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 20:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62BBD841BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZGien7Vo-ZS for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 20:03:19 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA47B841AB
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 20:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA47B841AB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AE95240002;
 Fri, 18 Aug 2023 20:03:15 +0000 (UTC)
Date: Fri, 18 Aug 2023 22:03:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230818220314.3178c964@windsurf>
In-Reply-To: <20230818151608.988723-1-bernd@kuhls.net>
References: <20230818151608.988723-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692388995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=40UyyH341mX0H4nWrPpDlB60pfNrLG5Bkqo003cE470=;
 b=deoCTFxFG2Da+Uc1VtVmj6fovX8+YPFlCnIt25frtOEN1efpEOC6qJmleD/mRbsyBEF/dj
 iMyI077jUNO5m5PckAxbufrh4bWVwYkzBJgFIY5nAYG+Wpi5OgbcHBhmIqreIugNe3WcsM
 RqewZisPpuDizEbA/l/7ao8+jXuSzRUqwY1rZ5eY9suoDFjEqQ8Q/lI/udXSePdUTpG9cC
 hNARAHUQUWbab5XEKDzoO9fpgyudM18rXgeg3+oSJ4kUXDff19XJcYD1r6Ns5uuOPgIxM5
 S8SMr8cyQdkVrvYqYuEbozew2lC1OKJS+ZL6VlvX+WjUoeFd3M+BHCD+39Oiew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=deoCTFxF
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix typo in
 make target .stamp_built
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

On Fri, 18 Aug 2023 17:16:08 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> This fix can be backported because the offending line was added in 2009.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 5d1c1da128..9d40754939 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -286,7 +286,7 @@ $(BUILD_DIR)/%/.stamp_configured:
>  	$(Q)touch $@
>  
>  # Build
> -$(BUILD_DIR)/%/.stamp_built::
> +$(BUILD_DIR)/%/.stamp_built:

Note that double colon rules have a specific meaning in make:

  https://www.gnu.org/software/make/manual/html_node/Double_002dColon.html

I've read a few times the page, but I'm not sure I fully grasp what it
says, so I don't know if the double colon was intended (and needed at
the time) or was a typo.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
