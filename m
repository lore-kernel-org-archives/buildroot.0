Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A704C54756
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 349F2612AE;
	Fri, 16 May 2025 17:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZ4M5842Goi7; Fri, 16 May 2025 17:59:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46C7061315
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46C7061315;
	Fri, 16 May 2025 17:59:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5920185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D743A4003A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CT4yswcb80vv for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6659400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6659400F6
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6659400F6
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB9661C0FCB; Fri, 16 May 2025 19:59:27 +0200 (CEST)
Message-ID: <bdedb768-1e59-4e22-8e1a-96ea5d7d46d9@rnout.be>
Date: Fri, 16 May 2025 13:21:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
References: <20250514094620.59162-1-buildroot@bubu1.eu>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250514094620.59162-1-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418367; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=m/6yFMICsFId+lBpe7Zknag9DFzTjen5YR6hA135BZw=;
 b=HV0PCBamZbKoHcCe/rOmlg4JncsGFv8kpOBCA7qM6y2VzKArAUfeEL+W1HdioC7z6ec4WN
 26Oxg4kXvc+nTxC0yQC0KG+9G74Dr9CM/8ely94weE1P8eiEKPhxql3//YmJbB8Lp4lBv0
 IUQ1CC5HQ3JUEQiUoLxyJsXeahWtAtCnFg1ti4zWGQuIdj5GW5h8n0DbSpM4jlQEHGzyMq
 QxYlszmQsa+zxmzuJ6cPy4NjYb9cGR6Iw+ni7pIAz6TNR9QRGMkUZLe2bOpfkO0i5I3vNC
 AWzRaMu7M9FuFyAZixYeT9h/oFH1K1lxV6zE8TjwAR69Jr+qnQU7RmgoMAvnMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=HV0PCBam
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-django: security bump
 to 5.1.9
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



On 14/05/2025 11:46, Marcus Hoffmann via buildroot wrote:
> Fixes CVE-2025-32873 [1].
> Django also updates setuptools[2], so we can remove the --skip-dependency-check
> flag and need to update the package archive capitalization accordingly.
> 
> [1] https://www.djangoproject.com/weblog/2025/may/07/security-releases/
> [2] https://github.com/django/django/commit/bbf376bbc8cdfca817b54e7df99539633d10b06e
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/python-django/python-django.hash | 4 ++--
>   package/python-django/python-django.mk   | 7 +++----
>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 1e197004d0..57b9e9fb0e 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  80247a8b48cdac55e5ad3fb682ab71a3  Django-5.1.8.tar.gz
> -sha256  42e92a1dd2810072bcc40a39a212b693f94406d0ba0749e68eb642f31dc770b4  Django-5.1.8.tar.gz
> +md5  da93c81fcaf2e0b4dab3cf44e7564c7c  django-5.1.9.tar.gz
> +sha256  565881bdd0eb67da36442e9ac788bda90275386b549070d70aee86327781a4fc  django-5.1.9.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index b64d8e4cd1..fd8a4eb9e8 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,15 +4,14 @@
>   #
>   ################################################################################
>   
> -PYTHON_DJANGO_VERSION = 5.1.8
> -PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
> +PYTHON_DJANGO_VERSION = 5.1.9
> +PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>   # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/00/40/45adc1b93435d1b418654a734b68351bb6ce0a0e5e37b2f0e9aeb1a2e233
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/10/08/2e6f05494b3fc0a3c53736846034f882b82ee6351791a7815bbb45715d79
>   PYTHON_DJANGO_LICENSE = BSD-3-Clause
>   PYTHON_DJANGO_LICENSE_FILES = LICENSE
>   PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
>   PYTHON_DJANGO_CPE_ID_PRODUCT = django
>   PYTHON_DJANGO_SETUP_TYPE = setuptools
> -PYTHON_DJANGO_BUILD_OPTS = --skip-dependency-check
>   
>   $(eval $(python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
