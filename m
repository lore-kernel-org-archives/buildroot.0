Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B54E99050
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 07:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAB5A608A5;
	Fri, 10 Apr 2026 07:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yep13AtgNB0X; Fri, 10 Apr 2026 07:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF58460880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775807327;
	bh=XoS+K8RrpPxaOgJCqF01SHWdy0WYfLu/rtSSEbLlhzM=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MtUTyZyyKYgVM9dlfVyyH4vU8Tcf4E7pjnNVjiNw004bcvgK8q6ABlorWDBuSXp2t
	 mug6sUNpaKWHkTl1wXaKhS5lSLq0CH4zhpVFn5dkIImCC6LCtFATrtmiyBa9xNC3f1
	 0eDUtzQbQ9s83eoOc1TUdzV6KHsCXdkq2hpQU41Qpjv5y50nK9oI7AmOewYIkdAHOr
	 Oibp8jXY1pd4i1c3P4/Ws/3nwl4/Q76WiAZsMyaswbXULGp4aausbzps7N3mOZ+QD0
	 gC/FNDQ2znuWsqHJmntEfSE/GrEU+HxB1X1bq40fpg53tGjSCr5lZfyvvp2R6GfwwC
	 yLubkfWdtSUgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF58460880;
	Fri, 10 Apr 2026 07:48:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10CF51F6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 07:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02A4540246
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 07:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMk4V5TnvXIM for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 07:48:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=bisson.gary@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E5C8240070
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5C8240070
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5C8240070
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 07:48:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488aa77a06eso27154215e9.0
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 00:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775807323; x=1776412123;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=isFZPnL4cj4YkDFWa1ebwFBEzis2QYq/1nkZvfJ3t3E=;
 b=eAbiTWLI/l+765MCJV1Ng0vTLlu9QdZHunBaYEv5cXi+MEmhAsR5ElM6eOZlg6i6OK
 X4R0fQ2pJJPi2AQrXH/65bunn8N8sD2Sfwr7yl+Sh/7ZY+wlYW/tUYsR8qs6svRWVlca
 r+XyLuTH7wlYPKPbEIkCuVygBwJlGqkMMQsZVj5Lo/whCcjk+OnU2tCaS8cmJ4kVVNCJ
 Wvsmx+Ix4BIxsCOMKiO5cP3NEfCgg7+qVNcO23mfKl7T4Rj9E0ep5TIZpSMVGXU9tjP7
 gorpqoNrKcig2u270/13rovcUdyPC+06cSNY2pDlMLepX3syrrEvGTbUovnWg/LeUtZg
 uQIg==
X-Gm-Message-State: AOJu0Yz23VaemQlDatwMhsCHVrK2bwqgIEHvKkh4yfVekVxXBivWn24F
 EXVO58lQOwsDkWXj6rS6SoNMzBQBFvbIT4asWob0XXyq49aYQ5VC53F70bukzg==
X-Gm-Gg: AeBDiete3ELyobWyzDWvAkJPP5LqO0f1uUEbEAGogy1OaJChDrDNVHMT/CMx36sSKxl
 /uUhKdEEgznvaUFgEXIk7SX2wiVxm6AE/FEUmMA8KTx99a/YMLKwGTAmWBOHIkpWLtNm73t9j/w
 5cYY0O2Uz1iEXU3kFfdyC1XVz65cQ090296sFAEDkws6QeouEwaND2ynh8zkiq9B+0nrGyRMzhB
 TFGNrGY0TrA9Iwq919HEhFUQHWTDq0gGlnHYoKR4uXWLBrxP2Q8ZvYUdfgr4zWTNN/lLSRo+HnC
 lG3RzrsjGz6tsSdcRLmLcp8GXheexRFjh21954FRKTRLqPgSDf1PTPTWQvekJe1Sfr7YTv70Q0W
 6ebQ5QVgLaD7h/WbgN9UV0uCGpMmYMheeJTHW9B/rE/MnuoSF/Ep7P2SwP1N5WNytCHl4lktzR3
 WPC1WmTxfw0qmFwtAnhCQhYKz0v56oCg==
X-Received: by 2002:a05:6000:26c4:b0:43c:f1da:488a with SMTP id
 ffacd0b85a97d-43d642a4d54mr2831718f8f.13.1775807322352; 
 Fri, 10 Apr 2026 00:48:42 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:c6a2:4659:6438:8651])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63dec07esm5705565f8f.13.2026.04.10.00.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 00:48:41 -0700 (PDT)
Date: Fri, 10 Apr 2026 09:48:40 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <adirWO7Ss77pxf5o@owl5>
References: <20260408-nitrogenfix-v1-1-fc4471caaff2@gmail.com>
 <25d0f6f195a6d3e37d7f4f71894b7a86@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25d0f6f195a6d3e37d7f4f71894b7a86@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775807323; x=1776412123; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=isFZPnL4cj4YkDFWa1ebwFBEzis2QYq/1nkZvfJ3t3E=;
 b=Eyay1PF+lMJ02vDkDPiTtcMRQ1DDjLw/LipKsGCNvAXGUCvqUsLn93vdZXBoqaaIRt
 jD4H6mSVVYCxNMQ+Lt/XeMfr0r82xH+h3YWPWbdK21HcWyHgBaxfGeT9vv1BhJXGoRcw
 4Wf0yzgVW5oPj2BYCMcDydiGu6C5CNc0WN+THpd9e4BkPEjbq5DaNVSqNOZOWeu9A2nN
 2MOqCXps+Furrw3kpoMmf1xZ6bKOUffZeSFF/+zS8U3JX6TTd02G9x2Vl9CyEv2T33Tb
 gFW/P4HdG9SngvP1J2QHRbz3JVQYiDkWGxmiDRITla6pw9v6nrqmQjoCLyEWWqK5c6LZ
 /S7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Eyay1PF+
Subject: Re: [Buildroot] [PATCH] configs/nitrogen*: bump u-boot revision
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Thu, Apr 09, 2026 at 10:44:47PM +0200, Julien Olivain wrote:
> Hi Gary,
> 
> On 08/04/2026 10:33, Gary Bisson wrote:
> > - update nitrogen8mp SMARC rev2 support
> > - update LPDDR4 init to match latest NXP spreadsheet
> > - update binman support for newer python versions
> > 
> > Fixes:
> > - https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764611
> > - https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764638
> > - https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764687
> > - https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764734
> > 
> > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> 
> Applied to master, thanks.
> 
> Could you consider switcing those defconfigs to use Bootlin external glibc
> stable toolchains, please?

Sure thing, will provide a patch for that shortly.

Thanks,
Gary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
