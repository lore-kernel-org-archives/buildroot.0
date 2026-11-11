Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65D8606A336
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 16:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MSicsPzs
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13D098144A;
	Wed, 11 Nov 2026 16:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-dzVu37NCUk; Wed, 11 Nov 2026 16:50:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4EFE18143D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794415802;
	b=CsFTUFB0JE475YltdOzP4x7fl1PODj+8uVvpV0hYE8+ex9tq3xvlOnWfg44Ls+1CKQzX
	 Uo4izXHZHZaRy5DJychyOAaSmInWpS1nExV/6qfPQ5qakRN7RFAFLdnRxwIhk+KKpkarF
	 CY+XoEqDYU5wFbXfaX4xzN29HinXGfBJmdi3lw8ldQvBXgATy/xc5Wp1+tNVHCRX+Ajs+
	 qQvoCl46hTZvUPQ6U1HYI7rYAJkVTEe6MYpmtVAWWJfkrfTPN/hLXYu2zcbw86y9W1jm+
	 HfpS+qj3gTkuylms/AndRbn4LJLk50nB/fTnXq5q8C6TJlekPaLJtugl79X+27CSTNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794415802;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=f56BcWoOXzRWDTlAkLGqrx+2bgWR+dVrIkjoWE7z2Mw=;
	b=ptx3iPxXJTJGQD1SaclShIe08BZ3rzFLS9ZdcfjLeqsDHS2eXEdUwAD/xhGinJdtwqb4
	 qg4Qg8ZfgKfjMLiKwK0moWoF48/8Ao4tWdHlht7md8MyJLnUcitJKheoQs+BpNWR8fn8P
	 agdE8aelcak9lWZHJA73XzEOMYInsgMQlF1ax3jnpR9EYV+wtKqHq2FhsciGUR1QaCiuS
	 5pjqXszgbq0Ys8O+r6ypDwbM8VfFsRw9T0MS80ZPIxxdm+yoE2ZvufSe+SKtM2qzhvJSA
	 ZPn5pawABSsJmj30Y7Xj0fQWjoZhZB6Vm6ZhYHOIXOlAopItfOk8+h9oMa64BMz1Jig==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794415802;
	bh=f56BcWoOXzRWDTlAkLGqrx+2bgWR+dVrIkjoWE7z2Mw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MSicsPzsyMWAOOVWhB83D1oG6agQ8Gfgi8dF77sxd9uKgvRQSoDJWq4CcsFstX9wd
	 u1kVm9ay/XJRl6tg0SDEH3LjHmzts4DsX5zDCFZiuMtcyMXuK9FYYbPoPxvE8/MtzJ
	 UTDugHe0of2gwP2rPP3x2Btn8sSVVH4VuaQ8Egvs4uT3lyJ4Uv1yXNCJkjm++0h/b4
	 UdalCeoZYz05LiMn2s0FaHc9UE8T/eB60iWeuaXIpVDpYMn1pK9EyV455aTSsPZQ3z
	 qj0jqJnBXVbzTOtXacvT9LNHW/AhQ7jafNkc3ge60vlYHuabg2t9R/33mqRl6UrXgo
	 xo17j/fC5RP2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EFE18143D;
	Wed, 11 Nov 2026 16:50:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53323731
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 16:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39874606A7
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 16:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQZ8RtZQuJU4 for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 16:49:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A857A6088D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A857A6088D
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 16:49:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 936C42003A4;
 Wed, 11 Nov 2026 17:49:54 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 11 Nov 2026 17:49:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 11 Nov 2026 17:49:54 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20261111161724.3843936-1-fiona.klute@gmx.de>
References: <20261111161724.3843936-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.21
Message-ID: <959ecbb096877e4f8a58129c665bc1ce@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.3.x,
 6.18.x, 6.12.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/2026 17:17, Fiona Klute via buildroot wrote:
> Update the latest kernel releases to:
>  - 7.3.3 -> 7.3.4
>  - 6.18.62 -> 6.18.63
>  - 6.12.116 -> 6.12.117
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
