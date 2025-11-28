Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247F9D116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 21:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB0BD60D9C;
	Fri, 28 Nov 2025 21:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcKVLznza6YV; Fri, 28 Nov 2025 21:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDB7C60DD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDB7C60DD0;
	Fri, 28 Nov 2025 21:00:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B66E01A9
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D0F540175
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHgGJBFCkWeB for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 21:00:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C4E54006E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C4E54006E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C4E54006E
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:00:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6CAF5B00535;
 Fri, 28 Nov 2025 22:00:33 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 22:00:33 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 22:00:33 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marcus Hoffmann
 <bubu@bubu1.eu>
In-Reply-To: <20251124160029.3122459-1-buildroot@bubu1.eu>
References: <20251124160029.3122459-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <f69cf684f6b0b903864c5b3d74b22703@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764363637;
 bh=uivupVfziay2NSFKZiwpNiRZoXxZtmYCn0wmSjLuciE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aTWQ7ivpbnP2smcmDDktACnWwG8fnYnajHjZOrJAzK4gGLSJsHz/ftaN6/HqN53yS
 MC9dYCbz8gnF6h46cH8Y401JJOQ8Njv0Sx3i65dDrv1cYicAg2c7949wBserJZSg9O
 McJH953F13UztuptZUGwtM4nuiaoDjUl8SK0YBV5UzqQTnMqXcxFwRCtmG+2ZFSwQa
 1aI16VyrVnsoz+ztM6t4qX7wA2bONbKJUO62nyk5hilaYtcH8nX1dgzvn/OVvAxsPa
 3B0Y0cPS800OVv7zLCunC1aR1pfdRd93womTm+m0Ht/0aBrbOVltx5JJ43zWyyjNAy
 t2FTVhPXTGNdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aTWQ7ivp
Subject: Re: [Buildroot] [PATCH] package/python-fastapi: bump to 0.121.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus,

Thanks for the patch.

On 24/11/2025 17:00, Marcus Hoffmann via buildroot wrote:
> This introduces a new trivial [1] runtime dependency (annotated-doc), 
> so
> we add that as a separate package.

Any specific reason to introduce this new package with the bump?

If not, could you please split this patch in two: a first one
introducing the package, and the second doing the fastapi bump.

Also, there is a check-package error. See below.

> 
> Changes:
> * https://github.com/fastapi/fastapi/releases/tag/0.120.0
> * https://github.com/fastapi/fastapi/releases/tag/0.120.1
> * https://github.com/fastapi/fastapi/releases/tag/0.120.2
> * https://github.com/fastapi/fastapi/releases/tag/0.120.3
> * https://github.com/fastapi/fastapi/releases/tag/0.120.4
> * https://github.com/fastapi/fastapi/releases/tag/0.121.0
> * https://github.com/fastapi/fastapi/releases/tag/0.121.1
> * https://github.com/fastapi/fastapi/releases/tag/0.121.2
> * https://github.com/fastapi/fastapi/releases/tag/0.121.3
> 
> [1] 
> https://github.com/fastapi/annotated-doc/blob/main/src/annotated_doc/main.py
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  DEVELOPERS                                        |  1 +
>  package/Config.in                                 |  1 +
>  package/python-annotated-doc/Config.in            |  7 +++++++
>  .../python-annotated-doc.hash                     |  5 +++++
>  .../python-annotated-doc/python-annotated-doc.mk  | 15 +++++++++++++++
>  package/python-fastapi/Config.in                  |  1 +
>  package/python-fastapi/python-fastapi.hash        |  4 ++--
>  package/python-fastapi/python-fastapi.mk          |  4 ++--
>  8 files changed, 34 insertions(+), 4 deletions(-)
>  create mode 100644 package/python-annotated-doc/Config.in
>  create mode 100644 
> package/python-annotated-doc/python-annotated-doc.hash
>  create mode 100644 
> package/python-annotated-doc/python-annotated-doc.mk
> 
[...]
> diff --git a/package/python-annotated-doc/python-annotated-doc.mk 
> b/package/python-annotated-doc/python-annotated-doc.mk
> new file mode 100644
> index 0000000000..23e0ccd358
> --- /dev/null
> +++ b/package/python-annotated-doc/python-annotated-doc.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-annotated-doc
> +#
> +################################################################################
> +
> +

Running "utils/docker-run make check-package" generates
an error here:
package/python-annotated-doc/python-annotated-doc.mk:7: consecutive 
empty lines

Could you remove it, please?

> +PYTHON_ANNOTATED_DOC_VERSION = 0.0.4
> +PYTHON_ANNOTATED_DOC_SOURCE = 
> annotated_doc-$(PYTHON_ANNOTATED_DOC_VERSION).tar.gz
> +PYTHON_ANNOTATED_DOC_SITE = 
> https://files.pythonhosted.org/packages/57/ba/046ceea27344560984e26a590f90bc7f4a75b06701f653222458922b558c
> +PYTHON_ANNOTATED_DOC_SETUP_TYPE = pep517
> +PYTHON_ANNOTATED_DOC_LICENSE = MIT
> +PYTHON_ANNOTATED_DOC_LICENSE_FILES = LICENSE
> +PYTHON_ANNOTATED_DOC_DEPENDENCIES = host-python-pdm-backend

And to follow the format of all other packages, could you add a new line 
here?

> +$(eval $(python-package))

Could you send an updated patch addressing those issues, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
