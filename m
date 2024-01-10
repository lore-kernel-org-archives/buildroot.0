Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431F2C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 11:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEBFE81C81;
	Wed, 10 Jan 2024 11:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEBFE81C81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t734-8pEYXIZ; Wed, 10 Jan 2024 11:01:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A4638291A;
	Wed, 10 Jan 2024 11:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A4638291A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 661EE1BF23B
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 11:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EE2F613B4
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 11:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EE2F613B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lHjI7x9hUZg2 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 11:01:15 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 185E560B1B
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 11:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 185E560B1B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A12F9B0053E;
 Wed, 10 Jan 2024 12:01:05 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Jan 2024 12:01:05 +0100
Date: Wed, 10 Jan 2024 12:01:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZZ548XGug565N5dq@landeda>
References: <20240110093850.2302133-1-james.hilliard1@gmail.com>
 <20240110093850.2302133-4-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240110093850.2302133-4-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704884471;
 bh=nfuT1L2i5vQP3XxB7zMsF3CZ+uLQZLwnaucOW1XKwqw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IwpJaBwL51/qM5cqMX7eY6CsVaLXKtLk5QtUEzg3wjyogt5vXBWTekQRAslXnzIbX
 0z18PpBYhvtWfiY4PuwbmZgHQSL4D33kd0jWViYQH/POLsQ2XcRygC0Gx+6iuMdLOa
 Yz8Mu1XWX346vUaZcT/OKec6WX63nuC4GlSjTxEpc42NxwJXeGKXMYIQ41PEMgza/7
 BLW4PLuYS7aoS/StiXjcxE1fSHRGIjmvZHfg3dW3JrnitkfGGLbcCkqvZvMH/XHCYa
 PwsqfO71lDfz7nV2ORMP6uW5f0J8hP3zk3+nVAbj6JmezXZwcneFCaQV0crY8HG2IZ
 aSvXd/Mt3R2sQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IwpJaBwL
Subject: Re: [Buildroot] [PATCH 4/6] package/python-swig: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>,
 =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-01-10 02:38 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

What's the difference with the swig package we already have?

On PyPi, the package you are adding is called just swig, and the page
on PyPi [0] redirects to the project's homepage [1] that is the same
as the homepage for our package/swig/, but the repository it pints to is
different [2] rather than the one from the swig homepage [3].

The description for the swig-on-pypi repository states:

    A project that packages SWIG as a Python package, enabling swig to
    be installed from PyPI:
        pip install swig

    or used as part of build-system.requires in a pyproject.toml file:
        [build-system]
        requires = ["swig"]

So, here are a few questions:

  - can we instead us the existing package/swig to provide the same
    functionality as python-swig? I see there is a --enable-python3
    flag, at least.

  - if not, then will the two conflict, i.e: will python-swig install
    the same set of files as swig does, even partially?

  - if not, do we need to keep both versions in sync? Currently,
    package/swig is still only at 4.1.1.

[0] https://pypi.org/project/swig/
[1] https://swig.org/
[2] https://github.com/nightlark/swig-pypi
[3] https://github.com/swig/swig

Regards,
Yann E. MORIN.

> ---
>  package/python-swig/python-swig.hash |  5 +++++
>  package/python-swig/python-swig.mk   | 17 +++++++++++++++++
>  2 files changed, 22 insertions(+)
>  create mode 100644 package/python-swig/python-swig.hash
>  create mode 100644 package/python-swig/python-swig.mk
> 
> diff --git a/package/python-swig/python-swig.hash b/package/python-swig/python-swig.hash
> new file mode 100644
> index 0000000000..d60477f602
> --- /dev/null
> +++ b/package/python-swig/python-swig.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/swig/json
> +md5  c2bf820a545f333d47b7be513baaee3c  swig-4.1.1.post1.tar.gz
> +sha256  5cbf2d4dfc413f74cac197704296a9ef065a3f81c7b3792ff11a56d312c4f652  swig-4.1.1.post1.tar.gz
> +# Locally computed sha256 checksums
> +sha256  73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  LICENSE
> diff --git a/package/python-swig/python-swig.mk b/package/python-swig/python-swig.mk
> new file mode 100644
> index 0000000000..89ede170c8
> --- /dev/null
> +++ b/package/python-swig/python-swig.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# python-swig
> +#
> +################################################################################
> +
> +PYTHON_SWIG_VERSION = 4.1.1.post1
> +PYTHON_SWIG_SOURCE = swig-$(PYTHON_SWIG_VERSION).tar.gz
> +PYTHON_SWIG_SITE = https://files.pythonhosted.org/packages/da/b8/d1bfba3d7f75eeca60ecdcb2c214e5cdebb7477437d45db77b6dafee80f9
> +PYTHON_SWIG_SETUP_TYPE = setuptools
> +PYTHON_SWIG_LICENSE = Apache-2.0
> +PYTHON_SWIG_LICENSE_FILES = LICENSE
> +HOST_PYTHON_SWIG_DEPENDENCIES = \
> +	host-python-scikit-build \
> +	host-python-setuptools-scm
> +
> +$(eval $(host-python-package))
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
