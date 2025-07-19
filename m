Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6502BC83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 10:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35E9C845E3;
	Sat, 19 Jul 2025 10:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVvqPfoCFBuO; Sat, 19 Jul 2025 10:51:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FB6F8130B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FB6F8130B;
	Sat, 19 Jul 2025 10:51:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B43FEDA
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A607061445
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vEbelwD_f4Aq for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 10:51:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1FDC9613DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FDC9613DC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FDC9613DC
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:51:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B7B0E13F8D6;
 Sat, 19 Jul 2025 12:51:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 12:51:44 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 12:51:44 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Michael Walle
 <michael@walle.cc>, Bryan Brattlof <bb@ti.com>
In-Reply-To: <20250715081938.108853-1-heiko.thiery@gmail.com>
References: <20250715081938.108853-1-heiko.thiery@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7254486958fd9d105b94e7119b04c4d5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752922309;
 bh=ty5VhCpHqmwnx5CY363EWWoGbmT9LxWYi1I6f0jYf1I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BkU6WrIps8vcL/nocpJYRcGmT4HDvNUxegpeqlBPBucF0cMrqd80C77MB65fafGei
 sPEQ+Ob93RXr5ZjeDA7JoFbZuocqIKpG6/nHvMaQ7hVvldsYX5UwcFAMdBxvfxhyt0
 i0sU6eGVLfSO0qHJFLm0xxpHeQwuO4Cfu3EwMgcBk9/0y9bTOurb7bkkwJsDRmY0vj
 itdQ9xGPDknmbR/4Jeofy3NWlSQs/LOCYEch7FTWd05+vsplKYYmGLw/Rnz+fFrmeY
 jmUo9K5DFix6asNAOERx++AFH/Z0TC/T3LlOZ5HDNTsDgWL1dwWzflc2zSoNdvDiO8
 QzFgw+JkPcubg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BkU6WrIp
Subject: Re: [Buildroot] [PATCH v2] package/linux-firmware: add option for
 Chips&Media Wave 521C
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

On 15/07/2025 10:19, Heiko Thiery wrote:
> Add an option to install the firmware files for Chips&Media Wave 521C
> video processor used in the TI K3 architecture.
> 
> This "cnm/wave521c_k3_codec_fw.bin" file has been present in 
> linux-firmware
> since version 20221109.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
