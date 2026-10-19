Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFDA606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ayQoPB6k
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E26C60716;
	Mon, 19 Oct 2026 17:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRUMzxr6SPWt; Mon, 19 Oct 2026 17:17:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 849CE6067C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792430278;
	b=VYnTdyh/xCoC2DrJW+czaB5OystyCworyeEbg2WRMGV7TpUthXE+kJkwVYOsJCXwsyn7
	 OJlyLqOOcmIsafYk7WlJE7uXodG3G8QsFiFGIHRustt+goWaW7eIqpmesXqYH/u8JmYFL
	 2kI/SsWCvGzZ5MhvdLga2Bewv6CCSmdP/1V7JxD3N/ZAMJCsRgwT31EYiUMWMakUM18d6
	 f29c+H+rWKujWshqvPJkFnPHiU31xB2hMWFp+ba2NWzL4BAm6XqnwWC1D7VwWXZybBsEF
	 D6bTGuHhbgi6R36MSPwUwb65cm+CkB1WodjpKYDPf/enwGE+z97wUWzmP6BzX3U+SxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792430278;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0lpEcR0rdTijzeuyoySBSDtcwUAtIWdlRosPa6QWf8Y=;
	b=ZnnbrfvRsQgOAFalXD0488T4eszBP9/xlelkr6SaHw99cm5zU6jcn9Q3YuWa7WoD+qpY
	 XnQ3SiVHPHkn4Ew33PRawt164yv1jtkjUz/InOVdvALMPORlm4R3U+WR42qrA4x+nCyTN
	 CiFHEMZ+r4qpTUmqogtcy25oDBPlbd3Q7HZsxR6OCfjArDDbNaGfwVuP2i2Z/tpHiVAEO
	 kyIIKtbv20eCD8WDa6L9bbZmWQVvuujd+ZdEWNDinjxiwJGPAY3tZd5TVusBenhvSn4oQ
	 fp7F4kP7t1Le/WSb6BQ/PrCjbAR6X5J9lX+WB7V1Tf8cBksfIMMhlhSE9fkkcFQBbqw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792430278;
	bh=0lpEcR0rdTijzeuyoySBSDtcwUAtIWdlRosPa6QWf8Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ayQoPB6kkmEyMBOOxFZAdksrsgpTBuYFTumYIJdBhd0izQb8a9OTlUspL9NKopLfE
	 Sd3wNADM71DKl2KIYiep/S6kqFzZxJEeY8X6HLJlBm6BhhFfF/VqXq7VAqaE4kOy1l
	 1PTNL4ApR5asaYI0McRxygxvTcudtX6cT43PEXNsidzYE5xhonVwhotQFHBdrP/IDd
	 8+wUOEGuMoa4hZUT4uVRxPPUKKsiB2sk7nQeWO1dgFHB0LaHcCHKgEuxiEmEK+VtDZ
	 0y4CDaSkev5nl7gO+ER73SEkavXaPW8sT9hMz121SFA0UTorELAJ4npTEbp7G6pA6e
	 qNVu90Hl4Z1rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 849CE6067C;
	Mon, 19 Oct 2026 17:17:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B0321E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C9CF60606
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Rruc0dAToZ0 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:17:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9AB6A6067C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792430276;
 b=ec6L+LEE4t+dRK+gpnjTg2mlAgPORZvW4EP4OqeNTGOmPRBrXAEnrJiYGKxBlIzR2i6H
 GLXw2N2jZxKAK6YxcVQpIfBhOn99WrZC8wWf6ejNZuGKGRq2q/Pd624ABm0VosHgHHkNZ
 ve6Im8IFtAoZOeblUAS3Ojh7zofamWIL5SfkO02Bt35rm1cZ+lUI7U/APiw9+m96jlaeb
 D8cYcWXYWmI1euWwndIYkKTh9RCNG4vPKXQEAOay7QwvKAegzTD95KoCfBEymiw2ZfBRg
 1eQrRs7ZIiBSeAynndF+W1cC80VGXTLbfK8hIDQp9ttBYrPjTIJ9/KyT4WsWMSzU9hw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792430276;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=wqK1jET/eQl57GTdDt53y1iAlYVobB88Loz18zVAVU4=;
 b=nG65bDnToWtpCAzQXZlaoA+0eQk1u6t931RCbFkrtqBykSkUvlhCYSYjS7Z/veLcKpUz
 NMdTR3Yunpry/RaqEbGiG2vMSn3WPiUCXwlxYLPm60cwVxMaPzSfNvVkmCL11bVHg9z1p
 bMKCkmcoLrva8M3i/7XUO+J3m94mxs74Pio0a8WMU7FoyKLYnJDfB9XpXWLS8PsibWWXu
 rKRVbev/F/DLbivxGh/5DWxrj2seUePwEiCAM7sSB0YSP7oMYX9WRbX3le31Tjw1I8cMw
 WNgHGntCVH9K0mwbgPndxxUuo4Nr6m5GduONvywyCESiqbPMnDbHBv+ukosLIN3amxA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BreVjhQQ; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AB6A6067C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:17:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 358EC1A1237;
 Mon, 19 Oct 2026 17:17:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0A26C60582;
 Mon, 19 Oct 2026 17:17:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A7DF910328C5E; 
 Mon, 19 Oct 2026 19:17:48 +0200 (CEST)
Date: Mon, 19 Oct 2026 19:17:48 +0200
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>, 
 James Hilliard <james.hilliard1@gmail.com>
Message-ID: <atZQuKdxCIqtsWnq@windsurf>
References: <20261016123321.7165-1-flaviu.nistor@gmail.com>
 <20261016123321.7165-2-flaviu.nistor@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261016123321.7165-2-flaviu.nistor@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v5 2/2] support/testing: add snappy test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 03:32:59PM +0300, Flaviu Nistor wrote:
> Add a simple test case that imports the module and does a simple compress
> decompress routine.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
