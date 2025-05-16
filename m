Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F155CC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C46E641806;
	Fri, 16 May 2025 10:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KR4_EtMMLI57; Fri, 16 May 2025 10:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 151F74187B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 151F74187B;
	Fri, 16 May 2025 10:49:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 740AE1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5976C4187B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O58asUiyA7b3 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:49:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BBCF041806
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBCF041806
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBCF041806
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:49:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C7F161C0FE3; Fri, 16 May 2025 12:49:15 +0200 (CEST)
Message-ID: <28cab487-e2ff-4082-9799-aa2208932aa4@rnout.be>
Date: Fri, 16 May 2025 12:49:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexander Mukhin <alexander.i.mukhin@gmail.com>, buildroot@buildroot.org
References: <20250506131252.4170-1-alexander.i.mukhin@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250506131252.4170-1-alexander.i.mukhin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392555; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=egvPCOZhUpNVtV0tssMuPZ3/TKRbLHpUGE15Z2FbQP4=;
 b=avUm4MhplNwolLA2jsLqxRgTF7jZ5gXvXJyJ23BxjzzB8/Nort6+EV0070XeOoRajYfILh
 sMbrLfUy+gTd6E28dMcdw6OA0iVdCa52/1ExoX7Um8BF2GaOuz9mvsmYuNDGFUhVrS4YzO
 oTKPMkeFOafqbtIPHhznVuq3vJS446wy3eQm0skKLGXDSvg+WFUizrohjufJWffGywy5Mn
 QmpbscTP8prN/jxhBQVxtqmpYyoSFXjNcTrezBB5TTqAs6MpRqrxGkRiBc33X9nKsbhmmX
 H/qKhNzCgy7/sd0FY/MAQsiWqn2d7+OszTqIThwWVlso3eFS33JNg5VRKCwW6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=avUm4Mhp
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Alexander Mukhin
 from tinyproxy and zfs
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



On 06/05/2025 15:12, Alexander Mukhin wrote:
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5bb81ad1..d314be79 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -131,10 +131,6 @@ F:	package/openpgm/
>   N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
>   F:	package/libest/
>   
> -N:	Alexander Mukhin <alexander.i.mukhin@gmail.com>
> -F:	package/tinyproxy/
> -F:	package/zfs/
> -
>   N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
>   F:	package/mini-snmpd/
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
