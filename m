Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CCECD4F3E
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 17:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEC3E80DD9;
	Sun, 16 Nov 2025 17:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2JT6KqSfm89; Sun, 16 Nov 2025 17:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BA2580D13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BA2580D13;
	Sun, 16 Nov 2025 17:54:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C579D5
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 17:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8312F401EC
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 17:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HA5anHUavYWI for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 17:54:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4EB99401AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EB99401AD
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EB99401AD
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 17:54:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B829A19F58A;
 Sun, 16 Nov 2025 18:54:37 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Nov 2025 18:54:37 +0100
MIME-Version: 1.0
Date: Sun, 16 Nov 2025 18:54:37 +0100
To: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251115231507.4299-1-mr.zoltan.gyarmati@gmail.com>
References: <20251115231507.4299-1-mr.zoltan.gyarmati@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2872756d19f799e17cfeeed4c8c6dce4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763315678;
 bh=qTfdswXsmq/j8Cj4GiNYCl8zo6q+ZdF/fCOvajpqz+k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dZahE5U+CsLKQ8Dt+/YoymTpON7VfIioJnX+AwjGq46dO3OHhkmY+swNeObgW9WfD
 RY4mcLp901h2qbGX9GNRXjYzcptrTdaaTHTvqlg2qTC1Nxgo/OLmR9KBks0GhVBAGv
 W+0cGaXXCqjHj7df1Sn2vIYXQIxqwzqnf2xPrScrVXIyWJtPmrFu8qpRGx7QpwJZly
 td5PYMa8hQ9FV60qZPXYRGYCQ7KgBKfZuXTlnqhcrgWdVeMs/icv0MP0Lr5NRwD4QM
 JdbbFj+SJhlJ6Vq/pwRJz906snnKTM7A4pe0yQl7OLLX0B3L6LpmkqpIvvse/ng/JH
 QxPDeTAy0522w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dZahE5U+
Subject: Re: [Buildroot] [PATCH] Update my e-mail address in DEVELOPERS
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

On 16/11/2025 00:15, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
