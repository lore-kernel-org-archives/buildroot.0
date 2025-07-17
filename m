Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425B8C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A0DB4171C;
	Thu, 17 Jul 2025 20:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a58vAA-Z5KOL; Thu, 17 Jul 2025 20:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCDBB41193
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCDBB41193;
	Thu, 17 Jul 2025 20:41:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D708226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F27681E40
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvwYZcqLGKhh for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E7CA81E38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E7CA81E38
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E7CA81E38
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 23B03B977AA4; Thu, 17 Jul 2025 22:41:16 +0200 (CEST)
Message-ID: <2d3a6930-d81a-42b4-9b6f-8a8e5d4c714d@rnout.be>
Date: Thu, 17 Jul 2025 22:41:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250715223723.745122-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250715223723.745122-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752784876; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=azHBCjk7DaJosNvqX0e1Co+E632zROnglaNfiKWsyEA=;
 b=Hf5wx/J9s4cdXodd7n9MDK4NPk8MpZ45T2zqURru1neXBJkfKKb9rsTJcEbts859tKNjdf
 DYeiqqP0tA0tSRGeMay2e7UQxxksOnv+kx+Nm+M93BT8e21bppvpi17fJETiyisH5xKumI
 rwcaIfnu5v86ON7+iWpVaNgkcZ/5JwKWd/ndildbBDSK7mJRwZG8ZKy8EbukChan/kveKJ
 Xndlpt4fb+EOut2XmTGpw1pkFKwS9saJpydJpOm01UDfcY80TAkJkC+lRoLzgy0eKUBg+V
 gADEjWiVsPLw2BGSReSBBH9J19TxaDmaKJJsOgWqNbT0dMJ8hS+k6/6JybNdhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Hf5wx/J9
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 80.9.0
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



On 16/07/2025 00:37, James Hilliard wrote:
> Rebase add executable patch.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../python-setuptools/0001-add-executable.patch  | 16 ++++++++--------
>   package/python-setuptools/python-setuptools.hash |  4 ++--
>   package/python-setuptools/python-setuptools.mk   |  4 ++--
>   3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/0001-add-executable.patch
> index 9e12c4b628..aaef27ed75 100644
> --- a/package/python-setuptools/0001-add-executable.patch
> +++ b/package/python-setuptools/0001-add-executable.patch
> @@ -1,4 +1,4 @@
> -From 995cf87c0dfc420908847a06661cbae21d16a8f6 Mon Sep 17 00:00:00 2001
> +From 6fe6747c7d7509cc1af9667e1dae610657e5ccdf Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
>   Date: Mon, 7 Dec 2015 01:14:33 +0100
>   Subject: [PATCH] add executable
> @@ -22,10 +22,10 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>    2 files changed, 11 insertions(+)
>   
>   diff --git a/setuptools/command/install.py b/setuptools/command/install.py
> -index 741b140c7..5a281237a 100644
> +index 19ca60145..c4bb536b9 100644
>   --- a/setuptools/command/install.py
>   +++ b/setuptools/command/install.py
> -@@ -39,6 +39,7 @@ class install(orig.install):
> +@@ -35,6 +35,7 @@ class install(orig.install):
>        distribution: Distribution  # override distutils.dist.Distribution with setuptools.dist.Distribution
>    
>        user_options = orig.install.user_options + [
> @@ -33,7 +33,7 @@ index 741b140c7..5a281237a 100644
>            ('old-and-unmanageable', None, "Try not to use this!"),
>            (
>                'single-version-externally-managed',
> -@@ -73,6 +74,7 @@ class install(orig.install):
> +@@ -67,6 +68,7 @@ class install(orig.install):
>            )
>    
>            super().initialize_options()
> @@ -42,7 +42,7 @@ index 741b140c7..5a281237a 100644
>            self.single_version_externally_managed = None
>    
>   diff --git a/setuptools/command/install_scripts.py b/setuptools/command/install_scripts.py
> -index 4401cf693..38f5d5092 100644
> +index 537181e32..6893e6a8c 100644
>   --- a/setuptools/command/install_scripts.py
>   +++ b/setuptools/command/install_scripts.py
>   @@ -18,6 +18,13 @@ class install_scripts(orig.install_scripts):
> @@ -59,13 +59,13 @@ index 4401cf693..38f5d5092 100644
>    
>        def run(self) -> None:
>            self.run_command("egg_info")
> -@@ -45,6 +52,8 @@ class install_scripts(orig.install_scripts):
> -         )
> +@@ -39,6 +46,8 @@ class install_scripts(orig.install_scripts):
> +         dist = metadata.Distribution.at(path=ei_cmd.egg_info)
>            bs_cmd = self.get_finalized_command('build_scripts')
>            exec_param = getattr(bs_cmd, 'executable', None)
>   +        if self.executable is not None:
>   +            exec_param = self.executable
> -         writer = ei.ScriptWriter
> +         writer = _scripts.ScriptWriter
>            if exec_param == sys.executable:
>                # In case the path to the Python executable contains a space, wrap
>   --
> diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
> index b5bac10fe2..d0ed270e9c 100644
> --- a/package/python-setuptools/python-setuptools.hash
> +++ b/package/python-setuptools/python-setuptools.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/setuptools/json
> -md5  652d999eca1412525c01e4c5b6e2275b  setuptools-79.0.1.tar.gz
> -sha256  128ce7b8f33c3079fd1b067ecbb4051a66e8526e7b65f6cec075dfc650ddfa88  setuptools-79.0.1.tar.gz
> +md5  82e1d67883b713f9493659b50d13b436  setuptools-80.9.0.tar.gz
> +sha256  f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c  setuptools-80.9.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index 1ee5448100..e013000c57 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETUPTOOLS_VERSION = 79.0.1
> +PYTHON_SETUPTOOLS_VERSION = 80.9.0
>   PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/bb/71/b6365e6325b3290e14957b2c3a804a529968c77a049b2ed40c095f749707
> +PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/18/5d/3bf57dcd21979b887f014ea83c24ae194cfcd12b9e0fda66b957c69d1fca
>   PYTHON_SETUPTOOLS_LICENSE = MIT
>   PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
>   PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
