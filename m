Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF58C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 13:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF71D61044;
	Sun, 20 Jul 2025 13:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLUIF0vLXFw6; Sun, 20 Jul 2025 13:39:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3666361056
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3666361056;
	Sun, 20 Jul 2025 13:39:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 498DF117
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 13:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B73B61056
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 13:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2moFjHXo8CA1 for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 13:39:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7195961044
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7195961044
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7195961044
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 13:39:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 3F9B12003AE;
 Sun, 20 Jul 2025 15:39:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 15:39:16 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 15:39:16 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Stephan Hoffmann <sho@relinux.de>
In-Reply-To: <20250516123337.799148-2-buildroot@heine.tech>
References: <20250516123337.799148-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.11
Message-ID: <5972cc4d55d874cb0136b26dcf23faa3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753018758;
 bh=IdtsZfXMmzteQee7gNV98Et1WPZf0GeQ6QY5JkS7kJI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jdJvTHRiBXxhskyx8FmA5KjiCat0bHZ9LkonmlQWfzD3YoXL6mm8nmx9aL8rychJ8
 9WyG4bXW6fNpLFsljqSMxmrsQJsD2BgwG3m70xSJ26WEEHm6aLPyWR/maDu3XtK7aS
 3sYAQBFt+GG2gV5YShyhJhmjbfCNCgPRjHclYidPUIhSFnMJXCsGRG5nQZB8f+f07M
 sHnm8C/9GCFD+U7Oz7TeuB+n6/KY+78QTqhosxHd4J7EU3X12v3jLLH5MJ80UCPl7U
 n2/E9Ty3qx4ymnRaBt4CELgR5zneKJSaeNegF729HxiO27fFyUmXScqhR6CagmhQch
 zljTC2XQ9cNjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jdJvTHRi
Subject: Re: [Buildroot] [PATCH] package/gtest: bump to version 1.17.0
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

On 16/05/2025 14:33, Michael Nosthoff via buildroot wrote:
> - bump gcc minimum to 7 as C++17 support is mandatory
> 
> Release Notes: https://github.com/google/googletest/releases
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
