Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53449E7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 10:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E63A741388;
	Tue, 17 Dec 2024 10:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5BvbQ9h-ByQ; Tue, 17 Dec 2024 10:05:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B635C4138B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B635C4138B;
	Tue, 17 Dec 2024 10:05:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8205CE
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 10:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98BC16110C
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 10:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Ll63Xd-71Vg for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 10:05:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 75FC66111B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75FC66111B
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75FC66111B
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 10:05:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B3BD1007;
 Tue, 17 Dec 2024 02:05:28 -0800 (PST)
Received: from debian (X72Y076X74.nice.Arm.com [10.34.111.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DC363F528;
 Tue, 17 Dec 2024 02:04:59 -0800 (PST)
Date: Tue, 17 Dec 2024 11:04:56 +0100
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <Z2FMyLInGBpM5lFq@debian>
Mail-Followup-To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 Sergey Matyukevich <geomatsi@gmail.com>
References: <20241216090421.2867204-1-vincent.stehle@arm.com>
 <847d9076e7ae8227d486d9ef1fe08bb0@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <847d9076e7ae8227d486d9ef1fe08bb0@free.fr>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: bump to v2.12
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

T24gTW9uLCBEZWMgMTYsIDIwMjQgYXQgMTA6MDg6NDZQTSArMDEwMCwgSnVsaWVuIE9saXZhaW4g
d3JvdGU6Cj4gSGkgVmluY2VudCwKPiAKPiBPbiAxNi8xMi8yMDI0IDEwOjA0LCBWaW5jZW50IFN0
ZWhsw6kgd3JvdGU6Cj4gPiBVcGRhdGUgdHJ1c3RlZC1maXJtd2FyZS1hIHZlcnNpb24gdG8gdjIu
MTIgYW5kIGFkZCBhIGhhc2ggZmlsZQo+ID4gYWNjb3JkaW5nbHkuCj4gPiAKPiA+IENvbXBhcmVk
IHRvIHYyLjExLCB0aGUgbGljZW5zZSBoYXMgY2hhbmdlZCB3aXRoIHRoZSBhZGRpdGlvbmFsIG1l
bnRpb24KPiA+IG9mCj4gPiBmaWxlcyBmcm9tIHRoZSBweWRldmljZXRyZWUgcHJvamVjdCB1bmRl
ciBBcGFjaGUgMi4wIGxpY2Vuc2UuCj4gPiBBcyB3ZSBvbmx5IGRvY3VtZW50IHRoZSBtYWluIGxp
Y2Vuc2Ugb2YgVEYtQSwgQlNELTMtQ2xhdXNlLCB0aGlzIGNoYW5nZQo+ID4gaGFzCj4gPiBubyBp
bXBhY3QgZm9yIHVzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZp
bmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gPiBDYzogRGljayBPbHNzb24gPGhpQHNlbnppbGxhLmlv
Pgo+ID4gQ2M6IFNlcmdleSBNYXR5dWtldmljaCA8Z2VvbWF0c2lAZ21haWwuY29tPgo+IAo+IFRo
YW5rcyBmb3IgdGhlIHBhdGNoIChhbmQgdGhlIGV4dGVuZGVkIHRlc3RpbmcpLiBJIGFwcGxpZWQg
dG8gbWFzdGVyLgoKSGkgSnVsaWVuLAoKVGhhbmtzIGZvciBoYW5kbGluZyB0aGF0LgoKPiBJIHJl
bW92ZWQgdGhlIGhhc2ggZmlsZSBmb3IgdjIuMTEsIHNpbmNlIGl0IGlzIG5vIGxvbmdlciBuZWVk
ZWQKPiBoZXJlLiBJIGFsc28gc2VlIHRoYXQgYXJtX2Z2cF9lYmJyX2RlZmNvbmZpZyB1c2VzIFRG
LUEgdjIuMTEgWzFdCj4gYnV0IGl0cyBwYXRjaCBkaXJlY3RvcnkgWzJdIGRvZXMgbm90IGluY2x1
ZGUgYW4gZW50cnkgZm9yIGl0Lgo+IEkgYmVsaWV2ZSBpdCB3YXMgbWlzc2luZyBhbmQgd2FzIHVz
aW5nIHRoZSBoYXNoIGZpbGUgSSByZW1vdmVkLgo+IFRoaXMgZGVmY29uZmlnIG1pZ2h0IGJlIGJy
b2tlbiBub3cuIENvdWxkIHlvdSBkb3VibGUgY2hlY2sgdGhhdAo+IHBsZWFzZT8gWW91IG1pZ2h0
IG5lZWQgdG8gYWRkIGJhY2sgYSBoYXNoIGZpbGUgaW4geW91ciBib2FyZAo+IHBhdGNoIGRpcmVj
dG9yeSAoZXZlbiBpZiBpdCdzIGZvciBhbiB1cGRhdGVkIHYyLjEyIHZlcnNpb24pLgoKVGhhbmtz
IGZvciBwb2ludGluZyB0aGF0IG91dCEKCkkgc2VlIG5vdCBvbmUgYnV0IHR3byBkZWZjb25maWdz
IHVzaW5nIFRGLUEgdjIuMTEgd2l0aG91dCBhCmNvcnJlc3BvbmRpbmcgaGFzaCBmaWxlIG5vdzoK
CiAgYXJtX2Z2cF9lYmJyX2RlZmNvbmZpZwogIHJvY2twcm82NF9kZWZjb25maWcKCkkgd2lsbCBz
ZW5kIHBhdGNoZXMgdG8gYWRkIGhhc2ggZmlsZXMgdG8gYm90aCBzb29uLgoKRm9ydHVuYXRlbHkg
SSB0aGluayB0aGVyZSBpcyBubyB1cmdlbmN5LCBhcyB3aXRoIHRob3NlIGRlZmNvbmZpZ3MgVEYt
QQpkb2VzIGluZGVlZCBzdGlsbCBleHRyYWN0IGZpbmUgYW5kIGFsbCB3ZSBnZXQgZm9yIG5vdyBp
cyBhIHdhcm5pbmc6CgogIFdBUk5JTkc6IG5vIGhhc2ggZmlsZSBmb3IgYXJtLXRydXN0ZWQtZmly
bXdhcmUtdjIuMTEtZ2l0NC50YXIuZ3oKClRoaXMgaXMgYXJndWFibHkgYSBiaXQgb2YgYSBzdXJw
cmlzaW5nIGJlaGF2aW91ciB3aGVuIHdlIGhhdmUKQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hB
U0hFUz15Li4uCgpCZXN0IHJlZ2FyZHMsClZpbmNlbnQuCgo+IAo+IEJlc3QgcmVnYXJkcywKPiAK
PiBKdWxpZW4uCj4gCj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC8tL2Jsb2IvbWFzdGVyL2NvbmZpZ3MvYXJtX2Z2cF9lYmJyX2RlZmNvbmZpZyNMMjAKPiBb
Ml0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vdHJlZS9tYXN0
ZXIvYm9hcmQvYXJtL2Z2cC1lYmJyL3BhdGNoZXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
