Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6C2C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B047D801FA;
	Fri,  2 May 2025 10:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjXVe5LQjHx8; Fri,  2 May 2025 10:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D21C3820D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D21C3820D7;
	Fri,  2 May 2025 10:40:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE5FDEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C49BD415B9
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bL2byvEkpuQM for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:40:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C14C741591
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C14C741591
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C14C741591
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:40:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9392E1C1120; Fri,  2 May 2025 12:40:32 +0200 (CEST)
Message-ID: <ec533ec2-ce00-4347-8493-07f15e3e1e78@rnout.be>
Date: Fri, 2 May 2025 12:40:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1744229017.git.yann.morin.1998@free.fr>
 <138d9e88a9127ed4ade6d0e33d62f91bf0bb3c81.1744229017.git.yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <138d9e88a9127ed4ade6d0e33d62f91bf0bb3c81.1744229017.git.yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182432; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yis5IiBYPR9qhlYFiXJdCv0CGqpscwVpq49zHW3M+6I=;
 b=oqBZgormA43nb2rEVYTJfSeGernGmApFtilC7I0YDLHu33nTX7z0LD3OQiAFdFBEJFfMDy
 WZx4XzRCVJRQDouCFCKT9neGyEMnb4YpL92KWCN9E6q6q74vzqWLQCXBKvrNMdw+Dy3XTB
 WP0kQac6ZHJkTukLgxcfKATs9Hg4p9Sac69BdzsKAgU88xqU3U41Jqkntzn6K3d3IIwpW/
 +Bu30manWntukXg5cBb7tFYW6mCVhHeeK3ny3Guva/8DWkDBL4PFj+m1Fz8H/cHKp8G7w6
 vWzXW2hUlkIjZgn+PepSBks18r2gUyydJqL+gHO+xpCvK4rhpNm2oskMfiEy0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=oqBZgorm
Subject: Re: [Buildroot] [PATCH 02/29 v2] package/dejavu: update homepage
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



On 09/04/2025 22:03, Yann E. MORIN wrote:
> The currently referenced homepage is a cyber-squatter. Switch to the new
> official homepage.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/dejavu/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dejavu/Config.in b/package/dejavu/Config.in
> index 5d21e56088..ca549d30e4 100644
> --- a/package/dejavu/Config.in
> +++ b/package/dejavu/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_DEJAVU
>   	  maintaining the original look and feel through the process
>   	  of collaborative development, under a Free license.
>   
> -	  http://dejavu-fonts.org
> +	  https://dejavu-fonts.github.io/
>   
>   if BR2_PACKAGE_DEJAVU
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
