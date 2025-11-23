Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE22CFC518
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 13:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92CAE40719;
	Sun, 23 Nov 2025 13:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPWCK0gjIDz8; Sun, 23 Nov 2025 13:54:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 895014067A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 895014067A;
	Sun, 23 Nov 2025 13:54:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC461158
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 13:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DDF640147
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 13:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGQuiOXaFMEr for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 13:54:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 883CE40081
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 883CE40081
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 883CE40081
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 13:54:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 45B7E19F5AF;
 Sun, 23 Nov 2025 14:54:01 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Nov 2025 14:54:01 +0100
MIME-Version: 1.0
Date: Sun, 23 Nov 2025 14:54:01 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>
In-Reply-To: <20251122172004.2260635-1-bernd@kuhls.net>
References: <20251122172004.2260635-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <9d6ae22b66ee619b7ba4d1075bdcebe6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763906043;
 bh=g7VevPaE1UiMpk4QxwxCWGPFN8npIVGIS0hEao9f1r8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tXUXla2HMsc/B4/qS8vQ80FrKn44h17fPGRDgQWrAg29OKQTkdoxMXGNpJSvHpZaj
 g9gy5TIhShP8ivu38q/GW2b9FZK+T0gsou12ZIpKzTyDfWfB8aSRVKMsTSu1fNvn6d
 Tn9r7zPs9WcqSFaqCy2gcvxm77I7ITIlQtDY49/1YZghRLFBAWtUPE3tn+lHsY5G/H
 5/jwZDXCCVVtQR4kXAtum0lrWXGG58QZGP9Pw4pm25S6PNzRiS8s0k+0h3Fou530f8
 ztW7h7gun5jch+5N9mUuxD2cndUb6ZrMcWO6KtX6LzeEYQ0Xa8Euzg6QIUAZbZknyg
 G86/ADDEjsNTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tXUXla2H
Subject: Re: [Buildroot] [PATCH/next] package/php-pecl-dbus: bump version to
 0.4.1
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

Hi Bernd,

On 22/11/2025 18:20, Bernd Kuhls wrote:
> Removed patches which are included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Even if this patch was marked for next, I applied it on master.
I did this because php-pecl-dbus was currently failing to build
on master, and this bump is mostly buggixes and it is fixing
the issue with php 8.4.

I added few info in the commit log about the failure. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/752d46c7264e926dd7c9f4c46b4172cff62b7fa3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
