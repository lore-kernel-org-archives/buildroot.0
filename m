Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1388CECE567
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 20:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADE5A400F2;
	Sat,  7 Sep 2024 20:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyFsndmrq4gO; Sat,  7 Sep 2024 20:29:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41241403B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41241403B8;
	Sat,  7 Sep 2024 20:29:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E98DA1BF3DA
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D67F4403B8
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0P_lNgQ4auT for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 20:29:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B4B5400F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B4B5400F2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B4B5400F2
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 20:29:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EB2FD13F86A;
 Sat,  7 Sep 2024 22:29:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Sep 2024 22:29:06 +0200
Date: Sat, 7 Sep 2024 22:29:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zty3kl18c4yV2fVt@landeda>
References: <20240719045639.3336541-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240719045639.3336541-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725740950;
 bh=zApNaSdjDVk5X53fpNi6HZx7R6MXpq5sfeWJ0a91djE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y9V34D4s44ZJu6T8CBuCrSGeVAJ+uXiijStVBfkIdO/huxx0CXHCFpOfXVW12cge5
 s7YxdiIVyfhKaUoNTfgcqA/PRktB11GWTQgiq20xNLAsXSg+gfmqOizy+CRPWWXNrP
 CKWm2wLI1kf1XrX4J5YkaLQRKBGRLvwn1JA5w/+nf6m2B8EgAuyKcoQ//Rhku/Yh2M
 dYhQEl9QN8Yzh8RzjlUFoCgP2zHOgKrdKSQk9okoumfotErIIt3jqICWZR4zBpXBA5
 1RBM6ryNar5lfEGEAluS1H/2w28oVkYvFYAlG5vX4P3dsOFxTwtsrWQZa2HRWfcenG
 SvZmm0uLt6K+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y9V34D4s
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.7.0
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

James, all,

On 2024-07-18 22:56 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-maturin/python-maturin.hash | 2 +-
>  package/python-maturin/python-maturin.mk   | 7 +++----
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
> index 9807260ebd..3c5f836ad5 100644
> --- a/package/python-maturin/python-maturin.hash
> +++ b/package/python-maturin/python-maturin.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after vendoring
> -sha256  53d51f5e2decca9af248748684aefa9245910757f19ae147dcf566172ecb0907  python-maturin-1.4.0-cargo2.tar.gz
> +sha256  56c18b09d38080f9975fb679be1fda01b936d21f5ef233967cda3dd74905e683  maturin-1.7.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
>  sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
> diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
> index 37479dd7e7..70cdb15949 100644
> --- a/package/python-maturin/python-maturin.mk
> +++ b/package/python-maturin/python-maturin.mk
> @@ -4,10 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_MATURIN_VERSION = 1.4.0
> -PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
> -PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/20/90/43a3aa35f037e91582ec7516a92084a71f84e89e39ef580813bed072b154
> -PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename

This change is incorrect: it drops the hack we have to ensure we can
have our -cargo2 post-version suffix appended to archive filename, as
done in commit c617ebbc977d.

Please, carefully prepare your changes, especially when there are
changes that are so unusual like those weird _SITE_PYPI and _SOURCE_PYPI
variabless that are not usually part of our python packages. That should
really have triggered a warning when preparaing the patch...

Regards,
Yann E. MORIN.

> +PYTHON_MATURIN_VERSION = 1.7.0
> +PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
> +PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/80/da/a4bbd6e97f3645f4ebd725321aa235e22e31037dfd92caf4539f721c0a5a
>  PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
>  PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
>  PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
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
