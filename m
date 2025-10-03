Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA1BCAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 12:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8FB740E93;
	Fri,  3 Oct 2025 12:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQ5ASUpEhrxS; Fri,  3 Oct 2025 12:00:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12CC240E61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12CC240E61;
	Fri,  3 Oct 2025 12:00:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B11E226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D193611A0
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KldHC-8O7-Tz for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 12:00:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76D956077A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76D956077A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76D956077A
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:00:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DB7A7B00596;
 Fri,  3 Oct 2025 14:00:38 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Oct 2025 14:00:38 +0200
MIME-Version: 1.0
Date: Fri, 03 Oct 2025 14:00:38 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251002155602.872945-1-dario.binacchi@amarulasolutions.com>
References: <20251002155602.872945-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <dc062f054f33408dd522030ae457583b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759492841;
 bh=TUbHI6LCAOHVQQIiewkx3uS6hMA6X50Qb56QN9Th7iA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IjpmDvp7zOixbax4f0PYLHAf545kmtI6bd3FqDyqQQeFGN7acqFOu3IdYog3vBzRz
 D2KFyiDsQu9DpjmTXoX0wr0umvfuY2xs1RkpcfCFYmwkHnvZVzrTgfaymA7VJFzV74
 qPPsKS9JmAhw64Q5bkptZCQeHY7rVBcgR/9NEXfo1RUisk5VQtT7M7KT0PU4Jz7hO3
 PAt+IlWYTBRr3dor9/8zcoPSH4SHI5ffGQbm4taQBzhfaUIi1MHjWRV6vWLibagmTS
 IMLcoKehUcALZstd6WnB/TfM6P6vT6MzHoUkrf9JDljIZu/8KeVnZG+TcaQNB1Y1+K
 zJjZDBvg0uVjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IjpmDvp7
Subject: Re: [Buildroot] [PATCH v2 1/2] package/expat: security bump to
 version 2.7.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/10/2025 17:56, Dario Binacchi wrote:
> This bump includes the security fix for CVE-2025-59375.
> 
> Release notes:
> https://github.com/libexpat/libexpat/blob/R_2_7_2/expat/Changes
> 
> Fixes:
> https://www.cve.org/CVERecord?id=CVE-2025-59375
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
