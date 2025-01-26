Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC3DC0218D
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 21:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0824080F6D;
	Sun, 26 Jan 2025 21:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0D6a4Yb4rGUR; Sun, 26 Jan 2025 21:49:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1572D811B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1572D811B7;
	Sun, 26 Jan 2025 21:49:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74F80F10
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 21:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E8C26063C
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 21:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJJnrHLZ8rhn for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 21:49:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C851605FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C851605FF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C851605FF
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 21:49:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1ED3013F89A;
 Sun, 26 Jan 2025 22:49:47 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37168])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 22:49:47 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 22:49:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>
In-Reply-To: <20250126173402.24273-3-vincent.stehle@laposte.net>
References: <20250126173402.24273-1-vincent.stehle@laposte.net>
 <20250126173402.24273-3-vincent.stehle@laposte.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <0f703425522cb6ac8c950ddbad188c60@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737928189;
 bh=QvVSQTHUYVpURaYb3bj93/R7UmCXueK8nIVip99TxH0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mMiJnhiKzrBqyLpJLWxZ6D5gA9BF5u5BJ/yfAswqq/M4uykIhxReQMf1Qxlk3ZR1C
 ZGdmTv//1S3cqvDPLWDVNz46Z8jwqI6rPC1sWeQijmnoCNc6Gof4lMu8JwU322fuyu
 Jp8V3lvXAM+6FKfLP034hS79czASNQp5SsojQO3KPly+z4FTmESTVbSMI0PELyELWv
 CAakGnp4+DmeO6Ig10N1JSzKMOGSyaoQWcQhxjMIEx977rDn/zeyQiejWoPkSorMCd
 vdJC4EJucY6nkAO8dvzw93I69QJ6mvJRDDQXoBzYR07HZmfwlwekfvjqVdfO2BUhdR
 jWr6qYoLiM1hg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mMiJnhiK
Subject: Re: [Buildroot] [PATCH v2 2/2] support/testing: test_xen: repair
 and leverage xen tools
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

SGkgVmluY2VudCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKVGhlIFM5OWN1c3RvbSBzdGFydHVw
IHNjcmlwdCBnZW5lcmF0ZXMgYSAibWFrZSBjaGVjay1wYWNrYWdlIiBlcnJvci4KU2VlIGJlbG93
LgoKT24gMjYvMDEvMjAyNSAxODozNCwgVmluY2VudCBTdGVobMOpIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gQ3VycmVudCB0ZXN0IHJ1bnMgYSBYZW4gaHlwZXJ2aXNvciBhbmQgYSBMaW51eCBkb20w
LCBmcm9tIHdoaWNoIHdlIGNhbgo+IGRldGVjdCB0aGF0IHdlIHJ1biB1bmRlciBYZW4gYnV0IG5v
dCBtdWNoIG1vcmUuIEluZGVlZCwgd2l0aCBjdXJyZW50Cj4gdGVzdCdzIHNldHVwIHRoZSBYZW4g
dG9vbHMgYXJlIG5vdCBmdW5jdGlvbmFsLgo+IAo+IFdlIGFkZCBiYWNrIG5ldHdvcmtpbmcgdG8g
b3VyIHN0cmlwcGVkLWRvd24ga2VybmVsIGNvbmZpZyB0byByZXBhaXIgWGVuCj4gdG9vbHMuCj4g
Cj4gV2l0aCBYZW4gdG9vbHMgZnVuY3Rpb25hbHMsIHdlIGNhbiBlbmhhbmNlIHRoZSB0ZXN0IHdp
dGggdGhlIGNyZWF0aW9uIAo+IG9mCj4gYSBWTS4gVG8gYmUgYWJsZSB0byB1c2UgdGhlIHJvb3Rm
cyB0aGF0IHdlIGJ1aWxkIGluIGJvdGggdGhlIGRvbTAgYW5kIAo+IGluCj4gdGhpcyBuZXcgZG9t
MSwgd2Ugc3dpdGNoIHRvIGFuIGluaXRyYW1mczsgbm8gbW9yZSByb290ZnMgcGFydGl0aW9uIGlu
Cj4gdGhlIGltYWdlLiBBZnRlciBzdHJpcHBpbmcgdGhlIHJhbWRpc2sgYSBiaXQgd2UgY2FuIGV2
ZW4gcmVkdWNlIFFlbXUncwo+IG1lbW9yeSB0byAxIEdCLgo+IAo+IFN1Z2dlc3RlZC1ieTogSnVs
aWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhs
w6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgoKWy4uLl0KCj4gZGlmZiAtLWdpdCAKPiBh
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuL292ZXJsYXkvZXRjL2luaXQu
ZC9TOTljdXN0b20gCj4gYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3hlbi9v
dmVybGF5L2V0Yy9pbml0LmQvUzk5Y3VzdG9tCj4gbmV3IGZpbGUgbW9kZSAxMDA3NTUKPiBpbmRl
eCAwMDAwMDAwMDAwLi42MmI3NTY4YTU4Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyAKPiBiL3N1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuL292ZXJsYXkvZXRjL2luaXQuZC9TOTlj
dXN0b20KPiBAQCAtMCwwICsxLDQzIEBACj4gKyMhL2Jpbi9zaAo+ICsjCj4gKyMgQ3VzdG9tIHNj
cmlwdCBmb3IgdGVzdF94ZW4ucHkKPiArIyBUaGlzIHdpbGwgcnVuIGJvdGggaW4gZG9tMCBhbmQg
aW4gZG9tMS4KPiArIyBXaGVuIHdlIGRldGVjdCB0aGF0IHdlIGFyZSBpbiBkb20wIHdlIG1vdW50
IHRoZSBib290IHBhcnRpdGlvbiB1bmRlciAKPiAvbW50LAo+ICsjIHRvIHNlZSB0aGUga2VybmVs
IGltYWdlIGFuZCB0aGUgaW5pdHJhbWZzLgo+ICsjCgpSdW5uaW5nIHRoZSBjb21tYW5kICJ1dGls
cy9kb2NrZXItcnVuIG1ha2UgY2hlY2stcGFja2FnZSIgcHJvZHVjZXMgdGhlIAplcnJvcjoKCiAg
ICAgCnN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuL292ZXJsYXkvZXRjL2lu
aXQuZC9TOTljdXN0b206MDogCkRBRU1PTiB2YXJpYWJsZSBub3QgZGVmaW5lZCAKKGh0dHBzOi8v
bmlnaHRseS5idWlsZHJvb3Qub3JnLyNhZGRpbmctcGFja2FnZXMtc3RhcnQtc2NyaXB0KQogICAg
IApzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3hlbi9vdmVybGF5L2V0Yy9pbml0
LmQvUzk5Y3VzdG9tOjA6IApydW4gJ3NoZWxsY2hlY2snIGFuZCBmaXggdGhlIHdhcm5pbmdzCgpF
dmVuIGlmIGl0IGlzIGEgY3VzdG9tIHN0YXJ0dXAgc2NyaXB0IGZvciB0aGUgdGVzdCwgSSB0aGlu
ayBpdCB3b3VsZApiZSBiZXR0ZXIgdG8gY29tcGx5IHRvIHRoZSBjaGVja2VyIChyYXRoZXIgdGhh
biBqdXN0IGFkZGluZwphIC5jaGVja3BhY2thZ2VpZ25vcmUgZW50cnkpLgoKQ291bGQgeW91IGZp
eCB0aG9zZSB3YXJuaW5ncyBhbmQgc2VuZCBhbiB1cGRhdGVkIHBhdGNoLCBwbGVhc2U/CgpCZXN0
IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
