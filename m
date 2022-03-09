Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B766C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 20:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4422F40A0A;
	Wed,  9 Mar 2022 20:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfMkR-m6mAAM; Wed,  9 Mar 2022 20:48:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C78F40541;
	Wed,  9 Mar 2022 20:48:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9BEB1BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A942F81254
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59uUx-XJL2bX for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 20:48:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0EC680E3F
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 20:48:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:959:4871:d6cd:4ee3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4914613F880;
 Wed,  9 Mar 2022 21:48:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1646858917;
 bh=htsfDr7EQtDPRbAI1wv4a+HM6bactGIKm3j5bofydrs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZML1KIfLeEJH2edeXqgTbw5i3J5n2Uef23Lyur2JzIc41jJlh+hgtuMTyVpdFCGep
 fwoL+NCr+RhhFaeIgCbmSUJrhcG6pSGX+rjt5e/rqePGwo8HDQayB82d2llA+n9MGE
 ORhsoRSm39Ff67xrbCn7PRJl/Nc2i+0rHBXPXB6nMRZ8Z9wMEjSIDbn53Us7nFbtYv
 MO3sIAQuVbx7ixZBaOzZJ25kwIIJVNuburplDmkNAGA0rIQqoXwC9ja5/CL89tUBxK
 7P34RfW9x7RZAzIe6bcgt0OCY8Scmr7QjicM6YWY++sUT66GAP+Cc4zx5A27sXa9Wu
 h6On447A/CsgA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 09 Mar 2022 21:48:34 +0100
Date: Wed, 9 Mar 2022 21:48:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220309204834.GC23050@scaer>
References: <20220309175931.538771-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220309175931.538771-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,1/1] package/ola: drop autoreconf
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-03-09 18:59 +0100, Fabrice Fontaine spake thusly:
> OLA_AUTORECONF has been set since re-introduction of package in commit
> 16ff948444c3978d63f483344a3d92d994c64312 but it is not needed as no
> patches are touching Makefile.am or ola.m4 anymore
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Fix typo in title
> 
>  package/ola/ola.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/ola/ola.mk b/package/ola/ola.mk
> index 5090076175..1874350784 100644
> --- a/package/ola/ola.mk
> +++ b/package/ola/ola.mk
> @@ -9,7 +9,6 @@ OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VE
>  OLA_LICENSE = LGPL-2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
>  OLA_LICENSE_FILES = COPYING GPL LGPL LICENCE
>  OLA_INSTALL_STAGING = YES
> -OLA_AUTORECONF = YES
>  
>  # util-linux provides uuid lib
>  OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex host-ola
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
