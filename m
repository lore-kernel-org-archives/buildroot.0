Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F191CC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF12781EAD;
	Sun, 18 May 2025 14:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id udKmAnMGSC52; Sun, 18 May 2025 14:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8D1281EAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8D1281EAE;
	Sun, 18 May 2025 14:41:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 905C51BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81EAD81EAE
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhcTFiChS1uq for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:40:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 912B981EC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 912B981EC9
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 912B981EC9
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:40:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 733A31C0FF6; Sun, 18 May 2025 16:40:55 +0200 (CEST)
Message-ID: <7e8f1a80-d4e7-4085-8319-30c2c0095bb5@rnout.be>
Date: Sun, 18 May 2025 16:40:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Lionel Flandrin <lionel@svkt.org>
References: <20250514150446.968758-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250514150446.968758-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579255; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1TdUn2ycDKZpGtEir8eV/XZTEpoAWqecCCkPceQGvXY=;
 b=gpWZrFbnKgkgzLthfoDso5Ms+m0vowgAjeY1EndpzU2gqvrbhWMvumBeHpOG0CqqxgWoE+
 IlReAgBibErcc4OE8fBMsLJvK19Dj9aB6aI8lac3QXw6v99qd7Hiz2pWTtAG8cmqXDsTcc
 BqsFLNkk2kOiToKS6DjkWXyv553zFUVnIWOXvyRIv6ows5EGR4g5TNr8Fm7Osud/tsl90a
 yl3GkndRytjMsb2W6mxO1B5IMR5IafoG0eWF96ZxXbA7MTjSQMY5zxzYQR5eAWXDWUu1Pg
 Zec/XA/IxGjZUd8iuUi/a3lMaxleJzPNEnl/nUfIocIEfxOeAAnNouIZFHrJCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=gpWZrFbn
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask: security bump to
 version 3.1.1
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



On 14/05/2025 17:04, Thomas Perale via buildroot wrote:
> Fixes the following security issues:
> 
> - CVE-2025-47278: In Flask 3.1.0, the way fallback key configuration was
>      handled resulted in the last fallback key being used for signing,
>      rather than the current signing key.
> 
> For more information, see:
>    - https://nvd.nist.gov/vuln/detail/CVE-2025-47278
>    - https://github.com/pallets/flask/commit/73d6504063bfa00666a92b07a28aaf906c532f09
> 
> For more details on the version bump, see the release notes:
>    - https://github.com/pallets/flask/releases/tag/3.1.1
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/python-flask/python-flask.hash | 4 ++--
>   package/python-flask/python-flask.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
> index 97982f99d5..17564e8587 100644
> --- a/package/python-flask/python-flask.hash
> +++ b/package/python-flask/python-flask.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/flask/json
> -md5  c95d81666442bf04f7de7db7edbe2aff  flask-3.1.0.tar.gz
> -sha256  5f873c5184c897c8d9d1b05df1e3d01b14910ce69607a117bd3277098a5836ac  flask-3.1.0.tar.gz
> +md5  59dc1b0772bab098aff83e8008e97af6  flask-3.1.1.tar.gz
> +sha256  284c7b8f2f58cb737f0cf1c30fd7eaf0ccfcde196099d24ecede3fc2005aa59e  flask-3.1.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
>   sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
> diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
> index d44c2e68ef..2269b05d29 100644
> --- a/package/python-flask/python-flask.mk
> +++ b/package/python-flask/python-flask.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_FLASK_VERSION = 3.1.0
> +PYTHON_FLASK_VERSION = 3.1.1
>   PYTHON_FLASK_SOURCE = flask-$(PYTHON_FLASK_VERSION).tar.gz
> -PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/89/50/dff6380f1c7f84135484e176e0cac8690af72fa90e932ad2a0a60e28c69b
> +PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/c0/de/e47735752347f4128bcf354e0da07ef311a78244eba9e3dc1d4a5ab21a98
>   PYTHON_FLASK_SETUP_TYPE = flit
>   PYTHON_FLASK_LICENSE = BSD-3-Clause
>   PYTHON_FLASK_LICENSE_FILES = LICENSE.txt docs/license.rst

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
