Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64179C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 15:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3709681CAD;
	Sat, 25 Jan 2025 15:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83QSq7Ntzlrd; Sat, 25 Jan 2025 15:12:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5639B81D35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5639B81D35;
	Sat, 25 Jan 2025 15:12:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 028791183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E32E981D46
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lvq1rwf9N_Qe for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 15:12:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B34581BCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B34581BCB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B34581BCB
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:12:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6BDB6B0054E;
 Sat, 25 Jan 2025 16:12:14 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35960])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 16:12:14 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 16:12:14 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Graeme Smecher <gsmecher@threespeedlogic.com>
In-Reply-To: <20250124200150.3839590-1-james.hilliard1@gmail.com>
References: <20250124200150.3839590-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <22b0294254837ecd327d2895cc9f9bba@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737817936;
 bh=Gv9aI+U5Aimr9Xm6kGznZH4f/sijVmrjGerXGjIpvGg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iw4dWGQTXzhIqHIqHKNpeI+zNSbl7sLJV2bp96/sia2YwgKy7q23qzgWI2/dWdM3n
 IqewbEGpctSKooF8JXNyMJ1pTMw5H8Q3i1xgvkbV5h3/eDFyTzm4DNSzIL4NEUIQWj
 elu7CFvynzNcsmMAuvRJ2B3lwXjqi3Lctq4991/iwbcQIpqYt2HYKN15I2FYa+I62s
 YH2k/Eq7GRQXj+OOFBPADEhUZO2WP7InvXOvQEHT7qBNjSQ3TxLcudI7RgQbikT7Xs
 0GQydlNlfhxwD9Jn1mJCHdhWIDfbLDs3EdWfhy8PJyUlgptTGIfI/cKwCbgV4ZvryZ
 vZRr6y8rHVHWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iw4dWGQT
Subject: Re: [Buildroot] [PATCH 1/1] package/python-orjson: bump to version
 3.10.15
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

On 24/01/2025 21:01, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
