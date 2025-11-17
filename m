Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F98ACE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 428AD4140D;
	Mon, 17 Nov 2025 20:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DuM3mYBU1L-i; Mon, 17 Nov 2025 20:07:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE025413E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE025413E4;
	Mon, 17 Nov 2025 20:07:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20E68158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1395A818C0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJJ4KwOW1mwS for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:07:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10A0E8187F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10A0E8187F
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10A0E8187F
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 14FFBB979430; Mon, 17 Nov 2025 21:07:23 +0100 (CET)
Message-ID: <7e516d41-40e8-484f-8844-9bfa3152c3c2@rnout.be>
Date: Mon, 17 Nov 2025 21:07:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20251103082930.365967-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251103082930.365967-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763410043; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Isy6ieHL+7IqOWLlReJkZB3GmcAbyn6tjchMZXBGJHk=;
 b=adHf429s8o6wSBxSGnA9IiEw4zKmFNkprnZpn/r3qsIIkYmb/OUddb3ImcZbbi3Xee4KpG
 DR5LV1l6OvXeHwv/bV+cIqSSA3h0XNBRToBCU3jXMx7E4C0CT35LENyoZqR3gzUXPM8gB6
 bWqYvwT1rjbw7oqmkXN0d9cahQ2hYkfXLJ8ICxyVs4xxdZwL4ef9bKXXaS18+w5DvKHL6A
 9K/5W1VQgAku5taN1oczDabv94xyS5cQjo6FMNvpdUApRAN2spJpCBQ56qDLKZ+qhGHBO8
 PlhT43INcl8zRhFP13TRmFJgvbRQz3qdPEBFPYGxR7AQ8mUBLR3jwaegmpoUHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=adHf429s
Subject: Re: [Buildroot] [PATCH] package/pkg-download.mk: fix
 'dereferencing' typo
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



On 03/11/2025 09:29, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-download.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index fa1e06537e..ef268f5c83 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -27,7 +27,7 @@ else
>   BR2_DL_DIR = $(DL_DIR)
>   endif
>   
> -# ensure it exists and a absolute path, derefrecing symlinks
> +# ensure it exists and a absolute path, dereferencing symlinks
>   DL_DIR := $(shell mkdir -p $(DL_DIR) && cd $(DL_DIR) >/dev/null && pwd -P)
>   
>   #

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
