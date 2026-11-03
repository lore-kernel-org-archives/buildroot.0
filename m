Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C324C606A324
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 10:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=io8tZrd7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=R3vXPCQD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A005A80E26;
	Tue,  3 Nov 2026 10:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Esq0m6FJ68SO; Tue,  3 Nov 2026 10:25:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7D47F80E03
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793701523;
	b=oB/B3kVrvpNzgYLqU+EimwP6wADJWEjHVmR3EIXOQx06FXM16ukOfr32CabTEvlyQVCl
	 eNrQSduWCG+Kzes0hDehmnA9D3GJ9zvjrLie1+WHeZ2+VCTpcJCA+SPFHxdDRG1cgoFXm
	 gfC+gkr+LXT6YQIkft3dBxvwWVYc+R8WGhK3q68JfmtXxs+SdlcXCZdVXVLMKM9t5t3t5
	 U8mLqWtKY/RiyxtDPdq8+AvaBGVyDFdLyeZiAHK3U/ZuCuUpfI/giFfhTHE7/qWr7km+e
	 HTsgOZ0JDf1YyiUGfAlKocRM+NbnZ2ibJNEFP7N2wcDpShjf9iS/QU2GUB8c2/QktOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793701523;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:From:In-Reply-To:X-CMAE-Envelope:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=PGBKa/pgrlNlZ50bgjQGOgh8RQw4KcfxU/9aXvPmDXs=;
	b=hF6zTGN2+3K1iE9KZgvy4XCOCAiBB+2DqBStNy+cIzni9bBHz98DKwTPKjO9fOD7qkma
	 gP1SXdGuvPAkipP1QL9p460tdQsB4oUjLdyfgbp5NyZt35TO+llVFGyyzQt7Q/hgXE6qW
	 SnYzOPjU9cdUPK+7zvdZvODNcMGfYU9P0eL4K/QAnQsads0FgrWY+T8JzQfSKKyLMRo5x
	 odV8u8qUqyFAea2DbrnsOSUNpZZAof6F+sq1BqY+NamGaxTCg18nEuUwIufkq8O5pz8jP
	 odEMJtf/XSvKH4BZoCI+sx4HiKrzOd4T9mTtZk9oazTaoy/J7NWF6yNiBhGzuGey6Xw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793701523;
	bh=PGBKa/pgrlNlZ50bgjQGOgh8RQw4KcfxU/9aXvPmDXs=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=io8tZrd73yLFIl2txAshgMYS9WA3ugXEZTlIWcAwDfLco/qIEJOA9UrR38rVuZYTB
	 y139EylLVYwfzcH/SQtsLcMs3TaMHaiLmHZUJ9mOeFXIb1XEAQ8Gve5kdqHZfIdPNS
	 8FLNTbmvGIsz/snnB8d3dptJAN2Ypgt0x8hz3qlhgztc2yPLxo5oe9iSzOiXg7LXZ1
	 AyHpxE2tBRzVWllvtKt8BSY+TdEmFPzHvkmU3PYdgqWq5E5PCj3jk1w7t+w9crLxNt
	 i+LJnZGhJ2fYpqQF/Ii7JyScTRpAMJjOc6vquN6dOfzg9/A6SEWEE/S3RplHHOdzus
	 KZocGlVfMZRIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D47F80E03;
	Tue,  3 Nov 2026 10:25:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1539A15
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93967400B1
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HkQ1_RFqyM9K for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 10:25:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7A94A4005E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793701520;
 b=nzgPkq1wzOe63+V5seShf8lCPP12Lt8KzrLM5SIA5zFUTBbbdGnx2dSwgSmFBMsI3i5u
 bNNuO7N1awfkk3Bio4P1nAkw6oqBxDQNHC7aJoUQNFKyfPJo2JYw6Q816/rQLI9hkTbWr
 S/AhP/6q0C96I4INwxVS/F/iE9VXe/iMm030rkPRRX3HVN4CHBfQFsd/f1A/8RTshxHAx
 XcxVNJ6Cm6YvARLwr8CTk+xnb5pTDiSWxUqaSdhLvtNn25/jB+u+N1aLzsGzEmJJPk97Z
 C4oGDXF5fZzkeZGPgIIeBKcF993RwKl3S8wjhyI4D0mJ6NW92AWFrZrlj0mNlu9fotQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793701520;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-CMAE-Envelope;
 bh=V+CvENwox4BirxlWENv1eV9N2WixHoV6ugHlbsR5DDE=;
 b=Gq6W/Kqpv+AjMX59W/fwUX58IqhO+sbhH0bBZnCYgnSABKGPEKfEQabAgDT5L+KC4Lx+
 0DxpCKJ1L0AEqi6HTwMiauexxw5cQtfoNwkJmPOrBXTQcVOCViWg6NcJHOrxVUS1BdCH4
 EurX+LPw0NFB+1PtAxrlSxFAY35t+IEEi4wweMcNRMMuzhKtK5i6FEE/7iSM1KViXJQAw
 BKQ5ShdfD3Z5yo/auBgRUKELrgEGiwlY/BurYNk59lkKIS9ogt7KjDwZjAbsi5u7848d9
 jsQTscbFnBlkg4EAoe/8EYugPq66KgdIiHyTU8VCz6VWFqScUyQVypoetLGxty4tJDw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=R3vXPCQD; 
 arc=none smtp.remote-ip=62.149.156.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=R3vXPCQD
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A94A4005E
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:25:19 +0000 (UTC)
Received: from [192.168.1.115] ([151.95.84.63]) by Aruba SMTP with ESMTPSA
 id OBhdxqpqUW41bOBhdxq8Jj; Tue, 03 Nov 2026 11:25:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793701517; bh=b1DJMD3Nm1bcH/wAs4b16e4s1wuV0l08zbATl/OoxTI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=R3vXPCQDHDI4O01oFWDqVjdIafTr+WJqGpwRU6bVpRBxwkKh5mnRQgSUmavTo19ZJ
 wNwDI6fRCwxVVYfhdm55TvIqjf+f1z4hWIheLQcthNI9lj+BtU3cY2gKvqqiphXGHR
 AR7QJz/XIRp5xAlQrW87+css2VuIizkKLMQDKTuW8gGFte8jR4voXM6btTwB8KNlwt
 UQu3MKCeqTvoaEZvPD2MXNW7QsYAVRPEWr2GmOeDKs5GIWr5ntZI1oWXUzaZv4wwiZ
 E27oCJdtQQOb97wXIXIxWx2S1lfe8ReFOBE7IkbtNrKwZfFTCJXi1756BwWySM2SaM
 5oQhLg3fFUEug==
