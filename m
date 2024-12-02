Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0A0D7832F
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 15:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 232B942578;
	Mon,  2 Dec 2024 15:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDl0bG53XZo0; Mon,  2 Dec 2024 15:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9542425A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9542425A3;
	Mon,  2 Dec 2024 15:39:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DF761DAA
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 15:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E21086153B
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 15:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7p9OTlFQEllG for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 15:39:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02F6A6153A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02F6A6153A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02F6A6153A
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 15:39:10 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:2ddd:b692:571f:f1a1])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5E9BF13F861;
 Mon,  2 Dec 2024 16:39:04 +0100 (CET)
Date: Mon, 2 Dec 2024 16:39:04 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Brandon Maier <brandon.maier@gmail.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Robin Jarry <robin@jarry.cc>
Message-ID: <iig5bn2go5jmwxxgusoagg4oapd7kmazljykzgemmnuvtz7a74@m5btvmgminf7>
References: <CADwxmTnvhL1rg7T2k8Ye+wV0gx2oCCjLmnKiCfUQsY7ud9RVPA@mail.gmail.com>
 <20241127013001.24122-1-vjardin@free.fr>
 <20241127013001.24122-2-vjardin@free.fr>
 <D5Z27LYGMKJK.2KDMDIY9CR01H@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D5Z27LYGMKJK.2KDMDIY9CR01H@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733153947;
 bh=wAb9y+m4WTWbCr3Ehn6TaMvWEUJF9PDrHeFsWg8Pm8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Egp6CWL4BJYdQUMoWpcszOWU/zBkx7+LZeZD6SPgdBuq7LKHR9bWqixZneOev4cp7
 IKzwflJ+Z541vDxE1ici6NLKHD1d//Y+C8Zn7i9ywq4TKBO3qL35r1RlmtojnjrPmi
 RdKSwPdUkvKFVC5s21D2mxj0IQM+6rctgHEoGWYim3rrhy591ZvbnFt3D7fqUe4tT7
 GdbKSf/GppQEAWg0gxREz+7Dm3ZQi1lFIZ5X+19vvjbHTcn6rUMK8hFPClbVbtQp/d
 eFQWs17llxV64LUsJ+WnHcetGCstW48LncvnoBdQqUV+E5IAMY4JCkqFxwGdI/7xYY
 Kq2K4DnfiQU6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Egp6CWL4
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pkg-meson: h files only into
 sysroot
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQnJhbmRvbiwKCk9uIEZyaSwgTm92IDI5LCAyMDI0IGF0IDA1OjQyOjU5UE0gVVRDLCBCcmFu
ZG9uIE1haWVyIHdyb3RlOgo+IEhpIFZpbmNlbnQsCj4gCj4gT24gVHVlIE5vdiAyNiwgMjAyNCBh
dCA3OjMwIFBNIENTVCwgVmluY2VudCBKYXJkaW4gd3JvdGU6Cj4gPiBNYW55IHBhY2thZ2VzIGJ1
aWx0IHdpdGggQnVpbGRyb290IGFuZCBtZXNvbiBjdXJyZW50bHkgaW5zdGFsbCBoZWFkZXIKPiA+
IGZpbGVzIGludG8gYm90aDoKPiA+ICAgLSB0aGUgdGFyZ2V04oCZcyAvdXNyL2luY2x1ZGUsIGFu
ZAo+ID4gICAtIHRoZSBzeXNyb2904oCZcyAvdXNyL2luY2x1ZGUuCj4gPgo+ID4gV2hlbiBGT09f
TUVTT05fSU5TVEFMTF9UQUdTID0gWUVTLCBlbnN1cmUgdGhhdCBoZWFkZXIgZmlsZXMgYXJlCj4g
PiBpbnN0YWxsZWQgZXhjbHVzaXZlbHkgaW4gdGhlIHN0YWdpbmcgKHN5c3Jvb3QpIHRhcmdldCBk
dXJpbmcgdGhlCj4gPiBidWlsZCBwcm9jZXNzLgo+ID4KPiA+IFRoZSBkZWZhdWx0IGlzIEZPT19N
RVNPTl9JTlNUQUxMX1RBR1MgPz0gTk8gaW4gb3JkZXIgdG8gYXZvaWQKPiA+IGNoYW5naW5nIHRv
IHRoaXMgbmV3IGJlaGF2aW91ciBmb3IgdGhlIHRpbWUgYmVpbmcuCj4gCj4gVGhpcyBzZXR0aW5n
IGhhcyBkaW1pbmlzaGVkIHZhbHVlIGlmIGl0IGlzIGRlZmF1bHQgb2ZmLiBIYXZlIHlvdSBkb25l
IGEKPiBzaWRlLWJ5LXNpZGUgYnVpbGQgdG8gc2VlIGhvdyBtYW55IHBhY2thZ2VzIHRoaXMgYnJl
YWtzPwoKTm8sIEkgZGlkIG5vdDogbXkgYXNzdW1wdGlvbiB3YXMgdG8gc3RhcnQgZWFzeSB3aXRo
b3V0IGJyZWFraW5nL2NoYW5naW5nCmFueSBiZWhhdmlvdXIuIFRoZW4sIHdlIGNhbiBzdGFydCB0
dXJuaW5nIGl0IHRvICJZRVMiIGJ5IGRlZmF1bHQgbGF0ZXIKb24uCgpTbywgZm9yIHRoZSB0aW1l
IGJlaW5nLCB0aGUgbWVzb24gYmFzZWQgcGFja2FnZXMgdGhhdCBhcmUga25vd24gdG8gYmUKIm9r
IiBjYW4gc3RhcnQgdXNpbmcgdGhlIHRhZ3MuIEkgcGxhbiB0byBkbyBzbyBmb3IgZ3JvdXQsIGxp
YmVjb2xpIGFuZCBEUERLLgoKU2lkZSBxdWVzdGlvbjogaG93IGRvIHlvdSBoYW5kbGUgYSBzaWRl
LWJ5LXNpZGUgYnVpbGQgd2l0aCBCdWlsZHJvb3QgPwoKPiA+ICsJCSAgJCQoJCQoUEtHKV9TUkNE
SVIpL2J1aWxkICQoaWYgJChmaWx0ZXIgWUVTLCQoJChQS0cpX01FU09OX0lOU1RBTExfVEFHUykp
LC0tdGFncz1ydW50aW1lLGRldmVsKQo+IAo+IFRoZSBjb21tYSBpbiAiLS10YWc9cnVuZXRpbWUs
ZGV2ZWwiIGlzIHRyZWF0ZWQgYXMgdGhlIE1ha2VmaWxlIHNlcGFyYXRvcgo+IGZvciAiJChpZiB4
LCB5LCB6KSIuIFVzZSAiLS10YWc9cnVudGltZSQoY29tbWEpZGV2ZWwiIGluc3RlYWQgd2hpY2gK
PiBzdWJzdGl0dXRlcyBhIGxpdGVyYWwgY29tbWEuCgpPSywgdGhhbmtzIGZvciBjYXRjaGluZyBp
dCAhLCBpdCdsbCBiZSBpbmNsdWRlZCB3aXRoIG15IG5leHQgdXBkYXRlLgpJIGRpZCBub3QgYW5h
bHl6ZSB3aHkgSSBkaWQgbm90IGNhdGNoIGl0Li4uCgo+IAo+IFRoZSBzaW5nbGUgIiQiIG5lZWQg
dG8gYmUgIiQkIiBzbyB0aGV5IGFyZSBwcm9wZXJseSBlc2NhcGVkLiAoRXhjZXB0Cj4gIiQoY29t
bWEpIikKCk9LCgpUaGFua3MgQnJhbmRvbiwgYmVzdCByZWdhcmRzLAogIFZpbmNlbnQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
