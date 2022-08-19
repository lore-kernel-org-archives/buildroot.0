Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1D6C32772
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 09:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34FA9842A8;
	Fri, 19 Aug 2022 09:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34FA9842A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmuHYrs6yR8g; Fri, 19 Aug 2022 09:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27AC084266;
	Fri, 19 Aug 2022 09:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27AC084266
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAEF11BF293
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 09:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 931CD84266
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 09:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 931CD84266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3F3_Sr92QaW for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 09:51:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23B1683F7D
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23B1683F7D
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 09:51:05 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4M8H7k495gz9t1d
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 11:50:58 +0200 (CEST)
Message-ID: <84dd48a1-a7c0-7960-1e9f-7db064423ce3@othermo.de>
Date: Fri, 19 Aug 2022 11:50:57 +0200
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220725064338.1326554-1-james.hilliard1@gmail.com>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <20220725064338.1326554-1-james.hilliard1@gmail.com>
X-Rspamd-Queue-Id: 4M8H7k495gz9t1d
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1660902658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ecpLphiJd+jei1a9kAeyKP2J86UpVM06tfWkG/+0//0=;
 b=tRthuQh7zVPTuc+N6Zm9Ntnih1naUOKgcmNTe0WwwFhXAnTTBA9DbpQfxzhCWVtjze10+u
 mQTryVYjEmLUFHsFlH8BRvbDik0n9f8SJVeRpYZaBJTwVpjycDizHT90fyYviU9czjSUgn
 SE52NR+Uo8cuDL/3Wg42CUxmOXJTBqCs8gE8/J+UD9spaCXQUb65ocNhq9mxbJ7vxY2DwR
 x6zoHEgbfModDypzM8a/s9OpgSgmtEfJDRPjcF/+ADrICDLjs5IyyOlz2LejSIghGopY7O
 HHzRNNNcyl/8GhrkHWK/POc4gIgOPCF8UwXXHSuYDImbSoD/RrK0gPcbo1ioZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=tRthuQh7
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python: clean conflicting
 pep517 packages before install
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 25.07.22 08:43, James Hilliard wrote:
> The python installer package isn't able to overwrite packages that
> already exist, this causes problems when doing a rebuild or update
> without a full clean.
> 
> To fix this we can use functionality from importlib to identify and
> remove any conflicting python package files before installation.
> 
> Since we are adding this functionality to our pyinstaller.py script
> we must also use pyinstaller.py for host python packages to avoid
> hitting this issue there as well.
> 
> Fixes:
> Traceback (most recent call last):
>    File "/home/buildroot/buildroot/support/scripts/pyinstaller.py", line 69, in <module>
>      main()
>    File "/home/buildroot/buildroot/support/scripts/pyinstaller.py", line 61, in main
>      install(
>    File "/home/buildroot/buildroot/output/host/lib/python3.10/site-packages/installer/_core.py", line 109, in install
>      record = destination.write_file(
>    File "/home/buildroot/buildroot/output/host/lib/python3.10/site-packages/installer/destinations.py", line 207, in write_file
>      return self.write_to_fs(scheme, path_, stream, is_executable)
>    File "/home/buildroot/buildroot/output/host/lib/python3.10/site-packages/installer/destinations.py", line 167, in write_to_fs
>      raise FileExistsError(message)
> FileExistsError: File already exists: /home/buildroot/buildroot/output/target/usr/lib/python3.10/site-packages/tinycss2/__init__.py
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

> ---
>   package/pkg-python.mk          | 12 ++++++++++--
>   support/scripts/pyinstaller.py | 23 +++++++++++++++++++++++
>   2 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 5794e3a195..b147827821 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -139,6 +139,14 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
>   HOST_PKG_PYTHON_PEP517_ENV = \
>   	$(HOST_PKG_PYTHON_ENV)
>   
> +HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
> +	--interpreter=/bin/python \
> +	--script-kind=posix \
> +	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
> +	--scripts=$(HOST_DIR)/bin \
> +	--data=$(HOST_DIR)
> +
>   HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
>   	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
>   
> @@ -200,7 +208,7 @@ $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/*
>   else
>   $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
>   $(2)_BASE_BUILD_CMD = -m build -n -w
> -$(2)_BASE_INSTALL_CMD = -m installer dist/*
> +$(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
>   endif
>   else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
>   ifeq ($(4),target)
> @@ -208,7 +216,7 @@ $$(error flit-bootstrap setup type only supported for host packages)
>   else
>   $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
>   $(2)_BASE_BUILD_CMD = -m flit_core.wheel
> -$(2)_BASE_INSTALL_CMD ?= -m installer dist/*
> +$(2)_BASE_INSTALL_CMD ?= $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
>   endif
>   else
>   $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
> diff --git a/support/scripts/pyinstaller.py b/support/scripts/pyinstaller.py
> index 6dd9242327..1ab1b83178 100755
> --- a/support/scripts/pyinstaller.py
> +++ b/support/scripts/pyinstaller.py
> @@ -2,12 +2,34 @@
>   
>   import argparse
>   import glob
> +import os
> +import pathlib
> +
> +from importlib.machinery import PathFinder
> +from importlib.metadata import DistributionFinder
>   
>   from installer import install
> +from installer._core import _process_WHEEL_file
>   from installer.destinations import SchemeDictionaryDestination
>   from installer.sources import WheelFile
>   
>   
> +def clean(source, destination):
> +    scheme = _process_WHEEL_file(source)
> +    scheme_path = destination.scheme_dict[scheme]
> +    context = DistributionFinder.Context(
> +        name=source.distribution,
> +        path=[scheme_path],
> +    )
> +    for path in PathFinder.find_distributions(context=context):
> +        if not path.files:
> +            continue
> +        for file in path.files:
> +            file_path = pathlib.Path(file.locate())
> +            if file_path.exists():
> +                file_path.unlink()
> +
> +
>   def main():
>       """Entry point for CLI."""
>       ap = argparse.ArgumentParser("python pyinstaller.py")
> @@ -58,6 +80,7 @@ def main():
>       )
>   
>       with WheelFile.open(glob.glob(args.wheel_file)[0]) as source:
> +        clean(source, destination)
>           install(
>               source=source,
>               destination=destination,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
