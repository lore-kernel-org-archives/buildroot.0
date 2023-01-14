Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D9EC3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 21:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA1FE40A02;
	Sat, 14 Jan 2023 21:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA1FE40A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N88binvDK_wa; Sat, 14 Jan 2023 21:00:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA66E415A4;
	Sat, 14 Jan 2023 21:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA66E415A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 836591BF2A5
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EB9D81B60
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EB9D81B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wMesdAEXMSGL for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 21:00:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AA5C81B52
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AA5C81B52
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 21:00:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id F353F5FF96;
 Sat, 14 Jan 2023 22:00:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Jan 2023 22:00:46 +0100
Date: Sat, 14 Jan 2023 22:00:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicolas Carrier <Nicolas.Carrier@orolia.com>
Message-ID: <20230114210046.GE199036@scaer>
References: <8ef2e2013a5e486034e602157d91b1de0d1ad374.camel@orolia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ef2e2013a5e486034e602157d91b1de0d1ad374.camel@orolia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673730049;
 bh=xDvXvqk/Z52yW/oxVs48LZx57hFGHe6ljcdYQMZZwnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mxErmJwwSF+xL47fZPc+WjPGvPf1sid1CDG/6DpyqotrLkV56ctc1xMn3TmSkSQcS
 CGHdVSykqer3BMWbdNxVzHKF85255pUkn8XgYyZ0plH/qLav1zzPqB8Qeks/f5Qg/Y
 Ptp8+e4LYQ8plloHQm/8NqiMn5VKTHth++gmPhX5MstdbFQvOpSSPw+FnE70rMdZvJ
 dWnvY1XSN/fEmBgjgHaVjZ4EYBLtFH9V/hIFT1OtcIY+1BiFoBa2xHbNeb30RnTe3A
 rRp9oo/5w3rLc+bBXXkAJJZzsC+149j0o73VZtg+MlOujfQa+L2wEBBzvluu++t1Ug
 3tuZHzGBJnzHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mxErmJww
Subject: Re: [Buildroot] package/lpeg: add missing LPEG_LICENSE_FILES
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nicolas, All,

On 2023-01-13 13:44 +0000, Nicolas Carrier spake thusly:
> The lpeg.html file declares the licensing terms at its bottom, so it
> should work as a license file.

> From 12007e85d75daf941b8e82741e14ee1cb9c61893 Mon Sep 17 00:00:00 2001
> From: Nicolas Carrier <nicolas.carrier@orolia.com>
> Date: Fri, 13 Jan 2023 14:39:53 +0100
> Subject: [PATCH 1/1] package/lpeg: add missing LPEG_LICENSE_FILES
> 
> The lpeg.html file declares the licensing terms at its bottom, so it
> should work as a license file.
> 
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
> ---
>  package/lpeg/lpeg.hash | 3 +++
>  package/lpeg/lpeg.mk   | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/lpeg/lpeg.hash b/package/lpeg/lpeg.hash
> index 1ccaf242c4..f480ac6483 100644
> --- a/package/lpeg/lpeg.hash
> +++ b/package/lpeg/lpeg.hash
> @@ -1,2 +1,5 @@
>  # computed by luarocks/buildroot
>  sha256  e0d0d687897f06588558168eeb1902ac41a11edd1b58f1aa61b99d0ea0abbfbc  lpeg-1.0.2-1.src.rock
> +# computed locally
> +sha256  2b80a8cce793e008ba433e5e0184f20aca4a67ec741439fafd86a874a6a91c49  lpeg-1.0.2/lpeg.html
> +

    $ make check-package
    package/lpeg/lpeg.hash:5: empty line at end of file

> diff --git a/package/lpeg/lpeg.mk b/package/lpeg/lpeg.mk
> index cdb2e81a5f..82c733904b 100644
> --- a/package/lpeg/lpeg.mk
> +++ b/package/lpeg/lpeg.mk
> @@ -6,5 +6,6 @@
>  
>  LPEG_VERSION = 1.0.2-1
>  LPEG_LICENSE = MIT
> +LPEG_LICENSE_FILES = lpeg-1.0.2/lpeg.html

I've changed that to use $(LPEG_SUBDIR), which is autocomputed by the
luarosk-package infra to contain the proper package-version string.

Applied to master with that fixed, thanks.

Regards,
Yann E. MORIN.

>  
>  $(eval $(luarocks-package))
> -- 
> 2.30.2
> 

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
