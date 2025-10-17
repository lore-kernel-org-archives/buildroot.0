Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36BFCCD199
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 16:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A55481760;
	Fri, 17 Oct 2025 16:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLT-sCG7zW-1; Fri, 17 Oct 2025 16:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A6E481753
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A6E481753;
	Fri, 17 Oct 2025 16:39:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B06CD8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 287B5403A0
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Il3Xm0no_Y-V for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 16:39:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31C73400E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31C73400E9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31C73400E9
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:39:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 42F5619F58A;
 Fri, 17 Oct 2025 18:39:26 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Oct 2025 18:39:26 +0200
MIME-Version: 1.0
Date: Fri, 17 Oct 2025 18:39:26 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20251016173957.246866-1-buildroot@bubu1.eu>
References: <20251016173957.246866-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <940d1c5638358f24a2c7730a8fa1ba99@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760719169;
 bh=r+wkEbSliT3gFJvOwgWRpW/UkaqJRRIpHwRBPFGD830=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jIJt2ezXM1GAom6Jub9XpHfUh5ZZwPG9dLXItEsp0NpIO8toq4bm4jRVFCpLVtJ8p
 ULV1KGhcGWOb+RhuryjWl+j2UZiND8amFWziqU8M49Fvt+7+tWXKwVJ6RZpp6bsEzm
 Nf7R3bDsQhZRVu7EC7zf8I5feVfrsLqULDqvdopCbqFyeOAFeU27PIMR5iTs9siU2h
 CB5kIYbvj6FRDXcm5eqyMr2rHH3gH75yjkWQt9iF8D80U1bKiUb1TJYpYh2HE874Wv
 dKX42zaQFld/nf11osqzyhTDIxC6gqNoZpn9jzbfi3yG6Tk1nCVs7HXS+z+Zuy7aUX
 2uwQy3KBhmkLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jIJt2ezX
Subject: Re: [Buildroot] [PATCH 1/3] package/python-typing-inspection: bump
 to 0.4.2
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

On 16/10/2025 19:39, Marcus Hoffmann via buildroot wrote:
> Changelog: 
> https://github.com/pydantic/typing-inspection/blob/main/HISTORY.md#v042-2025-10-01
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
