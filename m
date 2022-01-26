Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B37C28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 17:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C28760F9C;
	Wed, 26 Jan 2022 17:42:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X1QqqcKBxhO6; Wed, 26 Jan 2022 17:42:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C79E060F93;
	Wed, 26 Jan 2022 17:42:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DB5B1BF417
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 17:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B22160F8C
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 17:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id prEwt8Xi2PVY for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 17:42:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14F9660EFA
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 17:42:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:61f5:fb85:a06d:c0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E347813F838;
 Wed, 26 Jan 2022 18:42:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643218942;
 bh=GtJmBiWqgoQVObmy47gPTa1ayRB4z8un2Nl4pisNbU8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IQn7nb0OxPsCivLZhR0QGi0GXnKZFjehsaD2T9hotZCVpM236KnQr4gUMTax5XRYf
 1nX6lNvucTtovvwxnLyVjJRQdlzzUPhYlFUh/1+r3PIUM59by0ToYILMbzsFP7BFR3
 dhu3e1VFfGuoAkxfUClf8Tdr+v1VzkY/A8394EK9WbCpN05/3IjcoTkKQZx8x5CTzb
 rEEmDgU2dK0szGbw01zwRp7+06YyK1+DwRiwP05E0ohfLydcPj8mJcC25c1emPMe0D
 MqJtYZiqr3xSMk9HSCxfpYQyrNZCiGSPS3TsDXXEHVNOG+2J5+x51iC/s2GYJV+E9i
 9xegPag7B3Pnw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 26 Jan 2022 18:42:18 +0100
Date: Wed, 26 Jan 2022 18:42:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220126174218.GJ457876@scaer>
References: <20220116104114.103601-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220116104114.103601-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add test for
 python-gnupg
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2022-01-16 11:41 +0100, Julien Olivain spake thusly:
> This commit add a simple test doing symmetric encryption/decryption
> to check this python interface with the gpg binary is working fine.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                                    |  2 ++
>  .../tests/package/sample_python_gnupg.py      | 24 +++++++++++++++++++
>  .../tests/package/test_python_gnupg.py        | 21 ++++++++++++++++
>  3 files changed, 47 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_gnupg.py
>  create mode 100644 support/testing/tests/package/test_python_gnupg.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a91e2dfcde..e038941b3b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1611,6 +1611,8 @@ F:	package/python-distro/
>  F:	package/python-gnupg/
>  F:	package/python-pyalsa/
>  F:	package/riscv-isa-sim/
> +F:	support/testing/tests/package/sample_python_gnupg.py
> +F:	support/testing/tests/package/test_python_gnupg.py
>  
>  N:	Julien Viard de Galbert <julien@vdg.name>
>  F:	package/dieharder/
> diff --git a/support/testing/tests/package/sample_python_gnupg.py b/support/testing/tests/package/sample_python_gnupg.py
> new file mode 100644
> index 0000000000..b5b718a8cb
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_gnupg.py
> @@ -0,0 +1,24 @@
> +import gnupg
> +
> +gpg = gnupg.GPG(verbose=True)
> +
> +plain_data = "Some plain text data"
> +good_passphrase = "Good Passphrase"
> +
> +# Test Encrypt
> +result = gpg.encrypt(plain_data, None, passphrase=good_passphrase, symmetric=True)
> +assert(result.returncode == 0)
> +enc_data = str(result)
> +assert(enc_data != plain_data)
> +
> +# Test Good Decrypt
> +result = gpg.decrypt(enc_data, passphrase=good_passphrase)
> +assert(result.returncode == 0)
> +dec_data = str(result)
> +assert(dec_data == plain_data)
> +
> +# Test Bad Decrypt
> +result = gpg.decrypt(enc_data, passphrase='A Wrong Passphrase')
> +assert(result.returncode != 0)
> +dec_data = str(result)
> +assert(dec_data != plain_data)
> diff --git a/support/testing/tests/package/test_python_gnupg.py b/support/testing/tests/package/test_python_gnupg.py
> new file mode 100644
> index 0000000000..0c71f6b6d0
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_gnupg.py
> @@ -0,0 +1,21 @@
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy2GnuPG(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON=y
> +        BR2_PACKAGE_PYTHON_GNUPG=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_gnupg.py"]
> +
> +
> +class TestPythonPy3GnuPG(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_GNUPG=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_gnupg.py"]
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
