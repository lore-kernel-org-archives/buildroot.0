Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB427C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 11:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4162840012;
	Sat, 25 Nov 2023 11:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4162840012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Db60oABFn-IN; Sat, 25 Nov 2023 11:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3512340236;
	Sat, 25 Nov 2023 11:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3512340236
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DD6E1BF27C
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 11:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35E3242135
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 11:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35E3242135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x_7clsl0__sc for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 11:31:06 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE28C42096
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 11:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE28C42096
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:a9ce:514c:eb15:225c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9AFDF13F86A;
 Sat, 25 Nov 2023 12:30:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Nov 2023 12:30:59 +0100
Date: Sat, 25 Nov 2023 12:30:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231125113059.GG3177259@scaer>
References: <20231124232519.184099-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231124232519.184099-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700911863;
 bh=xvAX3mYgdnjE7KtMEcLi6Iz2YArQZ6eaa8xosyMfvoo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s/FaBAl2bx4qeKgBBxlodXE6+YAya1M5nZu6ln1TCsAxRBa6325NaYCHE9GkP3yKW
 n0GVXnWwtXbVGOoiivOyi7c007krXfwAyd67hpuKszpXULNtyl6MzRzjxS6MT22GTT
 Nr1qt/sGSms2LuKppORD0HqFOqgsGQQ53iGtws6EJzvu7vhdR8veOxtIw6Vuf2u3w2
 iSwi38jxENJBgQN9A+wAryLuDTdlAV4bW/71JMw25Brv/a2utfheGEMMjnVb6/zGju
 mqnm9c6fobG64sIxiKvJX4fajXngSJAJBTae2Gs0tNs9DlBhnQbJThXB/C3xCaJMyH
 G0MqD/RWh8LmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=s/FaBAl2
Subject: Re: [Buildroot] [PATCH 1/1] package/python-orjson: bump to version
 3.9.10
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-11-24 16:25 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I've applied all the version bumps that did not require new packages,
from this one up to the pyelftools one, i.e.e 23 commits, to next,
thanks!

Regards,
Yann E. MORIN.

> ---
>  package/python-orjson/python-orjson.hash | 2 +-
>  package/python-orjson/python-orjson.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
> index 773fb14568..0e9b93f311 100644
> --- a/package/python-orjson/python-orjson.hash
> +++ b/package/python-orjson/python-orjson.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after vendoring
> -sha256  048938fd9153f37eaf7a08b748de94ff87b2488dd3bd9f96c3ae784527a961b3  orjson-3.9.2.tar.gz
> +sha256  245a1ad9a8f926273787e91f7d7e14b4b357e263a215d8c96dd2039b3cddc238  orjson-3.9.10.tar.gz
>  # Locally computed sha256 checksums
>  sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
>  sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
> index cf05b26262..a2e8a50468 100644
> --- a/package/python-orjson/python-orjson.mk
> +++ b/package/python-orjson/python-orjson.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_ORJSON_VERSION = 3.9.2
> +PYTHON_ORJSON_VERSION = 3.9.10
>  PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
> -PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/30/a4/96bcb52da0de9ccfcd99a60719b995c9b9c3aaa3a70701f0790ce856c10d
> +PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/72/75/642688bf5d99131fe8cf603f4ef9f26e4b1c6ed8f7f5c7e6fb31def54fb7
>  PYTHON_ORJSON_SETUP_TYPE = maturin
>  PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
>  PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
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
