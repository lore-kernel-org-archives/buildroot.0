Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E90C3ABC9
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 17:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BF95607FF;
	Sat, 10 May 2025 17:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-4QSTaPNYcR; Sat, 10 May 2025 17:13:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74F59608A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74F59608A5;
	Sat, 10 May 2025 17:13:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 645B4E2
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AD4B40119
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpP0lL688AsO for <buildroot@buildroot.org>;
 Sat, 10 May 2025 17:13:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73EA4400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73EA4400D1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73EA4400D1
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:13:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2DF34780368;
 Sat, 10 May 2025 19:13:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 May 2025 19:13:18 +0200
MIME-Version: 1.0
Date: Sat, 10 May 2025 19:13:18 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Yair Ben Avraham <yairba@protonmail.com>
In-Reply-To: <20250509220542.379160-1-thomas.petazzoni@bootlin.com>
References: <20250509220542.379160-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <812213e1e432d31255f06510fd409a0a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746897200;
 bh=wO/QZ15ypB1h9YN6VaGAv0lslVB9JmV/bPY0mI4yhFw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SlUWBlxQ1cJQOR55hGHLLKYndwZtSiD45oAQOwhB+3m3kvTaXv1KXSa3pKc+zpBPe
 Z22VAbjLAEA2YNjlGWMfzD5NcgtlYmKuDz2CyxmKWjOC4MEiweH5VyYC7dmW+QN1Z+
 PeBbjOdr7C0I/A9vmHbKBxXKPetlReyblNpcoAR9DDKvN6J21OWFjD+zhtdVZktaKA
 wZ1eD8nrC0MKhvLProiH4q8hbnHryb2cMbHGuIWHHI2OudTLjBASdE0cs5gqlmAhrK
 ejmS9nm0iUZsjcNxyY6Ut83opzSidzqPYuj86JejM0qMUQygNyXqVw115An9wacy6I
 BX2uGGuGGTQow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SlUWBlxQ
Subject: Re: [Buildroot] [PATCH] package/tpm2-pkcs11: bump to version 1.9.1
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

On 10/05/2025 00:05, Thomas Petazzoni via buildroot wrote:
> 1.9.0..1.9.1 changes described at:
> 
>   https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.9.1
> 
> Update suggested by https://gitlab.com/magerkraut at
> https://gitlab.com/buildroot.org/buildroot/-/issues/109 as "There is a
> issue with the database LOCK file".
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/issues/109
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
