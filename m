Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1772606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 12:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=obThZ5v5;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=brC226I8
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4AA980E52;
	Sun,  1 Nov 2026 12:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V7Qab7-8btuX; Sun,  1 Nov 2026 12:44:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9CBB980E7D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793537058;
	b=P8TYGQe6nj8gvPAFsTIubc6tn9Wcgv0cpcWgEhOGmUC/AnaWS2JGDlwu9eYxtscos+fp
	 EhEyCVPdlFqicWohOC7gf2bH4KnFyX/RcaMpfWATdkEMrMo48grVtpSyLhCiTCyKrozBz
	 DjsoRl0Z+9WVVdsi607jeDeewUaaTqf8CSONXQ3q8JJCAGcpYNoFmbmweft/v2Topex6M
	 uRfBAreALwijXdvm1GN02OZ08FJv1QkOdroN5tBkshFG5/7qvjP7npDYlZybWhYh0w/Rg
	 WKDGpOeJBX4g4W7gCXPvIRaz2qG+SBqKXE07+FsyoJ1SwekgKcqcy/hqq4L2tsC1l4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793537058;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:DKIM-Signature:MIME-Version:In-Reply-To:References:From:Cc:
	 To:Date:Message-ID:User-Agent:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=QOenMxC/CCT8sBmhomhU1Xr6i/2EPGLFef/pfVN4AS0=;
	b=osGK63G8hVL81qfsa/TszWIsyeYnkwqxi05Ee6Ol44vo/2LxkqxkOBtPsz/1H6ecYy20
	 F5JCtJ5H/t+KW7xFgDzDkFF6ms6uVEANCeksHmUzB/FS/TE7qa/OAHbJ5ZlHR6GTVm53s
	 B2CyTmc29wGvJ+exj+ixQrALNzFD18IGjOESKQk/W8utH78MERPgj2pzNHvfzsG1JLc7L
	 BNG5SbU/H6TuZmqKTqgMQ6WQHaa67StyyaOa9J3M7/qVJE2NtPPgPbzp83mEniF+R13zE
	 FXxnzDa3LYvsg6mkNp1kBSb6BQ7TVfyuvgwAuNQtMLiujGGzLEthSksqeajP2nbL7Zw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=brC226I8;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793537058;
	bh=QOenMxC/CCT8sBmhomhU1Xr6i/2EPGLFef/pfVN4AS0=;
	h=In-Reply-To:References:From:Cc:To:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=obThZ5v5Bjz/XPsXbtYx+xdEdQLYLSyU4F3q0HwnvGdIF95IHijgKyvDoYbGzBnZe
	 LX001erGJrLgDulHwfN2kxi9QiNkG4O0f0nJxPvLpuBInMR7ZP/CDgwfzBSrGhVc8t
	 Gk5R7HR7CBCarVD0tJl0UeKvswQNZd8tx5jBrSPA/kjV7ez29juXa+ypw7i1PHI1xs
	 uBuRDlbY7FMfFrvdzodE1hpcb3cEwCyejFlsYv2gpr8HxldcnB9TwK6Mk2Fx90aX+U
	 Jg1os8I/rsj74aLI1JVrM4iy66m/QxkROheS5ZmHwENNt3zWFzbUVlv7Nb09dJOY5M
	 6Tg6iPE9KgPdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CBB980E7D;
	Sun,  1 Nov 2026 12:44:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50C19323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 12:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 367E980E7D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 12:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPmsP-EbyZjl for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 12:44:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4DABC80E52
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793537056;
 b=kxOcW8xHJvUgwgWjpQfYgtQAPh9Jw98qT/ithuCRL5MPBeChVeIcaYDh0qnQfU6sZ4bl
 PRwOkQNj6fDTUuYwJpjhMjV9ndeF6nlhbpOEVrL7g/lby1idn5/Yj2ks+8/g+2bb5ObRH
 HPVF9CDvXTN6k8WVL6FHP5zIQ8lHWP4Nb0zlm4ixXMPtMKhK7MmQviGvfeUWvF1MC4cpT
 FIcsJ9DASa4wOo8AodZq+D16JlzX8nj2wCYYUCrnCsez3/5jDVXR32lKu9VkJOwr+EN0E
 W7A+dbZjcHG4tPslLgdyhNS3Q5v4JJwLoAoCx3Hbd+CcMvvIVXYUIx82j04hHCLlnNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793537056;
 h=X-Greylist:Received-SPF:Received:DKIM-Signature:Content-Type:
 MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:Subject:
 From:Cc:To:Date:Message-ID:User-Agent;
 bh=37CBpPkm8kRamk8CFwb86IcMVr5Vh/mwKykZPX9qPC0=;
 b=I8gz6sF1IlAE5KV7tv8AQEi41kiK2QvLU6jBArHASDFGZQ/w3+ZXlBxK3hbXuEbNUBb9
 h051/ow3qcER4ay4i7dOflGo9X8h0/z/1dijRa603w8s8zcljFz5qvgiymWaVmGdyqJHb
 KqA+wSsIF4POd1BoGZ05duBCVGl19xI0fhTwguI2TLe0/izepcQ6gjxlOjWDqFzjwK1ry
 yV3GAS0afROKlsIRANVzJrW43pll9bBpd6OTrBRz4FbQzDkzFuYRK3qBh0j3EKQUvW4t4
 X7zlCD07DHyjq0WVCifRA9EMZekA1XAUE7ajfbJ/xp3Tlp+uIC+Tq7LuxDtId/bbaLg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=ideasonboard.com;
 dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=brC226I8; 
 arc=none smtp.remote-ip=213.167.242.64
