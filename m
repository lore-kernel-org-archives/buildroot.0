Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A223AC7EE32
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 10:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6294360C1E;
	Sat, 28 Jun 2025 10:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfEN0x0EbYIh; Sat, 28 Jun 2025 10:27:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C25F60DFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C25F60DFE;
	Sat, 28 Jun 2025 10:27:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D70B91C9
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D454A401DD
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Su-Hcufa7z58 for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 10:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42016400E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42016400E9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42016400E9
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:27:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id EC24119F740;
 Sat, 28 Jun 2025 12:27:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Jun 2025 12:27:09 +0200
MIME-Version: 1.0
Date: Sat, 28 Jun 2025 12:27:09 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Gregory Dymarek <gregd72002@gmail.com>,
 thomas.perale@mind.be
In-Reply-To: <20250627143151.768912-1-titouan.christophe@mind.be>
References: <20250627143151.768912-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <8fd1422166fc494f9fd26e0aa571e53d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751106433;
 bh=iocWZh9uGEPYfXnovb/U/aBjhSNSf1g5Ni0/cEgECNA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D0TjhS2CHdEEnDYprw3Pb35b246AH+h7I8HTDexNC5kg1S5sDhZyjg9oTrAraxE2N
 6XYbnDJ2BxUd4IId6zhvcpUnFP0LEqhHRt6puNtR537ujUr0nyUpWoy26Yyacry9wo
 qYUudbW9GAFbwYfwyNFp7ZsSAXg3AP/Y1+GhbNpUlSddFPm9b57qH/VmWBY1+Cai1C
 652/rS7ScStsju+ebwwF9ETUFYBSGFgQxCJaql3VO3eGOGJvXYCTww9o4J0u75Vh/2
 oUpBlpkpdnIIW11NBlOhwjpt4U0snFEzxS3JpluwzBb0amv5zBNulLILPyvPwf5n78
 13/A/CgPhtFHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D0TjhS2C
Subject: Re: [Buildroot] [PATCH] package/libwebsock: remove package
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

On 27/06/2025 16:31, Titouan Christophe via buildroot wrote:
> The upstream Github repository payden/libwebsock is no longer 
> available,
> and its URL now redirects to some completely unrelated software.
> We don't know for sure what happened, but at least the package does not
> build anymore, because its source code has vanished.
> 
> Since no other buildroot package depends on libwebsock, and it hasn't
> received any update; let's simply remove it from here.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
