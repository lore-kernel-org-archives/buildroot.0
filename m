Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883A2C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56F7C417FB;
	Fri, 16 May 2025 10:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96YARhRjX9zI; Fri, 16 May 2025 10:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DAD1417CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DAD1417CE;
	Fri, 16 May 2025 10:49:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0448B13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA4DB83D03
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prLE0i7gC4fb for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:49:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 538C183D01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 538C183D01
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 538C183D01
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:49:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5F8D51C0FC0; Fri, 16 May 2025 12:49:03 +0200 (CEST)
Message-ID: <7564733d-64a7-4a49-9eaa-9dd6cc55b241@rnout.be>
Date: Fri, 16 May 2025 12:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
References: <20250430091815.97571-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250430091815.97571-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392543; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=VdZL2Nc+kBa7aQNZCsWfI7ePnPbSlcCDDRUol9ukQCs=;
 b=Dbvhx2ifuBohC3/EmtxBwFCziD7dezDWdL5KVKZpzdSShco0XUuOq13A0cX8LEmg0DqvnL
 +dtz3IF8HMoMYnqDEuaAY1+zy9L9izlNTDMIUqufQJsLuHgut8Fge3FGWn6Gxsp4keqE+y
 Nk2GL1TdzZamvGaJHbDboifgQiDC1omndAUMESj9BySA24FBImsGKRfsncgBZcy3rZVW63
 GCqnHG8aarQM3iBQCzJ6VjvMNfFE2JFhEvw8bSwnWi7MIRkIERfje5RYJndrTH5/hymXai
 OCGvVBlg+iBTW9uW0bE+jmSlcuzpv1eCYTIchDrLY6x19xCnzNWeCNUcm5NhKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Dbvhx2if
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: update email for Titouan
 Christophe
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



On 30/04/2025 11:18, Titouan Christophe via buildroot wrote:
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 15389d530b..8c26ee3f22 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3291,7 +3291,7 @@ F:	toolchain/
>   N:	Timo Ketola <timo.ketola@exertus.fi>
>   F:	package/fbgrab/
>   
> -N:	Titouan Christophe <titouanchristophe@gmail.com>
> +N:	Titouan Christophe <titouan.christophe@mind.be>
>   F:	package/avro-c/
>   F:	package/mosquitto/
>   F:	package/python-avro/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
