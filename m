Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CC8C83F0F
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 09:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C2EA81ED4;
	Tue,  8 Jul 2025 09:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28T8GbrRw3sk; Tue,  8 Jul 2025 09:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85FCB81EC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85FCB81EC4;
	Tue,  8 Jul 2025 09:16:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD81E15F
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 09:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ED7B60B75
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 09:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHWnxdACZ2we for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 09:16:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7303460A6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7303460A6F
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7303460A6F
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 09:16:12 +0000 (UTC)
Received: from [192.168.178.42] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 232352C845F4;
 Tue, 08 Jul 2025 11:16:10 +0200 (CEST)
Message-ID: <420afe6e-9e01-4f07-be77-f32f9758e74f@bubu1.eu>
Date: Tue, 8 Jul 2025 11:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
References: <20250527152342.4288-1-fl@n621.de>
 <20250531143928.25446-3-fl@n621.de>
Content-Language: en-US
In-Reply-To: <20250531143928.25446-3-fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1751966170; bh=HSB9QjlAKeIdm3WHkZBVIjTkT4Pwoyqn2DVccTHd8Ic=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=GxsGmXTJ5bYXii31OxPkm0V7cYn/MzbuG+FpAQLamlSB01ZUs35Fk/ipGOkXQiHKG
 McQ+tJ5U6AmYjw0Kh8dT0jYkxjIZ6lS/chUheFW2Pmbl3MW0Z/3tafJ33KaQN1DR7v
 qyqcK7SC9/s7Jtace3XF852oQnsVsHQleW6ZD4DwRPlmxKQSQktscJuGQRL/kOYbgm
 RyDdVa+kXi78V+lFpJyilb2A/CefLbseaZRq0snOaqBa7uidQidDo3OOw5YHyClQT8
 MA0Wsz7WsjzKj6A37J+68P98NzEnsXVFhNE1setM5c/6AV+0qiaOy+RYDPv1hoZMcF
 b7aKMxarFKBIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=GxsGmXTJ
Subject: Re: [Buildroot] [PATCH v2 2/2] package/network-manager: switch
 default crypto provider to gnutls
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This looks sensible as well.

On 31.05.25 16:39, Florian Larysch wrote:
> Currently, when both libnss and GnuTLS are present, NetworkManager will
> get linked to libnss.
> 
> The NetworkManager project doesn't recommend one over the other
> officially and has supported both from day one back in 2007.
> 
> Arguments which one to prefer can be made in either direction:
> 
> Points in favor of libnss:
> 
>   - It's the default value in the NM build system, so it would be the
>     preferred backend if both are available and we didn't supply any
>     options to the build process
> 
>   - It's probably the more mature of the two, given that it's being used
>     in Mozilla products
> 
> Points in favor of GnuTLS:
> 
>   - While both backends seem feature-equivalent, the
>     _nm_crypto_verify_pkcs8 function is stubbed out in the libnss
>     code[1].
> 
>   - Both Debian and Fedora explicitly select GnuTLS in their packages. At
>     least in the case of Fedora it seems to have been a conscious
>     choice[2].
> 
> Given what it's actually used for in the code base, the choice does not
> matter a lot. However, since it is marginally more feature-complete and
> seems to be preferred by other distributions, let's switch to GnuTLS.
> 
> [1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/36f8de25c487fe1570a19fe917c85ec065b0339e/src/libnm-crypto/nm-crypto-nss.c#L523-540
> [2] https://src.fedoraproject.org/rpms/NetworkManager/c/29a9c41beafb5e549c10bfb50ee23ee47bdbc42f?branch=rawhide
> 
> Signed-off-by: Florian Larysch <fl@n621.de>
> ---

Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
