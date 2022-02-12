Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF220C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 12:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59F1560BDE;
	Sat, 12 Feb 2022 12:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wUtnbFkjsNnw; Sat, 12 Feb 2022 12:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77B9560BBF;
	Sat, 12 Feb 2022 12:52:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85C271BF84C
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 12:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C2B5410CB
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 12:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nz6NF3UPMOeL for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 12:52:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 764B9410C9
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 12:52:03 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id e7so23981010ejn.13
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 04:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uEcHazkxQABn7JVKaClvWf6MLmkbBGKg9Fqzo40buKQ=;
 b=PAUKPclz3U/pKPx1/MLi3FcQCYyQyK97MBNfVIq7YepuK8ADOfe6G7nUp6bUxMSyEs
 X9C8HY3deGrZ9LtOK2mlv16VRnrPUTTdmL1yA/zcCBd2MdVTIntb6gXarsc8bPdEKuXb
 W8plaYPEEZgsoA5Q+t6vT8+wUC2SjNq0yLetFFoNXeYVuUiwXWne54vfhkfJRnSIk43s
 f0xAEndEQKjOg7bwFKCOvqAsHzAG9WrBw8O/X77lAQBYuuj3djLjQUOuzw/ZP/f5VYXG
 hkCGCz+EFuZ5+oNk0qpzSlabJC0eSOw3XKwL6AwKEVvKDu5YmUeuZmQQEvrWGZ2rrZNX
 a52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uEcHazkxQABn7JVKaClvWf6MLmkbBGKg9Fqzo40buKQ=;
 b=Yt5iK9QznSMf1vROBc4EaQf7XWWFjJlD4Ppmow9pG+nm1ljp869cmcYXacnqSjCc60
 mylJeDmgjJH32yG5ZUy8ZkccP8Wh2czGTCSAQilhAGEh7ErxvzMVZbjtNUYlcNYt1liv
 CDqs7zTLZZx3ldzPUo2A+h4Chl3eYUf8mX3+twsa8gyAoEjH+t51dArwa2w/idjIs0KO
 f480yUCE39U3niwtuFEc6he7ElWH4oULzOltDylgZr654uXAJnO52yqokaNe5rHslqT7
 OphaX3rpptQoA8OM8u392kdlk/f2Gxjq1WLPxfCWbH67PnqTLCfYVPi9UzBbzFOlyGKb
 I1gw==
X-Gm-Message-State: AOAM530vpkpjQf/PQ0GR36ymY8k6vKTzMpbSQNPgzUX/WfK/05Yj6KWK
 syymh17UdBcx0JUI/yWuqPSSu/Tv6KZW7Q==
X-Google-Smtp-Source: ABdhPJxCVwmyVo0NmFy6kTh0h+agnH7z10K/t2utpUSpL7/jaEj/tnL3UzflelspVLlwZnsrrUyJkg==
X-Received: by 2002:a17:907:6d8b:: with SMTP id
 sb11mr4871148ejc.622.1644670321504; 
 Sat, 12 Feb 2022 04:52:01 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j20sm3287847ejo.27.2022.02.12.04.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 04:52:00 -0800 (PST)
Message-ID: <b5ec1de4-c2b5-7f84-3feb-129f130e9364@mind.be>
Date: Sat, 12 Feb 2022 13:51:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20220130172145.888946-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220130172145.888946-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add test for
 python-distro
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/01/2022 18:21, Julien Olivain wrote:
> This commit add a simple test checking the reported distro name and
> id are Buildroot (as reported by /etc/os-release).
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks. I removed the python2 part of course.

  Regards,
  Arnout

> ---
>   DEVELOPERS                                    |  2 ++
>   .../tests/package/sample_python_distro.py     |  4 ++++
>   .../tests/package/test_python_distro.py       | 21 +++++++++++++++++++
>   3 files changed, 27 insertions(+)
>   create mode 100644 support/testing/tests/package/sample_python_distro.py
>   create mode 100644 support/testing/tests/package/test_python_distro.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e17803f38a..368f95796b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1612,7 +1612,9 @@ F:	package/python-gnupg/
>   F:	package/python-pyalsa/
>   F:	package/riscv-isa-sim/
>   F:	package/zynaddsubfx/
> +F:	support/testing/tests/package/sample_python_distro.py
>   F:	support/testing/tests/package/sample_python_gnupg.py
> +F:	support/testing/tests/package/test_python_distro.py
>   F:	support/testing/tests/package/test_python_gnupg.py
>   
>   N:	Julien Viard de Galbert <julien@vdg.name>
> diff --git a/support/testing/tests/package/sample_python_distro.py b/support/testing/tests/package/sample_python_distro.py
> new file mode 100644
> index 0000000000..b31f129718
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_distro.py
> @@ -0,0 +1,4 @@
> +import distro
> +
> +assert(distro.name() == 'Buildroot')
> +assert(distro.id() == 'buildroot')
> diff --git a/support/testing/tests/package/test_python_distro.py b/support/testing/tests/package/test_python_distro.py
> new file mode 100644
> index 0000000000..943b29e47e
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_distro.py
> @@ -0,0 +1,21 @@
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy2Distro(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON=y
> +        BR2_PACKAGE_PYTHON_DISTRO=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_distro.py"]
> +
> +
> +class TestPythonPy3Distro(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_DISTRO=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_distro.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
