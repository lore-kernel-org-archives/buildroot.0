Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257EBC8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D184C834E8;
	Thu, 28 Aug 2025 13:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lH5d4k5pXXp; Thu, 28 Aug 2025 13:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 088E683495
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 088E683495;
	Thu, 28 Aug 2025 13:17:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3740DB8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2938160D9C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPvD_lE8nI_Z for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:17:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41C426070D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41C426070D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41C426070D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:17:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD5B2B978384; Thu, 28 Aug 2025 15:17:21 +0200 (CEST)
Message-ID: <8cf963cc-583f-4f7c-82f9-cd8e2ed588ae@rnout.be>
Date: Thu, 28 Aug 2025 15:17:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Alex Suykov <alex.suykov@gmail.com>
References: <20250818212559.3266944-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250818212559.3266944-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756387042; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=HJAIyrJNyg1Yfv2xR9GQOimj5eAyhK/GyeoxLPiiXXw=;
 b=NAr1ogPsPCJbllz6BGJOXkyLkpzbLySIruT6W8S5WMH9oCiiVwZatkFbnY41L/tYLiygH+
 0mexXFVySXIOLeTxF9CV8shfVRXvGGfNpbl4KoLjz6acMsO013pRmycDXA0FohFGoYgFLq
 8cPVCconyp+zfjY4uiBk44ek+eRiohNZVzSWgrrz6o3paGW69YEMz8r8IsWDVclOV9XuGl
 xCSsl7plIM7xrNyO02xC16hIGf82kxV3qRH8eNCM83UvxCVEtde1yteZjH9s99IsMUXgSF
 FvvFfSo9F2k1FbQUEq2lqYJdBOdI1H9geAa5Nzw/RS9k3LIhg5nP+iAsPV5/Zw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=NAr1ogPs
Subject: Re: [Buildroot] [PATCH] configs/chromebook_snow: remove defconfig,
 broken
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



On 18/08/2025 23:25, Thomas Petazzoni via buildroot wrote:
> This defconfig no longer builds:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273111
> 
> It has been failing for over 2 months:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dchromebook_snow&kind=BUILD
> 
> It builds a 4.15 kernel, which is not even a maintained LTS kernel.
> 
> Unless a fix is provided, this defconfig will be removed.
> 
> Cc: Alex Suykov <alex.suykov@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
