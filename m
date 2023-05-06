Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCC0C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57A4B81762;
	Sat,  6 May 2023 15:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57A4B81762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V7Q8rD8eCDSS; Sat,  6 May 2023 15:35:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 759EB81444;
	Sat,  6 May 2023 15:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 759EB81444
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C49C21BF36C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BEF960804
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BEF960804
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJf5d6VMMp3q for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:35:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 891CD60F54
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 891CD60F54
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:35:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C18A9B0056A;
 Sat,  6 May 2023 17:35:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 17:35:15 +0200
Date: Sat, 6 May 2023 17:35:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Uladzimir Bely <wiselord1983@gmail.com>
Message-ID: <20230506153515.GF252090@scaer>
References: <20230506091127.9192-1-wiselord1983@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230506091127.9192-1-wiselord1983@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683387318;
 bh=pAe701FjHChchvn2K2488X/x/CViFd6UsksrUaXQEBM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zfysneb4ZH4Un4Grno/TiPd8YaCNwt3ch7sD99CNlpAcGoBdfTuqYfFWBVjWkBm/q
 1ihxIvkaC14hpIqI403uBmFVVnIc1Y1h8g3LNEel+aClZpmIkLdO3tJX07BF+d5AiM
 Su+W15/M35foze5J5qW3e/meoUQh7MAk5XigcqMhWm2NpgoPJ3pBf0jqWtxPkHWr7C
 eb0RInrteabSO4mS3F5WRZw+fH79PgzdLKMw3TVCYcwBlXEW8/pd5zIJSPy5d1t2aR
 8po92fijZFPc3IND74HjHDRuL9om06c75/N+n6d1pyIwLIgoM8oYwC0MfERODHAGN9
 RaRnAyCjrQhqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zfysneb4
Subject: Re: [Buildroot] [PATCH 1/1] package/python-mpd2: bump to version
 3.1.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Uladzimir, All,

On 2023-05-06 12:11 +0300, Uladzimir Bely spake thusly:
> Signed-off-by: Uladzimir Bely <wiselord1983@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-mpd2/python-mpd2.hash | 4 ++--
>  package/python-mpd2/python-mpd2.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-mpd2/python-mpd2.hash b/package/python-mpd2/python-mpd2.hash
> index 88dcb28377..cfe5a7c0c0 100644
> --- a/package/python-mpd2/python-mpd2.hash
> +++ b/package/python-mpd2/python-mpd2.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/python-mpd2/json
> -md5  594dff3e53c8eb6f583ba642bc2c1a27  python-mpd2-3.0.5.tar.gz
> -sha256  6f1bffd93b9a32fc018a9bbf3487505b52e0d757ec34066905c60a912d492384  python-mpd2-3.0.5.tar.gz
> +md5  f083c107b28525bb4c2580140861d86e  python-mpd2-3.1.0.tar.gz
> +sha256  f33c2cdb0d6baa74a36724f38c1c4a099a7ce2c8ec4a2bb7192150a5855df476  python-mpd2-3.1.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
> diff --git a/package/python-mpd2/python-mpd2.mk b/package/python-mpd2/python-mpd2.mk
> index bfe382b59e..124ff57db0 100644
> --- a/package/python-mpd2/python-mpd2.mk
> +++ b/package/python-mpd2/python-mpd2.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -PYTHON_MPD2_VERSION = 3.0.5
> -PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/ed/c2/263621bdbbc37fa1a55fa1a7f66fd601bf08b3f87481e318a3509fb6c4bf
> +PYTHON_MPD2_VERSION = 3.1.0
> +PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/59/32/e57725251ce3117d2ed2a7b76d9722ea9bea26f54b2cc8981d03350e4103
>  PYTHON_MPD2_SETUP_TYPE = setuptools
>  PYTHON_MPD2_LICENSE = LGPL-3.0+
>  PYTHON_MPD2_LICENSE_FILES = LICENSE.txt
> -- 
> 2.39.3
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
