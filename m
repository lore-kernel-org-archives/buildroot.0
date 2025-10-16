Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4A1CCD183
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 20:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CEF54040E;
	Thu, 16 Oct 2025 20:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JqV2n_tKfzvg; Thu, 16 Oct 2025 20:48:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37BBC40410
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37BBC40410;
	Thu, 16 Oct 2025 20:48:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 059DDD8
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EABB480E1C
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9z_ghxk6sXVV for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 20:48:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E31480E21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E31480E21
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E31480E21
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:48:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B136178034E;
 Thu, 16 Oct 2025 22:48:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Oct 2025 22:48:00 +0200
MIME-Version: 1.0
Date: Thu, 16 Oct 2025 22:48:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
In-Reply-To: <20251015170417.1887247-1-bernd@kuhls.net>
References: <20251015170417.1887247-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <70ca4524e6b6a633fffc58598b6ffeeb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760647684;
 bh=wNiUP3eTmNOrYjWPzUk2mscQK5DvtKaU3kM4L+8MDbo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Sn3Tmq7EoLEu58EM5j4InfJgXvUS9MJlpz2B81+sNyPHvZht2ZRXwJczEUAeBWF93
 +d1LDlvvCrGz8EV/kuy2fMNZaKncz0sV16GsPKCJNDyp7emFcuMAXsJKUuaR0Wa2uU
 jVqiul1EHWOv9XJvHB/J02nbvKwTUNFxNdQakU+4y+c094ZLMLkHVy/ge0z4V4Lpgy
 4a9IA/HQUaxueoa0498y2Lk4HwlSQxMnSoVEaP3PirQkmgacAc8vrMr/wFa75aD/PO
 6CvysqcirPFRuxbeWluM+M5I4nDNZ419OtX6VBrLkU6U7081pkRM4z7Ko1hLGAwh9h
 H59RDVPucP1Rw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Sn3Tmq7E
Subject: Re: [Buildroot] [PATCH 1/1] package/python-lmdb: bump version to
 1.7.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On 15/10/2025 19:04, Bernd Kuhls wrote:
> Added dependencies to python-cffi & python-patch-ng due to upstream
> commit:
> https://github.com/jnwatson/py-lmdb/commit/3f6f458df64fdbf4a2dbc5ec0aa407b640ef00e2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/python-lmdb/Config.in        | 2 ++
>  package/python-lmdb/python-lmdb.hash | 4 ++--
>  package/python-lmdb/python-lmdb.mk   | 5 +++--
>  3 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-lmdb/Config.in 
> b/package/python-lmdb/Config.in
> index b63af96ec4..a94badbe76 100644
> --- a/package/python-lmdb/Config.in
> +++ b/package/python-lmdb/Config.in
> @@ -1,5 +1,7 @@
>  config BR2_PACKAGE_PYTHON_LMDB
>  	bool "python-lmdb"
> +	select BR2_PACKAGE_PYTHON_CFFI # runtime
> +	select BR2_PACKAGE_PYTHON_PATCH_NG # runtime

The script "utils/check-symbols" generates an error here:
package/python-lmdb/Config.in:4: BR2_PACKAGE_PYTHON_PATCH_NG referenced 
but not defined

There is apparently no such package in Buildroot, yet.

Could you send an updated patch addressing this issue, please?

>  	help
>  	  Universal Python binding for the LMDB 'Lightning' Database.
> 
> diff --git a/package/python-lmdb/python-lmdb.hash 
> b/package/python-lmdb/python-lmdb.hash
> index f729c197f8..525c434f2a 100644
> --- a/package/python-lmdb/python-lmdb.hash
> +++ b/package/python-lmdb/python-lmdb.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/lmdb/json
> -md5  f9d67b42a6d708ec1cfc860f67e20387  lmdb-1.6.2.tar.gz
> -sha256  
> d28e3fa59935ff688858760ec52f202ecb8c1089a3f68d1f162ea3078d151e73  
> lmdb-1.6.2.tar.gz
> +md5  0996b2df3b8019b76ce1fa37913e41f0  lmdb-1.7.5.tar.gz
> +sha256  
> f0604751762cb097059d5412444c4057b95f386c7ed958363cf63f453e5108da  
> lmdb-1.7.5.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  
> LICENSE
> diff --git a/package/python-lmdb/python-lmdb.mk 
> b/package/python-lmdb/python-lmdb.mk
> index 1648ed7054..3f92ef066f 100644
> --- a/package/python-lmdb/python-lmdb.mk
> +++ b/package/python-lmdb/python-lmdb.mk
> @@ -4,11 +4,12 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_LMDB_VERSION = 1.6.2
> +PYTHON_LMDB_VERSION = 1.7.5
>  PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
> -PYTHON_LMDB_SITE = 
> https://files.pythonhosted.org/packages/71/54/fb1d5918406a72fcf46fbfaece7c0349d88cd8685f5443a142ddd7dac05b
> +PYTHON_LMDB_SITE = 
> https://files.pythonhosted.org/packages/c7/a3/3756f2c6adba4a1413dba55e6c81a20b38a868656517308533e33cb59e1c
>  PYTHON_LMDB_LICENSE = OLDAP-2.8
>  PYTHON_LMDB_LICENSE_FILES = LICENSE
> +PYTHON_LMDB_DEPENDENCIES = host-python-cffi host-python-patch-ng
>  PYTHON_LMDB_CPE_ID_VENDOR = py-lmdb_project
>  PYTHON_LMDB_CPE_ID_PRODUCT = py-lmdb
>  PYTHON_LMDB_SETUP_TYPE = setuptools
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
