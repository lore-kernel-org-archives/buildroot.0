Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487A8CCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 21:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E95E40324;
	Sat, 11 Oct 2025 21:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbLZMwILoCxj; Sat, 11 Oct 2025 21:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 374EA40325
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 374EA40325;
	Sat, 11 Oct 2025 21:31:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFFABBC
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9613540323
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6C9lQo1e9fg for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 21:31:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A869F40318
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A869F40318
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A869F40318
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:31:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9408978035E;
 Sat, 11 Oct 2025 23:31:30 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Oct 2025 23:31:30 +0200
MIME-Version: 1.0
Date: Sat, 11 Oct 2025 23:31:30 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20251011141333.2044458-1-dario.binacchi@amarulasolutions.com>
References: <20251011141333.2044458-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e5eade5a0617acbe83f856745758ef1d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760218292;
 bh=j2e2jUuDvsQmJ+mLSZurUbJfmbuhw9ZN9aawZEjZE4s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mksseRz8pSh1a5QnzSpEFztRvolZ33H0TExkNES1DSO1VG2gXuaeL8fku4uSfsGPH
 AmXs9XfI2nHg8w506w3t49ghQkg4xfw1mFmc5WeMyv3ONaBvoVUHX92Jw/FINbJ43T
 ATW2MPaqbfGREkK23oT3w8ZK5nshbZRjDpW2LbVJ7jbmLnhieDUlfqeu5QnL16Tll1
 FBY2ySYyngdqn3JxSUFFjrlWlf+Ll5DBdb23F5iTHAAfLHKNE7U3yDEGnfnxjnVHkP
 6EYGnUjeGVW/OwGKvo9k3hfABWDwPJyzqqPqMyknX++EG3ZXXZy6sxgHwNSPWegpAB
 g6N7ZKqjAMOxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mksseRz8
Subject: Re: [Buildroot] [PATCH 1/1] package/gnuchess: bump to version 6.3.0
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

On 11/10/2025 16:13, Dario Binacchi wrote:
> Release notes:
> https://cgit.git.savannah.gnu.org/cgit/chess.git/tree/ChangeLog#n1
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
