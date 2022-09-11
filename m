Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFA0C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D58F64193F;
	Sun, 11 Sep 2022 09:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D58F64193F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NOMsWRQ42ASF; Sun, 11 Sep 2022 09:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99F354194C;
	Sun, 11 Sep 2022 09:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99F354194C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C2F21BF3D4
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 09:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07AC14058F
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 09:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07AC14058F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLfu3jDdmrF8 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 09:42:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCF7B403E2
Received: from mout1.freenet.de (mout1.freenet.de [IPv6:2001:748:100:40::2:3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCF7B403E2
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 09:41:59 +0000 (UTC)
Received: from [195.4.92.123] (helo=sub4.freenet.de)
 by mout1.freenet.de with esmtpa (ID earthquake.de@freenet.de) (port 25) (Exim
 4.94.2 #2) id 1oXJTO-003JMV-Cs; Sun, 11 Sep 2022 11:41:55 +0200
Received: from ipbcc0e031.dynamic.kabel-deutschland.de ([188.192.224.49]:61141
 helo=[192.168.0.11])
 by sub4.freenet.de with esmtpsa (ID earthquake.de@freenet.de)
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim
 4.94.2 #2) id 1oXJTO-009LOr-FL; Sun, 11 Sep 2022 11:41:54 +0200
Message-ID: <a5f78f21-7b6e-6e68-0104-d51879d82e35@freenet.de>
Date: Sun, 11 Sep 2022 11:41:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: de-DE
To: buildroot@buildroot.org, busybox@busybox.net
References: <661e0716-bbca-eec2-8a4a-0d155edea5c6@freenet.de>
 <c1d1e5ac-efe5-eeff-af5d-dd9d6eae5696@green-communications.fr>
From: Alex <earthquake.de@freenet.de>
In-Reply-To: <c1d1e5ac-efe5-eeff-af5d-dd9d6eae5696@green-communications.fr>
X-FN-MUUID: 16628893149E8ED8AABD1CO
X-Originated-At: 188.192.224.49!61141
X-Scan-TS: Sun, 11 Sep 2022 11:41:54 +0200
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=freenet.de; 
 s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Cc:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=c1T+OpbMaNmMCSWvUa2VZtPYCwb6xubF9LEZiCLVxk4=; b=yMl+Ixbydul1c4sBUqBNGNfQ17
 2jWHPOA1OiozuWIu7lcyzftZ4eKdLwUR0bLk9BQ+hgCHqS4LzlPdmX9xOUhvTrBlfqhev4EH07FXL
 w2+z/Tu194MPQz2iXVBZvcopr4dJXiEUplewIJE3EKqzPuLi472WedisTBt5x2ZwZS3nLbU3zxTsX
 94aCIBD46gFhLdoqrd89PUO8Q8K1vOXwiq7uUBARwHQrO4yXd9O3ah8HgeW4FuvjizED2h3djxTJ2
 osVt3W6ZFIDrJARBzTFQdwxltB1YbiXr+xjMNtPyeSt69NlZ/OnJh6dSbXBCvXVJ+ChvRo0tZqbCE
 SE+xnFFw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de
 header.a=rsa-sha256 header.s=mjaymdexmjqk header.b=yMl+Ixby
Subject: Re: [Buildroot] libstdc++ DSO missing
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

VGhhbmsgeW91IGZvciB5b3VyIGRldGFpbGVkIGV4cGxhbmF0aW9uLgo+IE9uIDA5LzA5LzIwMjIg
MTQ6MzQsIEFsZXggd3JvdGU6Cj4+IEhpLAo+Pgo+PiBJIGludGVyZ3JhdGVkIG15IGFwcGxpY2F0
aW9uIHRvIGJ1aWxkcm9vdC4gQ29tcGxpZSBpcyBzdWNjZXNzZnVsbCBieQo+PiB3aGVuIGxpbmtp
bmcgSSBnZXQgZXJyb3JzOgo+Pgo+PiB4ODZfNjQtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290
L3Vzci9saWI2NC9saWJzdGRjKysuc28uNjogZXJyb3IKPj4gYWRkaW5nIHN5bWJvbHM6IERTTyBt
aXNzaW5nIGZyb20gY29tbWFuZCBsaW5lCj4KPiBUaGlzIGVycm9yIG1lYW5zIHRoYXQ6Cj4gLSB0
aGUgbGlua2VyIGZvdW5kIGEgbGlicmFyeSB3aXRoIGEgRFRfTkVFREVEIGRlcGVuZGVuY3kgb24g
Cj4gbGlic3RkYysrLnNvLjYKPiAtIHRoZSBsaW5rZXIgZm91bmQgbGlic3RkYysrLnNvLjYKPiAt
IHRoZSBsaW5rZXIgaXMgbWlzc2luZyBzeW1ib2xzCj4gLSB0aGUgbGlua2VyIGZvdW5kIHRoZSBt
aXNzaW5nIHN5bWJvbHMgaW4gbGlic3RkYysrLnNvLjYKPiAtIGJ1dCB0aGUgbGlua2VyIGNvbW1h
bmQgbGluZSBkb2VzIG5vdCBpbmNsdWRlIGxpYnN0ZGMrKy5zby42Cj4gLSBzbyB0aGUgbGlua2Vy
IGlzIG5vdCBzdXJlIGlmIHRoZSB1c2VyIGFjdHVhbGx5IGludGVuZGVkIHRvIGxpbmsgd2l0aCAK
PiBsaWJzdGRjKysuc28uNi4KPiAtIHNvIGl0IHJlZnVzZXMgdG8gbGluay4KPgo+IFNpbmNlIGxp
YnN0ZGMrKy5zby42IGlzIHRoZSBDKysgcnVudGltZSBsaWJyYXJ5LCB0aGlzIGVpdGhlciBtZWFu
IHRoYXQ6Cj4gLSB5b3UgYXJlIGxpbmtpbmcgYSBDKysgcHJvZ3JhbSB3aXRoIGxkIG9yIGdjYyBp
bnN0ZWFkIG9mIGcrKwoKWWFwLCBvdXRzaWRlIG9mIGJ1aWxkcm9vdCwgbGlua2luZyBjYWxscyB0
aGUgZysrIGJ1dCB3aGVuIGxpbmtpbmcgaW5zaWRlIApidWlsZHJvb3QswqAgY2FsbHMgdGhlIHg4
Nl82NC1idWlsZHJvb3QtbGludXgtZ251LWxkLApiZWNhdXNlICQoTEQpIGluIHRoZSBtYWtlZmls
ZSBpcyBzZXQgdG8geDg2XzY0LWJ1aWxkcm9vdC1saW51eC1nbnUtbGQgCndpdGhpbiBidWlsZHJv
b3QuCgpJbnNpZGUgdGhlIHBhY2thZ2UgLm1rIGZpbGUgb2YgdGhlIEJVSUxEX0NNRFMgY2FsbHMg
bWFrZToKCiQoTUFLRSkgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpwqAgLUMgJChARCkKClNvIChh
IGtsdWRnZSB0byB0ZXN0KSwgaSByZXBsYWNlZCBpbiB0aGUgTWFrZWZpbGUKJChMRCkKYnkKJChI
T1NUX0RJUikvYmluL3g4Nl82NC1saW51eC1nKysKTm93IGxpbmtpbmcgaXMgc3VjY2Vzc2Z1bGwu
Li4KSXMgdGhlcmUgYSBtb3JlICJlbGVnYW50IiB3YXkgdG8gZG8gdGhpcy4uLj8gTm90IHNvIGEg
a2x1ZGdlIGxpa2UgdGhhdCwgCm1lYW4gc2V0dGluZyB0aGlzIHdpdGhpbiB0aGUgbWsgZmlsZSBi
ZWZvcmUgY2FsbGluZyB0aGUgcHJvamVrdCBtYWtlLi4uCkFuZCBob3cgdG8gc3BlY2lmZXkgJChD
QykgYWxzbyB0byBnKys/PwoKCj4gLSB5b3UgYXJlIGxpbmtpbmcgYSBDIHByb2dyYW0gd2l0aCBh
IEMrKyBsaWJyYXJ5IHRoYXQgcmVxdWlyZXMgCj4gbGlic3RkYysrLnNvLjYsIGluIHRoaXMgY2Fz
ZSB5b3UgbWF5IG5lZWQgLWxzdGRjKysgb24gdGhlIGxpbmtlciAKPiBjb21tYW5kIGxpbmUuCj4K
Pj4gQXJlIGxpYnJhcmllcyBtaXNzaW5nIGZyb20gYnVpbGRyb290IGVudmlyb25tZW50Pwo+Cj4g
Tm8sIG9ubHkgdGhlIGxpbmtlciBjb21tYW5kIGxpbmUgaXMgaW5jb3JyZWN0Lgo+Cj4+IEFkZGl0
aW9uYWwgSSBnZXQgd2FybmluZ3MgdGhhdCBzb21lIC5zbyBmaWxlcyBub3QgZm91bmQsIGJ1dCB0
aGV5IGFyZQo+PiBhdmFpbGFibGUgaW4gb3V0cHV0L2J1aWxkLzxUb29sPi9saWIKPgo+IFRoZSBj
b21waWxlciB3aWxsIG9ubHkgc2VhcmNoIGxpYnJhcmllcyBpbiBvdXRwdXQvc3RhZ2luZy9saWIg
b3IgCj4gb3V0cHV0L3N0YWdpbmcvdXNyL2xpYi4KPiBUaGUgcGFja2FnZSBmb3IgPFRvb2w+IHNo
b3VsZCBpbnN0YWxsIHRoZSBsaWJyYXJpZXMgdGhlcmUsIHNvIHRoYXQgCj4gb3RoZXIgcHJvZ3Jh
bXMgY2FuIGxpbmsgd2l0aCB0aGVtLiBUaGlzIGlzIGRvbmUgYnkgcHV0dGluZwo+Cj4gPFRPT0w+
X0lOU1RBTExfU1RBR0lORyA9IFlFUwo+Cj4gaW4gaXRzIC5tayBmaWxlLsKgIElmIDxUb29sPiBp
cyBhIGdlbmVyaWMtcGFja2FnZSAoYW5kIG5vdCBhIAo+IGF1dG90b29scy9tZXNvbi9jbWFrZSBw
YWNrYWdlKSwgdGhlbiB5b3UgYWxzbyBuZWVkIHRvIG1hbnVhbGx5IGV4cGxhaW4gCj4gaG93IHRv
IGluc3RhbGwgbGlicmFyaWVzIHRvICQoU1RBR0lOR19ESVIpL2xpYjoKCkluZGVlZCBJIGZvcmdv
dCBvbmUgb2YgdGhlIC5zbyB0byBiZcKgIGluc3RhbGxlZCB0byBzdGFnaW5nLiBBZnRlciBhZGRp
bmcgCnRoaXMgYW5kIGFwcGVuZCB0byB0aGUgJChNQUtFKSBjYWxsIHRoZSBMRF9MSUJSQVJZX1BB
VEg9IiQoQEQpLi4vPFRvb2w+L2xpYiIKY29tcGlsZSBhbmQgbGlua2luZyBpcyBzdWNjZXNzZnVs
bC4KCj4KPiBodHRwczovL25pZ2h0bHkuYnVpbGRyb290Lm9yZy9tYW51YWwuaHRtbCNfaW5mcmFz
dHJ1Y3R1cmVfZm9yX3BhY2thZ2VzX3dpdGhfc3BlY2lmaWNfYnVpbGRfc3lzdGVtcyAKPgo+Cj4+
IEJ1dCBJIGluY2x1ZGVkIHRoaXMgcGF0aCBieSAkKEBEKS8uLi88VG9vbD4vbGliCj4KPiBXaGls
ZSBpdCBtYXkgd29yaywgdGhpcyBpcyBhIGtsdWRnZS4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
