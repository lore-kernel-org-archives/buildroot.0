Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91044C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4450F42161;
	Mon,  6 Nov 2023 22:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4450F42161
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C3xybUO-S9fC; Mon,  6 Nov 2023 22:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C068142158;
	Mon,  6 Nov 2023 22:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C068142158
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 475951BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FB1C41708
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FB1C41708
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ShtIZ--MnwtL for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:52 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C39F42095
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C39F42095
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1100860007;
 Mon,  6 Nov 2023 22:25:50 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:23:21 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232321.74c79a5c@windsurf>
In-Reply-To: <20231105081313.2908316-1-james.hilliard1@gmail.com>
References: <20231105081313.2908316-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JA5XhbpYTNrXcrgwCuwHvei4pztf87aFvgH/KST47HM=;
 b=exHhqo2xpZppQ9vlxlV08iO3BqN1dC1x+CzoaF7T767l0lw+Qi6wU0iodobTLFJBYrRb6E
 nnev4ndl5BtMpgNamTiriO1FJfey04OSEHZGoGb6+LcmRPQtOTzqrF//Uzb3TzOWrRJX+G
 Hln4M6SWz5DWMXMGCwip0aU28Q1Ix8tewTvE89nONBQhO+vbzubPUN8nMN4eAEQSt3/5IY
 4mUMv1B5t9WuoKDa+USMq2yUZQtUMK8WPoqu/BNEXkjTZKukYZxOpbFI6zGKZshk4+WJb5
 DzRwTlVUsRxC+G3njzMt1DYahhG/xeOGOShFG9X3eGJ9CewMtq2wkhYE04l3Vg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=exHhqo2x
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jedi: bump to version
 0.19.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 01:13:13 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-jedi/python-jedi.hash | 4 ++--
>  package/python-jedi/python-jedi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
> index dee8810e89..99034d20bb 100644
> --- a/package/python-jedi/python-jedi.hash
> +++ b/package/python-jedi/python-jedi.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/jedi/json
> -md5  47e89a2b8bedcfeb1527fac37b9ba1b3  jedi-0.18.2.tar.gz
> -sha256  bae794c30d07f6d910d32a7048af09b5a39ed740918da923c6b780790ebac612  jedi-0.18.2.tar.gz
> +md5  0951191b506b660bfdb90c3dcd5b3254  jedi-0.19.1.tar.gz
> +sha256  cf0496f3651bc65d7174ac1b7d043eff454892c708a87d1b683e57b569927ffd  jedi-0.19.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
>  sha256  235e993965d399a25e7d493d25c8622f78718510884b9c051f1f1866b6f34e9d  jedi/third_party/django-stubs/LICENSE.txt
> diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
> index 40de61f0e8..5d54642a07 100644
> --- a/package/python-jedi/python-jedi.mk
> +++ b/package/python-jedi/python-jedi.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_JEDI_VERSION = 0.18.2
> +PYTHON_JEDI_VERSION = 0.19.1
>  PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
> -PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/15/02/afd43c5066de05f6b3188f3aa74136a3289e6c30e7a45f351546cab0928c
> +PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/d6/99/99b493cec4bf43176b678de30f81ed003fd6a647a301b9c927280c600f0a
>  PYTHON_JEDI_SETUP_TYPE = setuptools
>  PYTHON_JEDI_LICENSE = MIT, Apache-2.0 (typeshed)
>  PYTHON_JEDI_LICENSE_FILES = LICENSE.txt jedi/third_party/django-stubs/LICENSE.txt jedi/third_party/typeshed/LICENSE



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
