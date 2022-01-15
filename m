Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58BCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 09:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84DDB409DE;
	Sat, 15 Jan 2022 09:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1NGAcni2irVG; Sat, 15 Jan 2022 09:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0819409B1;
	Sat, 15 Jan 2022 09:21:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA64E1BF34B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9595960C05
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:21:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-x7Yz7bX5Ro for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 09:21:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B580F60BFB
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 09:21:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:edb9:18:17ad:29d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0371119F5B5;
 Sat, 15 Jan 2022 10:21:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642238466;
 bh=KUR/8pqzeXmmQjp9VGLlp+n8EnGbfkqaMFu9zAv8j90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UDmNgpougL3btt6WhYitYdtQydctxKvSKB9kHx0OYogmsHaSQSc6EPnNAnx0dHWog
 wSp+sqPF1y4ybV74m7fOTofNNOPd+yDrirloHneK8AA/raXQF1UE6NkI0kwG64eUjA
 vG4fYTanlKgFKgSaNfC+ZDil/9Abv5Ek87kCMFyNNDII2kPJO/9A/rkt3AjTFhkn+a
 U6TXQsTxqZq0CPm6hF7fMUF/LVScZYa4BjwHp1QVRwW3q2s4NpqIxWB3f6pfftMXOY
 Ngryt6dD2jND4Y1/UeaIztjvXppZkMRBULOQSeH8hLLhEaegKMs+vpcSqiMmDtO6Kb
 macVVQz7Sd3Rg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 10:21:03 +0100
Date: Sat, 15 Jan 2022 10:21:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220115092103.GB1945846@scaer>
References: <20220114224035.1502100-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220114224035.1502100-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.4.11
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-14 23:40 +0100, Fabrice Fontaine spake thusly:
> Fix the following security issues:
> - https://www.wireshark.org/security/wnpa-sec-2021-16.html
>   (CVE-2021-4186)
> - https://www.wireshark.org/security/wnpa-sec-2021-17.html
>   (CVE-2021-4185)
> - https://www.wireshark.org/security/wnpa-sec-2021-18.html
>   (CVE-2021-4184)
> - https://www.wireshark.org/security/wnpa-sec-2021-20.html
>   (CVE-2021-4182)
> - https://www.wireshark.org/security/wnpa-sec-2021-21.html
>   (CVE-2021-4181)
> 
> https://www.wireshark.org/docs/relnotes/wireshark-3.4.11.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wireshark/wireshark.hash | 6 +++---
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
> index bc7c9f4d7e..7b67e316ed 100644
> --- a/package/wireshark/wireshark.hash
> +++ b/package/wireshark/wireshark.hash
> @@ -1,6 +1,6 @@
> -# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.10.txt
> -sha1  63839abd94d3ae376f860e2d2969777680106578  wireshark-3.4.10.tar.xz
> -sha256  8aa7ef4a44ae62bb8db463cf761e2cc03b97305e0e77ed5be53fa83729187cef  wireshark-3.4.10.tar.xz
> +# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.11.txt
> +sha1  b656d8709b8b0b3d2a94665af6bec88495ad994c  wireshark-3.4.11.tar.xz
> +sha256  a0e227bce2cc3a51ef3301891a0243231990b52a39b68a84a6e32f69c4e75279  wireshark-3.4.11.tar.xz
>  
>  # Locally calculated
>  sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index 2ba81d1f39..0361d0bb64 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIRESHARK_VERSION = 3.4.10
> +WIRESHARK_VERSION = 3.4.11
>  WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
>  WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
>  WIRESHARK_LICENSE = wireshark license
> -- 
> 2.34.1
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
