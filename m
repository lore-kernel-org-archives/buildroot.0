Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4142FCAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 12:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 168BE401DC;
	Fri,  3 Oct 2025 12:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdU-7rn-QiJ4; Fri,  3 Oct 2025 12:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53426401D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53426401D8;
	Fri,  3 Oct 2025 12:01:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F55F226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 480A5409DD
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cxocs9Kumabg for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 12:01:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F047409E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F047409E9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F047409E9
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:01:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 487C0780515;
 Fri,  3 Oct 2025 14:01:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Oct 2025 14:01:03 +0200
MIME-Version: 1.0
Date: Fri, 03 Oct 2025 14:01:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251002185616.2326998-1-bernd@kuhls.net>
References: <20251002185616.2326998-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <5d0dfad32fb7c4eea060e6ca9c8b03f2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759492864;
 bh=t2+n0gs86DpHAe1aFI7KR+NwsM1nGRRcQ2enF0qHTds=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aDFZEnoAiWDZ7JHdJOm4c+hgKPtWGB9hyiWZ8IOVceoeHQ51mPiXqvowA7pYsjBIK
 B9ovRycBPvS70P8lrllMCoEm5UYXYgP8zL3r3tG8XZ3AbKn6q1V+Cf+gtpWTqRmT8i
 FQYvc3GNfp9WL3vlaJ4RIoGPfb4XeUcPMkiSQCYxKukSCxWFh1LgXLM4cTCNOf/r19
 tF91W1736KokU+05dXfDJDLfCw2yumNCQ3ckgIDj1FzESINELnPBiJ93RqLeOt1lHs
 EUbXwuPJ2yHlx5oRBFS3X47uKaILT6O0Efwh+8WDnYYWEzrSGcoIcWjzrdVM5Gn5UA
 iRqIEeETKCYqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aDFZEnoA
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12, 16}.x series
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

On 02/10/2025 20:56, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
