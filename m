Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA72C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D61983B28;
	Sat, 17 May 2025 10:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GA3dF01UOfik; Sat, 17 May 2025 10:35:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8FA583B2A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8FA583B2A;
	Sat, 17 May 2025 10:35:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B471C1DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5BA640409
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Xqjgdf25UhB for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:35:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF71140529
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF71140529
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF71140529
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:35:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 91E3F1C05C0; Sat, 17 May 2025 12:35:09 +0200 (CEST)
Message-ID: <35b678a2-897f-4eaa-9fa3-547d33d07982@rnout.be>
Date: Sat, 17 May 2025 12:35:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1747241900.git.yann.morin.1998@free.fr>
 <a014de507585b759a575d0ba424a4c5a996fa108.1747241900.git.yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <a014de507585b759a575d0ba424a4c5a996fa108.1747241900.git.yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747478109; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ttWHyt6o+kgxy0SopiS0IllA9iu4TrTa23toxys5nOs=;
 b=g4ijzKN5L4cQC3A0ooHP5rVeszwYmhn6XLi5a93k2ft2RD549md1jYOkAnWXgKiWe7/xd1
 fDwcOOrDL4dKSAunXzXmWvf3FG2Q8K0ekxNimwhrb/plTgHgKvzfCtd60XWs24qO0Nw4cy
 6lXaDGCamrZ3qiTNuIwt0vkZ+L3r02VJ/j9uqJf6vNFDr4FALTOgHF7BOErYYfWJpbbxmR
 h9ZROmTo5t8JX3NvIvXcADpWk3RLhwRWmLI1Lng4AcnGy+SXjFGm+t7SLROylQYaBhY+va
 Er9FXg4fGljdvIhYMk2YNYInFqb59HQur1mWb9HxSdtQakKHgdkUmi5gj1Zr9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=g4ijzKN5
Subject: Re: [Buildroot] [PATCH 06/13] support/scripts: rename
 check-merged-usr.sh
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



On 14/05/2025 18:58, Yann E. MORIN wrote:
> We're going to need it to check merged-bin, so the naming would be
> misleading as it would no longer be just about merged-usr.
> 
> Also drop the extension, it's useless.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle <arnout@mind.be>

> ---
>   Makefile                                              | 2 +-
>   package/skeleton-custom/skeleton-custom.mk            | 2 +-
>   support/scripts/{check-merged-usr.sh => check-merged} | 0
>   3 files changed, 2 insertions(+), 2 deletions(-)
>   rename support/scripts/{check-merged-usr.sh => check-merged} (100%)
> 
> diff --git a/Makefile b/Makefile
> index 411e1de515..a5aa1c6553 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -784,7 +784,7 @@ ifeq ($(BR2_ROOTFS_MERGED_USR),y)
>   
>   	$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
>   		@$(call MESSAGE,"Sanity check in overlay $(d)")$(sep) \
> -		$(Q)not_merged_dirs="$$(support/scripts/check-merged-usr.sh $(d))"; \
> +		$(Q)not_merged_dirs="$$(support/scripts/check-merged $(d))"; \
>   		test -n "$$not_merged_dirs" && { \
>   			echo "ERROR: The overlay in $(d) is not" \
>   				"using a merged /usr for the following directories:" \
> diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
> index b05c834b94..7d64959711 100644
> --- a/package/skeleton-custom/skeleton-custom.mk
> +++ b/package/skeleton-custom/skeleton-custom.mk
> @@ -27,7 +27,7 @@ endif
>   # counterparts are appropriately setup as symlinks ones to the others.
>   ifeq ($(BR2_ROOTFS_MERGED_USR),y)
>   SKELETON_CUSTOM_NOT_MERGED_USR_DIRS = \
> -	$(shell support/scripts/check-merged-usr.sh $(SKELETON_CUSTOM_PATH))
> +	$(shell support/scripts/check-merged $(SKELETON_CUSTOM_PATH))
>   endif # merged /usr
>   
>   ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
> diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged
> similarity index 100%
> rename from support/scripts/check-merged-usr.sh
> rename to support/scripts/check-merged

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
