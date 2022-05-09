Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BD6C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 06:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BA1B40A14;
	Mon,  9 May 2022 06:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xb0g2UkO2l3f; Mon,  9 May 2022 06:52:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95D5E4028D;
	Mon,  9 May 2022 06:52:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8F201BF284
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 954EA400EF
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:52:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2ePqDMmsd5X for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 06:52:20 +0000 (UTC)
X-Greylist: delayed 00:05:15 by SQLgrey-1.8.0
Received: from mout0.freenet.de (mout0.freenet.de [IPv6:2001:748:100:40::2:2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A57254028D
 for <buildroot@buildroot.org>; Mon,  9 May 2022 06:52:20 +0000 (UTC)
Received: from [195.4.92.122] (helo=sub3.freenet.de)
 by mout0.freenet.de with esmtpa (ID earthquake.de@freenet.de) (port 25) (Exim
 4.94.2 #2) id 1nnxAZ-00ABGS-MZ; Mon, 09 May 2022 08:46:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de; 
 s=mjaymdexmjqk;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EhzDBv6VAg80Sxbh25TRPOGSj1fVpjmW8WH3kvqT7mo=; b=C/EmKkBlEKP4Kn8sNbcZfEZxIv
 ncYwr0DV99bTs5Vue8LI54TCwOnvM6dPXndDvw9W3YMIOBgL3b2mWUYatp+6qa7rL3o7d5HpnM7R4
 gKfie8IV940A/qEjIR3KoWjj8iwGvB7vd02fCezE14SDg5sey8MHKJ3WbHP0gxqvyK1DSyVoxLD72
 GMnnxEJZPMorvul5nOyC0gEAx9oOYKBrJ3sYd5crnX8r9xfEIsgeSjJAY/207+0e8/MQSMrqQYWGm
 gT+DsJz2YGLV4CqHSqMoDXox85vb6U7T9t3g8DsnTZ4S/nRfSt+7mvMcnM+QohxiWUD05LT2n5w1Z
 QfVDdL2Q==;
Received: from ipbcc0e031.dynamic.kabel-deutschland.de ([188.192.224.49]:55849
 helo=[192.168.0.12])
 by sub3.freenet.de with esmtpsa (ID earthquake.de@freenet.de)
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim
 4.94.2 #2) id 1nnxAZ-003bxV-BW; Mon, 09 May 2022 08:46:59 +0200
Message-ID: <7f010cd1-dd28-f72c-7218-623bcdffa4f1@freenet.de>
Date: Mon, 9 May 2022 08:46:56 +0200
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
From: Alex <earthquake.de@freenet.de>
In-Reply-To: <87a6brhlo3.fsf@dell.be.48ers.dk>
X-Originated-At: 188.192.224.49!55849
X-Scan-TS: Mon, 09 May 2022 08:46:59 +0200
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

CkFtIDA4LjA1LjIwMjIgdW0gMjE6MjUgc2NocmllYiBQZXRlciBLb3JzZ2FhcmQ6Cj4+Pj4+PiAi
QWxleCIgPT0gQWxleCAgPGVhcnRocXVha2UuZGVAZnJlZW5ldC5kZT4gd3JpdGVzOgo+IEhpLAo+
Cj4gICA+PiA+IFNvLCBpZiBJIGJ1aWxkIHRoZSBpZGwgY29tcGlsZXIgZm9yIHRoZSB0YXJnZXQs
IGNvbXBpbGUgaXMKPiAgID4+ID4gc3VjY2Vzc2Z1bGwuIChtYWtlIHdpdGggVEFSR0VUX0NPTkZJ
R1VSRV9PUFRTKQo+ICAgPj4gPiBCdXQgYnVpZGluZyBmb3IgdGhlIGhvc3QgKG1ha2Ugd2l0aCBI
T1NUX0NPTkZJR1VSRV9PUFRTKSB0aGUgYnVpbGQKPiAgID4+ID4gZmFpbHMgd2l0aAo+ICAgPj4K
PiAgID4+ID4gIGcrKzogZXJyb3I6IC91c3IvYmluL2crKyI6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkKPiAgID4+Cj4gICA+PiA+IEluIGJ1aWxkcm9vdC1jb25maWcsIEJSMl9UT09MQ0hBSU5f
QlVJTERST09UX0NYWCBpcyBzZXQuCj4gICA+Pgo+ICAgPj4gPiBTbyBob3cgY2FuIEkgZ2V0IGEg
ZysrIGZvciBob3N0IGJ1aWxkaW5nPwo+ICAgPj4KPiAgID4+IFlvdSBuZWVkIHRvIGluc3RhbCBn
Kysgb24geW91ciBidWlsZCBtYWNoaW5lLgo+Cj4gICA+IGcrKyBpcyBpbnN0YWxsZWQgb24gbXkg
YnVpbGQgbWFjaGluZSB3aGVyZSBJIGNyZWF0ZSBteSBidWlsZHJvb3Qgc3lzdGVtLgo+ICAgPiBU
aGUgcHJvamVjdCBjb21waWxlcyBvdXRzaWRlIG9mIGJ1aWxkcm9vdCBvbiBteSBidWlsZCBtYWNo
aW5lLgo+ICAgPiBEb2VzIGJ1aWxkcm9vdCBlbnZpcm9ubWVudCBuZWVkIGEgbGluay92YXJpYWJs
ZSB0byB0aGUgZysrIG9uIHRoZQo+ICAgPiBidWlsdCBtYWNoaW5lPwo+Cj4gQXJlIHlvdSBzdXJl
PyBCYXNlZCBvbiB0aGUgYWJvdmUsIGl0IGRvZXNuJ3Qgc291bmQgbGlrZSB5b3UgaGF2ZSBhCj4g
L3Vzci9iaW4vZysrPwoKSW0gc3VyZTogJD53aGljaCBnKysKIMKgwqDCoCDCoMKgwqAgwqDCoMKg
IMKgwqDCoCAvdXNyL2Jpbi9nKysKCmcrKyBpcyBhIGxpbmsgd2hpY2ggcG9pbnRzIG92ZXIgZXRj
L2FsdGVybmF0aXZlcyB0byAKL3Vzci9iaW4veDg2XzY0LWxpbnV4LWdudS1nKystNwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
