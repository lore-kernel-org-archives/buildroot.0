Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14861CD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 12:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCF3D60902;
	Tue, 19 May 2026 12:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DVWnLYUzxJE; Tue, 19 May 2026 12:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E310B60903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779193260;
	bh=W/cwytel934LorLwyt3uiTjz0KLGw+Q4dlb43AA6UeI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=DuXfY+vmYNY4p8sgQPOECYlG0mUZE8QOY+2QniofiSHPEJb97qNd8VwJgdBOI4G6p
	 czsqhtSJczLcARGAXu30NLVFwRo52T0FnNbR5YTrbr60m1EJvKCKcy3lLViwn1VH+K
	 AodAGSupet30VWzH2Sl7hx9mjgSDocDeYDwpVcx2EKqcg6zVGqnQb/qo9ELU93Rjc7
	 j2o+IHiFfzHpgKd0444QizuBQ10y9n6oQC44Y7H2hsr049StkQaBDH8YpsHmp2W8dz
	 vii3aGNw+u3b//sbqBBLinnfNuVbv0Ul8Wsw2jsX/IOgE5ky69Bo+zK3cCJjL1zxf2
	 Bk8y5TQ7jeMuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E310B60903;
	Tue, 19 May 2026 12:20:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE7DE265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 12:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0721403BB
 for <buildroot@buildroot.org>; Tue, 19 May 2026 12:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGxbH4qaDYWz for <buildroot@buildroot.org>;
 Tue, 19 May 2026 12:20:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3BEA40284
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3BEA40284
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3BEA40284
 for <buildroot@buildroot.org>; Tue, 19 May 2026 12:20:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 779F0B97BE3F; Tue, 19 May 2026 14:20:54 +0200 (CEST)
Message-ID: <3e430879-8507-47b3-889b-6029ffc3cdd5@rnout.be>
Date: Tue, 19 May 2026 14:20:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <john.ernberg@actia.se>, John Ernberg <j@j-ernberg.se>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20260510193826.2846038-1-j@j-ernberg.se>
 <20260510193826.2846038-9-j@j-ernberg.se>
 <9576707c-2397-4598-b083-fec5a0271d21@rnout.be>
 <0d3ac09e-9899-4cea-b929-f8c866645ff3@actia.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <0d3ac09e-9899-4cea-b929-f8c866645ff3@actia.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779193255; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=PJErMjtvITHDzOKS6i19Xqck8wmV/k2sGyw+xTVhk1c=;
 b=gE2n7UJgbdJ4gPTzpyCjcb0zdS2zuM8E3yJQ1coDcjMSZiUzg8oX/t6kt0eqq8bJ38YBCg
 /XLYPsnayILTkOo7kpucPwC9RY9NRJfHePKhMG0ebTBCtr2P6AnR4QdLZsNLNFx78ZmK6a
 PjcrPCxeNOFfkyRZW9fNp0jADvCm3qwa1FFF4EN5DUxgzQyr8KwfiP4B+vOhllbZGOMzoe
 40HMSIRGolUsMraCBMd2H+JpazB3mm41W4V/r2GqABlaAtpvaN/vaiwh5N8VvSlpUvGqi/
 Xy1P2LzQxJxxNuVP38IzE2T75G5i2S+T1pBNsl50vGVQIh47EmUfx44RC+BaXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=gE2n7UJg
Subject: Re: [Buildroot] [RESEND PATCH 8/8] package/tpm2-tss: Correctly
 depend on util-linux-libs for fapi support
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

