Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2975CAC5AE
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 17:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7695A83366;
	Fri, 26 Sep 2025 17:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRdthhmgIEKJ; Fri, 26 Sep 2025 17:09:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 744C7834F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 744C7834F6;
	Fri, 26 Sep 2025 17:09:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 799BB198
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A97F836AE
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qtlls880Ua-s for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 17:09:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F05183366
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F05183366
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F05183366
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:09:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 26EF4780395;
 Fri, 26 Sep 2025 19:09:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Sep 2025 19:09:37 +0200
MIME-Version: 1.0
Date: Fri, 26 Sep 2025 19:09:37 +0200
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: buildroot@buildroot.org, Joel Stanley <joel@jms.id.au>
In-Reply-To: <20250926055738.319052-1-clg@kaod.org>
References: <20250926055738.319052-1-clg@kaod.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <485303556dfa801e596b5ba078b210a9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758906580;
 bh=ULihb0BUR3nspXhizcvnW2umnPLlbi0fvG5y+P7kwxk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EjLA3C+QXlBUxTZnbSYtJVE/AwL2nLELFxuKuvPGYWx6v7dJmOjiOXtzY2qJMWczJ
 E/9lCh3Tq24WG+EU2/Cl9Dq0ZkhMaRqzQ5NmBz4Ebv/bDsyehk56rtQW9PbLYE2ZeR
 M/FXHewa6A7uEmQCyqKgtbwsFBmq4u9iqpdEK8MJ8hb+aic08zXWY9n/vwJ4PEGIYw
 IKQJHl81cJ3HIKUwJ+xNrYAjq4zYZo4LjmeA2zMMU8vCMNcswNGVGVU8UxHb1EtUj4
 zGSV1AuKGadcBQI5FsK9D5sx/aLbFWAQQABekOHGWYlm5+OYy4395UxnnUw4IhjrX3
 YmYmIAxb4fcQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EjLA3C+Q
Subject: Re: [Buildroot] [PATCH 1/1] configs/aspeed_ast2500evb: select CPU
 arm1176jzf
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

T24gMjYvMDkvMjAyNSAwNzo1NywgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4gVGhlIEFzcGVl
ZCBBU1QyNTAwIFNvQyBmYW1pbHkgZW1iZWRzIGEgQVJNMTE3NkpaRiAzMi1iaXQgQ1BVLiBzZWxl
Y3QKPiB0aGlzIGFyY2hpdGVjdHVyZSB2YXJpYW50IGZvciB0aGUgdGFyZ2V0Lgo+IAo+IEFsbywg
Zml4ZXMgQ0kgdGhpcyBmYWlsdXJlOgo+IAo+ICAgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9v
dC5vcmcvYnVpbGRyb290Ly0vam9icy8xMTQ4MTIzODM0MQo+IAo+IFdBUk46IGRlZmNvbmZpZyAu
L2NvbmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJfZGVmY29uZmlnIGNhbid0IGJlIHVzZWQ6Cj4gICAg
ICAgTWlzc2luZzogCj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FSTVY2X0VBQklI
Rl9HTElCQ19TVEFCTEU9eQo+IAo+IEZpeGVzOiA2ZTVlNmY5OGZkNzMgKCJjb25maWdzL2FzcGVl
ZF9hc3QyNTAwZXZiOiBidW1wIGtlcm5lbCB0byA2LjE2LjcsIAo+IGNoZWNrIGhhc2hlcywgdXNl
IGJvb3RsaW4gdG9vbGNoYWluIikKPiBTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8
Y2xnQGthb2Qub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
