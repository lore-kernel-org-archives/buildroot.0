Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B824DC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E0B1607EE;
	Thu, 17 Jul 2025 20:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTks0edRFnPO; Thu, 17 Jul 2025 20:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B57DE607DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B57DE607DA;
	Thu, 17 Jul 2025 20:21:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 651441A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56F8D607DA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6UYwX5QJBNI for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:21:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 86A94607BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A94607BA
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86A94607BA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:21:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1E5FDB977AA4; Thu, 17 Jul 2025 22:21:47 +0200 (CEST)
Message-ID: <f8a831f8-bec7-48f7-91b0-e988f008965a@rnout.be>
Date: Thu, 17 Jul 2025 22:21:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
References: <20250714091150.17718-1-buildroot@bubu1.eu>
 <20250714091150.17718-2-buildroot@bubu1.eu>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250714091150.17718-2-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752783708; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=7s5RSc10ez3Q6WH/yRV2ReGYES177xXoNvyR+H77sAY=;
 b=PCXY5zD+FXe0HbysiAKAJGEoEEjrWnGQgp9c+EMyoiFUBXN3Lhrm4dpLxsWr8OssIbY8hn
 9+XVBQh72fId8xR2JpyR9cBpWcM0d1Tot/Ad0J0yV6U2B89ocLejKM6pUeBCIh6Y9UbrAJ
 Nn20vwW00a8Vx7bSnuepaXGRdfwZnyqxAwvLHwJ0vss+YBu+cxGQP/v0fU+WeXiw7ORCte
 8Ey0KF4y+iG2jD3IOHhIQPUPGypCt53Kh7kFAjHh6RaCqZlaZaTVmUhEysgbnty8X7ONBS
 4nNiWkSlVOTSxlFYf02Cc1v19sut3i9U0V1kyLB9lrfBd257/z5VSTJgnFxGhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=PCXY5zD+
Subject: Re: [Buildroot] [PATCH 2/2] package/python-typing-extensions:
 update description
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



On 14/07/2025 11:11, Marcus Hoffmann via buildroot wrote:
> Minimum python version is now 3.9, but also it's not really relevant to
> mention this in the package description.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   package/python-typing-extensions/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-typing-extensions/Config.in b/package/python-typing-extensions/Config.in
> index 35b88f34f1..e1d46b60c0 100644
> --- a/package/python-typing-extensions/Config.in
> +++ b/package/python-typing-extensions/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS
>   	bool "python-typing-extensions"
>   	help
> -	  Backported and Experimental Type Hints for Python 3.5+.
> +	  Backported and experimental type hints for Python.
>   
>   	  https://github.com/python/typing_extensions

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
