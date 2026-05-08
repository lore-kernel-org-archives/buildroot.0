Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BA1CD342F
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 09:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30352615B8;
	Fri,  8 May 2026 09:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RRZ7fef8Epe; Fri,  8 May 2026 09:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE95761350
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778232154;
	bh=n3W7T5tQMT7SH32Y1ETGv6fN7c+6PZSayqeflvSGGd8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ctaBMwI/qYWNm2JOPSqO6gCR/EPH5N/moO/n8bAWY5Uo8UXDRFV/1Cn5Qix/iCbYS
	 FUuvR46b9Zy7oAKOTYalN1LjgorXgjbBjMYv68vpWSCXdZlBg4VkZTEnm6dvYQ66/A
	 Kl+1PFCCO4+BTZGV35+zSj0LwcJ+bq0iOTF4/bj9sGawFy195nBMlqRON/xDYDNTQ3
	 nNU0GfSJ0BFXuYS17YiFOH8bwu9nmnQczIlcI838aYnE/bI/4LaPiedCyozSftLpzO
	 DuR2YvO32aLKpnCwiYzJ0+/uOsUXUoIhRBCK7/QtD+nmF7QEkibwBS4OpuLWkYYmrw
	 3l3fCDFrUZZoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE95761350;
	Fri,  8 May 2026 09:22:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AD0C317
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C9E761350
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id voaXOntehNSG for <buildroot@buildroot.org>;
 Fri,  8 May 2026 09:22:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7169E610F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7169E610F6
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7169E610F6
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:22:31 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 623012C84162;
 Fri, 08 May 2026 11:22:29 +0200 (CEST)
Message-ID: <1da2125b-1f2a-4832-aa27-b76596789f08@bubu1.eu>
Date: Fri, 8 May 2026 11:22:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
References: <20260508081010.250838-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
In-Reply-To: <20260508081010.250838-1-chakrabortyshubham66@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1778232149; bh=NE51jrJXxO91xCe6kwDtCPHV9inhcdKRXg9GSonIjRs=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=gM/i8BIqeMSuJkv51zywG6toaBo0MqZ2vEsBK0RGXtd6SAFPz3tjfdnrEC3ym2D7F
 8eWeqiBEhz9lqAbUsu7KkDRNihKNA8x3t4haYRhRr+oQ4riHv76LoKHAHti/EnJmQx
 bU8zaRO6VbuHDZaIy8MFpKNCx+6/uYJbus3XOfh7xt7SZxlTYXgBFPHB45wwlZZaOU
 5suBsHI64J5jvE0OESBw9V56hd9szgoKVAbXXceAcQabAUT9xsOORRyYDwK4PKWREd
 cpAkFYzX2euevOfgEW+tk7vy0F3ooCP2N8ZeSUzN+YuBNXR+zOKcqw+H7uBz2V4eF6
 QGcJLyngaR0bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=gM/i8BIq
Subject: Re: [Buildroot] [PATCH 1/2] package/htop: bump to version 3.5.1
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

Hi Shubham,

On 5/8/26 10:10, Shubham Chakraborty wrote:
> This patch updates htop from version 3.5.0 to 3.5.1, a minor bugfix
> release.
> 
> Key changes in this update:
> 
> - Bumped version from 3.5.0 to 3.5.1
> - Updated hash from upstream source

This is not that useful to add, as that's what happens with every 
package bump and it's trivially visible in diff. No need to state the 
obvious here.

> 
> Changelog:
> https://github.com/htop-dev/htop/releases/tag/3.5.1

There is no actual changelog here. The changelog lives at: 
https://github.com/htop-dev/htop/blob/main/ChangeLog (best to link to 
that file from the release tag though)

> 
> Builds Tested Using:
> - utils/test-pkg -a -p htop
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
I'll mark this as changes-requested. But more importantly:

Can I ask you to be a bit more diligent with the patches you send 
please? Your help in keeping packages in buildroot up-to-date is 
appreciated, but I'd like to not have to point out trivial things in 
most of your submissions at some point.

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
