Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B9DC83F1A
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 13:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F41B60AD1;
	Mon, 14 Jul 2025 13:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2iFvbcGqmol; Mon, 14 Jul 2025 13:28:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBCA260A54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBCA260A54;
	Mon, 14 Jul 2025 13:28:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7A385E
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE3C9608FA
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxd6HW5t7Rof for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 13:28:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B848F608E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B848F608E7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B848F608E7
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:28:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5A55E19F58A;
 Mon, 14 Jul 2025 15:28:53 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 14 Jul 2025 15:28:53 +0200
MIME-Version: 1.0
Date: Mon, 14 Jul 2025 15:28:53 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250714113755.214202-1-fancp2007@gmail.com>
References: <20250713040046.105851-1-fancp2007@gmail.com>
 <20250714113755.214202-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <76cd1e9f77927a6f11bdd7b39a7e9736@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752499734;
 bh=v/o6ZQtisLFS2iKZ7fihW3hIufr9NFpYUBodMXJi/y8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uLD1/5ESW1dgJXGr6qpcEf/wFKYgkINhIKAHw/3gSn56Q0X3P8LjSyZMMmT/D/jJ4
 wmuDCZ0pOTFBL+WG2jRj9ZNSQ31GjrIgWhSWK2zvYbod8+ez+hhXKOcWSlluAWqltE
 Q0dLApJU1fFdGpSEQKdVtiJXKf9y5DfnTnQEVmctgCK6KkWOcAZHbrO7vy7TPMefwP
 TxcZeeuUpL0XenjGQyNEA9dUexGDA/VBJ1hjFYiOY+HIB5L+rLD3rfrXOX8u68npqy
 1JSbkWrHT6Rfe2iStTxOVkunnuutMdbd8v+myWYd0jU2/Os02rh0dpR+FCEGGMlmRG
 Xd/FNr/UwJz2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uLD1/5ES
Subject: Re: [Buildroot] [PATCH v2] package/chrony: bump to version 4.7
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

On 14/07/2025 13:37, Scott Fan wrote:
> Release notes: https://chrony-project.org/news.html
> 
> Since this release, building without POSIX threads is no longer 
> supported.
> So add a depends on BR2_TOOLCHAIN_HAS_THREADS.
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
