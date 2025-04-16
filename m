Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DB6C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0890761126;
	Wed, 16 Apr 2025 21:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V11YF2B5s7Lx; Wed, 16 Apr 2025 21:27:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 463546FA15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 463546FA15;
	Wed, 16 Apr 2025 21:27:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2D8511B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3E4280C3B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVPUZqzxl6oR for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:27:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E47F881E67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E47F881E67
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E47F881E67
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:27:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA7BA1C0083; Wed, 16 Apr 2025 23:27:46 +0200 (CEST)
Message-ID: <f224063c-0a1b-4bd0-b2fb-10135c52c089@rnout.be>
Date: Wed, 16 Apr 2025 23:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20250404154044.49664-1-thomas.perale@mind.be>
Content-Language: en-GB
In-Reply-To: <20250404154044.49664-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838867; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=U7tXhZCk5fj3nmbLU43QbXFLbQ47sTrmgtrfMTlIRYM=;
 b=LxePcOkByWE1nSI6SB7TdlTvszXD5EZQsLVFcO+2/AfxmVB0rKlw0iwG/GnASWnOfY6Zy8
 1QkYeZgostk9tsS/469D1QnPGfvfEtIvROQ4b9uC5YV0piwsvDzGf4GJ/0AyRbvpoovIWQ
 jcheF21tJpiabNHAcEy57DvO1gz0wbtp7wxjwZ18pmsm/Tfq1A8PflcCk2Sm6h5WqF2DFA
 J/VowNAcPwcv3jzr1RM+Zd7hyZNoPasf7dg4T0r8heg0yKAQfVQl+Km7tKBVhdOI1mv9zy
 mdjgoa7wcUD2BoGPcih4efSgnPbQKig62hojJpu8MapP40QJxuXHv5UpGueh4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/dillo: remove trailing slash
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA0LzA0LzIwMjUgMTc6NDAsIFRob21hcyBQZXJhbGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBDb21taXQgZjJhODYyZmU2MCAocGFja2FnZS9kaWxsbzogbW92ZSB0byBnaXRodWIpIGNoYW5n
ZWQgdGhlIHNvdXJjZQo+IHNpdGUgZm9yIHRoZSBEaWxsbyBwYWNrYWdlLiBUaGlzIGNoYW5nZSBp
bnRyb2R1Y2VkIGEgdHJhaWxpbmcgc2xhc2ggYXQKPiB0aGUgZW5kIG9mIHRoZSBVUkwuCj4KPiBU
aGlzIGNhdXNlIGFuIGVycm9yIHdoZW4gcnVubmluZyBgbWFrZSBzaG93LWluZm9gIHdpdGggYEJS
Ml9QQUNLQUdFX0RJTExPPXlgOgo+Cj4gYGBgCj4gcGFja2FnZS9kaWxsby9kaWxsby5tazo0Njog
KioqIERJTExPX1NJVEUgKGh0dHBzOi8vZ2l0aHViLmNvbS9kaWxsby1icm93c2VyL2RpbGxvL3Jl
bGVhc2VzL2Rvd25sb2FkL3YzLjAuNS8pIGNhbm5vdCBoYXZlIGEgdHJhaWxpbmcgc2xhc2guICBT
dG9wLgo+IGBgYAo+Cj4gVGhpcyBjb21taXQgcmVtb3ZlcyB0aGUgdHJhaWxpbmcgc2xhc2guCj4K
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+Cgog
wqBBcHBsaWVkIHRvwqAyMDI1LjAyLngsIDIwMjQuMTEueCBhbmQgMjAyNC4wMi54LCB0aGFua3Mu
CgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCj4gLS0tCj4gICBwYWNrYWdlL2RpbGxvL2RpbGxvLm1r
IHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9kaWxsby9kaWxsby5tayBiL3BhY2thZ2UvZGlsbG8v
ZGlsbG8ubWsKPiBpbmRleCA1YTgyM2FhNGEzLi44MDJiZTg0NzE3IDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvZGlsbG8vZGlsbG8ubWsKPiArKysgYi9wYWNrYWdlL2RpbGxvL2RpbGxvLm1rCj4gQEAg
LTYsNyArNiw3IEBACj4gICAKPiAgIERJTExPX1ZFUlNJT04gPSAzLjAuNQo+ICAgRElMTE9fU09V
UkNFID0gZGlsbG8tJChESUxMT19WRVJTSU9OKS50YXIuYnoyCj4gLURJTExPX1NJVEUgPSBodHRw
czovL2dpdGh1Yi5jb20vZGlsbG8tYnJvd3Nlci9kaWxsby9yZWxlYXNlcy9kb3dubG9hZC92JChE
SUxMT19WRVJTSU9OKS8KPiArRElMTE9fU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9kaWxsby1i
cm93c2VyL2RpbGxvL3JlbGVhc2VzL2Rvd25sb2FkL3YkKERJTExPX1ZFUlNJT04pCj4gICBESUxM
T19MSUNFTlNFID0gR1BMLTMuMCsKPiAgIERJTExPX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4g
ICAjIGNvbmZpZ3VyZS5hYyBnZXRzIHBhdGNoZWQsIHNvIGF1dG9yZWNvbmYgaXMgbmVjZXNzYXJ5
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
