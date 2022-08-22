Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2CFC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 08:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F30C81CFE;
	Mon, 22 Aug 2022 08:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F30C81CFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bEsw9MoL1dvz; Mon, 22 Aug 2022 08:55:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AFF781CAD;
	Mon, 22 Aug 2022 08:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AFF781CAD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D8941BF321
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 08:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48A1760671
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 08:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48A1760671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NxU43Hqe0a8T for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 08:55:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE4FE605B7
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org
 [IPv6:2001:67c:2050:102:465::110])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE4FE605B7
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 08:55:51 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4MB5mg5mMgz9sRt;
 Mon, 22 Aug 2022 10:55:47 +0200 (CEST)
Message-ID: <1b0f969d-78f3-86ba-23e2-2e03af924800@othermo.de>
Date: Mon, 22 Aug 2022 10:55:46 +0200
MIME-Version: 1.0
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220822072241.2056264-1-james.hilliard1@gmail.com>
Content-Language: en-US
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <20220822072241.2056264-1-james.hilliard1@gmail.com>
X-Rspamd-Queue-Id: 4MB5mg5mMgz9sRt
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1661158547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X2LIQw2XvGrraiX8gXKZEsBdZBsuTGHFHOa2siSr5nY=;
 b=OZ0VlSDv3jXMS3Ff5XnZzdqujuwz7EvhOjFxW3Uk6CDJEtaD0ZUicPU7+9jrELbTZwkzXD
 suXNawa1aF+/hfh70D+2onLJ4H1xLubCcyG5T+0ouavdl8PwYSCKq4gRIBCwSDWamg8T4b
 DdWj07GRJzZvr3jg84ytMv0s5DowIKCzOBl6E9c5ehQikNPBMui0jCS/D+dmjO2vBgQ+8e
 hHt2PB0h1+9X8m0u6cwTIPQUURa+WQnMuFu9uHQBJ6ixwcUNn7t9G64eSyVE+rC3ccGVjJ
 O658DwfNhKMu5WIE2janvfuS6erDAVFVRmkuRcu+gNhbFNVmJQJcfRHMifcqKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=OZ0VlSDv
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pep517: bump to version
 0.13.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

thanks for keeping the python ecosystem up and running within buildroot :-).

Could you perhaps include a list of changes (or a link to the upstream 
changelog, not sure what the buildroot project prefers here) in package 
version bumps? That would make reviewing the patches easier for others.

For this package:
https://github.com/pypa/pep517/blob/main/doc/changelog.rst#013

     Remove support for end-of-life Pythons. Now requires Python3.6+.
     Remove support for toml package. Now requires tomli.
     Rely on preferred "files" API on Python 3.9 and later.


On 22.08.22 09:22, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

> ---
>   package/python-pep517/python-pep517.hash | 4 ++--
>   package/python-pep517/python-pep517.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pep517/python-pep517.hash b/package/python-pep517/python-pep517.hash
> index 4dd4c47fa0..6535e51656 100644
> --- a/package/python-pep517/python-pep517.hash
> +++ b/package/python-pep517/python-pep517.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pep517/json
> -md5  7ed0adb5f737c316e071d48d66329a5d  pep517-0.12.0.tar.gz
> -sha256  931378d93d11b298cf511dd634cf5ea4cb249a28ef84160b3247ee9afb4e8ab0  pep517-0.12.0.tar.gz
> +md5  7fd08b11215256601a8a4940c1ba3d34  pep517-0.13.0.tar.gz
> +sha256  ae69927c5c172be1add9203726d4b84cf3ebad1edcd5f71fcdc746e66e829f59  pep517-0.13.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
> diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
> index 45c4f8dd39..1fd294fbb4 100644
> --- a/package/python-pep517/python-pep517.mk
> +++ b/package/python-pep517/python-pep517.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PEP517_VERSION = 0.12.0
> +PYTHON_PEP517_VERSION = 0.13.0
>   PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
> -PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c679136edfba25f25791f45ffe1ea4ae2ec1c59fe9c35e061cd1
> +PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/4d/19/e11fcc88288f68ae48e3aa9cf5a6fd092a88e629cb723465666c44d487a0
>   PYTHON_PEP517_LICENSE = MIT
>   PYTHON_PEP517_LICENSE_FILES = LICENSE
>   PYTHON_PEP517_SETUP_TYPE = flit-bootstrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
