Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B5AC36008
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 18:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56DDB817FF;
	Tue, 25 Mar 2025 18:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cjUCYkn_8tMe; Tue, 25 Mar 2025 18:51:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A9E1817E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A9E1817E4;
	Tue, 25 Mar 2025 18:51:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 094AFC0
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 066D94116B
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Sp_adfud-Pr for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 18:51:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE53941275
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE53941275
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE53941275
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:51:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8E4795FFAA;
 Tue, 25 Mar 2025 19:51:02 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:38676])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Mar 2025 19:51:02 +0100
MIME-Version: 1.0
Date: Tue, 25 Mar 2025 19:51:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Buildroot Development <buildroot@buildroot.org>
In-Reply-To: <20250325113813.307451-2-bagasdotme@gmail.com>
References: <20250325113813.307451-2-bagasdotme@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <71710e65a9a79b065602ef86f185b6c2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742928663;
 bh=mZyvtHOlmZdo+IiwB1+ZmBH5KHhZGpzY/p3LRJ5j7aU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hsfcFFwqWvfqVzmjTeUFZ5HiEfDiR9XixeRvdCP3mir6jTNxyqB7aUrl30mIQ+24d
 AP6c0SthmNEU2BcgOKqAnNJcSqUS3ndDcCJeU9FXDJLmycPdlG7zA4t56iBXzj8RJt
 hQq4NScxLJBsQUFd91YQ5Xf4KQPxL8WxyatSAgAr/fMQ6FT4JtlN7rM8S8UZTYL7lN
 +Xkw1J1+A2cgRFFKRguZQ+hKWTCFLNc8SbtLH1W5x5tXNE3scbtHOpCrTZN/RNn8yh
 wSZvDc5wZwbEIv7w9Jz7fwDeaSVR+hD7xg68X6mGHAOxRK/gNqzFUcChbrJW2Aftd1
 x5m5HzSJrUr7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hsfcFFwq
Subject: Re: [Buildroot] [PATCH] package/git: bump to version 2.49.0
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

On 25/03/2025 12:38, Bagas Sanjaya wrote:
> Bump the package version to v2.49.0.
> 
> Release notes:
> https://lore.kernel.org/git/xmqqfrjfilc8.fsf@gitster.g/
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
