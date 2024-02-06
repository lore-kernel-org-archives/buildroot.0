Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E56C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26D4661142;
	Tue,  6 Feb 2024 17:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26D4661142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CgzwJfqlVwdG; Tue,  6 Feb 2024 17:04:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8041C60B8E;
	Tue,  6 Feb 2024 17:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8041C60B8E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2EA41BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B75E4046D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B75E4046D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cnak2xxXBuQ4 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:04:43 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 076F640530
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 076F640530
Received: from [192.168.17.123] (unknown [85.119.216.19])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C7FBB2C80CDD;
 Tue,  6 Feb 2024 18:04:40 +0100 (CET)
Message-ID: <d56a02ae-30d4-4a92-9a2d-953f75b36422@bubu1.eu>
Date: Tue, 6 Feb 2024 18:04:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240206155140.2351424-1-romain.naour@smile.fr>
 <20240206155140.2351424-2-romain.naour@smile.fr>
In-Reply-To: <20240206155140.2351424-2-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707239080; bh=PPq1o58fleE06nr2HGnTHMA94KlANN0X5F7+o4h7RxQ=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To;
 b=qqd+be6s1h1/PEumkRMSXCekyReWedyzn4JgF4PMRlanH21+pVvcVcv0zOlA9uwxW
 NfMSuJOss/U3n01MgM1To57/JSkqRiARoNhJOplLosrg4aLwKrpCkOUZZrRFzEuu/w
 PgToenYcd0wyEXUx3bYWNyROtbWXI6dnGIHEnvznqJ/+9NtsSObtMr+RbllRa7lIDD
 2Q1H6Wscg9uDbjb3ZjWmOilbyUPN22EZjH0xVP4LmSGhv/0kRk9ppt9D+eqkbrQOxQ
 MPFptCo/WTwxXadLj9/hcQJL5DcN6EE1nKcOwctsUzpnXAp0Yn0x/YD6J8sEDge6P4
 kKZFCFr6sT5kQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=qqd+be6s
Subject: Re: [Buildroot] [PATCH 2/2] package/python-bitstring: add missing
 runtime dependency
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
Cc: james.hilliard1@gmail.com, Romain Naour <romain.naour@smile.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Romain,

On 06.02.24 16:51, Romain Naour wrote:
> python-bitstring require python-bitarray and python-zlib at runtime
> since 4.0.1 release [1][2].

I needed to look at the version numbers 3 times, but this dependency 
actually got introduced in 4.1.0  :-). [1]

> 
> python-zlib is now needed for the "Experimental support for two 8-bit
> float types".

Is there a reference to that somewhere? (I know, nobody documents their 
dependencies on internal python modules, but where is the quote from?)

> 
> Intended to fixes (fixed locally):
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6104227183 (TestPythonPy3Bitstring)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854810 (TestPythonPy3Crossbar)

This test failed for a different reason: It ran with bitstring version 
4.1.2 which included a bogus python file with invalid syntax [2] which 
the pyc compilation step stumbles over. The version bump to 4.1.4 
already solved this.

[1] 
https://github.com/scott-griffiths/bitstring/releases/tag/bitstring-4.1.0
[2] https://github.com/scott-griffiths/bitstring/issues/293

> 
> gitlab-ci reports another issue at build time not reproduced locally:
> 
>    *** Error compiling '[...]/TestPythonPy3Bitstring/target/usr/lib/python3.11/site-packages/bitstring/plugin_test.py'...
>    Sorry: IndentationError: expected an indented block after function definition on line 6 (plugin_test.py, line 8)
> 
> [1] https://github.com/scott-griffiths/bitstring/releases/tag/bitstring-4.1.1
> [2] https://github.com/scott-griffiths/bitstring/commit/70c8af4d8bef557bc7d96f809d37e2c241587dd0
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: James Hilliard <james.hilliard1@gmail.com>
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
