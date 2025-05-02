Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C96C3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31255416FF;
	Fri,  2 May 2025 11:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_9B0fykhNpB; Fri,  2 May 2025 11:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F7F6415E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F7F6415E3;
	Fri,  2 May 2025 11:10:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9F21EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D709C41718
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHRQILqIBblJ for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:09:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08AC041521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08AC041521
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08AC041521
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:09:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0CEDB1C0F8A; Fri,  2 May 2025 13:09:57 +0200 (CEST)
Message-ID: <e7ece375-b863-4a70-925b-ef691da042e9@rnout.be>
Date: Fri, 2 May 2025 13:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Julian Scheel <julian@jusst.de>
References: <20250424205751.4111803-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250424205751.4111803-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746184197; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=hByKrCyjRRVRcIQPeSGjzh0Sig9OK591E+5p/fWOU00=;
 b=l56hjc8Q2cdDb44r0WU6X/eSzeeej29XNAG8wguMHW0C8gO/hXjxGLdtQuQ0B9PUV9IZpb
 I5j91bmDUcAeH83OBAhrAghnUuJQgAAhKDM1rIggX+oMSEdkCrDN94tvO5Dc3McJlu5+lV
 MrXCsJHG0yGwh/ffIZxHY92CBkZF2IWhby2yYB9DwTrS0X8L9bn1tis9OFnalU6tPi+cS5
 ZAaUAvvLtqvo9lb6kFpSau7BR6Z/adbJ+ar/1PlHe4vSgpRgKW2O651LkINPB+CwKZ9PB5
 2W5Q9+pp/mlu7qKumWm3NtTZTYCRxoPZ8g3tawUQB9YaTn/cvhZe4uP618AEkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=l56hjc8Q
Subject: Re: [Buildroot] [PATCH] package/cryptopp: add upstream URL in help
 text
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/04/2025 22:57, Thomas Petazzoni via buildroot wrote:
> The upstream URL was missing in the help text, so add it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/cryptopp/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/cryptopp/Config.in b/package/cryptopp/Config.in
> index 1648a73f9d..95f930c8f9 100644
> --- a/package/cryptopp/Config.in
> +++ b/package/cryptopp/Config.in
> @@ -6,6 +6,8 @@ config BR2_PACKAGE_CRYPTOPP
>   	help
>   	  A free C++ class library of cryptographic schemes
>   
> +	  https://cryptopp.com
> +
>   comment "cryptopp needs a toolchain w/ C++, dynamic library, wchar"
>   	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
>   		!BR2_USE_WCHAR

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
