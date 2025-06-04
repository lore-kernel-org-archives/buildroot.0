Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C340C5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68A2B60C06;
	Wed,  4 Jun 2025 18:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdkiZBuNEBs9; Wed,  4 Jun 2025 18:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96C0360E50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96C0360E50;
	Wed,  4 Jun 2025 18:26:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3D3EDA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D523183B3F
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYefhbY9iFWr for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:26:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF14A81086
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF14A81086
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF14A81086
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:26:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CFF5E1C0198; Wed,  4 Jun 2025 20:26:46 +0200 (CEST)
Message-ID: <a356c228-7162-410d-acaf-f5103489f628@rnout.be>
Date: Wed, 4 Jun 2025 20:26:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
References: <20250522094822.58859-1-buildroot@bubu1.eu>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250522094822.58859-1-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061607; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=DmFIi5IgxX6OzFxYdd06L9erC6+rA+W6eRjBJP/Kv30=;
 b=ae87+O/gftdBip8yuUj4T2S4+H2rb+feBCuFlqta8AC7H5rH7Dx7Vo3HtUR2Vu9vi6Fdom
 5KqMHvbZ6W+jv10mZA3751ZMU0S19AIirSJaP0Wn+cmdeE+N9gx7b38f8d7M3j6wXh5g7J
 2JUI4z6G9c21MgOLyp1JThEW8DAHcRMMCVN18nVo/R1Tv8aiL70isR4W7ghLy9HAOqfGV/
 JAMJzioRWzy7U/q60JAHK8cQP+a4vu28YWmYGuNsPAOvhmBtlsx1fwrT1VdtUYQ6+Vjs9q
 pQBTf3c/Y5OIsVzzNnWeNlg/BtkJhrsl08wIqIKZNRMF+B9T+w+iVYuMiNJz6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ae87+O/g
Subject: Re: [Buildroot] [PATCH 1/2] package/python-django: clarify licensing
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/05/2025 11:48, Marcus Hoffmann via buildroot wrote:
> Django includes code from a couple of other projects, add their
> respective license files and licenses to the django package.
> 
> ./utils/scanpypi finds most of these. Additionally this was
> cross-checked against debian's license list [1], not including some
> things that no longer exist or no longer indicate separate licensing
> upstream:
> * django/contrib/admin/static/admin/fonts/
> * django/utils/baseconv.py
> * django/utils/ipv6.py
> * django/utils/autoreload.py
> 
> Also not included are separate licensing for docs, which buildroot
> doesn't package:
> * docs/_theme/djangodocs/static/reset-fonts-grids.css
> * docs/_theme/djangodocs/static/fontawesome/LICENSE.txt
> 
> [1] https://metadata.ftp-master.debian.org/changelogs//main/p/python-django/python-django_5.2-1_copyright
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/python-django/python-django.hash | 10 ++++++++++
>   package/python-django/python-django.mk   | 14 ++++++++++++--
>   2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 836307f6b8..32a9ce13b8 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -3,3 +3,13 @@ md5  317174c6e0593c40e58ec1bd428b1091  django-5.2.1.tar.gz
>   sha256  57fe1f1b59462caed092c80b3dd324fd92161b620d59a9ba9181c34746c97284  django-5.2.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
> +sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
> +sha256  570a045a8372b6cd6a00e30ebafe8e3e8dfc0a7fe3d4ef2cc5f16d419eb63aeb  django/contrib/gis/gdal/LICENSE
> +sha256  08bf24b7551238ae325295245425b1caeb9ad0f42f9e2d303c7b353502632045  django/contrib/gis/geos/LICENSE
> +sha256  d48633adb736dac091477ec2206feebeee88e3e6e486aedb21c584e4b49be0ec  django/contrib/admin/static/admin/js/inlines.js
> +sha256  d4db9ebe6f29f5168eac45ad713f055623ac5d0dcd5ba92da23d650ae012020d  django/contrib/admin/static/admin/js/vendor/jquery/LICENSE.txt
> +sha256  4ee0cbc51370afde358652a0f977972053729ed578b6a42f5e2a037d114f0b39  django/contrib/admin/static/admin/js/vendor/select2/LICENSE.md
> +sha256  73af2949bff9296cb0f816c3be19a4da4e95adc94c1f924796e8bad3f03f2f29  django/contrib/admin/static/admin/js/vendor/xregexp/LICENSE.txt
> +sha256  d114faff3488c16c319b3235dc41f90239d3d63d9853733033d8f7535f5c0004  django/contrib/admin/static/admin/img/LICENSE
> +sha256  54004c4b606964ebc163af16d04607c16e428f8a78a026fecb53f70c09f4a94f  django/dispatch/license.txt
> +sha256  1ce0483ad554cf135efec70ad2097e82ed72790194f17e1591821dc82c2416e0  django/utils/archive.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 62c8a00313..21c68cba50 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -8,8 +8,18 @@ PYTHON_DJANGO_VERSION = 5.2.1
>   PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>   # The official Django site has an unpractical URL
>   PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/ac/10/0d546258772b8f31398e67c85e52c66ebc2b13a647193c3eef8ee433f1a8
> -PYTHON_DJANGO_LICENSE = BSD-3-Clause
> -PYTHON_DJANGO_LICENSE_FILES = LICENSE
> +PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
> +PYTHON_DJANGO_LICENSE_FILES = LICENSE \
> +							  django/contrib/gis/measure.py \
> +							  django/contrib/gis/gdal/LICENSE \
> +							  django/contrib/gis/geos/LICENSE \
> +							  django/contrib/admin/static/admin/js/inlines.js \
> +							  django/contrib/admin/static/admin/js/vendor/jquery/LICENSE.txt \
> +							  django/contrib/admin/static/admin/js/vendor/select2/LICENSE.md \
> +							  django/contrib/admin/static/admin/js/vendor/xregexp/LICENSE.txt \
> +							  django/contrib/admin/static/admin/img/LICENSE \
> +							  django/dispatch/license.txt \
> +							  django/utils/archive.py
>   PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
>   PYTHON_DJANGO_CPE_ID_PRODUCT = django
>   PYTHON_DJANGO_SETUP_TYPE = setuptools

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
