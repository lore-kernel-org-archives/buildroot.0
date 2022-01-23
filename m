Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C95BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 08:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19F328143D;
	Sun, 23 Jan 2022 08:39:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18St_nZ9Z_wK; Sun, 23 Jan 2022 08:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4906681424;
	Sun, 23 Jan 2022 08:39:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 512481BF33D
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 08:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F41581424
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 08:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qPYXN5tfHK_O for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 08:39:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8B8F8141B
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 08:39:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8038:e8ec:605a:7149])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EAEBEB0051E;
 Sun, 23 Jan 2022 09:39:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642927179;
 bh=Pq8/PmcF3oFv+uIYqgs6f0nY3FM47YQV2VXHYZUxIoQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gbMRlt1ZNRfqAR8pMZIeJM6OhM4OXmHBt8OKgmZiKqu7Xi4TS0WmUQidd6CRIqg7I
 FEUw1gM/cZwiu6CLPW+M5b/3hFhFOG7cbrG2JtSU5n/8UmWFHz3IVh/fGLmgJgaP+o
 71v49YY5cOv85jc+2XNAg9Tuz04XoMtaYrbwxT0ZIs6A5X4lDQOsCaTtF5+2km5ebI
 BVD17E2Ktw+w1Pr1B6qP2zEcwjSQdzgmHcGptF4caUtRsSvKqWBzTOQ1FXEjLAgYQf
 MHnlYifYIss8N7pd7c2Iwywe2a4jQJ+9LdhGMtT80lsI0z+CF/ufWVGEBwR51UcRUK
 eyBKOF9vg0qyQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jan 2022 09:39:35 +0100
Date: Sun, 23 Jan 2022 09:39:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220123083935.GL3621364@scaer>
References: <20220122224410.309822-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122224410.309822-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: switch to pcre2
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-22 23:44 +0100, Fabrice Fontaine spake thusly:
> Switch to pcre2 which is supported since version 1.4.62 and
> https://github.com/lighttpd/lighttpd1.4/commit/7512d82ca49f1b579819c2974c61de4e3137c70b
> and enabled by default since version 1.4.64 and
> https://github.com/lighttpd/lighttpd1.4/commit/750414d3bb6f13c119220e56d0c8123e665dffc5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lighttpd/Config.in   | 2 +-
>  package/lighttpd/lighttpd.mk | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
> index 9f593a9228..ed674a9227 100644
> --- a/package/lighttpd/Config.in
> +++ b/package/lighttpd/Config.in
> @@ -48,7 +48,7 @@ config BR2_PACKAGE_LIGHTTPD_BZIP2
>  
>  config BR2_PACKAGE_LIGHTTPD_PCRE
>  	bool "pcre support"
> -	select BR2_PACKAGE_PCRE
> +	select BR2_PACKAGE_PCRE2
>  	help
>  	  Enable PCRE support. Needed to support mod_rewrite
>  
> diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
> index f0974dd5b2..2a05071209 100644
> --- a/package/lighttpd/lighttpd.mk
> +++ b/package/lighttpd/lighttpd.mk
> @@ -26,6 +26,7 @@ LIGHTTPD_CONF_OPTS = \
>  	-Dwith_mysql=false \
>  	-Dwith_nettle=false \
>  	-Dwith_nss=false \
> +	-Dwith_pcre=false \
>  	-Dwith_pgsql=false \
>  	-Dwith_sasl=false \
>  	-Dwith_wolfssl=false \
> @@ -65,10 +66,10 @@ LIGHTTPD_CONF_OPTS += -Dwith_bzip=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIGHTTPD_PCRE),y)
> -LIGHTTPD_DEPENDENCIES += pcre
> -LIGHTTPD_CONF_OPTS += -Dwith_pcre=true
> +LIGHTTPD_DEPENDENCIES += pcre2
> +LIGHTTPD_CONF_OPTS += -Dwith_pcre2=true
>  else
> -LIGHTTPD_CONF_OPTS += -Dwith_pcre=false
> +LIGHTTPD_CONF_OPTS += -Dwith_pcre2=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIGHTTPD_WEBDAV),y)
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
