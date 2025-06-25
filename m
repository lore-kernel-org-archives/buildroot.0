Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E245C7EE2A
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 694F184219;
	Wed, 25 Jun 2025 17:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcGlJLSKkavF; Wed, 25 Jun 2025 17:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FA1F8416B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FA1F8416B;
	Wed, 25 Jun 2025 17:14:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F156154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0529441F0E
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gghmPPOo8C3Z for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3966441EF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3966441EF8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3966441EF8
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:14:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 263F119F748;
 Wed, 25 Jun 2025 19:14:34 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Jun 2025 19:14:34 +0200
MIME-Version: 1.0
Date: Wed, 25 Jun 2025 19:14:34 +0200
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org, Frank Vanbever <frank.vanbever@mind.be>
In-Reply-To: <20250624122048.946492-1-raphael.melotte@mind.be>
References: <20250624122048.946492-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <4326ba31e2454ddb4274760e7064c568@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750871676;
 bh=JQQv/IgmX3hIbYeaLFTKFao/dLqRWWTsVQWr9NeSWC4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iQyu/IgulMv0lMZE0Jq7XKDFvLTeQDmddURfTDRLI646VfS1yFf3dl4DlHjwShEMn
 LrGn550pz30859MeIsWwVFM3JDWn7Vc9lFG8BStCxLu7DXLar3mcdpDZkfIUV2wNTO
 qNpagG/X48BQINdelZxQPbyLRQnxnR68GeGwYt3u2AdWu/d3qFZpo4YRZYTLR3qk5h
 ejgnvJAvCR7iQPj6dO4F/d+zOw3O/Vg610PkqrwO73uuzoMMoFCUrn7sGyd0KDYBUM
 OS0byPznPhcuz2ogeEY3mS+A/t2AxV1cRipJ4Q5vxnABSKDGkgSshEPrse8iW6T/i3
 o9XhLThegJA4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iQyu/Igu
Subject: Re: [Buildroot] [PATCH 1/2] package/nginx-modsecurity: update
 upstream URLs
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjQvMDYvMjAyNSAxNDoyMCwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiAnaHR0cHM6Ly9naXRodWIuY29tL1NwaWRlckxhYnMvTW9kU2VjdXJpdHktbmdpbngnIG5v
dyByZWRpcmVjdHMgdG8KPiAnaHR0cHM6Ly9naXRodWIuY29tL293YXNwLW1vZHNlY3VyaXR5L01v
ZFNlY3VyaXR5LW5naW54Jywgc28gdXBkYXRlIG91cgo+IFVSTHMgYWNjb3JkaW5nbHkuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgoKU2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
