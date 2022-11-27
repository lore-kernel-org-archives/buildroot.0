Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992E5C43217
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 08:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37C7E405F7;
	Sun, 27 Nov 2022 08:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37C7E405F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ns1CR9NMaGee; Sun, 27 Nov 2022 08:13:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45A1140292;
	Sun, 27 Nov 2022 08:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45A1140292
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B87FA1BF470
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 08:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93C2960615
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 08:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93C2960615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9K4XE3A2YltF for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 08:13:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC079605EA
Received: from aven.230ruedubac.fr (aven.230ruedubac.fr [163.172.52.73])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC079605EA
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 08:13:52 +0000 (UTC)
Received: from aven.230ruedubac.fr (localhost [127.0.0.1])
 by aven.230ruedubac.fr (230ruedubac.fr domain) with ESMTP id 1424356528E
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 08:13:51 +0000 (UTC)
Received: from knet.local (knet.230ruedubac.fr [45.83.230.42])
 by aven.230ruedubac.fr (230ruedubac.fr domain) with ESMTPS id 1003F564F95
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 08:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by knet.local (Postfix) with ESMTP id EBFE711E96
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 09:13:50 +0100 (CET)
Received: from knet.local ([127.0.0.1])
 by localhost (knet.local [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ltklZVdUvKL for <buildroot@buildroot.org>;
 Sun, 27 Nov 2022 09:13:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by knet.local (Postfix) with ESMTP id 0F52B11E9F
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 09:13:49 +0100 (CET)
Received: from [192.168.200.169] (nb043690.eth.internal [192.168.200.169])
 by knet.local (Postfix) with ESMTPSA id EA68311E96
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 09:13:48 +0100 (CET)
Message-ID: <1671592a-0bf8-d5a9-e58f-97806cf60372@230ruedubac.fr>
Date: Sun, 27 Nov 2022 09:13:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: nl-BE
To: buildroot@buildroot.org
References: <20221126215436.2078346-1-davidb@230ruedubac.fr>
From: David Barbion <davidb@230ruedubac.fr>
In-Reply-To: <20221126215436.2078346-1-davidb@230ruedubac.fr>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=230ruedubac.fr; s=mail; t=1669536831;
 bh=L5cozfKdDn2FoFB8YaOqdNVZsSXRjIi6smHEBfjHwGg=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=JSJVE+lhKW2rPFbfWSo7y3HrzHp6AcqAiDlxc5lMhY2E6/cFRvRcHRj67ipaRnRfq
 qtCgDRa6x/wqPc7X081fdfkW4ZkvdE2OMERFDpUFR5XRIG/cRBVLb5fHNA+m3vXxjH
 GmBrqJOYxNJczsk5it3KeWLPWrQZDj1gnMZtT/mQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=230ruedubac.fr header.i=@230ruedubac.fr
 header.a=rsa-sha256 header.s=mail header.b=JSJVE+lh
X-Mailman-Original-Authentication-Results: aven.230ruedubac.fr;
 dmarc=fail (p=none dis=none)
 header.from=230ruedubac.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/x265: fix armv6 cross
 compilation issue
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

SGVsbG8sCgpTb3JyeSBmb3IgZGlzdHVyYmFuY2UsIHRoaXMgcGF0Y2ggbWFrZXMgY29tcGlsYXRv
biBvbiBuZW9uIGNwdSBmYWlsLgpJJ3ZlIHB1c2hlZCBhIG5ldyBwYXRjaCByaWdodCBub3cuCgpM
ZSAyNi8xMS8yMDIyIMOgIDIyOjU0LCBEYXZpZCBCYXJiaW9uIGEgw6ljcml0wqA6Cj4gV2hlbiBy
dW5uaW5nIGEgcHJvZ3JhbSB0aGF0IGRlcGVuZHMgb24geDI2NSwgaXQgY3Jhc2hlcyB3aXRoIHRo
ZQo+IG1lc3NhZ2U6IGlsbGVnYWwgaW5zdHJ1Y3Rpb24KPgo+IFRoZSBwYWNrYWdlIHgyNjUgd2Fz
IGZvcmNpYmx5IGNvbXBpbGVkIHdpdGggdGhlIGdjYyBmbGFnIC1tZnB1PW5lb24gZXZlbgo+IGlm
IHRoZSB0YXJnZXQgQ1BVIGRvZXMgbm90IHN1cHBvcnQgdGhlIG5lb24gaW5zdHJ1Y3Rpb24gc2V0
Lgo+IFRoaXMgZml4IGFkZHMgdGhlIGNtYWtlIGZsYWcgQ1JPU1NfQ09NUElMRV9BUk0gdG8gY29y
cmVjdGx5IHNldCBnY2MgZmxhZ3MKPiB3aGVuIGNvbXBpbGluZyBmb3IgQVJNIGFyY2hpdGVjdHVy
ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEJhcmJpb24gPGRhdmlkYkAyMzBydWVkdWJhYy5m
cj4KPiAtLS0KPiAgIHBhY2thZ2UveDI2NS94MjY1Lm1rIHwgNCArKysrCj4gICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS94MjY1L3gyNjUu
bWsgYi9wYWNrYWdlL3gyNjUveDI2NS5tawo+IGluZGV4IDUxYzM5ZGY0Y2QuLmUzYTRhY2M2ZTUg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS94MjY1L3gyNjUubWsKPiArKysgYi9wYWNrYWdlL3gyNjUv
eDI2NS5tawo+IEBAIC0zNSw0ICszNSw4IEBAIGVsc2UKPiAgIFgyNjVfQ09ORl9PUFRTICs9IC1E
RU5BQkxFX0NMST1PRkYKPiAgIGVuZGlmCj4gICAKPiAraWZlcSAoJChCUjJfYXJtKSQoQlIyX2Fh
cmNoNjQpLHkpCj4gK1gyNjVfQ09ORl9PUFRTICs9IC1EQ1JPU1NfQ09NUElMRV9BUk09MQo+ICtl
bmRpZgo+ICsKPiAgICQoZXZhbCAkKGNtYWtlLXBhY2thZ2UpKQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
