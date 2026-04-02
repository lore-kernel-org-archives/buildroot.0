Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D10AD6AAFD
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 19:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA81140B9E;
	Thu,  2 Apr 2026 19:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZytUvUhvRVqI; Thu,  2 Apr 2026 19:12:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8942040BA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775157158;
	bh=BPAL4RozGIDEn2X/zto+78iJ7KZtnxI6cNz4rlb3ZDY=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sQDreatotr6heo7eVq5Onf10M3Fs758SnWIPVybOFFppAJnseEO41fI34KyAXo5qW
	 OXVUijmK3sPxss/BhQ+tH4ZcO0cJHQWwHpUNpXyssX1xHGaNMr5/LloDXfcQ4+8lda
	 b7s/ICdo4R8jQ7EFpeuj4JF1l35dNYUH7/HDKuIIxlgeWwUtRDeOqRS8+p4S8WVSOi
	 A//6SFSb36G77S01xL+SmJB5XCw+ilxbTqsHCo3UNVGu/FoWzCtNQwDw+hNzEae5SY
	 TvbFdsy8z1pbxawoBSnY7kqALlJYswr43GINotrRqJStAkTiMu2bmjvahlZ5p4CYYm
	 2IZSNSKJXInwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8942040BA3;
	Thu,  2 Apr 2026 19:12:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39C522A2
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F7D940BA3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyDSeTtk3NPh for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 19:12:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C361C40B9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C361C40B9E
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C361C40B9E
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:12:35 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id 8NSywGPvnwf0D8NSyww4L8; Thu, 02 Apr 2026 21:12:32 +0200
Message-ID: <efae39d7-98ea-4bb1-9438-4ef52e2a551f@benettiengineering.com>
Date: Thu, 2 Apr 2026 21:12:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260402180419.2780025-1-bernd@kuhls.net>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260402180419.2780025-1-bernd@kuhls.net>
X-CMAE-Envelope: MS4xfAIG55LF++bbEZ0+b5kfzRU21Hv9J0utT6vw/EQGj4begHm8VZPrrpSKD0HFs1B6pg7DAbm3ccDCthDngxIJkL3G5Ra4D4+ClidtnxFRUqqMrdlWKVSI
 o7YJ70wLh6XNWTrqZBlFdWs3d1TxrnGv1R1S3U+IPeEweWfGsMx8jZxV5+JxN7qJZ0Cq/5lovMIcwPttd6VHAEGNXow4yyryL8dfEMK0ns3tquc7YxiKKQky
 UUxuZklD2WxSJKo44T0yuQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1775157152; bh=fAArn8pSg7sJWMYXUMQUVJb2A9u3aEnYK5kk+JC/kYg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=RdGfIOeHIWZaFll7lBQHETCq5J4kmKj0xFjR1jcZlBh4wKcznOSnIfONCB8ss55Lm
 SdSlDlf//jKw/y2PxqQok/mAswDIHvmsb92q0fCStWWXQ3YcCs86ZGg+Zi+v0gtE3R
 /6J37Wd9AcuGBkmyC3U75/L8i/F7ZU4KR36efe/Gf5x79VgBzH2Qs47qDXhs42l+8q
 +Bm6fQVDGclTV8l+id7iSh00shihkz5+PIX+1D1VTbVZovBjnWnvESQVIYPANUAG5s
 5r7QXHabJccGV1Jvn7gIYPCP+BIEz2ekmRbyczwRwcBVwAnM4ybmEPayEHbD8ykv67
 UVvl3aqOibAHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=RdGfIOeH
Subject: Re: [Buildroot] [PATCH 1/1] package/harfbuzz: bump version to 14.0.0
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

Hi Bernd,

On 02/04/2026 20:04, Bernd Kuhls wrote:
> https://github.com/harfbuzz/harfbuzz/blob/14.0.0/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

as discussed this major change has no API change compared to version 
13.x.x so no need to build all packages that depend on harfbuzz.

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards

> ---
>   package/harfbuzz/harfbuzz.hash | 4 ++--
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index 8642387392..626ed7b7d4 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/harfbuzz/harfbuzz/releases/tag/13.2.1
> -sha256  6695da3eb7e1be0aa3092fe4d81433a33b47f4519259c759d729e3a9a55c1429  harfbuzz-13.2.1.tar.xz
> +# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.0.0
> +sha256  d4aa312728136e3dc7c3cda47b871614ce0d12bbb19f9dcac2ea70de836dc307  harfbuzz-14.0.0.tar.xz
>   # Locally computed
>   sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index df05596b1d..aef8681a13 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 13.2.1
> +HARFBUZZ_VERSION = 14.0.0
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
