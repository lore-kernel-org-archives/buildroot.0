Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECC6C7EE22
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69B4142A8E;
	Mon,  8 May 2023 20:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69B4142A8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sy5_R4cQoxFa; Mon,  8 May 2023 20:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CD8941D30;
	Mon,  8 May 2023 20:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CD8941D30
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EFDC1BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49793404AB
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49793404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ecA103Eh9GzT for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:08:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3990641D2E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3990641D2E
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:08:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 856242003BE;
 Mon,  8 May 2023 22:08:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 22:08:03 +0200
Date: Mon, 8 May 2023 22:08:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Chris Packham <judge.packham@gmail.com>
Message-ID: <20230508200803.GK252090@scaer>
References: <20230430212110.2360240-1-judge.packham@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230430212110.2360240-1-judge.packham@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683576485;
 bh=uOuPPdPrpcEZzonatFlmhsBW8lgg7D8d2ubAxdyDpGI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y+3ceI1VJ/hrOmhNUmN1Rgdc2JCMHEvMyVK7O2J0uuv6vc93qUAzXTseetd2esMOI
 96bs35aUuWutsYjerkB7aNAO4YaSS+7iejjvZEROuuSdILCng7RxVVTxhm2skhzEB8
 vXj1mG5RwY0Y/kWro56BaqC0yT3JosuQWC1zXliYVmkPsAjyygdoBQcd19NlRADzfn
 /7BQ6J2tzqEYgrDm4CziaF5UNRdwDGUn3wh/OK8QilLyHunQzi78y0J3XpxHnUEfFu
 B9v5mQVI/+speeO0jh6hQKumOmU086fFPw0riDYNrgxbWSGIFW8THPb9H1zyyLMrBO
 ZvzvrT33Ks/wg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y+3ceI1V
Subject: Re: [Buildroot] [PATCH] package/syslog-ng: Bump version to 4.1.1
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

Chris, All,

On 2023-05-01 09:21 +1200, Chris Packham spake thusly:
> Bump version to 4.1.1 and update sample config.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/syslog-ng/syslog-ng.conf | 2 +-
>  package/syslog-ng/syslog-ng.hash | 2 +-
>  package/syslog-ng/syslog-ng.mk   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
> index 69db9b4b78..f4b74dc8c1 100644
> --- a/package/syslog-ng/syslog-ng.conf
> +++ b/package/syslog-ng/syslog-ng.conf
> @@ -1,4 +1,4 @@
> -@version: 3.38
> +@version: 4.1
>  
>  source s_sys {
>  	file("/proc/kmsg" program_override("kernel"));
> diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
> index 6fce7be996..8ab4d5ac3b 100644
> --- a/package/syslog-ng/syslog-ng.hash
> +++ b/package/syslog-ng/syslog-ng.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  5491f686d0b829b69b2e0fc0d66a62f51991aafaee005475bfa38fab399441f7  syslog-ng-3.38.1.tar.gz
> +sha256  d7df3cfa32d1a750818d94b8ea582dea54c37226e7b55a88c3d2f3a543d8f20e  syslog-ng-4.1.1.tar.gz
>  sha256  c75dcbfc17ccf742f12042a370f825a40951085d2352dfc9d07e715dae3ca9bd  COPYING
>  sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
> diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
> index a7176ad129..1c4cec6adb 100644
> --- a/package/syslog-ng/syslog-ng.mk
> +++ b/package/syslog-ng/syslog-ng.mk
> @@ -6,7 +6,7 @@
>  
>  # When updating the version, please check at runtime if the version in
>  # syslog-ng.conf header needs to be updated
> -SYSLOG_NG_VERSION = 3.38.1
> +SYSLOG_NG_VERSION = 4.1.1
>  SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
>  SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
>  SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
> -- 
> 2.40.1
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
