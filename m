Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39D7C7115B
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 18:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C214160638;
	Thu, 19 Jun 2025 18:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PmgKtLu0NFso; Thu, 19 Jun 2025 18:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04C2A6066A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04C2A6066A;
	Thu, 19 Jun 2025 18:47:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D5CBC181
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 18:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C744B404CA
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 18:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TspQIZLCmEo5 for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 18:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7E6140487
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7E6140487
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7E6140487
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 18:47:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 691232003AE;
 Thu, 19 Jun 2025 20:47:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 19 Jun 2025 20:47:13 +0200
MIME-Version: 1.0
Date: Thu, 19 Jun 2025 20:47:13 +0200
From: Julien Olivain <ju.o@free.fr>
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Cc: buildroot@buildroot.org, Gwenhael Goavec-Merou
 <gwenhael.goavec-merou@trabucayre.com>
In-Reply-To: <20250619123410.2152859-1-gwenj@trabucayre.com>
References: <20250619123410.2152859-1-gwenj@trabucayre.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <9d0ea8bad5c481b736faaab83a359ecc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750358835;
 bh=AKOHmZv7FvZhwYid15V1QBRec61wR/59h2fCAe8IJww=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ql29Wf2emHCJsqD1LOVSnr508++jtn7J0xqZwKcEvitk8REw9hKtTW5/BsyBSHzbV
 e4schb7TrzV0HtvpIEu+QZ3Lhoj8fRfPoKkmJG8Uov3TAD3/+GgJzGFT7ZSK5rhaPc
 Ihy0hJAQ5Aqpl9TAbOcd1rh2sSNxBKgsZkRxthRAbas8+XLLPeElq7FqLQ2uCvloq5
 iNFKYXd+jU7z/Y4re115t0ovEjVB6aF7vMQLVcefUlmqkJXJCGI37a2MYwGWoEXcWy
 cPWe0DSNeZv9cr1HoIbU2xzMzjXtChVQYqm8lhJ27k/1sYAxI/0pE0O8zYERgq5N2R
 3quBP5KHvATMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ql29Wf2e
Subject: Re: [Buildroot] [PATCH] package/gqrx: bump version to 2.17.7
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

On 19/06/2025 14:34, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou 
> <gwenhael.goavec-merou@trabucayre.com>

Applied to master, thanks.
I did few minor changes. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/6cf4f6cdb663d224bef0b96fedc183b27781a28b

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
