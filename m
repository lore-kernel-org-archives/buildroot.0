Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51885ECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 10:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E77BD404B7;
	Sun, 28 Aug 2022 10:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E77BD404B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R63BbnQ9JXJd; Sun, 28 Aug 2022 10:18:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 255A840420;
	Sun, 28 Aug 2022 10:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 255A840420
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B51591BF5AA
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 10:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9069181D70
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 10:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9069181D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJjyxahfCb2E for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 10:18:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 957F981A47
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 957F981A47
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 10:18:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C0682780511;
 Sun, 28 Aug 2022 12:18:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 12:18:17 +0200
Date: Sun, 28 Aug 2022 12:18:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220828101817.GN37358@scaer>
References: <20220828084033.13660-1-ju.o@free.fr>
 <20220828084033.13660-2-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220828084033.13660-2-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661681899;
 bh=jMff3bvs50nkQi2Y4GWD1IRZKC/+Je5EJWeC2qYxDMI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vMqNURpA6G1sSGeFpP73WhvaMgOl9W80eDarB+MIfHgJOE3/y/j17MsAS4RULydcI
 o+xUiBWPxL93d2HPte7/QPZYeTPrG9eSn0Zr36EgD8aVGYxJnOBDwkIRiZFhKlGs0V
 43F8CXfjvpq3suhaxPcgSjbxhJ3r5Hp9SW9kLVWs2ENiQKoq/i1/58iIDXyXoZfQG3
 NMGssYvOtagjI+fxygaRt9QcJVD2AcCCley78IRBk6NleLrxF2cWrERhGujvDuOIgQ
 Cn7Z2caLKSX7E2hWs4diQFjHpfGPc/IRfuaW4it/Bfy4093vP5AcjLJs79E4y+IBxg
 n11o9K2FZ1akw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vMqNURpA
Subject: Re: [Buildroot] [next 2/2] package/poco: add the new Prometheus
 component
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

Julien, All,

On 2022-08-28 10:40 +0200, Julien Olivain spake thusly:
> The Poco Prometheus component was added in 1.12.0. See:
> https://github.com/pocoproject/poco/blob/poco-1.12.0-release/CHANGELOG#L6
> 
> For Prometheus information, see: https://prometheus.io/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
> Tested with previous patch on BR commit 6c7061f with command:
>     cat > poco.config <<EOF
>     BR2_PACKAGE_POCO=y
>     BR2_PACKAGE_POCO_ACTIVERECORD=y
>     BR2_PACKAGE_POCO_CPP_PARSER=y
>     BR2_PACKAGE_POCO_DATA_MYSQL=y
>     BR2_PACKAGE_POCO_DATA_PGSQL=y
>     BR2_PACKAGE_POCO_DATA_SQLITE=y
>     BR2_PACKAGE_POCO_JWT=y
>     BR2_PACKAGE_POCO_MONGODB=y
>     BR2_PACKAGE_POCO_NETSSL_OPENSSL=y
>     BR2_PACKAGE_POCO_PDF=y
>     BR2_PACKAGE_POCO_PROMETHEUS=y
>     BR2_PACKAGE_POCO_REDIS=y
>     BR2_PACKAGE_POCO_ZIP=y
>     EOF
>     utils/test-pkg -a -p poco -c poco.config
>     ...
>     44 builds, 16 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>  package/poco/Config.in | 4 ++++
>  package/poco/poco.mk   | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/poco/Config.in b/package/poco/Config.in
> index cb447960f1..820e631966 100644
> --- a/package/poco/Config.in
> +++ b/package/poco/Config.in
> @@ -92,6 +92,10 @@ config BR2_PACKAGE_POCO_PDF
>  	select BR2_PACKAGE_POCO_UTIL
>  	select BR2_PACKAGE_POCO_XML
>  
> +config BR2_PACKAGE_POCO_PROMETHEUS
> +	bool "Prometheus"
> +	select BR2_PACKAGE_POCO_NET
> +
>  config BR2_PACKAGE_POCO_REDIS
>  	bool "Redis"
>  	select BR2_PACKAGE_POCO_NET
> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
> index 3bcc42c455..e37effd690 100644
> --- a/package/poco/poco.mk
> +++ b/package/poco/poco.mk
> @@ -33,6 +33,7 @@ POCO_OMIT = Data/ODBC PageCompiler \
>  	$(if $(BR2_PACKAGE_POCO_NET),,Net) \
>  	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL) \
>  	$(if $(BR2_PACKAGE_POCO_PDF),,PDF) \
> +	$(if $(BR2_PACKAGE_POCO_PROMETHEUS),,Prometheus) \
>  	$(if $(BR2_PACKAGE_POCO_REDIS),,Redis) \
>  	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
>  	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
> -- 
> 2.37.2
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
