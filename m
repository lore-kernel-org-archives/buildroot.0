Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25652CCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 12:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCF22412E9;
	Mon, 13 Oct 2025 12:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYkXSZxH6piH; Mon, 13 Oct 2025 12:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 197CA412EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 197CA412EC;
	Mon, 13 Oct 2025 12:04:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F3B42A8
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 12:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 710DC4130D
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 12:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEpS7ZVCBtan for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 12:04:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6EC0E4130B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EC0E4130B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EC0E4130B
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 12:04:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6BD5FB978C7F; Mon, 13 Oct 2025 14:04:03 +0200 (CEST)
Message-ID: <fff6d814-bebb-4fbb-b525-f2c31bc7776a@rnout.be>
Date: Mon, 13 Oct 2025 14:04:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
References: <20251013111851.47129-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251013111851.47129-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1760357044; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=lowta5KgI/0BYu+l+5WZw3VP9Qd+LGey3hPjWuSbYDI=;
 b=fiX5aNOpHV30/xXuOk0wfFo2/o3fSgi4j7xmerMrCU4adahaGvTzC4k6wIGWF+bzFv0dp9
 DSM92Dj/z4W3/2cdtd+VU1nLfGvy9/Ed9DAkzjH9DLoNqXezjF1ew+1um88RnVYpauLkZ9
 N6zxhUHUPqaf45ljOP4PViSqVOQQnljX6ozEWj1D73rh67ukxmoiKczaPmNB8/AIIJlkR/
 awzbKGOH1G9q7DqhJijn7Yw4HWUw+VBDOddIBN/0Lh+MMJv6/ACS1fmrNK/BXvY/9r5onV
 bWhC2XoiocJJAuLFeKPtbM+p+xjjfnp6bUC+6+6kBBQpBdtcPQutnyTeHcxHaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=fiX5aNOp
Subject: Re: [Buildroot] [PATCH] docs/website/download.html: fix latest
 releases dates
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



On 13/10/2025 13:18, Titouan Christophe wrote:
> The website download page was updated for the latest releases of
> 2025.{02,05,08} in [1], but the column "Latest release date" wasn't
> updated.
> 
> Moreover, indicate that 2025.05.3 is the EOL stable release.
> 
> [1] e5501d7b1a98c1e760f7569472d01491b21ffefa
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to master, thanks.

  Thank you for fixing my mistakes!

  Regards,
  Arnout

> ---
>   docs/website/download.html | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/website/download.html b/docs/website/download.html
> index 5bb7cf6987..d5b849ca9a 100644
> --- a/docs/website/download.html
> +++ b/docs/website/download.html
> @@ -54,7 +54,7 @@
>                 Changelog
>               </a>
>             </td>
> -          <td>2025-09-07</td>
> +          <td>2025-10-11</td>
>             <td>
>               <a href="/downloads/buildroot-2025.08.1.tar.gz">
>                 <img src="images/zip.png" width="24" alt="">
> @@ -70,7 +70,7 @@
>               <a href="/downloads/buildroot-2025.08.1.tar.xz.sign">[PGP sig]</a>
>             </td>
>           </tr>
> -          <th>Stable</th>
> +          <th>Stable (EOL)</th>
>             <th>2025.05.x</th>
>             <td>September 2025</td>
>             <td>
> @@ -79,7 +79,7 @@
>                 Changelog
>               </a>
>             </td>
> -          <td>2025-09-09</td>
> +          <td>2025-10-11</td>
>             <td>
>               <a href="/downloads/buildroot-2025.05.3.tar.gz">
>                 <img src="images/zip.png" width="24" alt="">
> @@ -105,7 +105,7 @@
>                 Changelog
>               </a>
>             </td>
> -          <td>2025-09-09</td>
> +          <td>2025-10-11</td>
>             <td>
>               <a href="/downloads/buildroot-2025.02.7.tar.gz">
>                 <img src="images/zip.png" width="24" alt="">

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
