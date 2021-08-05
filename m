Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00524C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 07:00:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EA596105A
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 07:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EA596105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A00283684;
	Thu,  5 Aug 2021 07:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ky9B5rdYugHq; Thu,  5 Aug 2021 07:00:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53C9483490;
	Thu,  5 Aug 2021 07:00:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4AE31BF331
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 07:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3D8B40286
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 07:00:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tqxc-ulrX2C6 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 07:00:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FD884027A
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 07:00:48 +0000 (UTC)
Received: from smtpclient.apple ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPA
 id BXN0mSU39xC2nBXN0mMUgK; Thu, 05 Aug 2021 09:00:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628146846; bh=2DBmwwpMEGiKcmVBg8oK9LzD/7QSy5JHTc+ZkuaFIaI=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=mh2MSDOdallGQKVqWFfYqDIasI/Avksly5XBFoa9nZM8p8m9r3GoWuUmCDNbBcb6K
 gIT/cTOx9XOnpqmqRmo49Hb+O8mzuBXIAF5oIw9WijfCxfJNj/Dz32XDsf9/qMc12r
 Jsm6kTIkldCAz8F7s74R8sT69FA70BpjDZxC2FXd/H4MQvBRNSM9Xspb1GGWwmVhMf
 lzO1gc9/oFmbrDm8aEOVoeOBZRBO4O/iG6EvRTs0RyhssARXrCWndSC6RLzqnjvBPS
 gePi/bDvl/AAaigHanOrpVzCljxAkgB8mP2UuPiTCmAuTu8DUkUBABwPaBknnzTWNH
 MqQ78YwcgQwgw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 5 Aug 2021 09:00:46 +0200
Message-Id: <0D65A15D-357A-4CCC-8FAD-8F83DB6A2E8A@benettiengineering.com>
References: <c7c2a618-924a-edbe-02c1-7862520e954c@mind.be>
In-Reply-To: <c7c2a618-924a-edbe-02c1-7862520e954c@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: iPhone Mail (18F72)
X-CMAE-Envelope: MS4wfJTnF67hn7cS/VZInhnLkNVxwiHKRgKTGxwLV/nDdzBnw4xHnrxSZiBd7F0PuoT7gr58bp73BpJZfw86k4RJSLhkLoRIemkswi6KxuXfMbeiOac6oAtc
 i9jNEFblGS3l1RqAnyuUoUwWztmjaLuHOIJgEIobg1eEwALRopd3hiFtE/p66oKjsi8S1uB4i/Q4QZtxU1vhklQ6tZYeFKnDJTvyIOlz5w3iHAVW1rlqsYN3
 ikI8ML1Bz4G0nlp/kqYveMUBTLRX3iJRzimKapvjWac=
