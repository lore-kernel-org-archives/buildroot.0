Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EAEC77B75
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E84786122E;
	Sat,  6 May 2023 14:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E84786122E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CXSzxEOcSeyE; Sat,  6 May 2023 14:44:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FA8D6112C;
	Sat,  6 May 2023 14:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FA8D6112C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F8371BF36E
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33E4C404C4
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33E4C404C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jVm15NSBuh3v for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:43:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E356400E5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E356400E5
 for <buildroot@buildroot.org>; Sat,  6 May 2023 14:43:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 707BBB0056A;
 Sat,  6 May 2023 16:43:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 16:43:18 +0200
Date: Sat, 6 May 2023 16:43:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230506144318.GG2661@scaer>
References: <20230323214901.3489-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230323214901.3489-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683384201;
 bh=IGuv1XjCKSZfNgfR/LazCCz6CH4nrnzyBoBfc5S48DI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sBLEvqdPwm4yoIdETRA2z/zc9mObSnlpBggDBO3/+4i8X/HZsuMCuvdH0vWJyG3Gq
 4d0p3Bnqm9K1U9/MMSWTlu0DsS23Clw0ChJI3is30fUzaulyzXmeWS9PmkFFBpCocx
 9Qovq9/4iBFDxXqHntVBUleoQ5lJtey/ksKrywbUU/CL38qSAfy538XOeAy+e90gUa
 lx0LuhEGtF/xl3CqWOBX0lnmPRMy8/Vul+xf4dM/8txo8jCjOesD7nFjrtR8kUF8/P
 39IKEUFEIi/CsTmmYleEqHXH96idfaCzbEtMaEgb4+vWV5PlSl3yOD9+HyfDUxzxH/
 vm8xB2Ga+nc9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sBLEvqdP
Subject: Re: [Buildroot] [PATCH v1] package/grep: bump version to 3.10
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

Peter, All,

On 2023-03-23 22:49 +0100, Peter Seiderer spake thusly:
> For details see [1].
> 
> [1] https://lists.gnu.org/archive/html/info-gnu/2023-03/msg00007.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/grep/grep.hash | 4 ++--
>  package/grep/grep.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/grep/grep.hash b/package/grep/grep.hash
> index c83e4653c3..142d15644d 100644
> --- a/package/grep/grep.hash
> +++ b/package/grep/grep.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking signature
> -# https://ftp.gnu.org/gnu/grep/grep-3.9.tar.xz.sig
> +# https://ftp.gnu.org/gnu/grep/grep-3.10.tar.xz.sig
>  # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
> -sha256  abcd11409ee23d4caf35feb422e53bbac867014cfeed313bb5f488aca170b599  grep-3.9.tar.xz
> +sha256  24efa5b595fb5a7100879b51b8868a0bb87a71c183d02c4c602633b88af6855b  grep-3.10.tar.xz
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/grep/grep.mk b/package/grep/grep.mk
> index 309987010f..2f3b405f93 100644
> --- a/package/grep/grep.mk
> +++ b/package/grep/grep.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GREP_VERSION = 3.9
> +GREP_VERSION = 3.10
>  GREP_SITE = $(BR2_GNU_MIRROR)/grep
>  GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
>  GREP_LICENSE = GPL-3.0+
> -- 
> 2.39.2
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
