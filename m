Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8396DC83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 21:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5998682F77;
	Sun, 20 Jul 2025 21:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyHnTEQDoGJs; Sun, 20 Jul 2025 21:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99A8883BC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99A8883BC5;
	Sun, 20 Jul 2025 21:35:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A2E1127
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BF5882F77
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0WXX5g5Cz_7 for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 21:35:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69AC783BB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69AC783BB4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69AC783BB4
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:35:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C698C5FFAA;
 Sun, 20 Jul 2025 23:35:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 23:35:36 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 23:35:36 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250720193021.3217820-1-james.hilliard1@gmail.com>
References: <20250720193021.3217820-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <52eb4a77c07853034e70dd2cea13a7eb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753047337;
 bh=kkaNM8eVv/zUB8EWD8vjwjYiI3A1pLmwZFb8o2suy5M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RFYXwVQUNwo+XMumoLeXHn6KmIj0BorzLoPn+tIn51c7IG2NGsj2Gep0Je0zEmUVe
 BZPnJ4UNiqgaWpkZbZaJJ07iRnHIGqTZambyGAfzxVxpqfIAuPPLAc685jJf+BBPCF
 V8mRCi/MnOW4Mh7y9NqP+u5YHn5tLTXJbQ1E6vZx8Z2TrUXLuK3LgrtHMSpa+4h49+
 KQY8HINTEYeYXO35Yyf83D+Zrv/xPN+2Aaa+6IIouptRtJUaC245HwwZUlBIlkdgxA
 DqU4n2mmyrmGwv3RJxKoTUR0g0kSPf584lIlaD30yszUH3sv8gwcrEQpUaG1OhJ2Jt
 mAjhcAP7gD+sA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RFYXwVQU
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiosignal: bump to
 version 1.4.0
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

On 20/07/2025 21:30, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