Subject: Re: [Buildroot] [PATCH] package/libfuse3: fix build failure on
 Microblaze due to wrong symver attribute detection
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Cj4gSWwgZ2lvcm5vIDQgYWdvIDIwMjEsIGFsbGUgb3JlIDIyOjU4LCBBcm5vdXQgVmFuZGVjYXBw
ZWxsZSA8YXJub3V0QG1pbmQuYmU+IGhhIHNjcml0dG86Cj4gCj4g77u/Cj4gCj4+IE9uIDA0LzA4
LzIwMjEgMDA6NDEsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+PiBBZGQgYSBwYXRjaCB0byBmaXgg
c3ltdmVyIHdyb25nIGRldGVjdGlvbi4gQXMgZXhwbGFpbmVkIGludG8gdGhlIHBhdGNoCj4+IHBl
bmRpbmcgdXBzdHJlYW1bMV0gX19oYXMgYXR0cmlidXRlKCkgZ2l2ZXMgZmFsc2UgcG9zaXRpdmUg
d2hlbiBhbgo+PiBhdHRyaWJ1dGUgaXMgbm90IHN1cHBvcnRlZFsyXSBhbmQgdGhpcyBsZWFkcyB0
byBhc3N1bWluZyBzeW12ZXIgYXR0cmlidXRlCj4+IGlzIHByZXNlbnQgYnV0IGl0J3Mgbm90LiBU
aGlzIGNvbnNlcXVlbnRlbHkgbGVhZHMgdG8gYnVpbGQgZmFpbHVyZS4gSS5lLgo+PiBNaWNyb2Js
YXplIGRvZXNuJ3QgcmVhbGx5IHN1cHBvcnQgaXQgc2luY2UgaXQgZG9lc24ndCBpbmNsdWRlIGlu
Y2x1ZGUKPj4gZWxmb3MuaCBpbiBjb25maWcuZ2NjIHRoYXQgZGV0ZXJtaW5lIHN5bXZlciB0byBi
ZSBhdmFpbGFibGUuCj4+IAo+PiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9saWJmdXNlL2xpYmZ1
c2UvcHVsbC82MjAKPj4gWzJdOiBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVn
LmNnaT9pZD0xMDE3NjYKPiAKPiBFeGNlbGxlbnQgZXhwbGFuYXRpb24hClRoYW5rcyBhIGxvdCA6
LSkKPiAKPiBBcHBsaWVkIHRvIG1hc3RlciAoYWZ0ZXIgYWRkaW5nIHRoZSBGaXhlczogbGluZSks
IHRoYW5rcy4KPiAKPiBSZWdhcmRzLAo+IEFybm91dAo+IAo+PiAKPj4gU2lnbmVkLW9mZi1ieTog
R2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4+
IC0tLQo+PiAuLi5vbi5idWlsZC1maXgtd3JvbmctLnN5bXZlci1kZXRlY3Rpb24ucGF0Y2ggfCA2
MSArKysrKysrKysrKysrKysrKysrCj4+IDEgZmlsZSBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCsp
Cj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmZ1c2UzLzAwMDEtbWVzb24uYnVpbGQt
Zml4LXdyb25nLS5zeW12ZXItZGV0ZWN0aW9uLnBhdGNoCj4+IAo+PiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJmdXNlMy8wMDAxLW1lc29uLmJ1aWxkLWZpeC13cm9uZy0uc3ltdmVyLWRldGVjdGlv
bi5wYXRjaCBiL3BhY2thZ2UvbGliZnVzZTMvMDAwMS1tZXNvbi5idWlsZC1maXgtd3JvbmctLnN5
bXZlci1kZXRlY3Rpb24ucGF0Y2gKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAw
MDAwMDAwMC4uZGEyMGMyNmYxOQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3BhY2thZ2UvbGli
ZnVzZTMvMDAwMS1tZXNvbi5idWlsZC1maXgtd3JvbmctLnN5bXZlci1kZXRlY3Rpb24ucGF0Y2gK
Pj4gQEAgLTAsMCArMSw2MSBAQAo+PiArRnJvbSAzYWJhMDlhNWM1NmUwMTc3NDZjNWMxNjUyZGJj
ODQ1ZjRkYjczNzRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+PiArRnJvbTogR2l1bGlvIEJl
bmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4+ICtEYXRlOiBU
dWUsIDMgQXVnIDIwMjEgMjM6Mzk6NDYgKzAyMDAKPj4gK1N1YmplY3Q6IFtQQVRDSF0gbWVzb24u
YnVpbGQ6IGZpeCB3cm9uZyAuc3ltdmVyIGRldGVjdGlvbgo+PiArCj4+ICtBcyBwb2ludGVkIGhl
cmUgWzFdIF9faGFzX2F0dHJpYnV0ZSgpIGlzIGJyb2tlbiBmb3IgbWFueSBhdHRyaWJ1dGVzIGFu
ZAo+PiAraWYgaXQgZG9lc24ndCBzdXBwb3J0IHRoZSBzcGVjaWZpYyBhdHRyaWJ1dGUgaXQgcmV0
dXJucyB0cnVlLCBzbyB3ZQo+PiArY2FuJ3QgcmVhbGx5IHJlbHkgb24gdGhhdCBmb3IgdGhpcyBj
aGVjay4gVGhpcyBsZWFkIHRvIEJ1aWxkcm9vdAo+PiArbGliZnVzZTMgYnVpbGQgZmFpbHVyZSBb
Ml0gd2hlcmUgdGhhdCBzaG93cyB1cCB3aXRoOgo+PiArYGBgCj4+ICtlcnJvcjogc3ltdmVyIGlz
IG9ubHkgc3VwcG9ydGVkIG9uIEVMRiBwbGF0Zm9ybXMKPj4gK2BgYAo+PiArSW5kZWVkIE1pY3Jv
YmxhemUgZG9lc24ndCBzdXBwb3J0IEVMRiBzaW5jZSBpdCBkb2Vzbid0IGluY2x1ZGUgZWxmb3Mu
aCwKPj4gK2J1dCBfX2hhc19hdHRyaWJ1dGUoc3ltdmVyKSByZXR1cm5zIHRydWUuCj4+ICsKPj4g
K1NvIGxldCdzIHN1YnN0aXR1dGUgdGhlICNpZmRlZiBfX2hhc19hdHRyaWJ1dGUoKSB3aXRoIGEg
c3Ryb25nZXIgdGVzdCBvbgo+PiArYSBmdW5jdGlvbiBmb28oKSB3aXRoIF9fYXR0cmlidXRlX18o
KHN5bXZlciAoInRlc3RAVEVTVCIpKSkuCj4+ICsKPj4gK1sxXTogaHR0cHM6Ly9nY2MuZ251Lm9y
Zy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTAxNzY2Cj4+ICtbMl06IGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2Q2Yy9kNmNmYWYyYWFmYWVkYTNjMTJkMTI3ZjZhMmQy
ZTE3NWIyNWU2NTRmL2J1aWxkLWVuZC5sb2cKPj4gKwo+PiArU2lnbmVkLW9mZi1ieTogR2l1bGlv
IEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4+ICstLS0K
Pj4gKyBtZXNvbi5idWlsZCB8IDE2ICsrKysrKystLS0tLS0tLS0KPj4gKyAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+PiArCj4+ICtkaWZmIC0tZ2l0IGEv
bWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAo+PiAraW5kZXggYjAyNTBlZS4uYTcyODFmMyAxMDA2
NDQKPj4gKy0tLSBhL21lc29uLmJ1aWxkCj4+ICsrKysgYi9tZXNvbi5idWlsZAo+PiArQEAgLTk2
LDIwICs5NiwxOCBAQCBlbmRpZgo+PiArICMgdG8gaGF2ZSBfX2hhc19hdHRyaWJ1dGUsIHRoZW4g
dGhleSBhcmUgdG9vIG9sZCB0byBzdXBwb3J0IHN5bXZlcikKPj4gKyAjIG90aGVyIGNvbXBpbGVy
cyBtaWdodCBub3QgaGF2ZSBfX2hhc19hdHRyaWJ1dGUsIGJ1dCBpbiB0aG9zZSBjYXNlcwo+PiAr
ICMgaXQgaXMgc2FmZSBmb3IgdGhpcyBjaGVjayB0byBmYWlsIGFuZCBmb3IgdXMgdG8gZmFsbGJh
Y2sgdG8gdGhlIG9sZCBfYXNtXwo+PiArLSMgbWV0aG9kIGZvciBzeW12ZXIKPj4gKysjIG1ldGhv
ZCBmb3Igc3ltdmVyLiBBbnl3YXkgdGhlIGF0dHJpYnV0ZXMgbm90IHN1cHBvcnRlZCBieSBfX2hh
c19hdHRyaWJ1dGUoKQo+PiArKyMgdW5mb3J0dW5hdGVseSByZXR1cm4gdHJ1ZSBnaXZpbmcgYSBm
YWxzZSBwb3NpdGl2ZS4gU28gbGV0J3MgdHJ5IHRvIGJ1aWxkCj4+ICsrIyB1c2luZyBfX2F0dHJp
YnV0ZV9fICgoc3ltdmVyICkpIGFuZCBzZWUgdGhlIHJlc3VsdC4KPj4gKyBjb2RlID0gJycnCj4+
ICstI2lmIGRlZmluZWQgX19oYXNfYXR0cmlidXRlCj4+ICstIyBpZiAhX19oYXNfYXR0cmlidXRl
IChzeW12ZXIpCj4+ICstIyBlcnJvciBzeW12ZXIgYXR0cmlidXRlIG5vdCBzdXBwb3J0ZWQKPj4g
Ky0jIGVuZGlmCj4+ICstI2Vsc2UKPj4gKy0jZXJyb3IgX19oYXNfYXR0cmlidXRlIG5vdCBkZWZp
bmVkLCBhc3N1bWUgd2UgZG8gbm90IGhhdmUgc3ltdmVyCj4+ICstI2VuZGlmCj4+ICsrX19hdHRy
aWJ1dGVfXyAoKHN5bXZlciAoInRlc3RAVEVTVCIpKSkKPj4gKyt2b2lkIGZvbyh2b2lkKSB7Cj4+
ICsrfQo+PiArIAo+PiArIGludCBtYWluKHZvaWQpIHsKPj4gKyAgICAgcmV0dXJuIDA7Cj4+ICsg
fScnJwo+PiArLWlmIGNjLmNvbXBpbGVzKGNvZGUsIGFyZ3M6IFsgJy1PMCcsICctYyddKQo+PiAr
K2lmIGNjLmNvbXBpbGVzKGNvZGUsIGFyZ3M6IFsgJy1PMCcsICctYycsICctV2Vycm9yJ10pCj4+
ICsgICAgICBtZXNzYWdlKCdDb21waWxlciBzdXBwb3J0cyBzeW12ZXIgYXR0cmlidXRlJykKPj4g
KyAgICAgIGFkZF9wcm9qZWN0X2FyZ3VtZW50cygnLURIQVZFX1NZTVZFUl9BVFRSSUJVVEUnLCBs
YW5ndWFnZTogJ2MnKQo+PiArIGVsc2UKPj4gKy0tIAo+PiArMi4yNS4xCj4+ICsKPj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
