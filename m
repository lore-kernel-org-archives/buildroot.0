Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF682606A326
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mCe2W9GI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B83E980DFA;
	Sun,  1 Nov 2026 15:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8L1J9gtd2xJ; Sun,  1 Nov 2026 15:05:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 034EC80DFF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793545526;
	b=ocUKKo8dysFKJ7MzqS56iI1ygZtMwnaHFdaMsm86Qrf3XjO2INnWASlZU5JvWomjUhAE
	 wEnCq6OUEwT9iI+YlKBwrwNzPedlw43kLOna1q4bImZtat2ftJBBWlSceoGiiiTi89PhG
	 XCE/XZTsmQyexz7NSd68NjX5MVDiOnWoruSkYB5bGKLB7lsG2v1uWOPbWlmLnzteg877g
	 bRgeJszf7KO8XURF1pdyGbwo7BKNOP8JHNts6Za1aDQQjnaFIa0z4DzEqRnbA1S/wDbsc
	 +NjNaEKlLz0HusfgwusWDG7mAgK6F3B07vqrlobxMqE1PPLq8YZqVqwQqD95CT06DCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793545526;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=1ZfvBE+A9vJwcsYBffhk/MZC7fXWtCE3MpO6HF/OlJo=;
	b=aYOmmzs033dFa2X4KypCZ/l/v3wRq9eTV2gM0AfhKWqbr8S01kQrUfUFVcaZ/UbVAkjV
	 k0/6T9wuIuw604sBsIO1cwea43oQ+5gbjV3FsYkyIwc3EZIwKYvW7S4A4mInOLoQ0CS/E
	 zu1mTAGj99+/V0pMe4P2aA/ONYa9kQNH6jgakdglkxVtrxGZzpVggCNzfWfsbh/iH/d57
	 rgOqWQg1v+8cgw7+4XIECbeW/rJqFgMr37zyaydickY7faQ/Py20j9TDZkW0PycvHO2S7
	 bCUQwGdqNA0muJq4fwwTSxYeUgZOVZwVF29KC3r2debdCINxgXG1f5dq18xseVwMlPw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793545526;
	bh=1ZfvBE+A9vJwcsYBffhk/MZC7fXWtCE3MpO6HF/OlJo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mCe2W9GIPy8EqNLBYg5YNF/LqQR8rI+L92iDCxy3ZarGco2fDTTpVXdyg+PkDr1Rs
	 sPixuOvtpggj65T2B50rhCEoQ4w6Yn6MbBUx4wx13gBst96PqZ2QfN/dQK4eUblMTz
	 XWQOF5gH391NwcPG45GhY6z/3Ck9kQ8ma64cbcOAEwtCCIK1bQY5kk5Uvf9LpXPoai
	 snjwuD0g59l2fdo/CP0y7fTYQz0hvuMwfCKTQPPcuIUSXtZJGPPh6YlzU9jPc05jPy
	 KBO/rvPQMhBv5txEwkSDuIAu3vQRcqBskIlK03y2S55W6LW7EY+Js46fhRG4n1jToB
	 9BsxjsbbiZEVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 034EC80DFF;
	Sun,  1 Nov 2026 15:05:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7567B323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B50E400C8
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rl7D2i3BQnto for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 15:05:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5FDAC4004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793545523;
 b=mA8cISAUV8TzE3Diy6rVB8AOd0RZlPsB3Knzmjhdw8l6hp5/umHnM/W1G7oI/faLiN2V
 WsjQmGNMxsLNi8ckMSVPbFX7bnLc52JIw4GEPvtXpUAQFXIKkMh66pO8EEsofjtE0e9en
 3XCr8Nw9NhCLWXKgwMOSOQrhV8fuJCEgcZOiYvJCvubZixZwalqSXluadTgMAs3jdsInt
 2q0uwU/YgxUeLXrFbWrejKJaoSXMn9BS69dEbo8cVQ7C1reZ5oOQlesVWYzeyyx+og13H
 GdjAVuOeNtcJh0keRW54zKSk6SHkDeO7yFU7ZTiwpYCSw06xc0isAb+0DZq9V53NbUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793545523;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=/suD3zWhgT08Rnz8pgVKQ9ZRAORYQcnaW6wIup6PqtM=;
 b=kTkvjDk2pkdrU0nCGoDNVorUJ8kilOUPt6k2KD3u1fWaCVvimzMUjyduzNL6iBQChId9
 xBHIpVceQJka7ahWZCMsnCdDzZRIPQkTp87bXh8p9T/FwGUv/0IXd+r6VCkCjm/4RVuZ0
 69L63CxM6bbeuxDusRwwdjFrO7+I81BxrxgnSe3tUjPPZYTEK1hW492VGC4hzKKl7fznF
 +/GPNk028IRZLDwb0OHVIlv9KmhizLSKwUN+x8AEyaYmFDVMsjM5RM3a5L1zmAMWwhQzR
 pAc94D7GTSGXPWTIT8BVsvH0FyZOqZdnv6Hw7HwWVzwuDifn0drNpv2YlGo9RmdEcng==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Oalfg1kN; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FDAC4004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:05:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 3893CB0054C;
 Sun,  1 Nov 2026 16:05:19 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 16:05:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 16:05:19 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20261031174249.2698980-2-james.hilliard1@gmail.com>
References: <20261031174249.2698980-2-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <241007578c30f63a49fcf5e7ae9bd2b3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-oauthlib: security bump to
 version 4.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 18:42, James Hilliard wrote:
> Fixes CVE-2026-49272: missing device code validation could allow a
> client to obtain a bearer token with an invalid device code.
> 
> https://github.com/oauthlib/oauthlib/security/advisories/GHSA-3jp2-3mrg-2vxc
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
