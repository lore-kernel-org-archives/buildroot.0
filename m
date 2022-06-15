Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3DFC43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 23:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 910E083E88;
	Wed, 15 Jun 2022 23:19:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fPwaitjwgp2L; Wed, 15 Jun 2022 23:19:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9835D828F8;
	Wed, 15 Jun 2022 23:19:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 236F81BF3BA
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 23:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 203F440292
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 23:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G26qpsIgJffu for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 23:19:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F205B400FE
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 23:19:17 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 n24-20020a4ae758000000b0041b82638b42so2624307oov.9
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 16:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wl9b9nGiao+tagAq9wPPO9CSjkFAnfvO9MEhZ3PArfY=;
 b=ggm/OtG/AofUkVRbBqFn+NBFFLblfjyGsJ+ODK4HOZ+moT4or+5PtIjVTIBMVBs7nX
 ZsYxvOuQnxSjeTM798S5266bojGpqZ2FweXgAqV9/r1Yq23lCq3aOtuFJxorJvkAeWxt
 nuYFe/0MFVQOIv032a7/4xSZi6TlfvHVLgyYLGkbTWTaX6L2qrfOD/VzXDu72tTxyNfO
 PxmQaSWG9W4qa7iPcg+CbPe2CKo8RpJzhuKfht0GnXqgRVax9MiTRQ0Cd95WH5F2ETt0
 BcLLpFOYMjHfhhSL0Td099Xs6fN7Cj8o3k8uV8L63AfNgPZYpTedep1B+J1Kl7NpbzM9
 LIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wl9b9nGiao+tagAq9wPPO9CSjkFAnfvO9MEhZ3PArfY=;
 b=jkygMZrjKLcdiYZkb6uwu5y7aB8BBoXGFJ5RyXImuQaWwPWz3cT+xQA4EpTTjapVah
 LvD2tP4LZ7cDZgCubphiLrRXCVQnVinUxK7WfMV0S419Am9cbHmmTW4FaZuhHWH0AfLq
 NHzwnJZSBi8lunGACX0ZeF2YdxNaz666HieX+NRoigLEDUaWGNWkxoM5BOEPi6dRFNZA
 I8083NaC5QLc8Bh1FSvBBdr3taysEW20O2p2Tt/g+8ZfNYj1/0WmBFh7GB6CKzXclWLO
 QvEaaWKsVXPpK96Nyza0B9agFszrNxc5QhVT7n+Da/aopmj9zl1fpM2sJ4YfuWUqKMHm
 xnSw==
X-Gm-Message-State: AJIora8DOIEiUNcTV1gLVvKkAcrXEGBHIg8jKJ0oqgc5pVcrO6V1e0kA
 q6BcFm56AWKHcjHA2k1I6+PNGHC6eBkqz9fgD3g=
X-Google-Smtp-Source: AGRyM1t5ytUY68fKjmSdXi+mK2G/xqAqx7UHXXH2CgGG9ufaPdRXh6pbvH9/KLw4dWBc8zkTkozL7a+cEV9PSboRjas=
X-Received: by 2002:a05:6820:169f:b0:41b:dba1:4f5f with SMTP id
 bc31-20020a056820169f00b0041bdba14f5fmr950012oob.69.1655335156921; Wed, 15
 Jun 2022 16:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220615212931.1082542-1-romain.naour@gmail.com>
In-Reply-To: <20220615212931.1082542-1-romain.naour@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 15 Jun 2022 17:19:06 -0600
Message-ID: <CADvTj4pYr9cCmn8ioBpkVAgYM5fxkMJpjEsn_piOTzZcNFZhLQ@mail.gmail.com>
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

Updated to 4.5.1 here:
https://patchwork.ozlabs.org/project/buildroot/list/?series=305011

>
> Revert this commit instead of trying updating python-jsonschema
> and introduce other runtime issue.
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
