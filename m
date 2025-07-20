Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252E3C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 14:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C58B5842BE;
	Sun, 20 Jul 2025 14:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fgAaeJwTKQq; Sun, 20 Jul 2025 14:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13A7684355
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13A7684355;
	Sun, 20 Jul 2025 14:39:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DBD6117
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 14:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EC2B84355
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 14:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQoIrNGdyMId for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 14:39:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E4E4842BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E4E4842BE
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E4E4842BE
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 14:39:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 262482003E3;
 Sun, 20 Jul 2025 16:39:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 16:39:13 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 16:39:13 +0200
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Cc: buildroot@buildroot.org, Gwenhael Goavec-Merou
 <gwenhael.goavec-merou@trabucayre.com>
In-Reply-To: <20250429074658.1272151-1-gwenj@trabucayre.com>
References: <20250429074658.1272151-1-gwenj@trabucayre.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <9876dbc1df7086456012c7a6281945af@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753022355;
 bh=EVbDJV2nr6LH0cpc+WuwIvVBYIXlnEG/NQuYKDiuIT0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kZFxhynqHWH7QJqOIIhpO7SBw7sK4DC5YZdyyg/X0OqwpuSAf/dZReHM0PTfsYsgN
 FATNVbi1PFbrj9R++zeWOb4pCa1PuUXIBD10oE2dgfnI5TE5NGM1zSuG2NRDs3q/0K
 60y6avg6LxNViwjqcvvuB12vNAPwhrh7ls88BZgWauAx9Q1DRXF+d80b9kwdCtf0PD
 qqsRJ44+NP1JARgTvSKDANRshxxKMlmEece7KnIpm7gkiGh7nSIR6r7wua2YW1cVvH
 vS5MLIbVsBqEWbbCR4HtGJRu5k3g3ejw0lVv2nJGvnnFaTeMtfJdsI+EYJDsAOO3K6
 FprYguRvksvgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kZFxhynq
Subject: Re: [Buildroot] [PATCH] package/soapy-sdr: new package
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

On 29/04/2025 09:46, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Soapy SDR - vendor and platform neutral SDR support library.
> 
> Signed-off-by: Gwenhael Goavec-Merou 
> <gwenhael.goavec-merou@trabucayre.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
