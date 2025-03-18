Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F796C35FFA
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 23:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2099380E5D;
	Tue, 18 Mar 2025 23:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Kkn_fCBvSCO; Tue, 18 Mar 2025 23:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35CD481FA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35CD481FA8;
	Tue, 18 Mar 2025 23:10:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D819C16E
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 23:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBFA540E61
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 23:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgX6puZ-6BXa for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 23:10:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE103410D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE103410D5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE103410D5
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 23:10:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C8E205FF95;
 Wed, 19 Mar 2025 00:10:47 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 19 Mar 2025 00:10:47 +0100
MIME-Version: 1.0
Date: Wed, 19 Mar 2025 00:10:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250226065844.2898647-1-vfazio@xes-inc.com>
References: <20250226065844.2898647-1-vfazio@xes-inc.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <b7e2a131ca94a7aa8ab73fa97d5458a0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742339452;
 bh=6ESw4cpL/I7mf64Jr086Pl0Dm5MzqDk+xtcLDVjmz7c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tMGOgl6o1eavbexYtsG9Wy8EsTJFP5RFZpcaynFqrHa3jogzTU+mNXRhDlPUlkHKZ
 NsTB0dImHL4pWskDtluO6gyWpQt+eT0E/upTzfaT1dD/S68OPqIoD1qFuNQpvaku2s
 uNYQ+QOLQQyqWcxrSJR4ybDijpVqXmax7W1lwtxZTO6mwYZTX3vRm948wg8muYl6JI
 I6tIlt+h1dGED3LWJvfbyn5/IYyjJyZgcAkrrW7yqHBS6PTaTec9InvP3FgEcPploC
 Jo+TIaRK7rR27Oc15wxafoo29hWse32dGQbaUkWzRLjrcp04C4wgXVlm+Yj5DiImlP
 uOcjm+ipord4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tMGOgl6o
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python3: bump to 3.13.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/02/2025 07:58, Vincent Fazio wrote:
> From: Vincent Fazio <vfazio@gmail.com>
> 
> Update CPython to 3.13.2.
> 
> The package selection logic has changed to require time64 support for
> uClibc by mirroring the logic from uclibc.mk (kernel headers >=5.1).
> 
> The following patches have been removed:
>   - Quirking ac_cv_buggy_getaddrinfo on cross compile
>   * This is resolved by always assuming it's not bugged via
>     ac_cv_buggy_getaddrinfo=no
> 
>   - Disabling lib2to3 in builds
>   * CPython 3.13 no longer ships lib2to3
> 
>   - Fix cross compiles when host and target are on the same SOABI
>   * This was fixed upstream [0]
> 
>   - Fixing the MULTIARCH value for musl/uClibc
>   * CPython 3.13 moved to new platform triplet detection logic [1] 
> which
>     supports musl. uClibc does not generate a platform triplet so will
>     not fail the check against MULTIARCH. See also [2].
> 
> One patch has been added that fixes thread identifiers on 32bit musl.
> 
> [0]: 
> https://github.com/python/cpython/commit/909d5ac2959ea88e1d3b38f35676a1c7e5dd44f6
> [1]: 
> https://github.com/python/cpython/commit/c163d7f0b67a568e9b64eeb9c1cbbaa127818596
> [2]: https://github.com/python/cpython/issues/118942
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

Applied to master, thanks.

For info, I also fixed the license hash.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
