Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BF1C27C5F
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 13:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A2FE41A72;
	Fri,  7 Jun 2024 13:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_zDDsknXMLo; Fri,  7 Jun 2024 13:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD685426AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD685426AB;
	Fri,  7 Jun 2024 13:57:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A54B1BF215
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 13:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 550106152F
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 13:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62jJUP9e-Jem for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 13:57:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A62261515
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A62261515
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A62261515
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 13:57:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BB89B13F89A
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 15:57:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 15:57:40 +0200
Date: Fri, 7 Jun 2024 15:57:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZmMR1E9bq_gbqxDi@landeda>
References: <20240607134408.2969500-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607134408.2969500-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717768661;
 bh=QzNVp63zUN277B/e/t3UVW0N8S0qeQjfkdPyjGhLFD8=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=bwdOGqf7wfLhO4Ws7Dm0RTmbHoDLuEWSPOVT1N/BLVlSvVMGpSpc4PiIhSCQYMM/9
 KW4izM0wElyzlVyF7IvKhJCp5JBRkLrI5vHxxRpE/zEITj71OGkIkN749vrGBsJhgs
 4HYWzajqIA+baKmHUke7nGD6NOUfvwL2pbztg6TRIEKRszdWLTdu3e9lNjhp1/suvq
 AVr/fkDJrx7IcfTEo+CBHDUogNlgMrVBNMDlyqPK4yD9ZimX8CSuZnqkfDCJvzj0IA
 65CE2DntaCO1PkH3/NR25HG1DjNAg3hdtqUaEZn5zXJ62aNsnhzgq57/fEvIgOUCWz
 HBrTZC/gpB2zQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bwdOGqf7
Subject: Re: [Buildroot] [PATCH 1/2] utils/checkpackagelib: really check
 variable name
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-06-07 15:44 +0200, Yann E. MORIN spake thusly:
[--SNIP--]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  utils/checkpackagelib/lib_mk.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Ups, patch 2/2 did not get through because of a mishap in one of the
recipients' email. v2 went through, now. Sorry for the noise.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
