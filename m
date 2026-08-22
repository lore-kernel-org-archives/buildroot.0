Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861A4C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 22:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35D0740560;
	Sat, 22 Aug 2026 22:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XlowHailR15b; Sat, 22 Aug 2026 22:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787436141;
	bh=Ku7XvCqbshOvsEMEfP/q01oTFCTnmfsOAqam+5SUmA4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p8y2md1843ofj+Oax6ansBiO6c33pzDPpjQXOSjQvDN/H+7J8oEgKC1zG9j3kM61O
	 mtOmnS7YIYp65w4kmCRa6ys1f7iPHpmvujOs61Eij0L87XI47oq2EP1LhLOS8U/V8q
	 muBlCSKAmDHTfCyw6m2xgZahRTBN8ZdTPASfJCB3AGk5noiH+CSfFq0WE4yx9eto0n
	 vw6+Yz+yuUCJwzorsDw1vfcQHpcCL1fcGo214RoJaJYlz212/q4SaC50cIqd1kXmPV
	 /j1n4doNQI2FGFJILIWvMTKhpXnAp9eRNB38oC5GxQusUmK+EKzfDO3SnwYAQpTW+X
	 +fNr145vKpGuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 697E040689;
	Sat, 22 Aug 2026 22:02:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D5E0534E
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 22:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C746340689
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 22:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kpxXr_FHlI8O for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 22:02:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9FC140560
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 22:02:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E50F4B0054C;
 Sun, 23 Aug 2026 00:02:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Aug 2026 00:02:14 +0200
MIME-Version: 1.0
Date: Sun, 23 Aug 2026 00:02:14 +0200
To: Stefan Mueller <stemu86@gmx.ch>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Stefan_M=C3=BCller?=
 <stefan.mueller@rey-technology.com>
In-Reply-To: <20260820073208.376968-2-stemu86@gmx.ch>
References: <20260820073208.376968-1-stemu86@gmx.ch>
 <20260820073208.376968-2-stemu86@gmx.ch>
User-Agent: Webmail Free/1.6.18
Message-ID: <728a865332a1d9514b341c5f40b740a5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/5] package/libssh2: fix CVE-2025-15661
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

T24gMjAvMDgvMjAyNiAwOTozMiwgU3RlZmFuIE11ZWxsZXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBGcm9tOiBTdGVmYW4gTcO8bGxlciA8c3RlZmFuLm11ZWxsZXJAcmV5LXRlY2hub2xvZ3kuY29t
Pgo+IAo+IEJhY2twb3J0IHRoZSBTRlRQIHN5bWxpbmsgYm91bmRzIGNoZWNraW5nIGZpeCBmb3Ig
Q1ZFLTIwMjUtMTU2NjEuCj4gCj4gVGhlIGluaXRpYWwgZml4IHJlcXVpcmVzIHRoZSBMSUJTU0gy
X1VOQ09OU1QgY29tcGF0aWJpbGl0eSBiYWNrcG9ydCBvbgo+IGxpYnNzaDIgMS4xMS4xLiBBbHNv
IGluY2x1ZGUgdGhlIHVwc3RyZWFtIGZvbGxvdy11cCBmaXhpbmcKPiBTU0hfRlhQX1NUQVRVUyBo
YW5kbGluZyBpbnRyb2R1Y2VkIGJ5IHRoZSBpbml0aWFsIHNlY3VyaXR5IGZpeC4KPiAKPiBUaGUg
cGF0Y2hlcyBhcmUgYmFzZWQgb24gdGhlIHVwc3RyZWFtIGZpeGVzIGFuZCBEZWJpYW4ncyBsaWJz
c2gyIDEuMTEuMQo+IGJhY2twb3J0cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gTcO8bGxl
ciA8c3RlZmFuLm11ZWxsZXJAcmV5LXRlY2hub2xvZ3kuY29tPgoKU2VyaWVzIGFwcGxpZWQgdG8g
bWFzdGVyLCB0aGFua3MuCgpJIGFsc28gYWRkZWQgbGlua3MgdG8gdGhlIERlYmlhbiBwYXRjaGVz
LCBmb3IgYmV0dGVyIHRyYW5zcGFyZW5jeQphbmQgdHJhY2VhYmlsaXR5LgoKQmVzdCByZWdhcmRz
LAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
