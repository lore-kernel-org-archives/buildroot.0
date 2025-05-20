Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389ECC3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C8D5610C5;
	Tue, 20 May 2025 17:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jAbBWijC5Qx; Tue, 20 May 2025 17:22:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30B6F61092
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30B6F61092;
	Tue, 20 May 2025 17:22:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E673CDE
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2B7581C0A
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKU4_iYbTAyx for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:22:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 281B481121
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 281B481121
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 281B481121
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:22:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 82CEF19F58A;
 Tue, 20 May 2025 19:22:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 20 May 2025 19:22:51 +0200
MIME-Version: 1.0
Date: Tue, 20 May 2025 19:22:51 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250518173932.2148232-1-bernd@kuhls.net>
References: <20250518173932.2148232-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <95ada85d5b74e41c4763acf9843baaac@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747761772;
 bh=He+cNck6NEjM/ASD/vl/7OI7PLim9rouD0Ygw6HCm8Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TEScSmCwJaJDDH1grbvMn8X3HpJa09v2MsL0fm+p/Q/YClKLpDLk5Of6IS3KwkRHl
 DKA0YIXtWhvM9IOdp0+guJPRxPlIoQlfIQryTKtfuq/Jmk5LL2JKcxVD3qVBUFtldS
 CsjF1HRXx1sW3RI+LQgccjVY7wMj8PuD+fc8KARdv5FcaTYpWJEL3qCm6I8pvQ5RPE
 3jRw4cOKp0qwJ/q9iRk8JhT14+2N1FdjIVFInXPYcCkTKnjWMGkIELfd0Sf4hmAM76
 /WHYe/89TW7FAo8jKC+HPejRc+gtsRVQIiQ0pazmr3V5W5x04zkTmfanxOOBK6qBd4
 7nhVqH7hNR3yw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TEScSmCw
Subject: Re: [Buildroot] [PATCH 1/1] package/privoxy: bump version to 4.0.0
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

On 18/05/2025 19:39, Bernd Kuhls wrote:
> Changelog:
> https://www.privoxy.org/gitweb/?p=privoxy.git;a=blob;f=ChangeLog;h=a7bffc52b8996c327a23ee562627841550ed90e9;hb=6adadda85067fb7d4cc8663fbfbcacb4b0206615
> 
> Removed patches which are included in this release.
> 
> Added support for pcre2 which was added upstream in the release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
