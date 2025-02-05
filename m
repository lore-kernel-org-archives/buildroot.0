Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E47CC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D35C80DB1;
	Wed,  5 Feb 2025 15:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llQWnNpxhNsA; Wed,  5 Feb 2025 15:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B22A80D92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B22A80D92;
	Wed,  5 Feb 2025 15:00:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43A3BCD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 278FA40BA4
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 10J_DkIAdvkg for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:00:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F46441259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F46441259
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F46441259
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:00:12 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 619416029; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 05 Feb 2025 15:00:08 +0000 (UTC)
Message-ID: <da1a07c5-c7bf-42dd-bbce-efbef6bce080@korsgaard.com>
Date: Wed, 5 Feb 2025 16:00:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org, j.neuschaefer@gmx.net
References: <20240704-snooze-v1-1-f9e845f0d813@gmx.net>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240704-snooze-v1-1-f9e845f0d813@gmx.net>
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=c4BpDzvMLUyrFLgDndoMU9K2a6MYqhOIE+g3MH3iFvpH+rkwPwD6uQdckpe9++gCiy7an8wzegikTjAkBc9bwh2p58qqNDtucaC9bDw8r8tePrxFYx9Y/wpgv3wLG0ka/OyL0qNEKWgW6WxAERjQckHy290lv28OCvFrlBfVgAsSjLQxnCw5DDDdyCunjPVbF4G0GpnVe9UQkppQ311fNZ4/fDsfqi5fRAKkPU2F1uhR9o74HLSSxSixP2gl40bpl1e2tRJiXSSJ066TdHovvIlDljyrmzmubPDtIxV4LAFzqgUdtxms3vtuzJKGXd6pz8ZmX2HNlVBxZE5qvfrHCA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Bmighw/P2YLdpr76shOkWAyxT1iP3Hsz5btjEljxTrM=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=c4BpDzvM
Subject: Re: [Buildroot] [PATCH] snooze: new package
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

T24gNy80LzI0IDIxOjQ5LCBKLiBOZXVzY2jDpGZlciB2aWEgYnVpbGRyb290IHdyb3RlOgoKSGVs
bG8sIGFuZCBzb3JyeSBmb3IgdGhlIHNsb3cgcmVzcG9uc2UuCgo+ICsrKyBiL3BhY2thZ2Uvc25v
b3plLzAwMDEtZml4LXNub296ZS1uLWZvcm1hdC1zdHJpbmcucGF0Y2gKPiBAQCAtMCwwICsxLDM4
IEBACj4gK0Zyb20gNWY5ZTYxNmIyOWZlMjcyZmZmYmIzMWU0YjdlYThmZjYxZjc4MTYwMSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogTGVhaCBOZXVraXJjaGVuIDxsZWFoQHZ1eHUu
b3JnPgo+ICtEYXRlOiBXZWQsIDI5IE1heSAyMDI0IDE5OjQyOjI3ICswMjAwCj4gK1N1YmplY3Q6
IFtQQVRDSF0gZml4ICJzbm9vemUgLW4iIGZvcm1hdCBzdHJpbmcKPiArCj4gK0ZpeGVzICMyMi4K
PiArCgpQYXRjaGVzIG5lZWQgc2lnbmVkLW9mZi1ieSB0YWdzIGFzIGZsYWdnZWQgYnkgLi91dGls
cy9jaGVjay1wYWNrYWdlLiBJIApoYXZlIGFkZGVkIHlvdXJzIGZyb20gYWJvdmUuCgo+ICsrKyBi
L3BhY2thZ2Uvc25vb3plL3Nub296ZS5tawo+IEBAIC0wLDAgKzEsMjkgQEAKPiArIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIHNub296ZQo+ICsjCj4gKyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gKwo+ICtTTk9PWkVfVkVSU0lPTiA9IDAuNQo+ICtTTk9PWkVfU0lURSA9ICQoY2Fs
bCBnaXRodWIsbGVhaG5ldWtpcmNoZW4sc25vb3plLHYkKFNOT09aRV9WRVJTSU9OKSkKPiArU05P
T1pFX0xJQ0VOU0UgPSBDQzAtMS4wCj4gKwo+ICsjIFVuZm9ydHVuYXRlbHksIHNub296ZSBkb2Vz
bid0IGhhdmUgYSBkZWRpY2F0ZWQgZmlsZSBmb3IgdGhlIGxpY2Vuc2UsIGJ1dCBpdAo+ICsjIGlz
IG1lbnRpb25lZCBpbiB0aGUgUkVBRE1FIGFuZCBpbiB0aGUgbWFucGFnZS4KPiArU05PT1pFX0xJ
Q0VOU0VfRklMRVMgPSBSRUFETUUubWQKPiArCj4gK1NOT09aRV9NQUtFX09QVFMgPSBcCj4gKwkJ
ICAgUFJFRklYPS8gXAoKVGhlIGRlZmF1bHQgaXMgL3Vzci9sb2NhbC4gQW55IHNwZWNpZmljIHJl
YXNvbiB0byBtYWtlIGl0IC8gaW5zdGVhZCBvZiAKL3Vzcj8gSSBoYXZlIG1hZGUgaXQgL3VzciBm
b3IgY29uc2lzdGVuY3kuCgo+ICsJCSAgIERFU1RESVI9JChUQVJHRVRfRElSKSBcCgpERVNURElS
IGlzIHVzZWQgYXQgaW5zdGFsbGF0aW9uIHRpbWUgYW5kIG5vdCBidWlsZCB0aW1lLCBzbyBJIG1v
dmVkIGl0IAp0byBfSU5TVEFMTF9UQVJHRVRfQ01EUyBzaW1pbGFyIHRvIGhvdyBpdCBpcyBkb25l
IGZvciBhdXRvdG9vbHMgcGFja2FnZXMuCgoKPiArCQkgICBDQz0kKFRBUkdFVF9DQykgXAo+ICsJ
CSAgIExEPSQoVEFSR0VUX0xEKQoKVGhlIE1ha2VmaWxlIGRvZXMgbm90IHVzZSBMRCwgc28gSSBo
YXZlIGRyb3BwZWQgdGhhdC4gSW5zdGVhZCB3ZSBuZWVkIHRvIApwYXNzIFRBUkdFVF9DRkxBR1Mg
YW5kIFRBUkdFVF9MREZMQUdTLCBzbyBJIGhhdmUgYWRkZWQgdGhvc2UuCgoKRmluYWxseSB5b3Ug
Zm9yZ290IHRvIGFkZCB0aGUgcGFja2FnZSB0byB5b3VyIERFVkVMT1BFUlMgZW50cnkuCgpDb21t
aXR0ZWQgd2l0aCB0aGVzZSBmaXhlcywgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJk
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
