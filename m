Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FB6C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:00:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DA4C619E7
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DA4C619E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14B934159F;
	Sun,  3 Oct 2021 20:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id luzXn37Ixv5g; Sun,  3 Oct 2021 20:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BF8E4157D;
	Sun,  3 Oct 2021 20:00:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDBFF1BF45A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD9334157D
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xGtycvYYbO7l for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:00:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0B6D406AE
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:00:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E954E13F87F;
 Sun,  3 Oct 2021 22:00:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633291253;
 bh=B/vJVSkMMyz6w3TUTbZw7plouxA9QAO+Y0kmyc/E3No=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JSLI9CQaHeYz+TanBYNb1GkdrfP5CrkEDElgIoVbyoeRER/pfsNLeC9IAiE4wUvbN
 MNLQpXa/gmizPbbJXPIu/SreBlfCLdroRklkSVwhFxxwY5uc9iK0Jajv/KxFTFmyGd
 R4G7+Tny5wSIiJViqKfyj3vWItBjbynonEO4SFVCZ01A8JXbmZ6XjA6fvD7KfKezvK
 JelY6wkbmXAuPdOJSBa8xCabWComLb7bZ9hr0vsO9sUpinhatuH2WFiLoIeEg6SMNr
 Pg0aiw5dnGX4aejpd6tIhS3IenLvJJhGKCx2qRfC630bcZirsjd0fFHoR/Heh+9/pV
 ikBw+98VFEVFA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 22:00:46 +0200
Date: Sun, 3 Oct 2021 22:00:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20211003200046.GS1504958@scaer>
References: <20210928110212.596939-1-asafka7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928110212.596939-1-asafka7@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pbr: bump to version
 5.6.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Asaf, All,

On 2021-09-28 14:02 +0300, Asaf Kahlon spake thusly:
> Plus, indent with two spaces in the hash file.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Series applied to master, thanks.

I've further replied to patches where I had to tweak stuff.

Regards,
Yann E. MORIN.

> ---
>  package/python-pbr/python-pbr.hash | 8 ++++----
>  package/python-pbr/python-pbr.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-pbr/python-pbr.hash b/package/python-pbr/python-pbr.hash
> index cca9de0178..8cf2a18d36 100644
> --- a/package/python-pbr/python-pbr.hash
> +++ b/package/python-pbr/python-pbr.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/pbr/json
> -md5	477d2aa285ad97250a172b199f4060b7  pbr-5.4.3.tar.gz
> -sha256	2c8e420cd4ed4cec4e7999ee47409e876af575d4c35a45840d59e8b5f3155ab8  pbr-5.4.3.tar.gz
> +md5  62565acc6bf3e7e10b082463421f8b46  pbr-5.6.0.tar.gz
> +sha256  42df03e7797b796625b1029c0400279c7c34fd7df24a7d7818a1abb5b38710dd  pbr-5.6.0.tar.gz
>  # Locally computed sha256 checksums
> -sha256	5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  LICENSE
> -sha256	eb4a8c8791f6caab1cf36df26db2b6f4e2ddda52657b060ff7f02abc63910aef  pbr/tests/testpackage/LICENSE.txt
> +sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  LICENSE
> +sha256  eb4a8c8791f6caab1cf36df26db2b6f4e2ddda52657b060ff7f02abc63910aef  pbr/tests/testpackage/LICENSE.txt
> diff --git a/package/python-pbr/python-pbr.mk b/package/python-pbr/python-pbr.mk
> index 12b5b56811..3cc7ab81fa 100644
> --- a/package/python-pbr/python-pbr.mk
> +++ b/package/python-pbr/python-pbr.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PBR_VERSION = 5.4.3
> +PYTHON_PBR_VERSION = 5.6.0
>  PYTHON_PBR_SOURCE = pbr-$(PYTHON_PBR_VERSION).tar.gz
> -PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/99/f1/7807d3409c79905a907f1c616d910c921b2a8e73c17b2969930318f44777
> +PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/35/8c/69ed04ae31ad498c9bdea55766ed4c0c72de596e75ac0d70b58aa25e0acf
>  PYTHON_PBR_SETUP_TYPE = setuptools
>  PYTHON_PBR_LICENSE = Apache-2.0 (module), BSD-3-Clause (test package)
>  PYTHON_PBR_LICENSE_FILES = LICENSE pbr/tests/testpackage/LICENSE.txt
> -- 
> 2.33.0
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
