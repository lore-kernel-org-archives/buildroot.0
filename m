Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759E6C5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 18:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 274F380E2E;
	Mon, 24 Aug 2026 18:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2I6JavwvFQJZ; Mon, 24 Aug 2026 18:18:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787595494;
	bh=wIQIrQFEvBqzZWsKmzI4L3qh15/CbSfIUERpaO+g/r8=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fDooe4yrBItzsLME5vKWSFjsW/llVjL1PNWusRYDeX1hARi2aB5cpm9+loWovADRw
	 jmirn6T4B4xCllphVUBAIO9q8RQRlOTta/fyDg2/6C89S29+PQM8VGlswVi+8KwGMu
	 EVkBfLV3LaM975+PZpGLqHQ/k4+kwY0cL0+bvAxwGl1bUkRT6PXmlSZpU6OcRmCICo
	 MGpsAjFQ+qYDPQSXnA6Uj8Xz9BcFTPPAl8e1qZD7f0/0sBFzo1z4nrE19eNfbxF6qO
	 IOEjfkYo4EEzeYKWVdCPFFYHLIThMwFGEsxN1ZTJcLfakS3wY1lfU4eQGNrFoinPHQ
	 mw36aZ5ufyBlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BA9080E1F;
	Mon, 24 Aug 2026 18:18:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EDF034E
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 18:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 055034006F
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 18:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eOSEZD8Gc_Jw for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 18:18:12 +0000 (UTC)
X-Greylist: delayed 309 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 24 Aug 2026 18:18:11 UTC
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.187;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 571634005C
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 18:18:10 +0000 (UTC)
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue012
 [213.165.67.103]) with ESMTPSA (Nemesis) id 1MP2zs-1xHLZY3jiO-00NoxQ; Mon, 24
 Aug 2026 20:12:52 +0200
Message-ID: <e18f7c88-3d2a-4ca1-9c5d-9522cb76cc2f@green-communications.fr>
Date: Mon, 24 Aug 2026 20:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adam Ford <aford173@gmail.com>
Cc: buildroot@buildroot.org
References: <20260716133001.2147463-1-aford173@gmail.com>
 <aox73MQnOLsOq-tt@windsurf>
Content-Language: en-US
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <aox73MQnOLsOq-tt@windsurf>
X-Provags-ID: V03:K1:ZIh+vtU+d+56cvDDAeSxhiHr+4Qm3xM1mqnnXaX3VMzFfv199Yc
 nofTcDNnTff07ebiblahGHtK3zsrI7rsSNjT7jsLRg2mdfPG+yHP7CMuE0443Z5UHe/K5RY
 7TPHLsO//71JGJgVGTmoGp79jfep9qA2tZckESJ0bxVaW+2Gb5dDukXwaiODk+gye4N6fDx
 pvOzbbssu8IkSBblJuTDA==
UI-OutboundReport: notjunk:1;M01:P0:FRdhyB6lsAE=;7dqVR818oCJzT4Jo2DhPEX2KFp8
 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
Subject: Re: [Buildroot] [PATCH] package/libxml-parser-perl: add
 host-libxcrypt dependency
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

TGUgMjQvMDgvMjAyNiDDoCAxOToxNSwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IGEg
w6ljcml0wqA6Cj4gSGVsbG8sCj4gCj4gT24gVGh1LCBKdWwgMTYsIDIwMjYgYXQgMDg6MzA6MDFB
TSAtMDUwMCwgQWRhbSBGb3JkIHdyb3RlOgo+PiBob3N0LWxpYnhtbC1wYXJzZXItcGVybCBjb21w
aWxlcyBYUyBtb2R1bGVzIGFnYWluc3QgdGhlIHN5c3RlbSBwZXJsCj4+IGhlYWRlcnMsIHdoaWNo
ICNpbmNsdWRlIDxjcnlwdC5oPi4gT24gYnVpbGQgaG9zdHMgd2l0aG91dCBsaWJjcnlwdC1kZXYK
Pj4gaW5zdGFsbGVkLCB0aGUgYnVpbGQgZmFpbHM6Cj4+Cj4+ICAgICAgLi4uL0NPUkUvcmVlbnRy
Lmg6MTI2OjE2OiBmYXRhbCBlcnJvcjogY3J5cHQuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9y
eQo+Pgo+PiBEZWNsYXJpbmcgaG9zdC1saWJ4Y3J5cHQgZW5zdXJlcyBjcnlwdC5oIGlzIHByZXNl
bnQgaW4gdGhlIHBlci1wYWNrYWdlCj4+IGhvc3Qgc3lzcm9vdCBiZWZvcmUgdGhlIGJ1aWxkLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KPiAKPiBT
b3JyeSBmb3IgdGhlIGRlbGF5IGluIGdldHRpbmcgYmFjayB0byB5b3UuIENvdWxkIHlvdSBwcm92
aWRlIHNvbWUKPiBkZXRhaWxzIG9uIHRoZSBlbnZpcm9ubWVudC9kaXN0cmlidXRpb24gd2hlcmUg
Y3J5cHQuaCBpcyBub3QgYXZhaWxhYmxlCj4gb24gdGhlIGhvc3Q/IEkndmUgdHJpZWQgYnV0IG9u
IEZlZG9yYSBvciBVYnVudHUsIGFzIHNvb24gYXMKPiBnbGliYy1kZXZlbCAob3IgZXF1aXZhbGVu
dCkgaXMgaW5zdGFsbGVkLCBpdCBwdWxscyBpbgo+IGxpYnhjcnlwdC1kZXZlbC4gT24gQXJjaGxp
bnV4LCAvdXNyL2luY2x1ZGUvY3J5cHQuaCBpcyBhbHNvIHByZXNlbnQuCj4gCj4gVGhhbmtzIGZv
ciB0aGUgYWRkaXRpb25hbCBpbmZvcm1hdGlvbiB0aGF0IHlvdSdsbCBwcm92aWRlIG9uIHRoaXMK
PiB0b3BpYyEKCk5vdCB0aGUgYXV0aG9yIGJ1dCBpbiBEZWJpYW4gRm9ya3kgKHRlc3RpbmcpIGFu
ZCBTaWQsIGxpYmM2LWRldiBubyAKbG9uZ2VyIGRlcGVuZHMgb24gbGliY3J5cHQtZGV2LCB0aGUg
cHJvdmlkZXIgb2YgY3J5cHQuaC4gIGxpYmNyeXB0LWRldiAKbm93IG9ubHkgaGF2ZSB0aGVzZSBy
ZXZlcnNlIGRlcGVuZGVuY2llczoKCmdhdWNoZS1kZXYsIGd1aWxlLTMuMC1kZXYsIGhlaW1kYWwt
bXVsdGlkZXYsIGxpYmFwcjEtZGV2LCAKbGliaWR6ZWJyYS0yLjAtZGV2LCBsaWJwZXJsLWRldiwg
bGlidXNlcjEtZGV2LCBzYS1jb21waWxlCgpOb25lIG9mIHdoaWNoIHdvdWxkIGJlIHR5cGljYWxs
eSBwcmVzZW50IG9uIGEgZGV2ZWxvcGVyIG9yIGJ1aWxkZXIgc3lzdGVtLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
