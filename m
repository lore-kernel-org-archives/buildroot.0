Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD5FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 08:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CA4781B52;
	Mon,  9 May 2022 08:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FnMQtfyjceF5; Mon,  9 May 2022 08:20:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50B4D81B35;
	Mon,  9 May 2022 08:20:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1298D1BF3BC
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 08:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E93A409FC
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 08:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=freenet.de
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 11vm2vNZDp8U for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 08:20:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout1.freenet.de (mout1.freenet.de [IPv6:2001:748:100:40::2:3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04309400EF
 for <buildroot@buildroot.org>; Mon,  9 May 2022 08:20:15 +0000 (UTC)
Received: from [195.4.92.123] (helo=sub4.freenet.de)
 by mout1.freenet.de with esmtpa (ID earthquake.de@freenet.de) (port 25) (Exim
 4.94.2 #2) id 1nnycj-005MZV-W3; Mon, 09 May 2022 10:20:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de; 
 s=mjaymdexmjqk;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DcoSRpTCXj21LUU223F/Zvil6hp3u8TYGit7/lOqLlQ=; b=JMON1CgZSNF07SaqbCZ0F8vKS/
 Cv65V4n9vlZLW7J7YNvpA/7McDjXjVCju54IkjxkwMlsweoQ7Vz65yQlRJoaMZAF13YAwbj+1127E
 oqlaeYPzemk3rdEf6T7YVKqkupedgHtHJNQG4h4WqCryG4LDKYIuklW0G8k3YcwjDoKypvgenCl7z
 qD/iXwlIYvTnv8kvFQcyq9d9ChFVp/sseyrSZ9oeAmx+t0sA0pPbVlDXj9lqmGhxIxwXURjxyhD5t
 u+ILX+EszBJR7MvecGWwmQHuJuO6iyRJfA/SY/tqPJzr1Se0Y6qyP+vT/JIzsMv002U5FAMuEtqOi
 wZo6zeeg==;
Received: from ipbcc0e031.dynamic.kabel-deutschland.de ([188.192.224.49]:57139
 helo=[192.168.0.12])
 by sub4.freenet.de with esmtpsa (ID earthquake.de@freenet.de)
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim
 4.94.2 #2) id 1nnycl-0056Ka-2y; Mon, 09 May 2022 10:20:11 +0200
Message-ID: <a2506be5-73cf-4566-16f0-26f8b06d2b76@freenet.de>
Date: Mon, 9 May 2022 10:20:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Peter Korsgaard <peter@korsgaard.com>
References: <80d6f58b-a36e-6148-c6b6-37a29d3244e5@freenet.de>
 <874k221y8l.fsf@dell.be.48ers.dk>
 <eb164229-ac1c-764a-b9e5-bd86018611ff@freenet.de>
 <87zgjsxujk.fsf@dell.be.48ers.dk>
 <fec240d1-19eb-93fa-24b3-e1292d471605@freenet.de>
 <87a6brhlo3.fsf@dell.be.48ers.dk>
 <7f010cd1-dd28-f72c-7218-623bcdffa4f1@freenet.de>
 <87wnevfbcj.fsf@dell.be.48ers.dk>
From: Alex <earthquake.de@freenet.de>
In-Reply-To: <87wnevfbcj.fsf@dell.be.48ers.dk>
X-Originated-At: 188.192.224.49!57139
X-Scan-TS: Mon, 09 May 2022 10:20:10 +0200
Subject: Re: [Buildroot] buildroot host builds with g++
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkFtIDA5LjA1LjIwMjIgdW0gMDg6NTAgc2NocmllYiBQZXRlciBLb3JzZ2FhcmQ6Cj4+Pj4+PiAi
QWxleCIgPT0gQWxleCAgPGVhcnRocXVha2UuZGVAZnJlZW5ldC5kZT4gd3JpdGVzOgo+IEhpLAo+
Cj4gICA+PiA+IGcrKyBpcyBpbnN0YWxsZWQgb24gbXkgYnVpbGQgbWFjaGluZSB3aGVyZSBJIGNy
ZWF0ZSBteSBidWlsZHJvb3Qgc3lzdGVtLgo+ICAgPj4gPiBUaGUgcHJvamVjdCBjb21waWxlcyBv
dXRzaWRlIG9mIGJ1aWxkcm9vdCBvbiBteSBidWlsZCBtYWNoaW5lLgo+ICAgPj4gPiBEb2VzIGJ1
aWxkcm9vdCBlbnZpcm9ubWVudCBuZWVkIGEgbGluay92YXJpYWJsZSB0byB0aGUgZysrIG9uIHRo
ZQo+ICAgPj4gPiBidWlsdCBtYWNoaW5lPwo+ICAgPj4KPiAgID4+IEFyZSB5b3Ugc3VyZT8gQmFz
ZWQgb24gdGhlIGFib3ZlLCBpdCBkb2Vzbid0IHNvdW5kIGxpa2UgeW91IGhhdmUgYQo+ICAgPj4g
L3Vzci9iaW4vZysrPwo+Cj4gICA+IEltIHN1cmU6ICQ+d2hpY2ggZysrCj4gICA+IMKgwqDCoCDC
oMKgwqAgwqDCoMKgIMKgwqDCoCAvdXNyL2Jpbi9nKysKPgo+ICAgPiBnKysgaXMgYSBsaW5rIHdo
aWNoIHBvaW50cyBvdmVyIGV0Yy9hbHRlcm5hdGl2ZXMgdG8KPiAgID4gL3Vzci9iaW4veDg2XzY0
LWxpbnV4LWdudS1nKystNwo+Cj4gT2ssIHRoZW4geW91IHdpbGwgbmVlZCB0byBsb29rIGNsb3Nl
ciBhdCB0aGUgYnVpbGQgc3lzdGVtIG9mIHRoYXQKPiBwYWNrYWdlIHRvIHVuZGVyc3RhbmQgd2hh
dCBpcyBnb2luZyBvbi4gUGVyaGFwcyBpdCBwbGF5cyBhcm91bmQgd2l0aAo+IExEX0xJQlJBUllf
UEFUSCBvciBzaW1pbGFyPwoKRm91bmQgdGhlIFByb2JsZW0sCmcrKyBpcyBhdmFpbGFibGUgYW5k
IGlzIHVzZWQgY29ycmVjdGx5LgpQcm9ibGVtIGlzOiB0aGUgbGFzdCBidWlsZCBwYXJ0IChjb21w
aWxlIHRoZSBmaWxlcyBuZWVkZWQgdG8gYnVpbGQgdGhlIApleGVjdXRhYmxlLCBub3QgZm9yIHRo
ZSBsaWJzKSB1c2VzIGEgZGVmaW5lIGluIHRoZSBtYWtlIGNhbGwgYW5kIHNldCBpdCAKbGlrZToK
T3V0c2lkZSBvZiBidWlsZHJvb3QgaXMgc2V0IGxpa2U6IC1EVEFPX0lETF9QUkVQUk9DRVNTT1I9
XCJnKytcIgpJbnNpZGUgaG9zdCBidWlsZGluZyBpcyBzZXQgd2l0aDogCi1EVEFPX0lETF9QUkVQ
Uk9DRVNTT1I9XCI8bXlob21lPi9idWlsZHJvb3QtMjAyMS4wMi45L291dHB1dC9ob3N0L2Jpbi9j
Y2FjaGUgCi91c3IvYmluL2crK1wiCgpQYXNzaW5nIHRoYXQgZW5kcyB3aXRoIGcrKzogZXJyb3I6
IC91c3IvYmluL2crKyI6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKClBhc3NpbmcgVEFPX0lE
TF9QUkVQUk9DRVNTT1Igd2l0aCB0aGUgYnVpbGRyb290IGhvc3QgY3h4IGNvbXBpbGUgd2lsbCAK
c3VjY2Vzc2Z1bGwgZmluaXNoLgpJcyB0aGVyZSBhIHZhcmlhYmxlIHNwZWNpZnkgdGhlIGNvbXBp
bGllciB3aXRoIHRoZSBjb21wbGV0ZSBwYXRoIHRoYXQgaSAKY2FuIHBhc3MgdG8gdGhlIGRlZmlu
ZT8gKEJUVzogSXMgdGhlcmUgYW4gb3ZlcnZpZXcgb3ZlciBhbGwgCmRlZmluZWQvYXZhaWxhYmxl
IHZhcmlhYmxlcz8pCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