X-Greylist: delayed 442 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 01 Nov 2026 12:44:15 UTC
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=brC226I8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=kieran.bingham@ideasonboard.com;
 receiver=<UNKNOWN> 
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DABC80E52
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 12:44:15 +0000 (UTC)
Received: from monstersaurus.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B702CBB;
 Sun,  1 Nov 2026 13:34:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1793536473;
 bh=4AxKYjqrX6td4NBnr9aI2II5rqZUW/k2apQpvqGWf1o=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=brC226I8Z5U0AqCmY/tgLs9E8YjQYLD+kgW34GNmrQwN8mvONDl5/wi6ZM7we+UtT
 4yTh/MWDv/dv5yNPBU7HXoepN+ctWkZtKVdMzNFzJmtedhx0lxpjb8Ej5UOzd7Iegw
 E5DXy8YfQk/kXMZxmR1W8jShnxuJzBPh7mXhgEXM=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261101104535.1696412-3-bernd@kuhls.net>
References: <20261101104535.1696412-1-bernd@kuhls.net>
 <20261101104535.1696412-3-bernd@kuhls.net>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Date: Sun, 01 Nov 2026 12:36:46 +0000
Message-ID: <179353660655.149264.14673315638167558606@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
Subject: Re: [Buildroot] [PATCH 3/6] package/libcamera: bump version to
 v0.7.2-167-g8fe1f4514
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Quoting Bernd Kuhls (2026-11-01 10:45:31)
> The releases of libcamera-apps and this package are not synced feature-
> wise. To use the newest release of libcamera-apps, version 1.14.0, we
> need to use a git tree newer than the current release 0.7.2 of libcamera.

I tagged and released libcamera-0.8.0 this morning.

Probably just as well to move to that. Can you check if the RPi apps
compile cleanly against it please ?

--
Kieran

> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libcamera/libcamera.hash | 2 +-
>  package/libcamera/libcamera.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index d1d7576533..1caad4f40c 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  7c5728f6a51d717542cfdd2ff368ac78fa2e50e8a7360a38bb37952e9293e008  libcamera-v0.7.1-git4.tar.gz
> +sha256  58864d3ef4f14661187ce9871e2a2d38d6f0e89c76b6beff2f663021130359af  libcamera-v0.7.2-167-g8fe1f45140bace32677b1f7b9a17ae3b4fa85a59-git4.tar.gz
>  
>  # license files
>  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 256909ebc8..03c31eabb8 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBCAMERA_SITE = https://gitlab.freedesktop.org/camera/libcamera.git
> -LIBCAMERA_VERSION = v0.7.1
> +LIBCAMERA_VERSION = v0.7.2-167-g8fe1f45140bace32677b1f7b9a17ae3b4fa85a59
>  LIBCAMERA_SITE_METHOD = git
>  LIBCAMERA_DEPENDENCIES = \
>         host-openssl \
> -- 
> 2.47.3
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
