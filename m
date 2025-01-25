Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66279C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 19:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F291340E4E;
	Sat, 25 Jan 2025 19:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74t4jk4q9OpR; Sat, 25 Jan 2025 19:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0B9D411C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0B9D411C3;
	Sat, 25 Jan 2025 19:42:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EEFD294A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 19:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8C61411C3
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 19:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_1kfMGJj39D for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 19:42:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4BED540E4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BED540E4E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BED540E4E
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 19:42:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B9248B0053D;
 Sat, 25 Jan 2025 20:42:17 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46738])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 20:42:17 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 20:42:17 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250120052150.3608-1-nemaakhilesh@gmail.com>
References: <20250120052150.3608-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <d17c36311c078df014dc4b406811f497@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737834140;
 bh=WcE44nbdxb960qZbA0ntC6Pe7XHeo4Q4aSLcnJ0UK/4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=recxQKpTmlDMPvvR5to/JfPG0tK/5XiP3iBczxj6KrvDeKIMSrS9SM0eERkztnN7/
 QYEfURAd2RMOyuKQZ2lJqUMKeypvIXgEhKyfjDQTioideXiGa9PAm0hBbf9wX6FFtk
 e1tDv9UapJgIH+/oSt4QA+op+hMHdEQxgxoKeHwOu8PITE+tyio+qQKh9f8RILgylI
 SvE2iEb9BkdxYDqzjw9RX526jEANQu9aiHPL2gDSmmMVJ9t6hshpfMm3yhk3RALj+v
 Ucz4Ym/t7aqkphhdvzO1vmz0CoVGh5eRWV+Ne0KeQOarUPWoWJ3EKwQuNOdO1pGW9Z
 k6AdUkb/X7Hxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=recxQKpT
Subject: Re: [Buildroot] [PATCH 1/1] package/libuv: bump to version 1.50.0
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

On 20/01/2025 06:21, Akhilesh Nema wrote:
> Release notes:
> https://github.com/libuv/libuv/releases/tag/v1.50.0
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
