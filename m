Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBC9CA0EDC
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 21:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 284A041D82;
	Tue, 12 Aug 2025 21:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuAmntLdHril; Tue, 12 Aug 2025 21:57:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53286409F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53286409F3;
	Tue, 12 Aug 2025 21:57:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 543CF938
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A3FC6070F
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MomAdbDKVGyT for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 21:57:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72BCB60701
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72BCB60701
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72BCB60701
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:57:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 183C52003AE;
 Tue, 12 Aug 2025 23:57:12 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 Aug 2025 23:57:12 +0200
MIME-Version: 1.0
Date: Tue, 12 Aug 2025 23:57:12 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250812063248.1197760-1-nemaakhilesh@gmail.com>
References: <20250812063248.1197760-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <1e387715a642ab660eb10b256ad87cc7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755035833;
 bh=xjIoyOnaDsHw+/3rphXlk6FzL8RVCg/7ZaJI50zLBlM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Sqqath/3IJ1KqpOxnYrFsPsvakpbjQq0ZOMGv3YwXfLfPrAIWOoQPWQJOUnEi64Y1
 RXkh5qGddOWJlCW+rSURgoZazO9ICuGzLt96Pqe5Use+pt5JjSr0xEiXy8XZG5BTFN
 mMnXuDjKhFtKJ6sJv65X5FdBUTDj9dpaxvy9qhQw/sgKssztRqIBn28TEGUqZp7QVT
 XFRqR+vkVq0f2F1WH6VO3uinhyR3OPs20dF2dB37vnNvnFNoxP0PQFxduW59CIigL0
 31nW0kkm3JUr61R8sw/Y65JdzFdLYFwZe5t6uTzrCst2EaI2H73nxzgMkYZfbUkXh4
 OcsUkX7eIzlCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Sqqath/3
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.16
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

On 12/08/2025 08:32, Akhilesh Nema wrote:
> Release notes:
> https://github.com/strace/strace/releases/tag/v6.16
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
