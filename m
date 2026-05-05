Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F4BCD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6751160AD3;
	Tue,  5 May 2026 19:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzByat1Ba8Bj; Tue,  5 May 2026 19:19:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F154D60AD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778008799;
	bh=5AySZdS/9buJqw80bXfvWszjbMjj/rGR5vPVw9SWmvU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hdsae9jp2nsiH4KbS5daxnwbCDtolapqPp4b1V1QXxWsZuIXJUk8ow9Edw/sPfTYx
	 yl7HoT5e+WFiFnMMh3YwTehanBP8P+QvDQUOZ8u7f214mj1iB1J/lhA07ODauv9NPZ
	 oAe2KFKs4Ay8W4Z0RJR8/0/zXiG0TanPQsXzD3wOVTbcqmG2+gZ0pL4mF+dSZqE/tX
	 EDWvzjFte4/RMEQIu8Q3PzV9I4+QHYeYnGcGH/iSYxg6H6d4NPBjSLsiivYaboOYo3
	 NzeTxEPyHSMEVFLcSz1RTAOS04gBoFJHknWKkohEhaHcmnPum+BLn6b16sPMWxs0aJ
	 BjLAth6/TnyKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F154D60AD9;
	Tue,  5 May 2026 19:19:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02FD5315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8E3181A12
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDVciG-lXUUn for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:19:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25B9E819FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25B9E819FC
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25B9E819FC
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:19:56 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A8C4E2C88D23;
 Tue, 05 May 2026 21:19:54 +0200 (CEST)
Message-ID: <092c37fc-ee12-44d2-a297-e521261e0843@bubu1.eu>
Date: Tue, 5 May 2026 21:19:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
References: <20260421184831.2576691-1-bernd@kuhls.net>
 <20260421184831.2576691-2-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260421184831.2576691-2-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1778008794; bh=i0WmEUrmACU8/ifi/IAUtsvN887kxHyqIWjnTQxE2lE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=jJ6ahLzg4u7EPSE1p4v5SphkbHkATJp0NfSxjOCw9H0F5sSaVNE0c/x2hnUp8Stbl
 ax+P1/ZXLwaidCw10IAVxncN9EzCGp21qUIy0w6FASxXx3NXYJhUhNjEpLyBLPbbnj
 3Zt0pcS4zF+9H/ss+PJi1o9i5E6MOb0kQ5NmMPX19du7zA7abaipdksVeBGz+AEBiK
 VZ0drljJqFrXCDeGUBRts1CDlj6+ifMmDybBZRr9pN6hyAmFz/oURxY+HRoOYjMVwG
 nVHuLfeNHUvWnksVIrpXCWj5F+IHj7EOglUYKjMn30+VKVYPc8UQHSWNY4V/MXl/ZW
 lbmEgC2JNVQLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=jJ6ahLzg
Subject: Re: [Buildroot] [PATCH 2/2] package/openscap: bump version to 1.4.4
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

On 4/21/26 20:48, Bernd Kuhls wrote:
> https://github.com/OpenSCAP/openscap/blob/1.4.4/NEWS
> 
> Removed patch which is included in this release.
> 
> Added tarball hashes provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
