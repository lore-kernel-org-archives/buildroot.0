Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF74E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F9BD80ABA;
	Fri, 27 Dec 2024 14:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVEtsLpQoNcn; Fri, 27 Dec 2024 14:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1363480C89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1363480C89;
	Fri, 27 Dec 2024 14:35:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CB9CE0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CE54402B3
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvFEAdka3RDY for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:35:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 21F39402B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21F39402B5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21F39402B5
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:35:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0E0B313F8BA;
 Fri, 27 Dec 2024 15:35:12 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:35:12 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:35:12 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241223144939.1719298-1-james.hilliard1@gmail.com>
References: <20241223144939.1719298-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b456f49c584ab1383dfdafa21fd20360@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310115;
 bh=ZVh+QOKi8ZwIQnDQcIiSKg+5ZN8Qb7SyhhPxJI3nhOQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YUx99vPwV8KZF+CB4D+Bo2Nwhq5/r5FWfG3m1Qk4bm8V2AcpVsSznOzmmolhEAk6Z
 arskJO2+pxpcrchGdV1O00Y2tyNARl7YjGwbybeAMEOIUWYhOZpoGuvrVtpxjpB8Jl
 3lWWBzRdcrsNRmk4qWaz7mqgjvCVcXLApSax3DgxS5l6gY1BneMsJzHtWIGRu+TThh
 wiQ1YYoUjfCATx7bSWQ7G6sW2sYbGn2LOVLmxDBAaDmIUEHy8pQDuU77xiCpcvJyEx
 b1Cd23LHj3elEKqG+DWVSp27sXdEkToxPjJOhx1ppF3OXhSkChsfr9tPzENqMIOyVc
 05vjbAsmDG7aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YUx99vPw
Subject: Re: [Buildroot] [PATCH 1/2] package/python-telnetlib3: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/12/2024 15:49, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks.

> ---
>  package/Config.in                                |  1 +
>  package/python-telnetlib3/Config.in              |  6 ++++++
>  package/python-telnetlib3/python-telnetlib3.hash |  5 +++++
>  package/python-telnetlib3/python-telnetlib3.mk   | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-telnetlib3/Config.in
>  create mode 100644 package/python-telnetlib3/python-telnetlib3.hash
>  create mode 100644 package/python-telnetlib3/python-telnetlib3.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 06472aa972..8da59cdcbf 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1421,6 +1421,7 @@ menu "External python modules"
>  	source "package/python-systemd/Config.in"
>  	source "package/python-tabledata/Config.in"
>  	source "package/python-tcolorpy/Config.in"
> +	source "package/python-telnetlib3/Config.in"
>  	source "package/python-tempora/Config.in"
>  	source "package/python-termcolor/Config.in"
>  	source "package/python-terminaltables/Config.in"
> diff --git a/package/python-telnetlib3/Config.in 
> b/package/python-telnetlib3/Config.in
> new file mode 100644
> index 0000000000..487258c272
> --- /dev/null
> +++ b/package/python-telnetlib3/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_TELNETLIB3
> +	bool "python-telnetlib3"
> +	help
> +	  Python 3 asyncio Telnet server and client Protocol library.
> +
> +	  http://telnetlib3.rtfd.org/
> diff --git a/package/python-telnetlib3/python-telnetlib3.hash 
> b/package/python-telnetlib3/python-telnetlib3.hash
> new file mode 100644
> index 0000000000..db18889b8f
> --- /dev/null
> +++ b/package/python-telnetlib3/python-telnetlib3.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/telnetlib3/json
> +md5  2dfac7e10ed63c408da50ea712415f87  telnetlib3-2.0.4.tar.gz
> +sha256  
> dbcbc16456a0e03a62431be7cfefff00515ab2f4ce2afbaf0d3a0e51a98c948d  
> telnetlib3-2.0.4.tar.gz
> +# Locally computed sha256 checksums
> +sha256  
> caaf4ac82c4363d4874a49b50af15797618f6aee5bf42218697cdcb41c391ca5  
> LICENSE.txt
> diff --git a/package/python-telnetlib3/python-telnetlib3.mk 
> b/package/python-telnetlib3/python-telnetlib3.mk
> new file mode 100644
> index 0000000000..e68533af5c
> --- /dev/null
> +++ b/package/python-telnetlib3/python-telnetlib3.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-telnetlib3
> +#
> +################################################################################
> +
> +PYTHON_TELNETLIB3_VERSION = 2.0.4
> +PYTHON_TELNETLIB3_SOURCE = 
> telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
> +PYTHON_TELNETLIB3_SITE = 
> https://files.pythonhosted.org/packages/ef/af/0fadfddd1764e627f4ba9c7381caaf121795ed459a1cc3d0fbb89a187954
> +PYTHON_TELNETLIB3_SETUP_TYPE = setuptools
> +PYTHON_TELNETLIB3_LICENSE = ISC
> +PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt
> +
> +$(eval $(python-package))
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
