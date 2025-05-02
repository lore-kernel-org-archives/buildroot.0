Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B99C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A498683D5D;
	Fri,  2 May 2025 10:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6VLhY0xqq5NC; Fri,  2 May 2025 10:45:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4AED82241
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4AED82241;
	Fri,  2 May 2025 10:45:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2054AEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05F2A600B9
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnW0VDY96vdM for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:45:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F1087605E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1087605E1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1087605E1
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:45:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CD46F1C1123; Fri,  2 May 2025 12:45:18 +0200 (CEST)
Message-ID: <ac36c93b-9d75-48c9-b450-acb72f3ec087@rnout.be>
Date: Fri, 2 May 2025 12:45:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
References: <20250422-libcamera-meson-doc-merged-v1-1-850c86402c43@cherry.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250422-libcamera-meson-doc-merged-v1-1-850c86402c43@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182719; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Fr9g4bjFm4CPEjSvxf/UVWftmRXAoSXczQCq+0D5aBw=;
 b=TF4FoSxSiegtlCTQzmMA5rNMo3FwTCEqD30sL5m9qCWytGuisxp2DEeDVsL0B9xwFA+SsL
 ph9OcbXJ9KfSFVOQUQ2C2OMB1qlYJenEa/NJa2Tp47j5atO6TQxFs51GVtWijDpN0Dtn+s
 yt9WVzNpdkcWfUPHrHWLS2eSD2HxqdI+bq0yUlENZJOfNu8z+ZY3UjKdAJusYzoPbLjpSg
 NI4ajpHMDkXBcqU5O18YnI29PRy/ey5kFXcntnJZiiKzD3ovzau2J69K68ftQsmtvZgO8u
 VzEwGO5/zsSC7+ZzpDGipmVUfDY+lzMtllUnZdkWcAnelltX3/jrEvkaOkbKMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=TF4FoSxS
Subject: Re: [Buildroot] [PATCH] package/libcamera: update patch with merged
 commit
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



On 22/04/2025 12:16, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The v1 of the patch that is in Buildroot ended up being reworked and
> merged from a v2, therefore let's update the patch by using the merged
> commit instead.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...t-automatically-build-documentation-if-sp.patch | 33 ++++++++++++++--------
>   1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch b/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
> index d8975a86cb431ea44b19e168904157dda8a4b018..c75ff1ce9dc1c17258f962465ece69b09868e0ed 100644
> --- a/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
> +++ b/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
> @@ -1,7 +1,7 @@
> -From 1e4db1f9792e4343231a1cf36aa553404a534828 Mon Sep 17 00:00:00 2001
> +From ae2b6cb3cac6a38a6c96625915cea4b9cf3fc180 Mon Sep 17 00:00:00 2001
>   From: Quentin Schulz <quentin.schulz@cherry.de>
> -Date: Fri, 4 Apr 2025 18:01:33 +0200
> -Subject: [PATCH] meson: do not automatically build documentation if
> +Date: Fri, 4 Apr 2025 18:12:35 +0200
> +Subject: [PATCH] meson: Do not automatically build documentation if
>    sphinx-build-3 is found
>   
>   Commit aba567338b25 ("Documentation: Move all dependencies into
> @@ -21,22 +21,31 @@ also to declutter the generated package if documentation isn't desired.
>   
>   Fixes: aba567338b25 ("Documentation: Move all dependencies into features")
>   Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> -Upstream: https://lists.libcamera.org/pipermail/libcamera-devel/2025-April/049705.html
> +Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> +Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
> +Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> +Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +Upstream: https://git.libcamera.org/libcamera/libcamera.git/commit/?id=ae2b6cb3cac6a38a6c96625915cea4b9cf3fc180
>   Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>   ---
> - Documentation/meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + Documentation/meson.build | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
>   
>   diff --git a/Documentation/meson.build b/Documentation/meson.build
> -index 6158320e..c59849f6 100644
> +index 6158320e..0fc5909d 100644
>   --- a/Documentation/meson.build
>   +++ b/Documentation/meson.build
> -@@ -116,7 +116,7 @@ endif
> +@@ -116,10 +116,8 @@ endif
>    # Sphinx
>    #
>    
>   -sphinx = find_program('sphinx-build-3', required : false)
> -+sphinx = find_program('sphinx-build-3', required : get_option('documentation'))
> - if not sphinx.found()
> -     sphinx = find_program('sphinx-build', required : get_option('documentation'))
> - endif
> +-if not sphinx.found()
> +-    sphinx = find_program('sphinx-build', required : get_option('documentation'))
> +-endif
> ++sphinx = find_program('sphinx-build-3', 'sphinx-build',
> ++                      required : get_option('documentation'))
> +
> + if sphinx.found()
> +     docs_sources = [
> 
> ---
> base-commit: 3ffdcc5b9db2a703259f900fdc8251c4e0d14dfb
> change-id: 20250422-libcamera-meson-doc-merged-e34c56293a18
> 
> Best regards,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
