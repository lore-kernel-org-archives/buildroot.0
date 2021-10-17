Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092EAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 07:50:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD21C61027
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 07:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD21C61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CA8F60671;
	Sun, 17 Oct 2021 07:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JdNdqGafxaBq; Sun, 17 Oct 2021 07:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4EF1607D3;
	Sun, 17 Oct 2021 07:50:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F56C1BF2F8
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 07:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B4B8401B8
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 07:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4wO4q2Chc9K0 for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 07:50:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 377EB40172
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 07:50:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6052:794b:b800:c2f1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9FA962003C1;
 Sun, 17 Oct 2021 09:50:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634457031;
 bh=J0nfOp5N9L3XrERPdjzQeDL7uSF9ckiovrQmQJPgsl4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FNEDAv6IyoBroGqD47tA7iXSj43B5Y3fpyfgdCm0EKznBoetYRTE0Gudh3fIFrXn3
 hLYr/srVJfQuvnG439xVmdcT4HJcONJzkBIXceBIMO36v3VM2BLrtzLsQOU6fsw4b2
 YzqEB8ULl+4KAoN4owW/zk/2C4wEh3yI6n0PkOMSfjKGPNo52IM6BwlS+cLpeXYMMB
 HmmU7MaTehOfIxVfLTlL8LFo8fz98SLivTf9TBeuZqT9wRXMboI2zkn3Y4n8PFqPlO
 qmVwLg1sLBtk/2jEuu9KVK1Vde+rYA+jCsYUlOtf2yl1UFQd7n8qy/aRWTpGRynTzG
 024h/KeAtUA5g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 09:50:27 +0200
Date: Sun, 17 Oct 2021 09:50:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211017075027.GD2400@scaer>
References: <20211016084136.2475297-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211016084136.2475297-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/wireguard-linux-compat: add
 missing comment about kernel dependency
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

On 2021-10-16 10:41 +0200, Fabrice Fontaine spake thusly:
> Add a comment when kernel is not enabled (missing since the addition of
> the package in commit de591c5c3a93a40d049a32bd79c30cc66daf5fb2)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wireguard-linux-compat/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/wireguard-linux-compat/Config.in b/package/wireguard-linux-compat/Config.in
> index 5a323a35e5..4e8e95bdc3 100644
> --- a/package/wireguard-linux-compat/Config.in
> +++ b/package/wireguard-linux-compat/Config.in
> @@ -21,6 +21,9 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
>  
>  	  https://www.wireguard.com
>  
> +comment "wireguard-linux-compat needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
>  comment "wireguard-linux-compat needs a toolchain w/ headers >= 3.10"
>  	depends on BR2_LINUX_KERNEL
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
> -- 
> 2.33.0
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
