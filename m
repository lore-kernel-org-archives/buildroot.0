Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BF7C0219D
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 21:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEE7240B37;
	Sun,  9 Feb 2025 21:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-N95ageJpTA; Sun,  9 Feb 2025 21:36:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3FD140978
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3FD140978;
	Sun,  9 Feb 2025 21:36:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34903C2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24D6981147
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9M-03ySMVZKA for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 21:35:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C995819ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C995819ED
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C995819ED
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:35:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0E6A22003B4;
 Sun,  9 Feb 2025 22:35:54 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Feb 2025 22:35:54 +0100
MIME-Version: 1.0
Date: Sun, 09 Feb 2025 22:35:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250209115018.799719-1-bernd@kuhls.net>
References: <20250209115018.799719-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <ad931774eabbfdbcd93726fbb4587a68@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739136956;
 bh=geh50kJcbolZJH7XZjNl+CqwTAf95C7kd+5u/xIQO+4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MLMu/oI16UZxJLN2bRLZqDFQt2p5HIfQm8S5cyobRiPqeY7+VHQXKAaj/Ptt+49Gp
 +j/cvxr7ZhTUOynmcn8L4xafUANfMpLxddAptSOqg9skJZTsPxApNYPh2PAD6B+d86
 zF/4Zb89GoC37foQ51BAjkicPKn5fVIlU5ej8NGgYzNLKd0e04Hi/gGAzYZzVMyZnA
 zDDVgUr9UQdeOR9j6KKCr9lo7ASXB6HqFT18Iv5nJ6sK+1gpFVec/+/nOzn6XWtNmZ
 r+ukTCGSEPfR9nxlnlppE7GMHM78fBbLM2sj1JTWegsKgo3lweh7oI3A+0pqAkDzY1
 nm6ajj+FqkwJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MLMu/oI1
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-iptvsimple: bump
 version to 21.10.2-Omega
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

On 09/02/2025 12:50, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
