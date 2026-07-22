Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465E0C4453A
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 20:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00DCB80F5C;
	Wed, 22 Jul 2026 20:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ae8aS6f5lJhY; Wed, 22 Jul 2026 20:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 272FA80F47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784753583;
	bh=wFH73bxwDVTtpDox6OQebsDQgtiC4iZZw2ARz9CEikg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=igfrdRxrJr9lZMtI0uH/RzyFGe/cIUHph1f6fA4EFjvTDJ8xXsnCZgKgV3ftdBipW
	 +VEPkcoZuug1LLyTZB3+pkYkiinIgjBaJ2u3AOv+hJA59PxF5LzMB1stwNZjF6Qgwf
	 0JUqNGEw82LlhTb8pfQNsymeVmNB6AoJVPJSW9lvADVOQLnS4x+wh6W783L4SQW8/P
	 Wi2oQ+ijvnLGbW6SNk4BGKBxuQNuGkoNpVrhMVKpnk9wz3U/+zUe4JvZK5ZO0mAI9s
	 Mz/fEhRM7sEgLxl7YvrZiskf5ny/NgucVhRZJlM4qj3hS+egsoFjByCo8e2cnu3w5a
	 nuDMnTxz86i4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 272FA80F47;
	Wed, 22 Jul 2026 20:53:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8250C224
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7420A405FA
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYjC8_jmOyqC for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 20:53:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 090A5405A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 090A5405A6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 090A5405A6
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:52:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3se2-1wvc891hHU-00wp8q; Wed, 22
 Jul 2026 22:52:57 +0200
Message-ID: <6d931cfa-764b-4919-9120-f0bb573cec89@gmx.de>
Date: Wed, 22 Jul 2026 22:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 Romain Naour <romain.naour@gmail.com>
References: <20260722153224.624762-1-fiona.klute@gmx.de>
 <bec86e53ad0d3f30277381bc81265355@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <bec86e53ad0d3f30277381bc81265355@free.fr>
X-Provags-ID: V03:K1:Eb2qTvvDd7yrH8EY4/CMIe76VQdGkHGHcA/h1rZvjotLwFJe2DE
 TxoCqELmHzMLuVahyy1pCEjCjTwKpnxKW1NvRqSsUCRB93gBlpAbaNeUHygjViz6GL3rmVU
 Tg0HAAaDHQ+4Up7Yc7ZZ1S9uMgHlJK0ESZp2mbpoTydmhX3ou7/lkkd/5yE1jBSgjQ+ZIqA
 IhhH50Mvcur28eP9Whqbw==
UI-OutboundReport: notjunk:1;M01:P0:FNA74euYTSE=;2X/U6Nvh7JjHKtHwwP1rhMYUiVx
 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
 p0bK5DXy/tfBut/svPiSk
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784753577; x=1785358377; i=fiona.klute@gmx.de;
 bh=MSeE/RJQKo28NRpbDuSuU9CtTtEK5aEDPDaBu1Ma7Bg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ObaCqKB8fPeM5dCCqaoFxS1b//t+6yH50q1reLWj8ioLokq2kjbtJgEoyrY+bSki
 yO+gNZo1nQPk1ngSvXh2WoL2kMqECs+qFlwWPjuLJ075v2ckY6Rcn0TDXcUtlbe4N
 hqnKLFDv9TsX5g4coNwCutsWP5pQODhzmSUSPCfbxxFNMwg3qUGcYpUC079R2QN51
 tHKPLttfeZpJjfaAoV1ckPJY7me7JLCLw9EGoZ2oFtke6xFUX7hBBAgKAq7I43fDg
 SVuIl0iX2QXeTzwhMKmnCn//1lIin81Lcwc/kPbi7DemgJDzPD8K5gzrObZhGH/42
 Y1w2ukQnP4Trlxe5HA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ObaCqKB8
Subject: Re: [Buildroot] [PATCH 1/7] package/skeleton{,
 -init-*}: add license information
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 22.07.26 um 22:27 schrieb Julien Olivain:
> On 22/07/2026 17:32, Fiona Klute via buildroot wrote:
>> From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
>>
>> All these packages are part of Buildroot and thus under
>> GPL-2.0-or-later unless stated otherwise, as described in COPYING.
>>
>> package/skeleton-custom is excluded because it provides a way to copy
>> skeleton data from any location chosen by the user, the license of
>> which is unknown to Buildroot.
>>
>> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
> 
> Applied to master, thanks.
> 
> For info, I also noticed there is other mentions of
> "BSD-0-Clause" in _LICENSE for the agec and ugetty packages,
> in case you want to continue your license info cleanup ;)
Eh, why not, it's quick enough to do. Patches sent. :-)

Thanks for the quick merges and best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
