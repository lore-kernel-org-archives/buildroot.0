Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55748C54E90
	for <buildroot@archiver.kernel.org>; Sun, 25 May 2025 14:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4E7F6065F;
	Sun, 25 May 2025 14:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSUeIsxeRIcH; Sun, 25 May 2025 14:15:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3588860612
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3588860612;
	Sun, 25 May 2025 14:15:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E7ED19D
 for <buildroot@buildroot.org>; Sun, 25 May 2025 14:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 202C0405D4
 for <buildroot@buildroot.org>; Sun, 25 May 2025 14:15:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_v9ve81Ofrb for <buildroot@buildroot.org>;
 Sun, 25 May 2025 14:15:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB386403F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB386403F9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB386403F9
 for <buildroot@buildroot.org>; Sun, 25 May 2025 14:15:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 45F252003B4;
 Sun, 25 May 2025 16:14:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 May 2025 16:14:58 +0200
MIME-Version: 1.0
Date: Sun, 25 May 2025 16:14:58 +0200
From: Julien Olivain <ju.o@free.fr>
To: Amer Alshanawany <amer.alshanawany@openpixelsystems.org>
Cc: buildroot@buildroot.org, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250523164150.69687-2-amer.alshanawany@openpixelsystems.org>
References: <20250523164150.69687-2-amer.alshanawany@openpixelsystems.org>
User-Agent: Webmail Free/1.6.10
Message-ID: <ba6372a4bc9c5b0bd970e3a33179a005@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748182500;
 bh=sn5sYe7jrt2gWU63pyWF0yiyI8oGeFhOiwfanPfHbiU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Mk/IkaL4Ys5LfyfOtSdUOm1+kcF0ppyS0GWaR9W4rewsUTq/BhSQ7G2RUzk3AJQ7t
 XWHTC9+PJZmlvSVxx2zWo6Y17QTEXNADXy4fkE9t4yrTDjTuR6IRTsic+VxJGl07Gp
 d21ufDs2exyw5Q1G+Cl6tls9xHPzX3I7pMIgpiCGmBm8VxdL6WQ4bg0EB0umRNFW5g
 Iifc/+X8REKj2TJICo1rz4PgRXfROHRf4wzsY/LNgu/TTTLoURnv4euzeQrp/Jf7Pu
 QbL1btqOe3WySptmaWZu0GmaDv0ctVHdtPgmy3nj4tXLh/GTu7ik93jPWdnQf7vF2q
 zkI6Cr39UHhlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Mk/IkaL4
Subject: Re: [Buildroot] [PATCH v2] package/uuu: add target support
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

On 23/05/2025 18:41, Amer Alshanawany wrote:
> Signed-off-by: Amer Alshanawany <amer.alshanawany@openpixelsystems.org>

Applied to next, with some minor modifications. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/066f6088723f03cc3fec863d0d48a6e9cf214582

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
