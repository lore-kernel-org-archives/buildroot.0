Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711DAC54ED1
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 11:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25E9484212;
	Sat, 28 Jun 2025 11:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6PqoLZrY7xz; Sat, 28 Jun 2025 11:17:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C37C842E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C37C842E8;
	Sat, 28 Jun 2025 11:17:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40601154
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 11:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31EB8400BD
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 11:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CeqGLarGL2EE for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 11:17:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 54DFF400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54DFF400B8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54DFF400B8
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 11:17:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D63385FF88;
 Sat, 28 Jun 2025 13:16:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Jun 2025 13:16:55 +0200
MIME-Version: 1.0
Date: Sat, 28 Jun 2025 13:16:55 +0200
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20250627120613.1929049-1-raphael.melotte@mind.be>
References: <20250627120613.1929049-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <ddd657aff7fd644b59a67e6741c378b9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751109419;
 bh=VFVGxAWnpkSVHjRVxirImoabVqAsm+JHF1wHMPoh7E8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Hwovwxu8BM659ZkD8kMg+emCEbM8BaWoHpgiHhz5LOZPAdVazYkTAcNOF/Szs0iAs
 B7th9IqAZYsyiyZFqL9kaWT7ogSBOjQv+wv/W13zDOpTqIfn44j2kv4QXOwQ/kiQQe
 WVi93nWyj3U892DzkYx0q56IYU1Lqu/Y6YnuLid1HQ/7vq6NQuH9fpPCVc6YnW4QD5
 4cZetnkjS6sDiu8umIsYm+U5wQX4zsJA6jTZyVoQQ+PKB1ntoDUtxU42qagkPuYsQ/
 jaslvGhaIJnTnOctUx5kmMg6InJQyGuiWkwNL/ol5h950OkexvXm1nEwluGRhOenSL
 XburgAIKXTnzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Hwovwxu8
Subject: Re: [Buildroot] [PATCH 1/1] package/binutils: fix build with gcc 15
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

T24gMjcvMDYvMjAyNSAxNDowNiwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBCYWNrcG9ydCB0aGUgdXBzdHJlYW0gcGF0Y2ggdGhhdCBmaXhlcyB0aGUgZm9sbG93aW5n
IGJ1aWxkIGVycm9yIHdoZW4KPiBjb21waWxpbmcgZm9yIG1pcHMgd2l0aCBnY2MgMTU6Cj4gCj4g
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIG1pcHMtb3BjLmM6Mjk6Cj4gbWlwcy1vcGMuYzogSW4gZnVu
Y3Rpb24gJ2RlY29kZV9taXBzX29wZXJhbmQnOgo+IG1pcHMtZm9ybWF0cy5oOjg2Ojc6IGVycm9y
OiBleHBlY3RlZCBpZGVudGlmaWVyIG9yICcoJyBiZWZvcmUKPiAnc3RhdGljX2Fzc2VydCcKPiAg
ICA4NiB8ICAgICAgIHN0YXRpY19hc3NlcnRbKDEgPDwgKFNJWkUpKSA9PSBBUlJBWV9TSVpFIChN
QVApXTsgXAo+ICAgICAgICAgIHwgICAgICAgXn5+fn5+fn5+fn5+fgo+IAo+IFRoZSBwYXRjaCBp
cyBhbHJlYWR5IHBhcnQgb2YgdXBzdHJlYW0gYmludXRpbHMgMi40NCwgc28gd2Ugb25seSBuZWVk
Cj4gaXQgZm9yIDIuNDIgYW5kIDIuNDMuMS4KPiAKPiBBbGwgMyB2ZXJzaW9ucyB3ZSBoYXZlIG9m
IGhvc3QtYmludXRpbHMgd2VyZSBidWlsZC10ZXN0ZWQgdXNpbmcgdGhlCj4gZGVmY29uZmlnIGZy
b20gdGhlIGF1dG9idWlsZGVyIGZhaWx1cmUgKHNlZSB0aGUgbGluayBiZWxvdykgYW5kIGdjYyAx
NQo+IG9uIHRoZSBob3N0Lgo+IAo+IEZpeGVzOgo+IC0gCj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVp
bGRyb290Lm9yZy9yZXN1bHRzLzg3My84NzNlYzI1Y2YwMWQ1ZjJiOWFlNzA0NGUwYjFkOGQ4Nzkx
Yjc4MWU2Lwo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1l
bG90dGVAbWluZC5iZT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
