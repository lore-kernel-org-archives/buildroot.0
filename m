Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74346E7718B
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 21:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3305B404FE;
	Fri, 20 Dec 2024 21:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UPdmxTKV4zy; Fri, 20 Dec 2024 21:52:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E54884050D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E54884050D;
	Fri, 20 Dec 2024 21:52:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6A9D730
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 21:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D49A980E09
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 21:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5JvnydZ3vvC for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 21:52:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBAF180DD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBAF180DD5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBAF180DD5
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 21:52:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A9A5378034E;
 Fri, 20 Dec 2024 22:52:43 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56944])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Dec 2024 22:52:43 +0100
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 22:52:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Falco Hyfing <hyfinglists@gmail.com>
In-Reply-To: <20241220205852.3180626-1-james.hilliard1@gmail.com>
References: <20241220205852.3180626-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <37175a847f2ecdd2f655f60b6b45a3b1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734731565;
 bh=yCgzLN0VEn4VlVuLdq07tD9DADTN+a/EWwzv4AbyupI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hBuOy1djnZS8kfUsjwJyceDKX+jbZysKc4/ztIQtU/TGZhWuijQak15JMclHXUuA9
 Q2FUqE+m58L71ptcuCx2gs8y8M7jwnPGGDIoOlHgffamkpKENG7++VxGnm4RY1aUa6
 Wm8udcYPKxPLHkyGLBDlez5FhTH61L9cPhNMGI2XURBnq+2jG8hv4BzyBgZFhzUzQr
 XpUf1kX9/73oiN3+p7emlD4SQBjK6N//TIgI8vkGO5g83I9PWZHIzXGcXajGm7+L1Q
 Wjz+w3uc3dwrRwKd4muG9DqXm/JA28LsnDmbwhcnkjWiHZBKtRU5IEfSlFFYQehQt4
 reYlV2+9ul2dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hBuOy1dj
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to
 version 3.8.2
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

On 20/12/2024 21:58, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-pymodbus/python-pymodbus.hash | 4 ++--
>  package/python-pymodbus/python-pymodbus.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pymodbus/python-pymodbus.hash 
> b/package/python-pymodbus/python-pymodbus.hash
> index 1c51c5b2ab..09b8508efd 100644
> --- a/package/python-pymodbus/python-pymodbus.hash
> +++ b/package/python-pymodbus/python-pymodbus.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pymodbus/json
> -md5  7fca9b2c51dce7e1d8585bb1d96dd7d1  pymodbus-3.8.1.tar.gz
> -sha256  
> 543e3fabb10e9012801d235108ec81c8db15cc8f8e2c398861d0dc5acf9c623e  
> pymodbus-3.8.1.tar.gz
> +md5  e677f59321fd2ffa9969f586a10c4341  pymodbus-3.8.2.tar.gz
> +sha256  
> c57e41662cb7c26830f2f0e0166ffe2fe08ffd8749e0ce0a56f3d9f4bdc2a5c6  
> pymodbus-3.8.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  
> LICENSE
> diff --git a/package/python-pymodbus/python-pymodbus.mk 
> b/package/python-pymodbus/python-pymodbus.mk
> index fe74e3d211..f0cf8cca0d 100644
> --- a/package/python-pymodbus/python-pymodbus.mk
> +++ b/package/python-pymodbus/python-pymodbus.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_PYMODBUS_VERSION = 3.8.1
> +PYTHON_PYMODBUS_VERSION = 3.8.2
>  PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
> -PYTHON_PYMODBUS_SITE = 
> https://files.pythonhosted.org/packages/ff/81/7a7bae73b54d3545a1da420886abea0641273bbd87956dc7217b54ef524f
> +PYTHON_PYMODBUS_SITE = 
> https://files.pythonhosted.org/packages/49/99/375ce7b037e89ebaf55a55e219ffbf83efdcc0b93a9d39a71d6a1f848e57
>  PYTHON_PYMODBUS_SETUP_TYPE = setuptools
>  PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
>  PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
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
