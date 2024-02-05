Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB569C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64EEF41B79;
	Mon,  5 Feb 2024 22:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64EEF41B79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2dPMnR8Eakln; Mon,  5 Feb 2024 22:18:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6340541A88;
	Mon,  5 Feb 2024 22:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6340541A88
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF2F11BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94FC241A84
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94FC241A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 25FMhsC9PqY5 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:17:48 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F159407D7
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F159407D7
Received: from [10.11.2.50] (220.211-78-194.adsl-static.isp.belgacom.be
 [194.78.211.220])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 337812C800D1
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 23:17:46 +0100 (CET)
Message-ID: <7e311fd3-0eac-4cff-a87e-da53f01abdf8@bubu1.eu>
Date: Mon, 5 Feb 2024 23:17:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <170717110256.12359.16509380444438086733-0@git.sr.ht>
In-Reply-To: <170717110256.12359.16509380444438086733-0@git.sr.ht>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707171466; bh=7mHAAyodVnrFVdmAg4FN57PmPH+1IhEVP1fti2D8zpg=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=aT/fZVo36s+3CLITjzOsscfI0TLP4oOMjBoEFbzPj3KpzVNBAT2dlQT3s0qGWroma
 5oVcgPHIu5Kiin9d7oer4V0h630MKR1xrZzZ+HeR2DcuJQ4DqpOwLEhgnNWMSg08VG
 eOkR6e55P2vumpf475CMqO83in/nAatBjmw0WS1XVNdGzNODBbmFcg8AqoNLV4wf1o
 zqVFbodh7iE2989QesPXS94PghGZ987ySMCXEpbE+402oKmU8bNwTuaYI4nt9UpLPD
 fphpVZiSzgqfNapnAerghJqG+3tERUMNIS+vpmO8AaBi2FTQ+4Qo/ANEJfnR31JNEk
 k3gKh1MM76eRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=aT/fZVo3
Subject: Re: [Buildroot] [PATCH buildroot] support/testing: add
 python-uvloop runtime test
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Eventually I'll manage to sign-off my commits ...

On 05.02.24 22:47, ~bubu wrote:
> From: Marcus Hoffmann <buildroot@bubu1.eu>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

> 
> ---
>   .../tests/package/sample_python_uvloop.py     |  6 +++++
>   .../tests/package/test_python_uvloop.py       | 22 +++++++++++++++++++
>   2 files changed, 28 insertions(+)
>   create mode 100644 support/testing/tests/package/sample_python_uvloop.py
>   create mode 100644 support/testing/tests/package/test_python_uvloop.py
> 
> diff --git a/support/testing/tests/package/sample_python_uvloop.py b/support/testing/tests/package/sample_python_uvloop.py
> new file mode 100644
> index 0000000000..dc85d3e04e
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_uvloop.py
> @@ -0,0 +1,6 @@
> +import uvloop
> +
> +async def main():
> +    print("Hello world!")
> +
> +uvloop.run(main())
> diff --git a/support/testing/tests/package/test_python_uvloop.py b/support/testing/tests/package/test_python_uvloop.py
> new file mode 100644
> index 0000000000..c5079ba59c
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_uvloop.py
> @@ -0,0 +1,22 @@
> +import os
> +
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3Uvloop(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_UVLOOP=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_uvloop.py"]
> +
> +    def test_run(self):
> +        self.login()
> +        self.check_sample_scripts_exist()
> +
> +        cmd = "%s %s" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[0], "Hello world!")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
