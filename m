Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E78CD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14D96606BF;
	Mon, 18 May 2026 18:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGaIsgg_isw3; Mon, 18 May 2026 18:13:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F19D606B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779127985;
	bh=jwCsXSy+UFxWa7NwQIhtD3PQRmce327y7w2Zrjd5ljU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QjpU58NKCGjx37/+HAhaUW0Pa2t9AliNWIp5D7YYygmP/iuCUti43ZAYTkIbntU0M
	 bQnYzVuFNHw7nAMS/vAgeGuyIMAWmDYEkkAuU4bgC2b6X58ka9rNKL2v7Jco5+YUSf
	 4UhzGlUlrVd+2OEkfasKhqaJbD7OocN76G5uR6oKbWScDT/ACNJWS/3PFrEEg6NsAZ
	 O36Iq9LcdEtaQF3TxiYLVBrnGLz0bjDVOwVTiSt81VN3O1OlYqU1LQ/fRnWq7PvFoT
	 oXXSo3dwYY3bPQazXwbO77hEpDZoE7nAtsntXm7Wsv4jeiQHV1w+UUr/kg8SpO00Ff
	 LfdbwuSmLup5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F19D606B4;
	Mon, 18 May 2026 18:13:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 943531B2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79DFD80CF0
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwAOENDNS29q for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:13:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 664A980CED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 664A980CED
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 664A980CED
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:13:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C2DE8B97BDDC; Mon, 18 May 2026 20:13:00 +0200 (CEST)
Message-ID: <01e1c6ce-21db-48c1-b6fe-1894b1f881bb@rnout.be>
Date: Mon, 18 May 2026 20:12:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20260518173643.52118-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260518173643.52118-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779127981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=oNEf+D/Nr3F39hWcoYdJT7s8c9lJTFw9K2PBOjvdFi0=;
 b=X6EvZsepl6wEyqFM429IdIkzU7CPmg5tHfNmBb9tPpdAwdxzlus+uL3MnyBEJR0nxKpZMY
 p1+X+COOCHecWpbamxkfyBnLfc/UWVMk9LMu1ZdmcM4pJ2TIIT5Nu7LlAEfawHxm6MAP9v
 UVoVQ220IO3h5DnuT03dgs4aSafjf7VUsJ3DOioAeNTj1rt0D5cd/TPXpFWqZZ3e5U1fBG
 xAQvTLzYI2v7kcdOl5MqcjRr/lFkTC8y2A9EYkZOCGOW9t5SxKqm9YgTRGFaOyITPV2q19
 ATh1HsBECQIrg5vPNoJwNyJiZfodbmUWArIzYy4GXPv73t+NRTZ0hAXWJu0y3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=X6EvZsep
Subject: Re: [Buildroot] [PATCH 1/1] package/python-google-api-core:
 propagate python-google-auth dependencies
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



On 18/05/2026 19:36, Julien Olivain via buildroot wrote:
> Fixes:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_GOOGLE_AUTH
>    Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
>    Selected by [y]:
>    - BR2_PACKAGE_PYTHON_GOOGLE_API_CORE [=y] && BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS [=y]
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-google-api-core/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-google-api-core/Config.in b/package/python-google-api-core/Config.in
> index 5ddc8b3b22..88bc8326b5 100644
> --- a/package/python-google-api-core/Config.in
> +++ b/package/python-google-api-core/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_PYTHON_GOOGLE_API_CORE
>   	bool "python-google-api-core"
>   	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-proto-plus
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-google-auth -> python-cryptography
>   	select BR2_PACKAGE_PYTHON_GOOGLE_AUTH # runtime
>   	select BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS # runtime
>   	select BR2_PACKAGE_PYTHON_PROTO_PLUS # runtime

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
