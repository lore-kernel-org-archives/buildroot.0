Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F68C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20EB940AFB;
	Sat, 31 May 2025 16:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JrnzuQbxDWjH; Sat, 31 May 2025 16:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3317E40AED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3317E40AED;
	Sat, 31 May 2025 16:48:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F053127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0E8483AE5
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWfy79ZKotrS for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:48:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4EB3183AE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EB3183AE2
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EB3183AE2
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:48:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8437B1C00C1; Sat, 31 May 2025 18:48:36 +0200 (CEST)
Message-ID: <40485331-f0f9-406c-abab-9c83e78fe45c@rnout.be>
Date: Sat, 31 May 2025 18:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20250514151255.2316205-1-buildroot@bubu1.eu>
 <20250514151255.2316205-12-buildroot@bubu1.eu>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250514151255.2316205-12-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710116; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=y5kktayVYHOsXnY4pr7q32E/+MvF57CylBxCbouC9kA=;
 b=EU2AIKleiLmV65oelvhWjPufPZq0Xetc2+VCegrDwk2CFL8vgERJz3+u5g433TPL7IVca5
 RD+AlkNTWCOfezpcHSqfwj9NB1bHHnJ29HnuhJnCO5hPh10y8piLblk8BY7Rcjr0wup5GC
 adc7AArK5WZqw06m8NIHh9WQpLsf+04bgbjOiQywUF8BxoWVoVbnCrZOdm0Re8jG9qSU1U
 yQofZ6tFGN7NwqgnnTYrSRle55OAah10BAXCjm83FDIYSQ8xstK8kQ5FQq92DfLnJTr9A/
 9U9RXoK4HR+TSThQ9ngtGtGHIO2oP7MqymQ0+IJ0DyGGmj+APK/t3keaynGx3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=EU2AIKle
Subject: Re: [Buildroot] [PATCH v2 12/12] support/testing: new
 python-pydantic-settings runtime test
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



On 14/05/2025 17:12, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> added in v2
> ---
>   DEVELOPERS                                    |  2 ++
>   .../sample_python_pydantic_settings.py        |  8 +++++
>   .../package/test_python_pydantic_settings.py  | 35 +++++++++++++++++++
>   3 files changed, 45 insertions(+)
>   create mode 100644 support/testing/tests/package/sample_python_pydantic_settings.py
>   create mode 100644 support/testing/tests/package/test_python_pydantic_settings.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 6138fd1ae6..cc2ecb76a1 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2282,11 +2282,13 @@ F:	package/python-tzlocal/
>   F:	package/python-waitress/
>   F:	support/testing/tests/package/test_python_fastapi.py
>   F:	support/testing/tests/package/test_python_pydantic.py
> +F:	support/testing/tests/package/test_python_pydantic_settings.py
>   F:	support/testing/tests/package/test_python_ruamel_yaml.py
>   F:	support/testing/tests/package/test_python_tzlocal.py
>   F:	support/testing/tests/package/test_python_waitress.py
>   F:	support/testing/tests/package/sample_python_fastapi.py
>   F:	support/testing/tests/package/sample_python_pydantic.py
> +F:	support/testing/tests/package/sample_python_pydantic_settings.py
>   F:	support/testing/tests/package/sample_python_ruamel_yaml.py
>   
>   N:	Marek Belisko <marek.belisko@open-nandra.com>
> diff --git a/support/testing/tests/package/sample_python_pydantic_settings.py b/support/testing/tests/package/sample_python_pydantic_settings.py
> new file mode 100644
> index 0000000000..c98d1ce9c1
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_pydantic_settings.py
> @@ -0,0 +1,8 @@
> +from pydantic_settings import BaseSettings
> +
> +
> +class Settings(BaseSettings):
> +    api_key: str
> +
> +
> +assert Settings().api_key == "ABCD1234"
> diff --git a/support/testing/tests/package/test_python_pydantic_settings.py b/support/testing/tests/package/test_python_pydantic_settings.py
> new file mode 100644
> index 0000000000..608cbbc5b1
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_pydantic_settings.py
> @@ -0,0 +1,35 @@
> +import os
> +
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3PydanticSettings(TestPythonPackageBase):
> +    __test__ = True
> +    config = """
> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_NEON=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_PYDANTIC_SETTINGS=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +    sample_scripts = ["tests/package/sample_python_pydantic_settings.py"]
> +    timeout = 30
> +
> +    def login(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(
> +            arch="armv7", kernel="builtin", options=["-initrd", cpio_file]
> +        )
> +        self.emulator.login()
> +
> +    def run_sample_scripts(self):
> +        """Run sample script while setting an environment variable"""
> +        for script in self.sample_scripts:
> +            cmd = (
> +                "api_key=ABCD1234 " + self.interpreter + " " + os.path.basename(script)
> +            )
> +            self.assertRunOk(cmd, timeout=self.timeout)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
