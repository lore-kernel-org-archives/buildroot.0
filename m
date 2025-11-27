Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C2AD111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1341540CE0;
	Thu, 27 Nov 2025 19:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcsbCT96RG2E; Thu, 27 Nov 2025 19:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9007C40AF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9007C40AF8;
	Thu, 27 Nov 2025 19:58:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 43381708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 356E840AF3
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2LrrbjS1ckJ for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:58:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3286540A97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3286540A97
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3286540A97
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:58:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F3C14B979CE5; Thu, 27 Nov 2025 20:57:57 +0100 (CET)
Message-ID: <ed344bb8-24c3-44a0-a03f-a67baa210138@rnout.be>
Date: Thu, 27 Nov 2025 20:57:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, buildroot@buildroot.org
References: <20251115231507.4299-1-mr.zoltan.gyarmati@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251115231507.4299-1-mr.zoltan.gyarmati@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273478; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=57+1JOnQMVEA+vrpa3qqGUHPUx1ETaxjqOb7HUnIk1M=;
 b=IxurfyJ5sTcx8SY86L93RbMoKoomS+4pRQ8ivjplYYlqyIKgIRfxqnytpfHbRhIlvDrw/i
 JNM4V9LzLfl1nOSFbveDkokBkG+aD8L6kgr8zJ5diHrw6jDX0pMuPzBZNCHvNovwnRCate
 eKTqBIuQ3UpilmAWxcp6ceM38lKF7U4GLml+ku0+oXptJhIVC2i33rrEy3ijKrHEsFkrSh
 yTwQe2d28gpQC24cEcO2hgxhBwqTaJZ2nMew+pHCxLgT9yKOUeSi0A8ObF8LhmKhvZt2fW
 rnTeBnE4wI+co1dTbXq8J3sIm+sYKmoBrNlno/33AK09qKI7WlTR73Wjm3XXmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=IxurfyJ5
Subject: Re: [Buildroot] [PATCH] Update my e-mail address in DEVELOPERS
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



On 16/11/2025 00:15, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7174afbdf9..048bc14a8c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3535,7 +3535,7 @@ F:	utils/scanpypi
>   N:	Yunhao Tian <t123yh.xyz@gmail.com>
>   F:	package/libopenaptx/
>   
> -N:	Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> +N:	Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
>   F:	package/crudini/
>   F:	package/grantlee/
>   F:	package/libusb/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
