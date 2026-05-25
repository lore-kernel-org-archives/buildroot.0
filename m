Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1DACD5BC9
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 17:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A63E240AA6;
	Mon, 25 May 2026 17:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOzuat3-pkpp; Mon, 25 May 2026 17:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A872540A36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779729593;
	bh=2W53WrFxgtaA+1MCjZCrohKJpCvvj2wiVO3DxrhfGrU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H9gq+5PYC+iKkXackxkZQ9/wuQdPKLjq9ynKJICT0upz3JcR5ly/XljminY+zvLMU
	 H5WCw7/pY4MUGmSDvzSkFXHNiZdLyRn5YA671MhiZ7aLeH43THEU58tEpLB01o4u/g
	 z7JGuRnGe19L8EUE2ZgX0HTQpeRvM4u5BA9e80xi79ifzaMSy3iI+GA1gTx7W4eSXD
	 F+ICMr15IEB8EBOyDDDNqpQEKcK7djJzPzet034cNB6I2YgrpHXtDhkn76tBOKXrhL
	 yveKsjK7uiF1xOaQ/65e3TFgcVvF/eZt3KJDxU3l1Xk8xbHjaio9wGmUc4h/7u6Qez
	 F802JzLiNO3CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A872540A36;
	Mon, 25 May 2026 17:19:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2A39297
 for <buildroot@buildroot.org>; Mon, 25 May 2026 17:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A955681412
 for <buildroot@buildroot.org>; Mon, 25 May 2026 17:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYtxnshfk16C for <buildroot@buildroot.org>;
 Mon, 25 May 2026 17:19:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E66B9813F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E66B9813F8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E66B9813F8
 for <buildroot@buildroot.org>; Mon, 25 May 2026 17:19:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 122907803A2;
 Mon, 25 May 2026 19:19:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 25 May 2026 19:19:46 +0200
MIME-Version: 1.0
Date: Mon, 25 May 2026 19:19:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20260525162053.1455403-1-bernd@kuhls.net>
References: <20260525162053.1455403-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <2d9534adce491669a832b3c5c07b4008@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779729589;
 bh=tXmRVVdUmGqNXi2W+veJcfLUa91+LSpoTrg4Jw7P2qc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EievgBLfJNWEiSggKqSUQCHGZQiOH3Bf/W+dO+zH/F3LZVUXWD1mYbaO9Y5T41Rzb
 wc0sw1mXUCUT+iO8ooJJUijRJed/UFBrOwP6RAo5qnGRoSv1ePXB7zQ0OFs7d69L7y
 2m+VpOg1HBGKKIK6uVtYLil3NtQ95zt5Pcc9Yimj290hW9I7GwcoCV0qNtVmACG6B+
 a1Jkw96Kh3B8AeYMLMb0az4BughFatxi27fezY31f1NsZE/V6dJZUcbaYIfP8ALMzp
 6TE9U4jczI3y+AXpAOTmJjVA1cwtSD/GjZMJFgYqpcO71vFAfM8JtNnpFfY565Zs7/
 RuK5pTbohiWKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EievgBLf
Subject: Re: [Buildroot] [PATCH/next 1/1] package/snmppp: bump version to
 3.6.5
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

On 25/05/2026 18:20, Bernd Kuhls wrote:
> https://www.agentpp.com/download/changes_snmp++v3.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
