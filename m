Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6321CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE85483F2B;
	Thu, 16 Dec 2021 19:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WuiDtWrA-tCJ; Thu, 16 Dec 2021 19:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5059C83F1E;
	Thu, 16 Dec 2021 19:09:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4445D1BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DAE583F1E
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zmYvlLx57c9M for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:08:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D03F83F04
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:08:47 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id y13so90464651edd.13
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 11:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DkppI1TFEQeoLo3WVoKxWRY/T+rXkM4fCHiAyn1K+vM=;
 b=CZK3e4Xzn5oR8hctaSCIk/LC5thhZJv6R5tOOzMOCL7p4GTdeh3u3SNNH7NTZmeLbH
 LQog1VZ0MRVXWaDOB/+GR+pFcYURwNB1cMYjD5Xs6aw4ZIxFezfN7NVFYnfMe3CKOfTT
 YbQeG7iN2K9ox8gseR7vgGQ4aO5M3DbHQ1y1VI8/8rZe5VuVO7/C88ud6F65lZsuTlsM
 snVIrI/mfQ1eKA6TJcOUauSpMZvOpwKFbPlq7Bhn56xJBQYpwWepS9hOQLz/Tz8nUxZR
 bZSUX438AGjoT3iTs7FEM1m5kf13/zkGcEH3Ndoneruz2GTTszv6MZsNopfeDqvo0vlo
 Z7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DkppI1TFEQeoLo3WVoKxWRY/T+rXkM4fCHiAyn1K+vM=;
 b=hvb1sTFMFu3xdb1bghlDfZFKL5VD2MG2kbw0l2sqa2erQBddX+vfGTmlk8IQd2BY8B
 kZHTSWbDPe74NbpfvonB0XNLv3vqrLN1Z/wBpUcRrxlrcU8MwdFuvUWPz7zeTikfJxtC
 KVMDXJrXUsMP3D1fyS0BBZZSznhy4rGUnMIwcylffTejN+YcnUH8IB6sbWzLSJv5kjOb
 5DjaCroWwYK1ycRtcawniAUJVrXu1DnTJr3SoeFWUfjGCeybW60+JpZZQj/KUEP3w29P
 uSTxTDlJxhGU68+CInyL7tofWr+Z/Vd8DCqA5po0rvTaEVvt4wnTj+6Z/0MJC0B+G4SD
 +LLA==
X-Gm-Message-State: AOAM531t3FWILkl/q/NxJabOlhpfZUiMHIjFEHRjbxjDBMMsgY2aN4Qv
 SEgZbYC3bTOzksdbdxp1bkN6MQ==
X-Google-Smtp-Source: ABdhPJzl8Q1BiNXWl3JAyZ1oNdSO7AeY8MMLUcoQEUvSlyt0wYPKeXThHpQmzFhz5iR0gITPLTs8Zw==
X-Received: by 2002:a05:6402:350b:: with SMTP id
 b11mr22450812edd.212.1639681725974; 
 Thu, 16 Dec 2021 11:08:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qa33sm548575ejc.71.2021.12.16.11.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 11:08:45 -0800 (PST)
Message-ID: <57a2bc15-b40d-a68c-768d-b5198122e400@mind.be>
Date: Thu, 16 Dec 2021 20:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20211215170803.27121-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215170803.27121-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 version 3.2.10
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
Cc: Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/12/2021 18:08, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - CVE-2021-44420: Potential bypass of an upstream access control based on
>    URL paths
> 
>    HTTP requests for URLs with trailing newlines could bypass an upstream
>    access control based on URL paths.
> 
>    This issue has low severity, according to the Django security policy.
> 
>    https://www.djangoproject.com/weblog/2021/dec/07/security-releases/
> 
> In addition, 3.2.8 / 3.2.9 fixes a number of bugs.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-django/python-django.hash | 4 ++--
>   package/python-django/python-django.mk   | 5 +++--
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index ab89f0341c..3eea17e70f 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  2ade1eecca77640abbde6c4589da27dd  Django-3.2.7.tar.gz
> -sha256  95b318319d6997bac3595517101ad9cc83fe5672ac498ba48d1a410f47afecd2  Django-3.2.7.tar.gz
> +md5  eaf0c3b4ac6b22cae9068360e6fd2d1b  Django-3.2.10.tar.gz
> +sha256  074e8818b4b40acdc2369e67dcd6555d558329785408dcd25340ee98f1f1d5c4  Django-3.2.10.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 0850aa1358..4f80208f0e 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,11 @@
>   #
>   ################################################################################
>   
> -PYTHON_DJANGO_VERSION = 3.2.7
> +PYTHON_DJANGO_VERSION = 3.2.10
>   PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
>   # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/59/45/c6fbb3a206df0b7dc3e6e8fae738e042c63d4ddf828c6e1ba10d7417a1d9
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/a5/8e/c6dfc718d572e4b33b56824b9e71e5ab9be8072e6747fc6184d206c3fdb3
> +
>   PYTHON_DJANGO_LICENSE = BSD-3-Clause
>   PYTHON_DJANGO_LICENSE_FILES = LICENSE
>   PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
