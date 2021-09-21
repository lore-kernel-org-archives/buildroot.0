Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF86C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 07:12:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A983E6115B
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 07:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A983E6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54FFE82F98;
	Tue, 21 Sep 2021 07:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TtulHyGy2E4H; Tue, 21 Sep 2021 07:12:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B382282F87;
	Tue, 21 Sep 2021 07:12:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5531BF2CB
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 07:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 833A840114
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 07:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cD3fsEE2rj0Y for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 07:12:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3509400C9
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 07:12:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FA32611C5;
 Tue, 21 Sep 2021 07:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632208370;
 bh=DXJ3dlD9PqoSHDI6yUahC/H31G6OTz8Xqh1csKxyMLY=;
 h=In-Reply-To:References:Subject:Cc:To:From:Date:From;
 b=dqrdN3hQYMh4/qN5Vzyhz0ZnWU1QTmhHXFbWL/ZhyN+PowT93kLO5N65eT33wg7ii
 QqXsd1pg5mB7DJUlcdnyDkQ+Q5nAd2g3ZlPOTTfPdVc+fJjireyII78PwkcRW5g8EV
 l6MSNPvNcfG55UtvRbEZqlWvTXOtpD0GNwCWIDiEqKpGWe3QgJW5JmP2ShmcJ2F76o
 6UoGe9rLIoYdq/Yi/z733NW4uqwYhWRpuptt8FxwEqhULPJTI94QTkkOUhpirSQn7P
 5b+6X83KuA/WYZ7Dc3pWwwWrk9D6xbRpTfstuQu0Go4XxRpyp4jowaSzlXTohGaC8k
 /p1sRLC5O+UzA==
MIME-Version: 1.0
In-Reply-To: <CAJPV9MqsdZa5oCYSE-+ZsNi4w1w8CWVeUPd4CohXddt5pcr7zQ@mail.gmail.com>
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <163189935709.536094.10717640766848618610@kwain>
 <CAJPV9MrYNwrrZ34-JgRPO62Y_6yT0HZ564YuB_qFKYdsRo7nXQ@mail.gmail.com>
 <163213021612.4283.1135197152174473636@kwain>
 <CAJPV9Mphsf6BhYHhsD7BFRXms2Psbi0xFX9SUaBbyu40iZCecQ@mail.gmail.com>
 <163214406368.4283.14394760824414034461@kwain>
 <CAJPV9MrgZcVw3cmO1+w_zn6M2yub+nCZ73H_YJ0g=OTpuu1MeA@mail.gmail.com>
 <163214596519.4283.5229631383777844599@kwain>
 <CAJPV9MqsdZa5oCYSE-+ZsNi4w1w8CWVeUPd4CohXddt5pcr7zQ@mail.gmail.com>
To: José Pekkarinen <jose.pekkarinen@unikie.com>
From: Antoine Tenart <atenart@kernel.org>
Message-ID: <163220836697.4283.6363157164675068449@kwain>
Date: Tue, 21 Sep 2021 09:12:46 +0200
Subject: Re: [Buildroot] [PATCH] package/refpolicy: Treat all modules as
 custom
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

UXVvdGluZyBKb3PDqSBQZWtrYXJpbmVuICgyMDIxLTA5LTIxIDA4OjI5OjM4KQo+ICAgIE9uIE1v
biwgU2VwIDIwLCAyMDIxIGF0IDQ6NTIgUE0gQW50b2luZSBUZW5hcnQgPFsxXWF0ZW5hcnRAa2Vy
bmVsLm9yZz4KPiAgICB3cm90ZToKPiAKPiAgICAgIFJlcHJvZHVjaW5nIGxvY2FsbHkgdGhlIG1v
ZHVsZXMgd2VyZSBjb3JyZWN0bHkgbGlzdGVkIGFuZCBlbmFibGVkLgo+ICAgICAgSG93ZXZlciBs
b29raW5nIGF0IHRoZSBtb2R1bGVzLmNvbmYgZ2VuZXJhdGVkIG9uIHlvdXIgbWFjaGluZSwgeW91
cgo+ICAgICAgbW9kdWxlcycgZG9jdW1lbnRhdGlvbiBpcyBpbmNsdWRlZCBidXQgdGhlIG1vZHVs
ZXMgYXJlbid0IGVuYWJsZWQgKGFzCj4gICAgICBtb2R1bGVzKSBieSBkZWZhdWx0LiBUaGVyZSBt
aWdodCBiZSBzb21lIHJ1bGVzIGluIHRoZSByZWZwb2xpY3kgYnVpbGQKPiAgICAgIHN5c3RlbSB0
aGF0IGNhbiBleHBsYWluIHN1Y2ggYSBkaWZmZXJlbmNlLgo+IAo+ICAgICAgSSB0aGluayB0aGUg
aXNzdWUgY29tZXMgZG93biB0byB1bmRlcnN0YW5kaW5nIGhvdyBtb2R1bGVzIGFyZSBzZWxlY3Rl
ZAo+ICAgICAgdG8gYmUgZW5hYmxlZCBieSBkZWZhdWx0IChvciBub3QgZW5hYmxlZCksIGFuZCB3
aHkgeW91ciBtb2R1bGVzIGFyZQo+ICAgICAgaW1wYWN0ZWQuIChUaGVuIHRoZXJlIG1pZ2h0IGJl
IHNvbWV0aGluZyB0byBpbXByb3ZlIGluIEJ1aWxkcm9vdCkuCj4gCj4gICAgQ2FuIHRoaXMgYmUg
dGhhdCBJJ20gd29ya2luZyB3aXRoIGFuIG91dCBvZiBkYXRlIHZlcnNpb24gb2YgYnVpbGRyb290
Pwo+IAo+ICAgIE15IHByb2plY3Qgd2FzIHN0YXJ0ZWQgd2l0aCAyMDIxLjAyIGFuZCBJIG9ic2Vy
dmUgdGhlIHJlZnBvbGljeSBkYXRlcyBmcm9tCj4gICAgQXVndXN0IGxhc3QgeWVhci4gSSBwbGFu
IHRvIHN0YXJ0IHRoZSB3b3JrcyBvbiBmaXhpbmcgdGhpcywgc2luY2UgaXQKPiAgICBpbXBhY3Rz
IGFueSBzb3J0IG9mIHVwc3RyZWFtaW5nLgoKWW91IGNhbiB0cnkgd2l0aCBhIG5ld2VyIHZlcnNp
b24gb2YgcmVmcG9saWN5LCBpbiBjYXNlIHRoZXkgZGlkIGZpeCBhCmJ1ZyByZWxhdGVkIHRvIHRo
aXM7IGl0J3MgYSBnb29kIGZpcnN0IHRlc3QgdG8gbWFrZS4gQnV0IHRoZXJlIGFyZQpjaGFuY2Vz
IHRoaXMgaXMgZHVlIHRvIGhvdyBtb2R1bGVzIGFyZSBzZWxlY3RlZCBieSBkZWZhdWx0LCB0aGVy
ZSBtaWdodApiZSBzb21lIGV4dHJhIGxvZ2ljIHdlIGRvbid0IGtub3cgYWJvdXQuCgpUaGFua3Ms
CkFudG9pbmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