CgpPbiAxOS8wNS8yMDI2IDEwOjMwLCBKb2huIEVybmJlcmcgd3JvdGU6Cj4gSGkgQXJub3V0LAo+
IAo+IE9uIDUvMTgvMjYgMTA6MDAgUE0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAxMC8wNS8yMDI2IDIxOjM4LCBKb2huIEVybmJlcmcgd3JvdGU6Cj4+PiB0cG0yLXRz
cyBpcyBhIGRlcGVuZGVuY3kgb2Ygc3lzdGVtZCwgd2hpY2ggd2hlbiBlbmFibGVkIGJlY29tZXMg
YQo+Pj4gZGVwZW5kZW5jeSBvZiB1dGlsLWxpbnV4Lgo+Pj4KPj4+IHRwbTItdHNzIG9ubHkgcmVh
bGx5IHdhbnRzIGxpYnV1aWQsIHNvIGRlcGVuZCBvbiB1dGlsLWxpbnV4LWxpYnMgaW5zdGVhZAo+
Pj4gYnJlYWtpbmcgdGhlIGRlcGVuZGVuY3kgY3ljbGUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
Sm9obiBFcm5iZXJnIDxqQGotZXJuYmVyZy5zZT4KPj4+IC0tLQo+Pj4KPj4+IFJFU0VORDoKPj4+
ICDCoCAtIEZvcmdvdCB0byBzdWJzY3JpYmUgdGhpcyBlLW1haWwgdG8gdGhlIGxpc3QKPj4+Cj4+
PiAgwqAgcGFja2FnZS90cG0yLXRzcy90cG0yLXRzcy5tayB8IDIgKy0KPj4+ICDCoCAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS90cG0yLXRzcy90cG0yLXRzcy5tayBiL3BhY2thZ2UvdHBtMi10c3MvdHBtMi10
c3MubWsKPj4+IGluZGV4IDA4ZmY0MDEzMjguLjExZGEzN2E1YjQgMTAwNjQ0Cj4+PiAtLS0gYS9w
YWNrYWdlL3RwbTItdHNzL3RwbTItdHNzLm1rCj4+PiArKysgYi9wYWNrYWdlL3RwbTItdHNzL3Rw
bTItdHNzLm1rCj4+PiBAQCAtMzMsNyArMzMsNyBAQCBUUE0yX1RTU19DT05GX09QVFMgPSBcCj4+
PiAgwqAgVFBNMl9UU1NfQ09ORl9FTlYgKz0gQ0ZMQUdTPSIkKFRBUkdFVF9DRkxBR1MpIC1zdGQ9
Yzk5Igo+Pj4KPj4+ICDCoCBpZmVxICgkKEJSMl9QQUNLQUdFX1RQTTJfVFNTX0ZBUEkpLHkpCj4+
PiAtVFBNMl9UU1NfREVQRU5ERU5DSUVTICs9IGpzb24tYyBsaWJjdXJsIHV0aWwtbGludXgKPj4+
ICtUUE0yX1RTU19ERVBFTkRFTkNJRVMgKz0ganNvbi1jIGxpYmN1cmwgdXRpbC1saW51eC1saWJz
Cj4+Cj4+ICAgwqBUaGlzIGFsc28gcmVxdWlyZXMgc2VsZWN0aW5nIFVUSUxfTElOVVhfTElCUyBp
biBDb25maWcuaW4sIG90aGVyd2lzZQo+PiB5b3UgZ2V0Cj4+IHRoZSBmb2xsb3dpbmcgZXJyb3Ig
d2hlbiBvbmx5IHRwbTItdHNzIGlzIHNlbGVjdGVkIChhbmQgbm90IGUuZy4gc3lzdGVtZCkuCj4+
Cj4+ICoqKiB1dGlsLWxpbnV4LWxpYnMgaXMgaW4gdGhlIGRlcGVuZGVuY3kgY2hhaW4gb2YgdHBt
Mi10c3MgdGhhdCBoYXMKPj4gYWRkZWQgaXQgdG8KPj4gaXRzIF9ERVBFTkRFTkNJRVMgdmFyaWFi
bGUgd2l0aG91dCBzZWxlY3RpbmcgaXQgb3IgZGVwZW5kaW5nIG9uIGl0IGZyb20KPj4gQ29uZmln
LmluLgo+Pgo+IAo+IEkgZGlkIG5vdCBzZWUgdGhhdCBlcnJvciB3aGVuIEkgd2FzIHRlc3Rpbmcg
bXkgcGF0Y2guIElzIHRoZXJlIHNvbWV0aGluZwo+IHNwZWNpZmljIEkgY2FuIHJ1biB0aGF0IEkg
b3Zlcmxvb2tlZCB0byBiZXR0ZXIgY2F0Y2ggdGhlc2UgdGhpbmdzIGJlZm9yZQo+IHNlbmRpbmcg
dGhlIHBhdGNoZXM/CgogIEluIHRoaXMgY2FzZSBpdCBjb3VsZCBoYXZlIGJlZW4gZG9uZSBieSBl
bmFibGluZyBvbmx5IFRQTTJfVFNTX0ZBUEkgYW5kIApub3RoaW5nIGVsc2UuIEJ1dCBpbiBnZW5l
cmFsIGl0J3Mgbm90IGVhc3kuIEkgZGlzY292ZXJlZCBpdCB0aHJvdWdoIG1hbnVhbCAKcmV2aWV3
IChERVBFTkRFTkNJRVMgc2hvdWxkIG5vcm1hbGx5IGJlIHJlZmxlY3RlZCBleGFjdGx5IGluIENv
bmZpZy5pbikgYW5kIHRoZW4gCnRlc3RlZCB0aGF0IGluZGVlZCB0aGUgZXJyb3IgaGFwcGVucy4K
CiAgUmVnYXJkcywKICBBcm5vdXQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
