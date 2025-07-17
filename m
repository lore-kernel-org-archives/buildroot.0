Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01743C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD20D4178F;
	Thu, 17 Jul 2025 20:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWm84kV8XhY7; Thu, 17 Jul 2025 20:41:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F08F041764
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F08F041764;
	Thu, 17 Jul 2025 20:41:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CA372226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC2F440A62
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUR_pPys8iGN for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B78E540797
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B78E540797
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B78E540797
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C8921B977AA4; Thu, 17 Jul 2025 22:41:33 +0200 (CEST)
Message-ID: <b9ae1c3c-70aa-4df0-bcc6-8b0daeb2436e@rnout.be>
Date: Thu, 17 Jul 2025 22:41:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250715230450.757888-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250715230450.757888-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752784893; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=4VtVG2oJ5X25xJT4byAgBqFbhdcg7cyVnecJkhK7/OE=;
 b=Ary256c9+IlVgpIW8J9Pb4xpcbuRMjUyEk6xEPXRffMc0zwQO4d/vnJCi0tB8jZ5PXbizu
 0GS4PZSft35jb2RiHGPBSGeQB9pFt10hQjyIpmjWPcURsiVkIQ/F07k4I4lzdqTMy6UkNQ
 FyDBbWRaHr9zymQhddwgTKz8nF+07A5BUpl6BKNFkEZGqleICYWyOOF5x8tRZLVOFwGA91
 LqKnfMiJhL9Srxw/U1mI07u29fHFipnhq5WV9kRg3LPU7Z3SHK1sk8FWg6ramEQB6N74j9
 fpmGBGdsCTtkWSosh6CdoGS3n0MSk3VkXlPQPwSDXQAEamwvs3wD9mObtO9dMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Ary256c9
Subject: Re: [Buildroot] [PATCH 1/1] package/python-hatch-vcs: bump to
 version 0.5.0
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



On 16/07/2025 01:04, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-hatch-vcs/python-hatch-vcs.hash | 4 ++--
>   package/python-hatch-vcs/python-hatch-vcs.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-hatch-vcs/python-hatch-vcs.hash b/package/python-hatch-vcs/python-hatch-vcs.hash
> index 55cd3b3e5a..16f08bcc4a 100644
> --- a/package/python-hatch-vcs/python-hatch-vcs.hash
> +++ b/package/python-hatch-vcs/python-hatch-vcs.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/hatch_vcs/json
> -md5  d801fe7c3e5955307748f2790bbb3488  hatch_vcs-0.4.0.tar.gz
> -sha256  093810748fe01db0d451fabcf2c1ac2688caefd232d4ede967090b1c1b07d9f7  hatch_vcs-0.4.0.tar.gz
> +md5  9a22a9f7203783e526959d34510a9672  hatch_vcs-0.5.0.tar.gz
> +sha256  0395fa126940340215090c344a2bf4e2a77bcbe7daab16f41b37b98c95809ff9  hatch_vcs-0.5.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  117aa5006d8475562f04442ab06dd2a4c501af3a77255eae0deef1f0c2499a1a  LICENSE.txt
> diff --git a/package/python-hatch-vcs/python-hatch-vcs.mk b/package/python-hatch-vcs/python-hatch-vcs.mk
> index f63d8b26fe..1fc2a19706 100644
> --- a/package/python-hatch-vcs/python-hatch-vcs.mk
> +++ b/package/python-hatch-vcs/python-hatch-vcs.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_HATCH_VCS_VERSION = 0.4.0
> +PYTHON_HATCH_VCS_VERSION = 0.5.0
>   PYTHON_HATCH_VCS_SOURCE = hatch_vcs-$(PYTHON_HATCH_VCS_VERSION).tar.gz
> -PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/f5/c9/54bb4fa27b4e4a014ef3bb17710cdf692b3aa2cbc7953da885f1bf7e06ea
> +PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/6b/b0/4cc743d38adbee9d57d786fa496ed1daadb17e48589b6da8fa55717a0746
>   PYTHON_HATCH_VCS_LICENSE = MIT
>   PYTHON_HATCH_VCS_LICENSE_FILES = LICENSE.txt
>   PYTHON_HATCH_VCS_SETUP_TYPE = hatch

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
