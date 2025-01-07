Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFC6E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 19:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C63560823;
	Tue,  7 Jan 2025 19:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tl2f7RNhli5k; Tue,  7 Jan 2025 19:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 743716081A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 743716081A;
	Tue,  7 Jan 2025 19:05:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92B8A6B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 19:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99FCD6081A
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 19:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ski2WSGsE4lj for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 19:05:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A5BC6081F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A5BC6081F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A5BC6081F
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 19:05:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 47ECE13F880;
 Tue,  7 Jan 2025 20:05:22 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53704])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Jan 2025 20:05:22 +0100
MIME-Version: 1.0
Date: Tue, 07 Jan 2025 20:05:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20250106034114.152481-1-nemaakhilesh@gmail.com>
References: <20250106034114.152481-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <30a1b93be837cf4bcc649cc32c52c4a4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736276724;
 bh=wiM2qYiKxL6fmX2U/TGKDoWskgxE4mA5Wm29myNyZxY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l/mWnn04xMmBpFoVsdq5X3S5dXYLRgXnqpfvGTfwa8YcUOohuHw5SYhYz3t6ri9rq
 mW8+3OF3KEZOHK15/tGROKOKUGdLzAnqCH/eygIpYYVDSAAI07xD8mJBxmkcR61SZf
 hmI8ucQ5wdl4Z92FvdKNCn3qK2pYK1hSowFWMJJ9vBFFTFrcYW6bqfodsWRSiCF0xH
 xtaagLS2SjYKAVbWc3BG2KDvsxckCxuK9K8UxV+rOgu0YtJ6O3iguYhZVYLuSaxaPn
 Sabz4dlIUioxq9x7+q9triqaAJufFQFLqN7HR5Z+xONqEk88i6xqip2YzMsBFzKZLd
 JSugX8ELKVXzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l/mWnn04
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.12.0
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

On 06/01/2025 04:41, Akhilesh Nema wrote:
> Changelog - 
> https://github.com/iproute2/iproute2/compare/v6.11.0...v6.12.0
> 
> Drop 0003-arpd-use-designated-initializers-for-msghdr-structur.patch.
> Upstream commit - 
> https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=9c9824bcaf092cb99988d59717674b73b5d0d19c
> 
> Drop 0004-bridge-mst-fix-a-musl-build-issue.patch
> Upstream commit - 
> https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=6a77abab92516e65f07f8657fc4e384c4541ce0e
> 
> Drop 0005-bridge-mst-fix-a-further-musl-build-issue.patch
> Upstream commit - 
> https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=043ef90e2fa94397eb5c85330889ca4146a6d58a
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Appled to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
