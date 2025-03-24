Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E0DC36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 21:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0675460D56;
	Mon, 24 Mar 2025 21:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAV8IxUvkpA8; Mon, 24 Mar 2025 21:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D09460D57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D09460D57;
	Mon, 24 Mar 2025 21:40:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 885971B8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79EB8401FE
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQM5fJXFs5aP for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 21:40:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CBA3F400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBA3F400C1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBA3F400C1
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:40:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 986B778032A;
 Mon, 24 Mar 2025 22:40:23 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60198])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Mar 2025 22:40:23 +0100
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 22:40:23 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
In-Reply-To: <20250324115215.972943-1-alex.bennee@linaro.org>
References: <20250324115215.972943-1-alex.bennee@linaro.org>
User-Agent: Webmail Free/1.6.10
Message-ID: <2e81bd2c35a28a16067764da62423203@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742852425;
 bh=+q8iy0fQAmhpBwpeoJUZcCnqeu3+p8oVzKg/hJ8EsMc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sXS5rE//o5AQuoJUtnLoWnsn+uYD0pUcbCCdjHn5f2MrgE6B6whdvYNcattddNLmi
 nXOzLZUcV8x1CUZ3IcHuJyHEfih2Mjq2kh9esjifVMcNq9SzrclpzKaPLfPQkDKQ9o
 ZAEp9EYOtVj9AssxO9UZmaL3Uvvi+Y4doF0DjQbkGUMtzJoKagfGJz1ATS0iPaV/gK
 RyJ7CDM9Yw4ePu7hOHxjmWRNIxjceTAFS92dJwripd6+lVqZAtPntmTAk4h5J/ILXL
 YDJHmEkscgZpI5HiFgrVJkckX5PVvAPM7dYHHzo9fhUof0IGsU4nPGXaUTEc97y4kp
 eWBPmrUkE8Mxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sXS5rE//
Subject: Re: [Buildroot] [RFC PATCH] support/testing: make time setting
 portable
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjQvMDMvMjAyNSAxMjo1MiwgQWxleCBCZW5uw6llIHdyb3RlOgo+IFRoZSBidXN5Ym94IGRh
dGUgYXBwbGV0IGFjY2VwdHMgdGhlIGZvbGxvd2luZzoKPiAKPiAgIGRhdGUgQDEyMzQ1NjcKPiAK
PiBidXQgdGhpcyBjb25mdXNlcyB0aGUgY29yZXV0aWxzIHZlcnNpb24gd2hpY2ggZG9lc24ndCBp
bXBsaWNpdGx5IHNldAo+IHRpbWUuIEFzIHNvbWUgdGVzdHMgbWlnaHQgbmVlZCBjb3JldXRpbHMg
YmluYXJpZXMgd2Ugc2hvdWxkIGVuc3VyZSB0aGUKPiBlbXVsYXRvciBsb2dpbiB3aWxsIHdvcmsg
d2l0aCBib3RoLiBGaXggdGhpcyBieSBwYXNzaW5nIHRoZSAtcyAoc2V0KQo+IG9wdGlvbiB0byB0
aGUgY29tbWFuZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVl
QGxpbmFyby5vcmc+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