Message-ID: <32b29140-00ad-4643-9c59-0068cc215c5f@benettiengineering.com>
Date: Tue, 3 Nov 2026 11:25:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20261103100549.4129021-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20261103100549.4129021-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfGAlyS0BQXTrtHG8ldrzMLRbuh+PJENEZlHxFflV6K2s/O5Nzz4Ef8IFVFs2XQYGzoVYX8GGHvCf+Qf7/1kAET8nsDLFWsx2IBGB7Wp6Lg0DAKjA17BS
 Y569H2FBsbLQnGTuoF+8i0S8IlAayfC31C1FOICmkoFwvPL9ikhcjKGB6FVelmsGYasoSxcclDMdDjBinaSaFXxhggK1vdMAJVBeHRuzwVy27RAecuveXkf2
 /AYc6zUymyG8ZA2Q/CUPjQwendej+G1RO1Jn9oVrEVs=
Subject: Re: [Buildroot] [PATCH] package/rtl8723ds: fix build failure up to
 Linux 7.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes:
https://autobuild.buildroot.net/results/0a1/0a1bbe829597238107d3aa0bbecd33f051be665c//

On 11/3/26 11:05, Giulio Benetti wrote:
> Drop local patch already upstreamed.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/rtl8723ds/rtl8723ds.hash | 2 +-
>   package/rtl8723ds/rtl8723ds.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
> index 580f5d09f6..8557414e0e 100644
> --- a/package/rtl8723ds/rtl8723ds.hash
> +++ b/package/rtl8723ds/rtl8723ds.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  a04bc28cbaead30aca2894633ffa93d4bf0bf407a8c5b7120dd9832ceaf0310e  rtl8723ds-122a574f780da32bb0de760bf089a3a9ec1e8f87.tar.gz
> +sha256  e0cd998331f37d4ec5b18df695638ff9f3c2c564bcea936b55ef4b40d9c4613d  rtl8723ds-83191afe47af29d622701bab24020e2dc8b0fc48.tar.gz
>   sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
> diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
> index d8072f14bc..8dfda059f3 100644
> --- a/package/rtl8723ds/rtl8723ds.mk
> +++ b/package/rtl8723ds/rtl8723ds.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8723DS_VERSION = 122a574f780da32bb0de760bf089a3a9ec1e8f87
> +RTL8723DS_VERSION = 83191afe47af29d622701bab24020e2dc8b0fc48
>   RTL8723DS_SITE = $(call github,benetti-engineering,rtl8723ds,$(RTL8723DS_VERSION))
>   RTL8723DS_LICENSE = GPL-2.0
>   RTL8723DS_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
