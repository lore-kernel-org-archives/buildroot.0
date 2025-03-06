Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE112C282DE
	for <buildroot@archiver.kernel.org>; Thu,  6 Mar 2025 21:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BACE40B91;
	Thu,  6 Mar 2025 21:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5SgubytpZjD; Thu,  6 Mar 2025 21:25:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 758F4410F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 758F4410F6;
	Thu,  6 Mar 2025 21:25:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5734F21
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 21:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 890704016F
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 21:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCZ00GxK42En for <buildroot@buildroot.org>;
 Thu,  6 Mar 2025 21:25:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ACDAD400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACDAD400FB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACDAD400FB
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 21:25:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 3B935B00539;
 Thu,  6 Mar 2025 22:25:40 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 06 Mar 2025 22:25:40 +0100
MIME-Version: 1.0
Date: Thu, 06 Mar 2025 22:25:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, Sergey
 Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20250303170245.3657781-1-dario.binacchi@amarulasolutions.com>
References: <20250303170245.3657781-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e4ed1cdc7c5482daa0e3a49f314809f1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741296343;
 bh=65svK/WQvMn/bkCqP8MZKLMu3VsRBOiV7JCL2So9BsE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m/0jzxNsYAxsURkEIhUhFRWfhSpu0PHKTHjNsOplbHo/+rmveNRIe01HXLj7r/6Ez
 W+7ECkarS8FKAdRxkOqe/TKN8Phj/nuyBRgdMtFpVPfdxYzsWMd64hLZUF+dv/DdAs
 nagL9C4DMUWFkfkbYDioZH08BwZe927nGrw2PTGzW+QL/Hsq6anIaA3FYj6ZRCR7eT
 c1kgsBWJXMlCuAqXtbpczpSifgkjsaNCfdEyRfx9HMvj8wGIztdGHUnnEbQRr/uZ/+
 QyRrdimRmflW9oVa1YQOvNx1BLKm5WczVS87VUkMGxbEF2kzuT0Mv4Two+eERk1TYR
 0VTxGYF8D39XA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m/0jzxNs
Subject: Re: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: add
 lts-v2.12.x selection
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

On 03/03/2025 18:02, Dario Binacchi wrote:
> There is a new lts-v2.12.x branch. Add it to the selection
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
