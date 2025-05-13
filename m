Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA8AC3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 20:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FA9B41212;
	Tue, 13 May 2025 20:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOVkZovmbRYF; Tue, 13 May 2025 20:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6DE041218
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6DE041218;
	Tue, 13 May 2025 20:39:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF45712A
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4DE0406E3
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yzp0OgobfbTL for <buildroot@buildroot.org>;
 Tue, 13 May 2025 20:39:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3006641212
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3006641212
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3006641212
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:39:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 5B1E4B0053D;
 Tue, 13 May 2025 22:39:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 13 May 2025 22:39:18 +0200
MIME-Version: 1.0
Date: Tue, 13 May 2025 22:39:18 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250513200538.2731927-1-bernd@kuhls.net>
References: <20250513200538.2731927-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <f110d2deb21e44ebf167816f795baf57@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747168759;
 bh=YqQCwJtg3TtgkLFHF8t1EJmUOk0n60/8KWqDIVWXJP0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pEndoOP3S92Peuoe6Dytw2Y/ZkBY0fXvC3rgp+FYFU2e7vRajZ+P/DtNpBwIcTzsO
 qFTncO+H+6K+Ynt+ByhH9HtZwvA0qbV6DoxYwVqm1/Df+rwAa5eCTUPsUkqUxP/FId
 0n7QfQ5RvVr6/QiRqhbphemrhJEmzxStLk5RR7/lbqHLzvvyg8c4GqxmYdH9oHVwW2
 hSXUniFe0poTA20rJ5tx1Rvbe50zVNtW1/3E1PHlYMTfV2JoZqsz1bgyErPpE/JYcd
 AtxOe5ZR1yQwaPOSNO7Rw1KHH1yZlIfVXwDzBYmC5dvvPx7xB/7Qh5qsPVuu5ekkc+
 WdwRM5bsQHA3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pEndoOP3
Subject: Re: [Buildroot] [PATCH v2] package/dhcp: fix build with gcc-15.x
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

On 13/05/2025 22:05, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
