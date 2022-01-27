Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEE9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 18:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7A3B84CC4;
	Thu, 27 Jan 2022 18:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 91RORYjIHmXg; Thu, 27 Jan 2022 18:50:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 324E584C74;
	Thu, 27 Jan 2022 18:50:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11A801BF3EA
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3F9060A75
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRDfsciVkkcC for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 18:50:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DFCD60810
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 18:50:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cc8e:5bc6:13d0:52a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 2E2D12003DA;
 Thu, 27 Jan 2022 19:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643309409;
 bh=rwTeJ4I56KzuRB4q+gHjXBYykIePi9xe7dIg0bGOX3w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tpwjE5mZ94e2q1kHx5Y0PogITEBuJyuQc4PZrf6ep9mtr4LFw1uHRZ6FckttO2WLy
 VvuP9vBFnWhr2KGndhjwXhTmWULldai16qXTOtmMac5+6TiWzj5t430Vj+hGUzNTU/
 0dwNtYI9Tjl8cvzO3do38C6eCy62a1Zi/06yBPJ5YR1+zs6RuFJntka21q5EmFYW4E
 FwV4Gh+dpqotKSZ3R5xNcvgZLbsLFGLh4zNYNh9lRDlkgMXWNAJ6vWOG0BiqdrHP+H
 JLc6tDo/d+Cjy3rhSwgcPYEwCh1h/MdEQ/kT7/8fSbzqPo6gjCbpHlBT80R5R8XxWi
 mrHGLDcxFLvuA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 27 Jan 2022 19:50:05 +0100
Date: Thu, 27 Jan 2022 19:50:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220127185005.GN457876@scaer>
References: <20220127175359.2330776-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127175359.2330776-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/htpdate: fix install
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-27 18:53 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump to version 1.3.3 in
> commit 163509a8e0d558e6339c5489f072dfe805e0cc34:
> 
> >>> htpdate 1.3.3 Installing to target
> PATH="/home/buildroot/autobuild/instance-0/output-1/host/bin:/home/buildroot/autobuild/instance-0/output-1/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" /usr/bin/make -j4 -C /home/buildroot/autobuild/instance-0/output-1/build/htpdate-1.3.3 DESTDIR=/home/buildroot/autobuild/instance-0/output-1/target install
> make[1]: Entering directory '/home/buildroot/autobuild/instance-0/output-1/build/htpdate-1.3.3'
> strip -s htpdate
> strip: Unable to recognise the format of the input file `htpdate'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f1034de5ebc2fc2c49711820077d0b6e5e13aea5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/htpdate/htpdate.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
> index 200c3207a2..54b3ec2569 100644
> --- a/package/htpdate/htpdate.mk
> +++ b/package/htpdate/htpdate.mk
> @@ -19,7 +19,8 @@ define HTPDATE_BUILD_CMDS
>  endef
>  
>  define HTPDATE_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		DESTDIR=$(TARGET_DIR) install
>  endef
>  
>  define HTPDATE_INSTALL_INIT_SYSV
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
