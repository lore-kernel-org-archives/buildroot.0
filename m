Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9C1C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17ABC607E3;
	Thu, 17 Jul 2025 20:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ku8V8_SsIUjC; Thu, 17 Jul 2025 20:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3102E60781
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3102E60781;
	Thu, 17 Jul 2025 20:41:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05D2A226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0A1760781
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kwm3Z-U86HLK for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:41:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB11B60762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB11B60762
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB11B60762
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 03521B977AA4; Thu, 17 Jul 2025 22:41:37 +0200 (CEST)
Message-ID: <de6c8535-0a0c-4589-801d-358253530d5f@rnout.be>
Date: Thu, 17 Jul 2025 22:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250715231422.831691-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250715231422.831691-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752784898; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=q9pZxfMzjSbAkqYUC+bvCMT+ztHtXyXbpHHsw6d56fY=;
 b=GJX8fcJt4PQrDEhT9OolJX7KMqcxfWa53aEd7bfhzdP/klQviYUNv6bN/tMvLEyMLV2sv+
 WTiS73t5WGEsKmnCI+qdpKj67xk3KAF8hj3gPdzQdVZ42mABrrKbHo10uUDI1Y+kjjKRKL
 07A8iKKZYniFwYDT8vxdo9V1JsCBc8LSP4KLMoGlyX9j6bwtEMMAZecZYXoiTFzKmTuZBa
 xfLS7UFdHSTs3WxrfHPnwzbX7l6xN/0FwExaVaE9JlUNBkcKulvhvPP/+l2coWyeMvrdRR
 7RnAOgOXFeywNowGA9yxUyqjCqyY4yMnfFij492B6X1snJcz1sdDHz6/iea8Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GJX8fcJt
Subject: Re: [Buildroot] [PATCH 1/1] package/python-hatch-fancy-pypi-readme:
 bump to version 25.1.0
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



On 16/07/2025 01:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../python-hatch-fancy-pypi-readme.hash                       | 4 ++--
>   .../python-hatch-fancy-pypi-readme.mk                         | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
> index e3a6363eb7..e2d22cb287 100644
> --- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
> +++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/hatch-fancy-pypi-readme/json
> -md5  f5f9e639f066c91f8e623ec6231beae9  hatch_fancy_pypi_readme-24.1.0.tar.gz
> -sha256  44dd239f1a779b9dcf8ebc9401a611fd7f7e3e14578dcf22c265dfaf7c1514b8  hatch_fancy_pypi_readme-24.1.0.tar.gz
> +md5  8e1ed2416887685adc1c909ed4fb63cb  hatch_fancy_pypi_readme-25.1.0.tar.gz
> +sha256  9c58ed3dff90d51f43414ce37009ad1d5b0f08ffc9fc216998a06380f01c0045  hatch_fancy_pypi_readme-25.1.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  e69ea57f96e599e617f61af3e85bf326b87e833994709fb5e5908a81197730a2  LICENSE.txt
> diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
> index 0857864965..5e658239b1 100644
> --- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
> +++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_HATCH_FANCY_PYPI_README_VERSION = 24.1.0
> +PYTHON_HATCH_FANCY_PYPI_README_VERSION = 25.1.0
>   PYTHON_HATCH_FANCY_PYPI_README_SOURCE = hatch_fancy_pypi_readme-$(PYTHON_HATCH_FANCY_PYPI_README_VERSION).tar.gz
> -PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/b4/c2/c9094283a07dd96c5a8f7a5f1910259d40d2e29223b95dd875a6ca13b58f
> +PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/f3/0f/aed57c301f339936eb91cb4d8c1e5088a101081854bd3ec18a889df32365
>   PYTHON_HATCH_FANCY_PYPI_README_LICENSE = MIT
>   PYTHON_HATCH_FANCY_PYPI_README_LICENSE_FILES = LICENSE.txt
>   PYTHON_HATCH_FANCY_PYPI_README_SETUP_TYPE = hatch

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
