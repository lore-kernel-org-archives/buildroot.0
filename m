Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57251C43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 22:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C33B383E8A;
	Wed, 15 Jun 2022 22:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zS1UgtWSWZRx; Wed, 15 Jun 2022 22:49:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2882283E85;
	Wed, 15 Jun 2022 22:49:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E94E1BF3DB
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 22:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D51561080
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 22:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OdybuxTGWfz4 for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 22:49:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 109F761078
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 22:49:36 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 a8-20020a05683012c800b0060c027c8afdso9890224otq.10
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 15:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TdclFJBU7zAYa6a3cE5biFkJx/z5h3i1N+QmN5cXADQ=;
 b=N7uI+BPs3YyKEkkzwWYNXvwNOzLbBnNPdFxqR4D4k7PRBYb2Nuw9XF2pt1XM29tpJA
 ryy6iIZ8XAm0+sg+Bz/R/E1O3hzcqh/fKu50Qm6B033wVvPWYdihBByafhh1cFkDTNIm
 KiWBlG6KGOh6I7VKdB+u+TPSftQ9we9npopxKoj0fdFh90YbSMPsxvaDaBtUHRCWXKrF
 Olx4IgvGFU/zgLziFD+awUF859+m+DkJWsVkbC4A5qQRBD0DUvHfiFdxRQ2eEqkIPo2e
 xnQc6/A1VJGZRLFU6Ze5XRfL+pX5iFmaqdlJ+3F9CEKy/hvaTe4QRBZ/dfYAccMHSB75
 AU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TdclFJBU7zAYa6a3cE5biFkJx/z5h3i1N+QmN5cXADQ=;
 b=jgSDfz0Io1/oEkZ1U3rN0GkCCS7dZmFU4m3MGuiS8L6P5N00nBBM16PdOPqCa4Zf9h
 qDBWCwk2NNo/obohBI/Rfq9Yzow+N7ne5a4uodTmh3efXZ2FKlgCd4CXLqRQ9cT/f6YR
 duih8bO725YW+DQXcM2jxLnlSOK/V60Zfe5OJkLe71bJL40Jx1aCWoS9ziTkFH1TsCuf
 K/5VlbE54qBtej5QWAJ/etm1nm4kokQa8RbF3U2k6zyuVkgEgVOW5MKNz7o5NUMz1xxR
 0+F37RF66FzS4U+uNZDae+wtavhD1fpjv+MSvuNjxR7nEXsbgAcWj2chHoC9/bRTphON
 k6wg==
X-Gm-Message-State: AJIora9i9Tj7kXHWPbbnXv642sJb497Mq99+wTm/5d8s4++8iNkN2pzQ
 64OI+1scQN+ucgmow9IrKbA+mEqMDd8/xbpK55M=
X-Google-Smtp-Source: AGRyM1srrsrAJ/fT4al9vI4xNZusFr+yODBx1zf8cJgiFz8xxEDlVDFM86sPhaHXPrwxM04kCKG52rOD3HKh/eWp5ag=
X-Received: by 2002:a05:6830:4411:b0:60c:5362:3e49 with SMTP id
 q17-20020a056830441100b0060c53623e49mr972590otv.151.1655333375674; Wed, 15
 Jun 2022 15:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220615212931.1082542-1-romain.naour@gmail.com>
In-Reply-To: <20220615212931.1082542-1-romain.naour@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 15 Jun 2022 16:49:24 -0600
Message-ID: <CADvTj4qgP2VXD4SHuRBoeoWk9tWg3KmZ9PAKn+Jnz=toAgO5RA@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH] Revert "package/python-flask-expects-json:
 bump to version 1.7.0"
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jun 15, 2022 at 3:29 PM Romain Naour <romain.naour@gmail.com> wrote:
>
> This reverts commit 16bfb1a3c45656da85aca892125b032befbbdbe4 since
> python-flask-expects-json >= 1.6.0 requires at least
> python-jsonschema 3.0.0 (v3.0.0a1) to be able to use the following
> import introcuded by commit [1]:
>
>   from jsonschema.validators import _LATEST_VERSION as LATEST_VALIDATOR
>
> Indeed, python-jsonschema package still at 2.5.1 version.
>
> Revert this commit instead of trying updating python-jsonschema
> and introduce other runtime issue.

Probably best to just update python-jsonschema I'm thinking.

I'll see what's needed for that.

>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2580341645
>
> [1] https://github.com/Fischerfredl/flask-expects-json/commit/e1d2898ab1ca7bf02ae60885f9be92b31fa8a62a
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-flask-expects-json/python-flask-expects-json.hash  | 4 ++--
>  .../python-flask-expects-json/python-flask-expects-json.mk    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/python-flask-expects-json/python-flask-expects-json.hash b/package/python-flask-expects-json/python-flask-expects-json.hash
> index e465bcb56a..c023222fd7 100644
> --- a/package/python-flask-expects-json/python-flask-expects-json.hash
> +++ b/package/python-flask-expects-json/python-flask-expects-json.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/flask-expects-json/json
> -md5  3a77c4059f21e6e37e652c9dbbdc2e7c  flask-expects-json-1.7.0.tar.gz
> -sha256  4ef186a86f10572a21af82e549546deda024326628b4a96cd14d3a0f71754d62  flask-expects-json-1.7.0.tar.gz
> +md5  c1fb8ede58db312d7923212dc97b8ab4  flask-expects-json-1.5.0.tar.gz
> +sha256  0087dc3d089f1ac75a1fc0f259f4dbd02bbb9c356e92e1a080f2309e2f75d053  flask-expects-json-1.5.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  06154a99fdc664107294a0a5e7e68f776078d075408dd32bbeaa7340fdd39e73  LICENSE.txt
> diff --git a/package/python-flask-expects-json/python-flask-expects-json.mk b/package/python-flask-expects-json/python-flask-expects-json.mk
> index 55c9bc9571..487f15d4e5 100644
> --- a/package/python-flask-expects-json/python-flask-expects-json.mk
> +++ b/package/python-flask-expects-json/python-flask-expects-json.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>
> -PYTHON_FLASK_EXPECTS_JSON_VERSION = 1.7.0
> +PYTHON_FLASK_EXPECTS_JSON_VERSION = 1.5.0
>  PYTHON_FLASK_EXPECTS_JSON_SOURCE = flask-expects-json-$(PYTHON_FLASK_EXPECTS_JSON_VERSION).tar.gz
> -PYTHON_FLASK_EXPECTS_JSON_SITE = https://files.pythonhosted.org/packages/12/a5/b27cf21d62c2b5a0a32e2f92bde9658e74c34fcc2e004bb0d591f1bf7627
> +PYTHON_FLASK_EXPECTS_JSON_SITE = https://files.pythonhosted.org/packages/4c/4a/9d9d050af700fb3feebd1f8466e73d65ce8b4709f27773e07100b0993451
>  PYTHON_FLASK_EXPECTS_JSON_SETUP_TYPE = setuptools
>  PYTHON_FLASK_EXPECTS_JSON_LICENSE = MIT
>  PYTHON_FLASK_EXPECTS_JSON_LICENSE_FILES = LICENSE.txt
> --
> 2.35.3
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
