Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D69C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1682781778;
	Fri,  2 May 2025 11:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8KTezOaV2Me; Fri,  2 May 2025 11:09:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FBC181B69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FBC181B69;
	Fri,  2 May 2025 11:09:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 523CE229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3624140AAB
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7GHmNr0EflS for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:09:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E4C640E21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E4C640E21
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E4C640E21
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:09:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 558E31C0D8C; Fri,  2 May 2025 13:09:07 +0200 (CEST)
Message-ID: <e107d28a-d93e-4faf-bc0a-2d62464eb1e9@rnout.be>
Date: Fri, 2 May 2025 13:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Pierre Floury <pierre.floury@gmail.com>
References: <20250423185227.1313667-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250423185227.1313667-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746184147; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0QB7roy1UZCa2NUtpWJahJFxpm+Jwv5tghMCq8owtvY=;
 b=AxmSzu/stzjjLyZWpWcHRFCFMUWwtvGsmzHstp2Vci7KFhYP8zpTXNaRQF2ZBrdD8m0zW9
 ClaPejLgG9sks1mdMFRidRaiFEjZV7u5BJfu/idFeXNT7bxN6NPX8HjbWyitEyB3ObSJl2
 N+VCla8J+8GaX5pAi8BT6RAq56OTms2pnU/JpRDOklossd9Fiz0RAuA08dx9JAF8A1ZblJ
 Ko6hBceFojfu5ItNzF85c+95l+GPIl/PEqqT9TRrcFtF1KOR1/mRovDZRQIlyV9HmhkMxF
 rCdNILz1W1E9wIDnnmI3ZPTAbVGpPyPspLvtJeipf3gA8nAtWQ5FInLXlGlgrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=AxmSzu/s
Subject: Re: [Buildroot] [PATCH] package/trace-cmd: bump to version 3.3.2
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



On 23/04/2025 20:52, Giulio Benetti wrote:
> Release notes:
> https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/tag/?h=trace-cmd-v3.3.2
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/trace-cmd/trace-cmd.hash | 2 +-
>   package/trace-cmd/trace-cmd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
> index c1b52a5195..832dae693e 100644
> --- a/package/trace-cmd/trace-cmd.hash
> +++ b/package/trace-cmd/trace-cmd.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  2efe103389367e93c764c4a788880ba51018a65dec21b0411965a5f06a6338c1  trace-cmd-v3.3.1.tar.gz
> +sha256  cf16c91c0c49893499710ab2f722fd7c5ffce27485d2f7509370836b168ecd45  trace-cmd-v3.3.2.tar.gz
>   sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
>   sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
>   sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
> diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
> index cf16ddcb17..ec8f5c4b59 100644
> --- a/package/trace-cmd/trace-cmd.mk
> +++ b/package/trace-cmd/trace-cmd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TRACE_CMD_VERSION = 3.3.1
> +TRACE_CMD_VERSION = 3.3.2
>   TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
>   TRACE_CMD_SITE = \
>   	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
