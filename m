Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0702ECD4F54
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 20:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEFE660BE4;
	Tue, 19 May 2026 20:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VDlMTMz6JRK; Tue, 19 May 2026 20:50:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE00F60BDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779223803;
	bh=wB55Sw9H1ov/C+DJI0pbqq8hWAeLrdLGyJwU3cuz7pk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eNtd3QdeW1wHOEeNjY2qBfmH338s+0GzMD8ABVyQwmmyg1PtI/AmxwENMdS1se2D3
	 add1SPzhwX2XDVioS8eg3n7Qh1nIFyrS1Z7KpgnYksQp+JzfjX3/ozQO4wv2LU/fzb
	 X5h7kv6wVRbhIgYi/ev8IIllutXz4lEZB1T/Mc90Z9KWhGENEO6/N/is0bC+fy/MIA
	 G/UttXtolWSGmzvzqVrV1CPmhs2uNKuRxMqEoWOoAixPHQEHZ4d1H1Q7aSFctAtOy6
	 t3phPksjNKbseD2tdMLY225M/PomdClrXNHr2qfeLd0pEilSSSUxxN4xqEN8zcYLfo
	 G/MOElH2Tw9nQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE00F60BDE;
	Tue, 19 May 2026 20:50:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC67C265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1BDE4056E
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0J7p8-n0QaO for <buildroot@buildroot.org>;
 Tue, 19 May 2026 20:49:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 315C340208
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 315C340208
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 315C340208
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:49:58 +0000 (UTC)
Received: from [192.168.11.192] (ip-109-42-117-151.web.vodafone.de
 [109.42.117.151])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B89F02C86EC7;
 Tue, 19 May 2026 22:49:55 +0200 (CEST)
Message-ID: <4d31d112-c1d7-4673-aabd-059a54f84d90@bubu1.eu>
Date: Tue, 19 May 2026 22:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260519182049.890882-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260519182049.890882-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1779223796; bh=0W4OzfEXnm1RRhD1OCYoIARnotjuj048sQexTGeQVqY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Fej8TZAmiWzxWw5wVzZ6u4zl0TsLM46djDm68Iitco4j/Ak7OSAOCkX7cD4diW2Yx
 qBer9OzTuSdIq7D6u3DWloER95M1/FBKfZnkK5bz9bzoAJIAsdI4449q4YAJdbHPYj
 8nKd+4n+X6TMNHw1XAL43bP6WqSHe50jhTpw5WcO51ulQJmBpGR6ZRgBQEESONb7NX
 LzQNGQCS27O/g4QZ2Q7hM0P3Nlsko4L/qiPozV+3aOe/ix8COcDEGMiHscqmtxPk/E
 TrvCJzILN0mtAY3qg9k/OgUT8mHk2flq2nBpOwJhgIm+S9mzAckj829HoVSNjF5FXL
 0FKHXAUvJL0lQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Fej8TZAm
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: security bump
 version to 2.42.1
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

Hi Bernd,

On 5/19/26 20:20, Bernd Kuhls wrote:
> https://www.kernel.org/pub/linux/utils/util-linux/v2.42/v2.42.1-ReleaseNotes
> 
> https://www.kernel.org/pub/linux/utils/util-linux/v2.42/v2.42-ReleaseNotes
> "Security fixes:
> 
>   CVE-2026-27456 - mount(8) TOCTOU symlink attack via loop device.
>     The SUID mount follows symlinks when resolving loop backing file
>     paths. On systems where non-root users are permitted to mount loop
>     devices (via 'user' option in fstab), this allows access to
>     arbitrary files.
> 
>   CWE-190 - Integer overflow in libblkid parse_dos_extended().
>     A crafted MBR disk image can cause uint32_t wraparound in EBR
>     chain processing, causing reported partitions to not match the
>     on-disk layout. Tools like udisks may then register a partition
>     at logical sector 0."

Both of these where also fixed in 2.41.4: 
https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.4-ReleaseNotes

So as far as I can see, this is not a security bump.

> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
