Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398F5CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC6DE606E3;
	Sat, 10 Oct 2026 20:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVPhSlBEFIXX; Sat, 10 Oct 2026 20:38:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0673460639
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791664703;
	b=XMQdmDC9vW2vc58oKmx4f/LTxm3rxiZKIQB2bYeVuwUX3pa9WIAzOJYVZ7zsyCAJ5aoF
	 wEx8KnZMJk1pG81ZKtSaQAKjAQDScXhwykh4BhRN0LWRhhBfMp1EvcE2PZaAuuBNZPtZW
	 fIaPJKRW+HsIVrOwOcey60lr7t6gYb3kCIudbxd+ZMehI3FOrf35YUrW1loSc1lOOmssx
	 DqLiNMezdzdAKPoz9haGU3VoFQNvYNw3zvhr9DA/GDcTTWsfVUTr6eC4UvWwcqirl6+T9
	 G9Hy1J9EI2RP0bHkPcWNOXHlx0P5DEaluVZTqx8J4M1pOW5XF9BRE56TML1rnGCDnJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791664703;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=uaI/t19oJMDeDw4MiRTjzXykGiZhZLWYOX48MZbp6kw=;
	b=Ui7l5SjSAMvsNJ9Iqf4T7APessc7JKiExepvZXVPD6gMbMvAy9cvZ6UZJd9GuSjRkBRS
	 bse9bpbDz4DheiT9VO2bsnUnI2ntbmG71JXTl5VMUBj9+LvNBnnPX7mMq7WOM48gk62+n
	 VwgWW0JvPZasRZqvIxevjxDRQ6AK1D2te4cqy9NVgEvWRvVHhRBY04wolkKRDZHgpgkYE
	 Q7baTkAPG11N9eseFlLVoQV1/hhwf3/dgN6tdfmpiXvEMnt6ffh7WgBnCgOzxbe3oi1kw
	 Wn3jlSgPT76cX+mr+YrMaTqKfhhgSBeWpm9MM86XegVLOnnax9poRYkR0SdKCnERX/g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791664703;
	bh=uaI/t19oJMDeDw4MiRTjzXykGiZhZLWYOX48MZbp6kw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ST5VmIztv+l9V15fGEBABbgnlQkiJHWq6axhcaZbdVRtuHQlJS1aisZIEyua9jjCy
	 gNHveTOjcsAFazlYxaDsbmTnJ0vL1hRsDMETMCnCI0egLBYyW+2/Ah1iPr0XYKs2Px
	 23WDhf84LekE4SHRLemI78h04+T6Tyo6W9/1DQVx4iSi4v9fYKCW589C8UTGV+BARE
	 b1r0R5BAVIaWzVSE1cGLbHopoIVnK98DUoW9J3GspmK71Pe4DBt3Q6pilnmY0aaqaK
	 by57Y1S2afIqrlEJtut4IqN7lAE7leBAUgf13J7nXmtsgESFIx8g+6PWVMkQIT44sQ
	 f1FUo3ckSy27w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0673460639;
	Sat, 10 Oct 2026 20:38:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A22C156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C6DE407F3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qk1H8_asSJLu for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:38:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 95561406AF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791664700;
 b=B5AiJQ1z/DkgOAMUrHmw/k8w25ZQ2FrhFDBMhqn2uV9t/9ZZ5Y35vCbzgPmP9Um+6/2G
 5ntL9DlIubCAdbAqPZTcHYYreeoOBz2tuHKM3QzAOYOjdttLR8u5UXEUpQyGpgbxAWNIi
 39pXYDXy2ME/PhU8N9bL4bxM9jsyZO5cF6bbpl72tytoD6E9HskFlqfXk2G37VWk/a64E
 YG9DXoN4RfGJPuM/KHwCN4c4bJZvU/RRTanuRyjk2EQ6aNMSG5RmKqZDpviqB31XwfVd4
 RG/VTtxq6ZfkOLWay361uQUqYuRm3YVtxnbrXuEQUgBmfUcoShcJt7T7fyECwKgcqgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791664700;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=fdaCtvpv5UbUwbpS2q2CXgOurjdpjHlXcBzVDfH+izs=;
 b=lYGrXDXsRWoiv4XLdAu9oLuNGgybiaRvm7DdU40Lx2qXx5un4ECA+1skTpdlEgTu9fDL
 TYZ4v3MsOgyW0nbxR9l59MZigM+3TCszQ39EQFXMuz84yMUZxEjbibKaRUL7zvsfmSnLY
 7z8PZlEkgKCjHcidnDBJpVYVHT4d429izitfhH5TtsFDy9jqF8gLqgrGIGMf3D/FezNL/
 2l5oEaImOHsuQmC4z4JykJ6lmDXyZLa9qlWjB5wn9DZksS70w1gFkv3/Fo4f1LKdZR2Yx
 2Qi0/2oHUglJ+XT6wlBVpUpVQB91ue+t1XVynpyfmGt1MvCrqegqWWN8FVUOGdc3Yag==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=FyWBcRJX; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95561406AF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:38:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E8F4B979FC1; Sat, 10 Oct 2026 22:38:14 +0200 (CEST)
Message-ID: <3419c1d7-8144-4abd-b73f-5859e06f2c55@rnout.be>
Date: Sat, 10 Oct 2026 22:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
References: <20260624101340.80670-1-thomas.perale@mind.be>
 <20260624101340.80670-2-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260624101340.80670-2-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/9] utils/generate-cyclonedx: make
 urllib.error import explicit
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/06/2026 12:13, Thomas Perale via buildroot wrote:
> Commit [1] introduced a code block that reference
> 'urllib.error.URLError'. There is not explicit import to 'urllib.error'.
> While this is not an issue in practice, linter complains that the import
> is not explicit.
> 
> [1] 17c9deb115 utils/generate-cyclonedx: hint at missing Buildroot host package on a specific error
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   utils/generate-cyclonedx | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index df12ee84c0..e337770599 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -16,6 +16,7 @@ from pathlib import Path
>   from typing import Iterator
>   import urllib.parse
>   import urllib.request
> +import urllib.error

  We're not consistent but ideally we keep the imports alphabetically sorted.

  Regards,
  Arnout

>   import subprocess
>   import sys
>   import re

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
