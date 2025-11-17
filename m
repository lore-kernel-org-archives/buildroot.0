Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E332CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 220F24028C;
	Mon, 17 Nov 2025 20:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8IWF-o0JwGwZ; Mon, 17 Nov 2025 20:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E48540359
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E48540359;
	Mon, 17 Nov 2025 20:01:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B33F31BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99EE0408C5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6uT_-lAJLZSf for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:01:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77BF540027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77BF540027
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77BF540027
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:01:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 24275B979430; Mon, 17 Nov 2025 21:01:04 +0100 (CET)
Message-ID: <1cec465f-1bfd-4669-b7d2-0aa07a1ff480@rnout.be>
Date: Mon, 17 Nov 2025 21:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251102111011.1390948-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251102111011.1390948-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409664; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=v6WrcllUWVaUwDfnLDVcHb6Ey8FP5WVcC9rh9IHJlWQ=;
 b=K5hTC4bs3NBw6Mps0kHes19Nh/f2A5+l1zrzTZ6UgCl6hCpk2vkDUv8M9lwR7t28s/Eh9q
 yspA0njObJJE5k1q+SUiIfCNkmGfQ+NijFtkB54siIZjcES4T0Y00rQVXdQnoL26NenPTw
 cGHZrAbhWuVj5n8xyQxzQnpEvPAC6+FK72yyzgn/ApYYfz3WTSqtKaW6kjfLcM0stvs65K
 RBn7e4lZYKPqIFSBa7j1VwvwS07tNKX5T/WRN3EdxlJklQgJ6Xwsz1BkU05RcQ10ayb5rg
 7jT77fXizEtWrKvlX9suMZFD+eGTq+icg8ewJudiqknrj94CK/WuxsOfvMiZiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=K5hTC4bs
Subject: Re: [Buildroot] [PATCH 1/2] package/live555: switch _SITE to
 videolan.org
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



On 02/11/2025 12:10, Bernd Kuhls wrote:
> Upstream site http://www.live555.com/liveMedia/public/ removes older
> versions, use videolan.org instead.
> 
> Fixes:
> https://autobuild.buildroot.net/results/7af/7af41a2774ba3ed7049e06fe290d3233e772ab19/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/live555/live555.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/live555/live555.mk b/package/live555/live555.mk
> index 56ed705783..1e1531ee53 100644
> --- a/package/live555/live555.mk
> +++ b/package/live555/live555.mk
> @@ -6,7 +6,8 @@
>   
>   LIVE555_VERSION = 2021.05.03
>   LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
> -LIVE555_SITE = http://www.live555.com/liveMedia/public
> +# upstream site removes older versions, use videolan.org instead
> +LIVE555_SITE = https://download.videolan.org/contrib/live555
>   # There is a COPYING file with the GPL-3.0 license text, but none of
>   # the source files appear to be released under GPL-3.0, and the
>   # project web site says it's licensed under the LGPL:

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
