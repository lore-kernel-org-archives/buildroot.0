Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594B6C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1086A41962;
	Mon,  5 Feb 2024 15:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1086A41962
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TO76FS-3f8Up; Mon,  5 Feb 2024 15:02:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 544DB418CA;
	Mon,  5 Feb 2024 15:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 544DB418CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 650E61BF2F0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CF7440A49
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CF7440A49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tvpoz26vuDWy for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:02:48 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 138EF40377
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 138EF40377
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DE4EC13F8E1;
 Mon,  5 Feb 2024 16:02:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 16:02:40 +0100
Date: Mon, 5 Feb 2024 16:02:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: ~bubu <bubu@bubu1.eu>
Message-ID: <ZcD4kMcv19FcwBxu@landeda>
References: <170713978507.21324.6362507954144029814-0@git.sr.ht>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <170713978507.21324.6362507954144029814-0@git.sr.ht>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707145365;
 bh=5IZVvcgqgOfx+IS3ltJDadZnzs0BTjKpoee2kTao4kc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I9C9Ly913dc56g5GRIlCO+NZjT6kGio8HsxHIOX9Nunnzo78WiSSO0qUVpm02ZX1p
 iJOe92wvD+9Yf2DadqyASJeLBslOiasV73FHzwMtz2auNJjsdcrMap5DH15GvV7KEh
 GYY/mgW7B/63+1MbmcTF7z5C/LlVpRZT/MAr/JHqfBxn0bDA6i6F2uieElTECumxBq
 1gyhGwbMsGp7ZZ6CM6HApg27RiStdLPWLIBTieUkhk4sS3zOMjm5RyH4dCznhaD63z
 XM/tAect5mBvpBcc6vTSV5DzkO2VWNwPBeuOjsWFtlurkNOxA5RjXyUkfz4qZDM0Qt
 4Nj/QF5mbqxbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I9C9Ly91
Subject: Re: [Buildroot] [PATCH buildroot] support/testing: add
 minimalmodbus runtime test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

On 2024-02-05 14:08 +0100, ~bubu spake thusly:
> From: Marcus Hoffmann <bubu@bubu1.eu>

Thanks for this new test. This commit log needs however to be a little
bit more detailed; see below...

> Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>
> ---
>  .../tests/package/sample_python_minimalmodbus.py      |  7 +++++++
>  .../tests/package/test_python_minimalmodbus.py        | 11 +++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_minimalmodbus.py
>  create mode 100644 support/testing/tests/package/test_python_minimalmodbus.py
> 
> diff --git a/support/testing/tests/package/sample_python_minimalmodbus.py b/support/testing/tests/package/sample_python_minimalmodbus.py
> new file mode 100644
> index 0000000000..a75145f900
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_minimalmodbus.py
> @@ -0,0 +1,7 @@
> +import minimalmodbus
> +from serial.serialutil import SerialException
> +
> +try:
> +    instrument = minimalmodbus.Instrument('/dev/ttyUSB99', 1)
> +except SerialException:
> +    pass

So, it took me a little while to understand how this test works, because
it uses the default kernel, which is probably lacking the appropriate
modbus driver.

So the test just checks that the initialisation fails, and we assume
that if the failure happens as we expect, we consider the module to be
working correctly. Which is a weird situation: failure means success!

I've added a bit of comments to explain that.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> diff --git a/support/testing/tests/package/test_python_minimalmodbus.py b/support/testing/tests/package/test_python_minimalmodbus.py
> new file mode 100644
> index 0000000000..53813406de
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_minimalmodbus.py
> @@ -0,0 +1,11 @@
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3Minimalmodbus(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_MINIMALMODBUS=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_minimalmodbus.py"]
> -- 
> 2.38.5
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
