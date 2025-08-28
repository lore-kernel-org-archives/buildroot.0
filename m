Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636ACCA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 20:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06E8380B47;
	Thu, 28 Aug 2025 20:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ajSiwW3Leld; Thu, 28 Aug 2025 20:34:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10E4980B4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10E4980B4C;
	Thu, 28 Aug 2025 20:34:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D9C7928
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 438264107E
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_6PLMrp_eFL for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 20:34:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4BC0D4101C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BC0D4101C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BC0D4101C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:34:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF58DB978315; Thu, 28 Aug 2025 22:34:20 +0200 (CEST)
Message-ID: <d3c9c076-dcaf-4856-aaeb-4c49b1b667ac@rnout.be>
Date: Thu, 28 Aug 2025 22:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20250817093118.3455688-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250817093118.3455688-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756413261; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=rmPN+wpHvThTD3pyRR4X33KBTjpqwh2uWDpQcxankmI=;
 b=a+ttprRmTK/lPZCFsGOEShWjagNfRQZPDD0bJ+VkBVPtAC/hQWqIESR9wJwyJLXeWGWrrZ
 6TB/9tq7QwwWUV0qO8RZ6+1VjMP2o2amWm/HAFQaE445Ayn7dhYpG3ei1/EPgnt9ZKR1EN
 Dpp3MCuYsuzy9Pa0Fur+4uWhVQ9v2Un21pZINHVfh5oRsmLpKU9sZ5jn+IXERtTZCUCQEQ
 6lLOlyyHUhCcawQaCWSJXeOmrBDR0K7ZSr0YX6tskPPyMPe6M0NJMu1q9CSHIttYjKsamp
 iiwubLMPkLtqjGVMXbLtF61EujWszuwkEO4KpiNYMVBS1M5W3NHPgl9UuSCBow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=a+ttprRm
Subject: Re: [Buildroot] [PATCH v2] python-yarl: bump to v1.20.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/08/2025 11:31, Thomas Perale via buildroot wrote:
> Since the python-cython bump to v3.1.2 (see [1]), python-yarl has been
> failing on the autobuilder with the following error message:
> 
> ```
> ERROR Missing dependencies:
> 	Cython~=3.0.0; python_version >= "3.12"
> make: *** [package/pkg-generic.mk:273: /home/buildroot/instance-0/output-1/build/python-yarl-1.18.3/.stamp_built] Error 1
> ```
> 
> The cython dependency has been addressed in python-yarl v1.20.1, for
> more information see the github issue [2].
> 
> For more information on the release, see:
> 
>    - https://github.com/aio-libs/yarl/releases/tag/v1.19.0
>    - https://github.com/aio-libs/yarl/releases/tag/v1.20.0
>    - https://github.com/aio-libs/yarl/releases/tag/v1.20.1
> 
> [1] b536caaec0 package/python-cython: bump to version 3.1.2
> [2] https://github.com/aio-libs/yarl/pull/1514
> 
> Fixes: https://autobuild.buildroot.org/results/d36/d367b69b85a65fa94e923ecff3ba03723b2a6e88
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to master, thanks.

  There was actually an earlier patch by Yegor that does the same thing, but 
this one has a better commit message.

  Regards,
  Arnout

> ---
>   package/python-yarl/python-yarl.hash | 4 ++--
>   package/python-yarl/python-yarl.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
> index ca2d42bf58..43ba31f81f 100644
> --- a/package/python-yarl/python-yarl.hash
> +++ b/package/python-yarl/python-yarl.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/yarl/json
> -md5  80b89d2b28be7345a38f099b2f839d7d  yarl-1.18.3.tar.gz
> -sha256  ac1801c45cbf77b6c99242eeff4fffb5e4e73a800b5c4ad4fc0be5def634d2e1  yarl-1.18.3.tar.gz
> +md5  23352fbc2b165825d4a33682c91788bc  yarl-1.20.1.tar.gz
> +sha256  d017a4997ee50c91fd5466cef416231bb82177b93b029906cefc542ce14c35ac  yarl-1.20.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
> index 160dec8a1b..4f25394c8b 100644
> --- a/package/python-yarl/python-yarl.mk
> +++ b/package/python-yarl/python-yarl.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_YARL_VERSION = 1.18.3
> +PYTHON_YARL_VERSION = 1.20.1
>   PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
> -PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/b7/9d/4b94a8e6d2b51b599516a5cb88e5bc99b4d8d4583e468057eaa29d5f0918
> +PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/3c/fb/efaa23fa4e45537b827620f04cf8f3cd658b76642205162e072703a5b963
>   PYTHON_YARL_LICENSE = Apache-2.0
>   PYTHON_YARL_LICENSE_FILES = LICENSE
>   PYTHON_YARL_SETUP_TYPE = setuptools

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
