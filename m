Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09477C0502C
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 10:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 792AE414C6;
	Sat, 27 Aug 2022 10:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 792AE414C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l9wdrC2GEjVm; Sat, 27 Aug 2022 10:06:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A46004109D;
	Sat, 27 Aug 2022 10:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A46004109D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1938E1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 10:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00E2C404D8
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 10:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00E2C404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1VyaTXXoHjM0 for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 10:06:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1507140141
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1507140141
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 10:06:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B56F619F5B2;
 Sat, 27 Aug 2022 12:06:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 12:06:29 +0200
Date: Sat, 27 Aug 2022 12:06:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220827100629.GU37358@scaer>
References: <20220824215318.389653-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220824215318.389653-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661594793;
 bh=45hfLunvCpcci8gWaWP6T5cWBirmcPtR5pDoNzDz6hs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ie+pYAoiIEz2B29FSD4yyXMhv/M0rS+MOR0F4t1kR9p8R4lP7xjIrWd8jwRJ9LUZs
 v6L+uhX2dIjafyfVzDy03YwX2DC7raDz6be/j9kc90zxepdDtcj8FEDeM1IUOjM1IG
 5IyRyvkIBnT8dy/GGgx2lvFk2lVlZwFLTk9aizF/WdewJRHTPqH4Dpo8ThWJkh/LKO
 E8A694yaTgP0SLS30bIgSvrK+OqyJJmKfIZF8DU8UaHJmfiyKmdRNr1or67RcT1Zh8
 BRdCP6PrLC4eOmCBAb1sMmieUqV+/JSZUP3tpyOdzH8t+BLeV4gUFDvx/mrNIykWN2
 aJ1aLFk3TD+9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ie+pYAoi
Subject: Re: [Buildroot] [PATCH 1/1] package/igh-ethercat: fix build without
 C++
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-24 23:53 +0200, Fabrice Fontaine spake thusly:
> tools needs C++ since the addition of the package in commit
> 27ad470d7df5509ae4a96edd04521211900090e4 resulting in the following
> build failure:
> 
> no -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I../include -I../master -Wall -DREV=`if test -s ../revision; then cat ../revision; else hg id -i .. 2>/dev/null || echo "unknown"; fi` -fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0  -c -o ethercat-Command.o `test -f 'Command.cpp' || echo './'`Command.cpp
> /bin/bash: line 1: no: command not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/89d096006839f32a3d03786e69e51ec3c5ea70f6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks. I just move the assignment first, before the
package's own options, in the spirit of "handle inherited dependencies
then one's owns".

I've also pushed a follow-up patch that cleans up this conditional multi
assignment ugliness, so that it looks more like we are doing elsewhere,
using a multi-line assignment.

Regards,
Yann E. MORIN.

> ---
>  package/igh-ethercat/igh-ethercat.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
> index b9771e8f8c..5004e4aa75 100644
> --- a/package/igh-ethercat/igh-ethercat.mk
> +++ b/package/igh-ethercat/igh-ethercat.mk
> @@ -20,6 +20,7 @@ IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E100),--enable-e100,--
>  IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000),--enable-e1000,--disable-e1000)
>  IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000E),--enable-e1000e,--disable-e1000e)
>  IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)
> +IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_INSTALL_LIBSTDCPP),--enable-tool,--disable-tool)
>  
>  $(eval $(kernel-module))
>  $(eval $(autotools-package))
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
