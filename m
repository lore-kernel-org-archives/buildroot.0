Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99835E77197
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 21:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B62180EBE;
	Thu,  2 Jan 2025 21:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2cNOn5yR41fN; Thu,  2 Jan 2025 21:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 455EC80EC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 455EC80EC4;
	Thu,  2 Jan 2025 21:01:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B26FCF27
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 21:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE68880EC4
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 21:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSoXOK_otTnI for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 21:01:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A254B80EBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A254B80EBE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A254B80EBE
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 21:01:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id F1A0A13F861;
 Thu,  2 Jan 2025 22:00:55 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42092])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 02 Jan 2025 22:00:55 +0100
MIME-Version: 1.0
Date: Thu, 02 Jan 2025 22:00:55 +0100
From: Julien Olivain <ju.o@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Micha=C5=82_=C5=81yszczek?=
 <michal.lyszczek@bofc.pl>
In-Reply-To: <20250102110025.722992-1-adam.duskett@amarulasolutions.com>
References: <20250102110025.722992-1-adam.duskett@amarulasolutions.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <c6c05167932be935876fa9fa049f2435@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735851658;
 bh=bn7adw4OU+5iOEGrg448JWq7GM8/+hcSglf6KEYriZo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lrDsj9iuEi6NWm3aVXnXDkhaxzBaBUIzFxPI9f1+eYzFAMZef92u843QeryEJSf1z
 6ayxHZ7ll9ZSBfRUlfpSZ2klGbAYB7k6YkXAyNLfnaw3QRv2TqIcE2w1Tob+1QX8bR
 faBHE2uQVn+ew3IY7q9x/YtWjF0znCJZOSizr3yaCGkFzzmGEN4DO724fvVg5aRVQg
 MFspOJalSxbfnuSLmVJV2I/ID4MyFmbFYGR0IlgesV3Ld4aqnyxw39+3J+6cYOKDe9
 7qDiWxxo6ITpgbBKHR8Cy0RH9bm+bQhOzq92oKQ3m2vFC0NQIzUt5CEpPTi/AIzMUL
 HHBsg6BwSg3aQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lrDsj9iu
Subject: Re: [Buildroot] [PATCH 1/1] package/bash: bump to version 5.2.37
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Adam,

On 02/01/2025 12:00, Adam Duskett wrote:
> Other changes:
>   - Refactor necessary patches
>   - Remove upstream patch
>     0003-configure-invert-condition-for-strtoimax-builtin.patch
> 
> run-tests tests.package.test_bash.TestBash.test_run passed
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

I applied to master, thanks. I did few minor fixups, see:
https://gitlab.com/buildroot.org/buildroot/-/commit/b7882d024ae484c52473955fbbcbf3b5f0717c2f

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
