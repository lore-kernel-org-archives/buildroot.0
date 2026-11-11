Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCEF606B7A1
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 18:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aUStA5zJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5769B60784;
	Wed, 11 Nov 2026 18:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqlcEVABrM_8; Wed, 11 Nov 2026 18:13:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 56305608AD
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794420821;
	b=VrVl6HZjTN3NjqXJiI5OgBpUBTk9gldUIzJkCjs6JZVsuvYAIIe+PCErfZsIXUB5Ae62
	 5O3eLH9QaWJTQ87lhLR2PFIsgbEx4urTI+IqPv/MH5h9O0Eh4mj3cNaMx81Cv7aC8Pgw5
	 8TZUB1/fZolMVQB3iUDUyLPdS6rHbxhx+XUqi/Q8WsD2luRqdgv19yXOI1pmmO2so3+xx
	 ofvhJJu6yI/EOkUHAyDfYUloUH5ob4YVZcXP2hMORnXfnl+QWcZ+eX+IyjLAUDVPIGvgL
	 M7FqXvZvqacHCHhKW8haoHpuMWarEG1esPUbi6piizv4CAaSpJkli7Cz4c/4Kdsd2aw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794420821;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=SirlLBhZugLkSXmbYsqPh5YYmitWgtq8ZZ1Ialkd8kc=;
	b=N9aHyicJG8e2J5xEf7x9tp9LkET1JQoHBcZtWCZZ96FlxJNFGzaqn2yFEA3qxQCTzMdC
	 fHzEdy6N/rdTg7Z56Qhj38gaz40ALcB35hZL9hYYBMwtUUkWEmTbrAMTlcC0/gndhoLuL
	 BEXN5CjooGPlZw5S/BKDxj7tw3cG5Jt3kRZbcq2l2BuFmU+AJBQKIwP6RRSMFpFRXV/yT
	 WcAiKK2+mNDRqJNRCgOYMtFFQNjNS08AO8kE3tOpctcQdYYWoc9t3zGuHZiGkGBn4VyBw
	 79vQ3YMNBycAhuNxcaYnGMEeynpFQJShXT6MXtt46qfE0uDYtWPWaz0fxahDL1un8+w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794420821;
	bh=SirlLBhZugLkSXmbYsqPh5YYmitWgtq8ZZ1Ialkd8kc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aUStA5zJ2r6oTdU5laC0ZMJpY4Mdn95uv7+04qQDt4dC+wcOjQ32+Clm5g2t2fhWk
	 7VH2iod4kFyCwXr8uX0wb59FGq5V07cONuwJpJICPtC9Bg0l10uW1vS0qS9Rt3KlU+
	 IM3Bh4SfMaTBCZ/cL/M71k3vFtc2KiNy16iAUVuOEYsgO3wBhTR2kh8kRD0jEkQVQD
	 xOY0RE6i1RqmbNRsUpWp2LQdCvEhpPok9roCqrzdSKLCazyyrW3S9ehmBPc5BFzhur
	 7QYlLK99oX1PHcUEXWA4hN2n+pnsBhAeFU3AnEZIsvYYYg9s1JEXiIFKLJpqTWkS3u
	 j2jaKqKkEf+Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56305608AD;
	Wed, 11 Nov 2026 18:13:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8971731
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72E2660784
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0p1iyqpP_tVW for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 18:13:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 54A35608F4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54A35608F4
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:13:24 +0000 (UTC)
Received: from [IPV6:2a01:e0a:1164:dba0:bf0c:75c5:43f0:4c00] (unknown
 [IPv6:2a01:e0a:1164:dba0:bf0c:75c5:43f0:4c00])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 027241847FA;
 Wed, 11 Nov 2026 19:13:20 +0100 (CET)
Message-ID: <46b07dbb-29c3-4663-a7e9-343bcede2416@grenoble.cnrs.fr>
Date: Wed, 11 Nov 2026 19:13:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>
References: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
 <20261111154553.673632-1-angelo.compagnucci@gmail.com>
 <20261111154553.673632-5-angelo.compagnucci@gmail.com>
Content-Language: en-US, fr
In-Reply-To: <20261111154553.673632-5-angelo.compagnucci@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 5/6] boot/at91bootstrap3: find the
 memory@ node of Linux device trees
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello!

On 2026-11-11, Angelo Compagnucci wrote:
> Before booting Linux, at91bootstrap 3.x sets the memory node of its
> device tree, which it looks for by the name "memory": the Linux device
> trees name it memory@<address> (e.g. memory@20000000 in
> at91-ariettag25.dts), and at91bootstrap stops before booting:
> 
>   DT: doesn't support add node (memory)
>   SD/MMC: Failed to load image
> 
> Backport the fix of the 4.x series.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
> Changes v1 -> v2:
>   - new patch
> ---
>  ...w-name-of-memory-node-in-device-tree.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch
> 
> diff --git a/boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch b/boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch
> new file mode 100644
> index 0000000000..ef6f5e14b3
> --- /dev/null
> +++ b/boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch
> @@ -0,0 +1,31 @@
> +From 72da9d23ed07bbfc793d767dc5a4044cc0a95706 Mon Sep 17 00:00:00 2001
> +From: Xing Chen <xing.chen@microchip.com>
> +Date: Fri, 24 Sep 2021 10:47:35 +0800
> +Subject: [PATCH] lib: fdt: adapt new name of memory node in device tree file
> +
> +The name of memory node was changed from 'memory' to 'memory@address'
> +in device tree files in Linux. For example, 'memory@20000000' .
> +This commit checks if the memory node is named 'memory' or it has a trailing
> +'@' .
> +
> +Signed-off-by: Xing Chen <xing.chen@microchip.com>
> +Upstream: https://github.com/linux4sam/at91bootstrap/commit/72da9d23ed07bbfc793d767dc5a4044cc0a95706
> +Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> +---
> + lib/fdt.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/fdt.c b/lib/fdt.c
> +index 8d1fdfdc5..aa20426c9 100644
> +--- a/lib/fdt.c
> ++++ b/lib/fdt.c
> +@@ -254,7 +254,8 @@ static int of_get_node_offset(void *blob, const char *name, int *offset)
> + 
> + 		nodename = (char *)of_dt_struct_offset(blob,(nodeoffset + 4));
> + 		if ((memcmp(nodename, name, namelen) == 0)
> +-			&& (nodename[namelen] == '\0'))
> ++			&& ((nodename[namelen] == '\0')
> ++				|| (nodename[namelen] == '@')))
> + 			break;
> + 
> + 		start_offset = nextoffset;

Doing a test build, I got this:

    >>> at91bootstrap3 v3.10.4 Patching

    Applying 0001-include-types.h-conditionally-define-bool-false-and-.patch using patch: 
    patching file include/types.h

    Applying 0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch using patch: 
    patching file lib/fdt.c
    Hunk #1 succeeded at 277 (offset 23 lines).

It appears the line numbers mentioned in the patch are incorrect: they
match the code in the 4.x branch. It's not a big deal, as patch manages
to find the hunk, but maybe the line numbers should have been updated
when backporting the fix?

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
