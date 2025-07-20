Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517A3C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 15:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E75C4134A;
	Sun, 20 Jul 2025 15:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25Y4G8QKB1dd; Sun, 20 Jul 2025 15:34:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39C1740FE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39C1740FE5;
	Sun, 20 Jul 2025 15:34:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CDA2DA
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 15:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3912683F56
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 15:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6j1nKROQssKx for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 15:34:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 52FCF83EDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52FCF83EDA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52FCF83EDA
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 15:34:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0D68FB00593;
 Sun, 20 Jul 2025 17:34:01 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 17:34:01 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 17:34:01 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org, Andrea Cervesato <andrea.cervesato@mailbox.org>
In-Reply-To: <20250720143047.1447676-1-petr.vorel@gmail.com>
References: <20250720143047.1447676-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <9d2a5d70a143daf4926dfa2ed7b55ce8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753025645;
 bh=MBAPHmxBuvQgxA8QotHc0lF5ZubGpmgsEgyU0qWsiKo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qmdITRBKa4JhEsjYb/OC2iatawwpYrDERL8Nqq5McMVLVf587nX9ewNGRwy+alJEc
 s6nEFazt7opnWTR79oAtj9GC1WIOnNeFGBgpV2mV7ZXrKAccpsGLzbD0G7tTRsb256
 Hmm6ZSMzy4WrX+yZh5bP9f8XRQ+rKc3TCnS9gZeBhQtiMBvCedpeA55S/2YDbOLjtn
 gLpwJQwoe8P6FDhZLiWyYt5Jxe4ctLA263KJF+NQD4szH6dVpZ3qGyyZnfKeVu3WI2
 uRdyaPKUkZqfSm1oqYk3X+4OVjd9+RB8F61SdBUZd25I6eGmzrvoYAshPA1h0XAvfb
 7OfZDrD86/fTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qmdITRBK
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: backport musl
 build fixes
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

On 20/07/2025 16:30, Petr Vorel wrote:
> Backport 2 commits from upstream which fixes LTP on musl on kernel >= 
> 6.14.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.

For info, I added extra info in the commit log and
moved _AUTORECONF up to make sure it can be seen at the next bump.
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/0ccd9300cdca0358cd7b10c3f87a3cbac1b328d6

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
