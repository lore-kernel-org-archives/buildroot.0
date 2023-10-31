Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD289C4167B
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 20:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EB2542EB3;
	Tue, 31 Oct 2023 20:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EB2542EB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s900E96kJX2f; Tue, 31 Oct 2023 20:43:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA0B742EB0;
	Tue, 31 Oct 2023 20:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA0B742EB0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 38BD41BF2E3
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 20:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1117742EB0
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 20:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1117742EB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nXNfhectUTOO for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 20:42:58 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A866442EAE
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 20:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A866442EAE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:67d2:c63c:7c2a:c31])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5953219F58A;
 Tue, 31 Oct 2023 21:42:51 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 31 Oct 2023 21:42:50 +0100
Date: Tue, 31 Oct 2023 21:42:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20231031204250.GA2568@scaer>
References: <20231031155029.2689-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231031155029.2689-1-tianyuanhao3@163.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698784974;
 bh=SHYlgbf6p9pSscA48GAn1lizXIOZYJWvCvYxZI/xUfs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zv+WeyACzIXdYB6+fKFotm7bRDhV7aleL2Yd4lmcj4IR9/zSdFuDnP0sxN4Tf0E/O
 TJNd+q0qKAp5vZLa4suGvE3LXxk3ECCaAj/LHQ7uQXznJzpAee5GnynG6PrT+/BRn6
 G36f0aQCE+8mkCfbof2kKUx5Co+soQMS7kxO6v+iyPTvfAhR1CnZbtgGwFA575IBgv
 HuqrXhOFIIximI846DvErjzDk9myogV/9emY7zUFfm0QTVdGUZ4vwdVtXRXSTld+12
 ysShJ8kc0MLnVfQCwSMyyi8SVOtsnnuGG6qiy1aMiEjzN5uRx6sdL6OUnQKRT7DjOI
 zTZD984JL0t5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zv+WeyAC
Subject: Re: [Buildroot] [PATCH 1/1] package/tini: move docker-init to
 /usr/libexec/docker/
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
Cc: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yuanhao, All,

On 2023-10-31 15:50 +0000, TIAN Yuanhao spake thusly:
> The docker-init is not intended to be a user-facing command, and as such
> it is more appropriate for it to be found in /usr/libexec/ than in $PATH.
> 
> See:
> https://github.com/moby/moby/commit/6caaa8cadc9e4f1e122b7b2bb4451500bbec6086
> https://github.com/docker/docker-ce-packaging/commit/5a998af6f53d978810aa6f5b566a484911ff4ca2
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  package/tini/tini.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/tini/tini.mk b/package/tini/tini.mk
> index 9da54f8a25..75b6786cfb 100644
> --- a/package/tini/tini.mk
> +++ b/package/tini/tini.mk
> @@ -31,7 +31,8 @@ endef
>  
>  define TINI_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 0755 $(@D)/bin/tini $(TARGET_DIR)/usr/bin/tini
> -	ln -sf tini $(TARGET_DIR)/usr/bin/docker-init
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/libexec/docker

Although what you did is correct, we usually use plain mkdir -p to
create directories, so I've changed that.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +	ln -sf ../../bin/tini $(TARGET_DIR)/usr/libexec/docker/docker-init
>  endef
>  
>  # Tini's CMakeLists.txt is not suitable for Buildroot.
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
