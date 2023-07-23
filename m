Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF04C001DF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 14:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7811781E84;
	Sun, 23 Jul 2023 14:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7811781E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7bn7G1WsQndd; Sun, 23 Jul 2023 14:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA01281E4D;
	Sun, 23 Jul 2023 14:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA01281E4D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09AF61BF3EB
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 14:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D729C60AEE
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 14:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D729C60AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c151z6dV6cnV for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 14:51:11 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9C5A60A8D
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 14:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9C5A60A8D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:46bc:e175:93d0:2fb4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0A6825FFA1;
 Sun, 23 Jul 2023 16:51:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 16:51:05 +0200
Date: Sun, 23 Jul 2023 16:51:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <20230723145105.GG2503916@scaer>
References: <20230723112159.3816711-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230723112159.3816711-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690123868;
 bh=V6RtPHeTQrWhAjgMVMLtS9XPIzzlvbjmYNUV2H1NMwU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fsOsZbxWtHtwpNMX9s3VbZD6mEI8iBnbLaIQFPuV9Sw9ikFAw6tFRo71ibPYq2bO3
 bMpZneA665h0FUCkjIowaqMHq4rxSJ1uR+rMT4gzCKUvbJoYPfrI4c5jq3/kmZlvW7
 coEsJEdciIR7ZQvDmkLSrF5bmoyFxgW651Pn2w3cMeoXOiUJ6MMdzEPZJbJTMbUxm6
 MCIceMrogBoOb6rQcK/IfH71YlwBWYJFLr0po7qGEhGc+9diAKNthMM28oI2LmC80G
 68ovJdgGC23SAl76czkYa+1xGhPMppW3CQtPoXWzWuSjR+bQkFHn5leQvjF9aKCXRc
 k4DZfHG7G9zmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fsOsZbxW
Subject: Re: [Buildroot] [PATCH] support/testing: add test for python-pysmb
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

Yegor, All,

On 2023-07-23 13:21 +0200, yegorslists--- via buildroot spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  DEVELOPERS                                           |  2 ++
>  support/testing/tests/package/sample_python_pysmb.py |  2 ++
>  support/testing/tests/package/test_python_pysmb.py   | 12 ++++++++++++
>  3 files changed, 16 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_pysmb.py
>  create mode 100644 support/testing/tests/package/test_python_pysmb.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a6644819bd..58c8b4c8aa 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3146,11 +3146,13 @@ F:	package/zlog/
>  F:	support/testing/tests/package/sample_python_dicttoxml2.py
>  F:	support/testing/tests/package/sample_python_dtschema.py
>  F:	support/testing/tests/package/sample_python_munch.py
> +F:	support/testing/tests/package/sample_python_pysmb.py
>  F:	support/testing/tests/package/test_libftdi1.py
>  F:	support/testing/tests/package/test_python_can.py
>  F:	support/testing/tests/package/test_python_dicttoxml2.py
>  F:	support/testing/tests/package/test_python_dtschema.py
>  F:	support/testing/tests/package/test_python_munch.py
> +F:	support/testing/tests/package/test_python_pysmb.py
>  F:	utils/scanpypi
>  
>  N:	Yunhao Tian <t123yh.xyz@gmail.com>
> diff --git a/support/testing/tests/package/sample_python_pysmb.py b/support/testing/tests/package/sample_python_pysmb.py
> new file mode 100644
> index 0000000000..68767f252a
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_pysmb.py
> @@ -0,0 +1,2 @@
> +from nmb.NetBIOS import NetBIOS
> +from smb.SMBHandler import SMBHandler

    $ make check-package
    support/testing/tests/package/sample_python_pysmb.py:0: run 'flake8' and fix the warnings

    $ flake8 support/testing/tests/package/sample_python_pysmb.py
    support/testing/tests/package/sample_python_pysmb.py:1:1: F401 'nmb.NetBIOS.NetBIOS' imported but unused
    support/testing/tests/package/sample_python_pysmb.py:2:1: F401 'smb.SMBHandler.SMBHandler' imported but unused

I've fixed that (by adding a # noqa).

Applied to master, thanks.

Regards,
Yann E. MORIN.

> diff --git a/support/testing/tests/package/test_python_pysmb.py b/support/testing/tests/package/test_python_pysmb.py
> new file mode 100644
> index 0000000000..cc4c7fb1e5
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_pysmb.py
> @@ -0,0 +1,12 @@
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3Pysmb(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_PYSMB=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_pysmb.py"]
> +    timeout = 40
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
