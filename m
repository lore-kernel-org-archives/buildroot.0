Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C0AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 10:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD8A441576;
	Sun, 26 Dec 2021 10:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJzwrVTFBFqq; Sun, 26 Dec 2021 10:49:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 386BF40966;
	Sun, 26 Dec 2021 10:49:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AA5B1BF476
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 897C382486
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zIDLAYzobuK6 for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 10:49:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8708382435
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:49:08 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 1R5NnRCUUq3qK1R5Nn0Jwk; Sun, 26 Dec 2021 11:49:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640515746; bh=5NhukZ1ZKzs5b6xAOrTadRdiprudAD+LV8EeG6aKp9w=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=HRT/XZWHey7LTK/Kivc6oNPw5Xn5Xi1Hk8Vd5QtH9W8wGSdCLCnN3i2FGit8jDe9N
 ymxtU/oCixBflkJfm5uOCsitXx5QTqmtMPhD4lztCnXHn1v53UVs0CuefQ2ez3o/Wz
 S4oP1r6WFu7hCDn2sC1fcIkIrSIr/rM1cUYPOdLn5dpltT/zerZYilbrX+r+m8ahbb
 RDmHDDT7Aa3qb0QujD+iGeXpdQArPZAojhHvqI1TsINTLdKdnh+VovmlpRfA5pIuYc
 vT+wjVyurdLcqjkHyVjLqRvT8ie6NH+6HOXb2p5SBNDGxyzm5SfJDuOeJFxfR7dKIi
 hENlBCTDcGZQA==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20211226103329.660967-1-thomas.petazzoni@bootlin.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <df7dde17-77bd-1d40-5193-82d554383358@benettiengineering.com>
Date: Sun, 26 Dec 2021 11:49:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211226103329.660967-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfKE7e0+EVez6hZ/3wSv15gTqMrdRz83VEeafCboOFIg9rJJS7/KYBR8MaxWSsBTA11Nr01Hjuo7d1+9xa0A2+BzBchTlAgCJeBybxZwDG2C+SMLmIsYj
 OZWZRLril+rL5DmX/lxVnPAv9o0/xBNKE/0VaHPh1qZxrERvZK5PJQNRF280238Xi+XR9KiOD/BH1r0rrh8kUrNG+xrJcfbhhJzqYNow/gaDvS/16xSJQXeV
 dpt1vcW2APzn3yRoZQv1gRsMlTjACBH3jCLpG6WC/JAP5/1RXFqDCWdBpnRWcegz
Subject: Re: [Buildroot] [PATCH] package/binutils: fix an OpenRISC binutils
 2.37 patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/12/21 11:33, Thomas Petazzoni wrote:
> When binutils 2.37 was introduced in commit
> 62f0232980c8168631b29f27edf612af8109c691 ("package/binutils: add
> version 2.37"), the patch
> 0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch was
> not properly updated. Indeed, between binutils 2.36 and 2.37, binutils
> has switched to using the standard "bool" type, so instead of using
> TRUE/FALSE, true/false must be used.
> 
> With this change, the binutils patch matches the one that was merged
> upstream.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   ...4-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch b/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
> index 779baeab63..0d18321ee1 100644
> --- a/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
> +++ b/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
> @@ -46,7 +46,7 @@ index 32063ab0289..67252394173 100644
>   +	      _bfd_error_handler
>   +		(_("%pB: pc-relative relocation against dynamic symbol %s"),
>   +		 input_bfd, name);
> -+	      ret_val = FALSE;
> ++	      ret_val = false;
>   +	      bfd_set_error (bfd_error_bad_value);
>   +	    }
>   +	  break;
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
