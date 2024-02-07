Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9F8C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7C8F400C1;
	Wed,  7 Feb 2024 10:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZmwbUKN8nHB; Wed,  7 Feb 2024 10:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EA3D4040D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EA3D4040D;
	Wed,  7 Feb 2024 10:01:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC44E1BF32D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 982AA4040D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uf_b7Xw2QPqC for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:01:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 54AD9402E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54AD9402E6
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54AD9402E6
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:01:40 +0000 (UTC)
Received: from [10.0.0.63] (unknown [109.133.241.250])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 39D072C83776;
 Wed,  7 Feb 2024 11:01:38 +0100 (CET)
Message-ID: <0662d5f1-1582-480a-a10f-f714586cf546@bubu1.eu>
Date: Wed, 7 Feb 2024 11:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240207084503.11109-1-romain.naour@smile.fr>
 <20240207084503.11109-2-romain.naour@smile.fr>
In-Reply-To: <20240207084503.11109-2-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707300098; bh=DVEeaUZxd231yPbwNHG/8sJcKpidt4UFCyEBLqYt+BQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=aidvM4ESHyvE7b5P4Zhh8t4D6N6EoyUqk1ZsZ6BL0AMQ/VNfI0kxwHiul9kbvwGx+
 aENtySkZOGhgYrzvYhOZIklRtxZpW3w85JycwcKhA+V/gK2JkvMKjfxvMrj9TPIkM9
 zEqbTfZBs89sQJHXa4zEW29kX4ZARodgbNa8rU0Lk38/cmRntuRwS66LG9aYCzfXYS
 2NyT9DBy24uQXZnS1UEa2XkglKUYq6iwpBXJup15z5GTNv9D32Mo6qtHJTpbKvbLXw
 I083MuehB7OOx+sRZIju/OVcZhtgcq0ArOc+fXQtm9TpN+kQqdhswDK2U5NQ4kFSX7
 LpiWLlv50W14Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=aidvM4ES
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-bitstring: add
 missing runtime dependency
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07.02.24 09:45, Romain Naour wrote:
> python-bitstring require python-bitarray and python-zlib at runtime
> since 4.1.0 release [1][2].
> 
> python-zlib is now needed for the "Experimental support for two 8-bit
> float types" [2].
> 
> Fixes:
> https://gitlab.com/kubu93/buildroot/-/jobs/6114047821
> 
> [1] https://github.com/scott-griffiths/bitstring/releases/tag/bitstring-4.1.0
> [2] https://github.com/scott-griffiths/bitstring/commit/70c8af4d8bef557bc7d96f809d37e2c241587dd0
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
> v2: fix commit log about python-bitstring release (Marcus Hoffmann)
>      reproduce the issue on gitlab-ci and update the Fixes tag url.
> ---
>   package/python-bitstring/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-bitstring/Config.in b/package/python-bitstring/Config.in
> index 93d7682577..82d0bb29c6 100644
> --- a/package/python-bitstring/Config.in
> +++ b/package/python-bitstring/Config.in
> @@ -1,5 +1,7 @@
>   config BR2_PACKAGE_PYTHON_BITSTRING
>   	bool "python-bitstring"
> +	select BR2_PACKAGE_PYTHON_BITARRAY # runtime
> +	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
>   	help
>   	  Simple construction, analysis and modification of binary data.
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
