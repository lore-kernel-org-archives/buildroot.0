Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B9CC61CE7
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 17:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C76440841;
	Fri,  6 Jun 2025 17:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkuyY8ntpA9H; Fri,  6 Jun 2025 17:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9A2C406BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9A2C406BC;
	Fri,  6 Jun 2025 17:35:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5BC7C8
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 17:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7C6840442
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 17:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RD9ZVAF14NIc for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 17:35:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB18E403F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB18E403F6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB18E403F6
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 17:35:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9863A2003D3;
 Fri,  6 Jun 2025 19:35:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Jun 2025 19:35:16 +0200
MIME-Version: 1.0
Date: Fri, 06 Jun 2025 19:35:16 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>
In-Reply-To: <20250605071233.195370-1-kadambini.nema@gmail.com>
References: <20250605071233.195370-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <168733e6b4c60c880c66a2b10b1715ec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749231318;
 bh=z+goYXV1htxNtkuxu85w09n8td0jC2eLt6LFqM5aTe8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YobudqHjh5WU0KIpQRa7iyOExMrOPUadEm+yZcA6beQNIY6Aimmlp6pbxYnhIWMZo
 /IDnM7bq7qBJo7aw6FoyxEfU0Y3yemRwe+ano4syalJ/wk+UtOdPINLi7iMJLAT1uV
 NRh3yvi2SmKs69hVPTohCwRTZaB0LwVfT2tK9NBV3icugLnjeiZTnZZ4W1s4wCWppk
 8j3qPmlKO/dyj9uvBTkLYHhIHrl5fVhKNUKiE3vN74HjVyw8rF36/zNvV2SfRd/dQQ
 e3b5qpkcpP8w46/wjB8bArKvmgBABvIzMG97UZrYsGfVT3DY28Gk9U9msDzxDSmgA3
 RLgOF/mhZEWfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YobudqHj
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: bump version to 10.3.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 05/06/2025 09:12, Kadambini Nema wrote:
> Release notes:
> https://github.com/FRRouting/frr/releases/tag/frr-10.3.1
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
