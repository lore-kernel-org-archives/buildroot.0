Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBDCECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A7CA819BE;
	Sat, 27 Aug 2022 07:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A7CA819BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dtbvvwapasy9; Sat, 27 Aug 2022 07:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C1AF817F5;
	Sat, 27 Aug 2022 07:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C1AF817F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E749D1BF853
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0FAA416DD
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0FAA416DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQUkDERlxc2m for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:52:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B08F416C0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B08F416C0
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:52:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id AADCC19F73C;
 Sat, 27 Aug 2022 09:52:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 09:52:51 +0200
Date: Sat, 27 Aug 2022 09:52:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220827075251.GK37358@scaer>
References: <20220826205755.22469-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220826205755.22469-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661586773;
 bh=rYwQPcZBZIwnLqXDV6ygBnqKuU0ZA1+MfYDat65hnuk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IIUJqAqzuPUGCr5V+hhK5meGT40nGhpQcMiREXLOx3FjQedr0RjY7h5Y3fexuEjZu
 IcAjDfxAVtMaMN+zKGtixm3aa0j/e03cV8CpcvBPgOmiCeZEdgBf4O86g6Vb9YAmJi
 pYYQWWUysAXe0wfFW4QjKyu++4CRl7IC+j9DCGQi5Wdg0OMlXHyaZhMkQgd3ynyR9n
 C1Jcv4W19JSBPDok7N4rKSEy1+mff+vfLTlsl204x1Hw+o6HbH00p1urqA3zeCQmFm
 nKPyG60eYC4+yVjwtveGHuPBrg8nRn7W0jZ/8sLNfuLYaBv4yKCMFJHG+/QIws52LH
 XMWAeafAuN2Bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IIUJqAqz
Subject: Re: [Buildroot] [PATCH 1/1] boot/edk2: fix legal-info
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

On 2022-08-26 22:57 +0200, Fabrice Fontaine spake thusly:
> Fix typo: EDK2_LICENSE_FILE -> EDK2_LICENSE_FILES
> added by commit 1074a37e783b023bd0491ba4f4f7acab7f289e1d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/edk2/edk2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
> index 2b12de53cb..5cbd9d152e 100644
> --- a/boot/edk2/edk2.mk
> +++ b/boot/edk2/edk2.mk
> @@ -8,7 +8,7 @@ EDK2_VERSION = edk2-stable202102
>  EDK2_SITE = https://github.com/tianocore/edk2
>  EDK2_SITE_METHOD = git
>  EDK2_LICENSE = BSD-2-Clause
> -EDK2_LICENSE_FILE = License.txt
> +EDK2_LICENSE_FILES = License.txt
>  EDK2_CPE_ID_VENDOR = tianocore
>  EDK2_DEPENDENCIES = edk2-platforms host-python3 host-acpica host-util-linux
>  EDK2_INSTALL_TARGET = NO
> -- 
> 2.35.1
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
