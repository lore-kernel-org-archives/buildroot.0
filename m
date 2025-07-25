Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BF6C87FCA
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 17:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BC48617AB;
	Fri, 25 Jul 2025 17:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_FEe26zAFf2; Fri, 25 Jul 2025 17:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B610D617AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B610D617AE;
	Fri, 25 Jul 2025 17:07:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB79C1D9
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 17:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D908741D9D
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 17:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 062W_eKVfiIr for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 17:07:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A65C40ECE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A65C40ECE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A65C40ECE
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 17:07:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E98CF78050C;
 Fri, 25 Jul 2025 19:07:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Jul 2025 19:07:04 +0200
MIME-Version: 1.0
Date: Fri, 25 Jul 2025 19:07:04 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250724192813.1193189-1-bernd@kuhls.net>
References: <20250724192813.1193189-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <3b861b16ad2fbdd6e3d58def852ae9ea@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753463226;
 bh=ps7FpB8h0qWgSe1WebT7n0IRbcSI+TDkNkkKOcua52k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AXSxm9MS5f3qrKR2mOirToMtDvpDYVijukWAqvlKXXXOL0xA4+/ABpLZKWzT7hKFh
 B0Z1RMMIrqB6gZr5xyNyrxjBcy2ZsVWCzXpIYF0V71VxEhnKN1U32JddS8hRI0ulki
 V1KqaAoM9OyXMfBSSAknFn5KF3rl2Yp/jz+C450NGuoML1zVfDNRxRigcRdcaISkX3
 AKxvciZLfzan9EhSnNiJ0hJ/CEz0C/B8f1xUeyaBEg3hJr3F0D9cehRjeJJQ/sgRX8
 fesa4UfSFMc6slO1cxQkiGF21j8dFxdvKlM8lzvYN8/xp2QfN+9IArV0NFNF5G2npa
 +dpijTESoDRcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AXSxm9MS
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-waipu: bump version to
 21.12.3-Omega
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

On 24/07/2025 21:28, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
