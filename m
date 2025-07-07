Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C148C71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 21:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08A6283E83;
	Mon,  7 Jul 2025 21:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIU9P44LusTE; Mon,  7 Jul 2025 21:08:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4364983DA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4364983DA5;
	Mon,  7 Jul 2025 21:08:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AC2E1BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B1B740571
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6R3iuDJiSUpH for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 21:08:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C65A403B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C65A403B4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C65A403B4
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:08:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 899D913F899;
 Mon,  7 Jul 2025 23:08:27 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Jul 2025 23:08:27 +0200
MIME-Version: 1.0
Date: Mon, 07 Jul 2025 23:08:27 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Joachim Wiberg <troglobit@gmail.com>
In-Reply-To: <20250707141530.3774427-1-peter@korsgaard.com>
References: <20250707141530.3774427-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <45eabd4765a8009ba3de4e7710359181@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751922509;
 bh=5iZtoDuBI1SXZ/8ZF+Lw0/zY6s3473rSANH1L8ZOK2k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VnDRoG9caCsfy5GIJtsaDLMv/A6cNn+T1J6r2KR0xXFb8eU2FtGgC9/ym49IkpIOS
 CYT6Gaul6AIZjF8hdX8i2TZrCIzAP5uJK8VdtD4sNMSIHzxlkLcYbu3fO9+FhDH4DE
 FPZ8LwxvD1ME1btWUC5YilAp8tVJXgF+hbpBQAKrQe/P5EYem4qYlY7/z09alSRIUp
 JichfqItEf+WjUOL1R40cdvZEegUO/EiEgAZS0fo60ekTPiSuxpIJJqLEBdycIR6oT
 zTY5aR2yjvA1INooPsaMYt0SZBxhg/7N/xe+QJpVztYCBOcfWuVShbjEisC9+uTR3Z
 ptOWBmgp/nNIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VnDRoG9c
Subject: Re: [Buildroot] [PATCH] package/libconfuse: use current upstream URL
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

On 07/07/2025 16:15, Peter Korsgaard wrote:
> https://github.com/martinh/libconfuse/ now redirects to
> /libconfuse/libconfuse/, so use that instead in .mk and help text.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
