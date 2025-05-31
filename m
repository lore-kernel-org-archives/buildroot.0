Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABB6C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A51F40AFB;
	Sat, 31 May 2025 16:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9TA3-LPWRSy; Sat, 31 May 2025 16:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B376240B17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B376240B17;
	Sat, 31 May 2025 16:48:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31DD1127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17F4040B17
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyQqngDU8Q_g for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:48:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 69F4740AFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69F4740AFB
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69F4740AFB
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:48:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B23BC1C00BB; Sat, 31 May 2025 18:48:08 +0200 (CEST)
Message-ID: <e666c7dd-f20b-405f-9ee0-c817a9de3a8b@rnout.be>
Date: Sat, 31 May 2025 18:48:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20250514151255.2316205-1-buildroot@bubu1.eu>
 <20250514151255.2316205-10-buildroot@bubu1.eu>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250514151255.2316205-10-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710088; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+gXeS6UAL7tm2II+NIgRAjxaE5BD+fZALYUUlDfQpBU=;
 b=FZaGwoII6jVAy5DrSESgpBj0O+VNPuwmoNXVzEt5uMmQO2x5o0jfHzZSQHtM0GonfsVV8G
 4OOAzSi/i/73MzEP/eODYoyHu06KLYLlV8ozL00pMcsgiY6AfqaKrLEyn7XX1sd9tab3B/
 HVItC1pPAB5umI8qc5k+meHZlU4LcxwaEmNgTuZH6HRVqcuEyg6TXbwf+z6Qg6K94QcpTm
 ZBfx2QqZam49sbvawFwSAVei35bfeDc9F7ab76x60gEJZFhWcehTx5Gy7R6eqZ/RCC/KeJ
 sEfOPUahjQ1xMDJONqLdSUS77OwwNJff2Cmt+mbGKHYp8NUGmV0yCibg09g9gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=FZaGwoII
Subject: Re: [Buildroot] [PATCH v2 10/12] DEVELOPERS: add Marcus Hoffmann
 for python-pydantic packages
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



On 14/05/2025 17:12, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> added in v2
> ---
>   DEVELOPERS | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index bf1d4b4d44..86a03fb74d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2273,6 +2273,9 @@ F:	package/pico-sdk/
>   F:	package/picotool/
>   F:	package/python-immutabledict/
>   F:	package/python-jc/
> +F:	package/python-pydantic/
> +F:	package/python-pydantic-core/
> +F:	package/python-pydantic-settings/
>   F:	package/python-ruamel-yaml-clib/
>   F:	package/python-typing-inspection/
>   F:	package/python-tzlocal/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
