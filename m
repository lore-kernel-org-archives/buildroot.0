Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258A0C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 22:36:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97DB560F42
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 22:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97DB560F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6353781016;
	Tue, 31 Aug 2021 22:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULRauTpsRWOK; Tue, 31 Aug 2021 22:36:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED3488101D;
	Tue, 31 Aug 2021 22:36:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 711A51BF5E6
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 22:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 614168101D
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 22:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n34h0JmoOaqp for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 22:36:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0881.aruba.it (smtpcmd0881.aruba.it [62.149.156.81])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9346181016
 for <buildroot@busybox.net>; Tue, 31 Aug 2021 22:36:11 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.10.189])
 by Aruba Outgoing Smtp  with ESMTPSA
 id LCMRmyxaHiG5ULCMRmn0Bi; Wed, 01 Sep 2021 00:36:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630449369; bh=kvJ2FMz1km5M1ZCrkKUMrWcYxutf+iZIj8wPEYuipwg=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=Zp5s5t6Ppebd8SJCfhobryS5H8XXKJ4ipab1FfedpJ1YG8vhAvb/ajJIWPl/jJ2qZ
 xkmaQGMQFNZu/x5JBhy4s2tL/ctWvXsnh0VumEpjDye8jVgMstWqvupwPxtnQKAwqS
 xe5XC/pKUJXDD3OkJQU9RIlLi8HE8QWNZmChXe/ufbF2yH+dA/nHhlVdY04702HYq2
 WYN1AP87Ns2XOxeHytv6iegVhxTojVRPMdVqJryXswmIfK4wjqPQgauoifMngNMrg1
 Ort+SsfbgECYstokqjyVGZVsgwwu+asJ7rHgEZP6wM87jsP5f/ZZliIo3mMuQaP6zQ
 jLvyG9LZ6tLYA==
To: David Corbeil <david.corbeil@dynonavionics.com>, buildroot@busybox.net
References: <CAHth+TX_S-rcD3MLLZ+PZLPWWG8V4p++aRtxsy3ED3_NUoAzTg@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <bcc8e6e7-7d05-a5a9-1f69-e6d758d7fdd3@benettiengineering.com>
Date: Wed, 1 Sep 2021 00:36:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHth+TX_S-rcD3MLLZ+PZLPWWG8V4p++aRtxsy3ED3_NUoAzTg@mail.gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfFGG7PxLPgGz5Mu1Fq2z5f6d8xZ+ciIOzVy04wd8cfOnL7QRK7PBR/wz/fKK4P9WBZ2vB6Zep4u53uiNxyN3ytZ27yLfOw68EzgZL0AHKgpRDDFTmD5/
 pNzJwq/cCYdRUonWUWfk0CNBPXht3pC9vlSUBUxPxnDt28q/gpHbjvwPpG5CKhiFfoIIR1OlmDsjwf1zsQpCmq32MmCjzOT/EFBhvDoFSZ1ke4tC+hC/YhQ4
 z1+Sb5EyUFdxT3s3km2eXg==
Subject: Re: [Buildroot] Buildroot + Rpi4 + Accelerated OpenGL + X11
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgRGF2aWQsCgpPbiA5LzEvMjEgMTI6MDUgQU0sIERhdmlkIENvcmJlaWwgd3JvdGU6Cj4gSGks
Cj4gCj4gCj4gVXNpbmcgQnVpbGRyb290LCBJ4oCZbSB0cnlpbmcgdG8gYnVpbGQgYW4gT1MgdGhh
dCBjYW4gcnVuIG15IE9wZW5HTCAobm90IAo+IEVTKSBhcHAgd2l0aCBhY2NlbGVyYXRlZCAzRCBn
cmFwaGljcy4gSSBhbHNvIHdhbnQgaXQgdG8gdXNlIFgxMSBhcyBhIAo+IGRpc3BsYXkgc2VydmVy
LiBTbyBmYXIgSSBoYXZlbuKAmXQgdHJpZWQgbXkgYXBwIGRpcmVjdGx5IG9uIG15IGJ1aWx0IE9T
IAo+IGJlY2F1c2UgaXQgaGFzIG1hbnkgZGVwZW5kZW5jaWVzIGJ1dCBJ4oCZbSB1c2luZyBnbG1h
cmsyLCBrbXNjdWJlIGFuZCAKPiBnbHhnZWFyIHRvIGRlYnVnIGFuZCB0cnkgb3V0IGRpZmZlcmVu
dCBCdWlsZHJvb3QgY29uZmlndXJhdGlvbnMuCj4gCj4gCj4gSSB0cmllZCB0aGUgL3ZjNC1rbXMt
djNkLXBpNC8gYW5kIC92YzQta21zLXYzZC8gb3ZlcmxheXMgaW4gdGhlIAo+IGNvbmZpZy50eHQs
IGJ1dCBJ4oCZdmUgaGFkIGJldHRlciByZXN1bHRzIHVzaW5nIHRoZSBmb3JtZXIuCj4gCj4gCj4g
U28gZmFyIEkgd2FzIGFibGUgdG8gZ2V0IGdsbWFyazIgdG8gcnVuIGJ1dCBpdCB3YXMgdXNpbmcg
YSBzb2Z0d2FyZSAKPiBPcGVuR0wgcmVuZGVyZXIgKHN3cmFzdCkuIEFsdGhvdWdoIHBlcmZvcm1h
bmNlIGlzIGFieXNtYWwgc28gdGhhdOKAmXMgYSBubyAKPiBnby4KPiAKPiAKPiBJIGhhdmUgNCBm
bGF2b3JzIG9mIGdsbWFyazIgaW4gbXkgT1MsIGdsbWFyazIsIGdsbWFyazItZXMyLCAKPiBnbG1h
cmstZXMyLWRybSBhbmQgZ2xtYXJrMi1kcm0uIFRoZSBvbmx5IG9uZXMgdGhhdCBydW4gYXJlIGds
bWFyazItZHJtIAo+IGFuZCBnbG1hcmsyLWVzMi1kcm0uIFRoZXkgcnVuIHJlYWxseSB3ZWxsIGF0
IDYwZnBzLiBrbXNjdWJlIHJ1bnMgcmVhbGx5IAo+IHdlbGwgYXMgd2VsbC4KPiAKPiAKPiBUaGUg
cHJvYmxlbSBjb21lcyB3aGVuIEkgdHJ5IHRvIHJ1biBnbHhnZWFycyBhbmQgZ2x4aW5mbyB3aGVu
IFgxMSBpcyAKPiBydW5uaW5nLiBJIGdldCB0aGUgZm9sbG93aW5nIGVycm9yczoKPiAKPiAgICoK
PiAKPiAgICAgR2x4Z2VhcnMKPiAKPiAgICAgICAgIEVycm9yOiBDb3VsZG7igJl0IGdldCBhbiBS
R0IsIERvdWJsZWQtYnVmZmVyZWR2aXN1YWwKPiAKPiAgICoKPiAKPiAgICAgR2x4aW5mbzoKPiAK
PiAgICAgICAgIG5hbWUgb2YgZGlzcGxheTogOjAKPiAKPiAgICAgICAgIEVycm9yOiBjb3VsZG7i
gJl0IGZpbmQgUkdCIEdMWCB2aXN1YWwgb3IgZmJjb25maWcgPiAgICoKPiAKPiAgICAgR2xtYXJr
MjoKPiAKPiAgICAgICAgIEVycm9yOiBHTFggdmVyc2lvbiA+PSAxLjMgaXMgcmVxdWlyZWQKPiAK
PiAgICAgICAgIEVycm9yOiBFcnJvcjogQ291bGRu4oCZdCBnZXQgR0wgdmlzdWFsIGNvbmZpZwo+
IAo+ICAgICAgICAgRXJyb3I6IG1haW46IENvdWxkIG5vdCBpbml0aWFsaXplIGNhbnZhcwo+IAo+
IEnigJlkIGxpa2UgdG8gZ2V0IHRoZSByZWd1bGFyIGdsbWFyazIgdG8gcnVuIHNpbmNlLCBmcm9t
IG15IHVuZGVyc3RhbmRpbmcsIAo+IGl0IHVzZXMgcmVndWxhciBPcGVuR0w/CgpJdCBkZXBlbmRz
IG9uIHlvdXIgT3BlbkdMIGltcGxlbWVudGF0aW9uLCBhbmQgaGVyZSB5b3UgaGF2ZSBhbiBFUyAK
aW1wbGVtZW50YXRpb24sIHNvIGl0J3Mgb25seSBhIHN1YnNldCwgYnV0IGNvbnNpZGVyaW5nIHlv
dXIgZGVmY29uZmlnIApiZWxvdyBYIHRyaWVzIHRvIHVzZSB0aGUgRVMgb25lIGJ1dCBkb2Vzbid0
IHN1Y2NlZWQgYmVjYXVzZSBvZiBmYnR1cmJvIApkb2Vzbid0IHN1cHBvcnQgeW91ciBicm9hZGNv
bSBncHUuCgo+IAo+IEnigJltIHByZXR0eSBjb252aW5jZWQgbXkgZW5kIGdvYWwgaXMgcG9zc2li
bGUgYmVjYXVzZSBJIHdhcyBhYmxlIHRvIGdldCAKPiBteSBhcHAgdG8gcnVuIGZsYXdsZXNzbHkg
aW4gUmFzcGJlcnJ5IFBpIE9TIHVzaW5nIHJlZ3VsYXIgT3BlbkdMLiBKdXN0IAo+IG5lZWQgdG8g
ZmluZCBhbGwgdGhlIG5lY2Vzc2FyeSBwYWNrYWdlcyBhbmQgY29uZmlndXJlIHRoZSBPUyBjb3Jy
ZWN0bHkuIAo+IEVhc3kgdG8gc2F5LCBlYXN5IHRvIGRvIHJpZ2h0PwoKSXQgaXMgcG9zc2libGUK
Cj4gCj4gSSBsaW5rZWQgbXkgZGVmY29uZmlnLCB0aGUgeG9yZyBjb25maWd1cmF0aW9uIGZpbGUg
YW5kIHhvcmcgbG9nIGZpbGUuCj4gCj4gCj4gYnVpZGxyb290IFJwaTRfMzJfZGVmY29uZmlnX2V1
ZGV2OiBodHRwczovL3Bhc3RlYmluLmNvbS94Zko5V2JkUSAKPiA8aHR0cHM6Ly9wYXN0ZWJpbi5j
b20veGZKOVdiZFE+Cj4gCj4geG9yZy5jb25mOiBodHRwczovL3Bhc3RlYmluLmNvbS92ZXdEd210
RCA8aHR0cHM6Ly9wYXN0ZWJpbi5jb20vdmV3RHdtdEQ+Cj4gCj4geG9yZyBsb2c6IGh0dHBzOi8v
cGFzdGViaW4uY29tLzB5RFhHRHI3IDxodHRwczovL3Bhc3RlYmluLmNvbS8weURYR0RyNz4KPiAK
PiAKPiBNYXliZSB0aGUgeG9yZyBjb25maWd1cmF0aW9uIGZpbGUgbmVlZHMgdG8gYmUgbW9kaWZp
ZWQ/IEJ1dCBob3c/IAo+IEFjY29yZGluZyB0byB0aGlzIDxodHRwczovL2dpdGh1Yi5jb20vcmFz
cGJlcnJ5cGkvbGludXgvaXNzdWVzLzQ1MjY+LCBJIAo+IHNob3VsZCBub3QgYmUgdXNpbmcgZmJ0
dXJibyBidXQgSSBkb27igJl0IGtub3cgd2hhdCB0byByZXBsYWNlIGl0IHdpdGguCgpZZXMsIHlv
dSBuZWVkIHRvIHVzZSBnbGFtb3IgYXMgSSByZWNhbGwsIHNvIHlvdSBuZWVkIHRvIGVuYWJsZSBp
dCBpbiAKQnVpbGRyb290IGFuZCAnbWFrZSBjbGVhbjsgbWFrZScuCgpUcnkgdG8gdGFrZSBhIGxv
b2sgaGVyZSBmb3IgeG9yZy5jb25mIGV4YW1wbGU6Cmh0dHBzOi8vd3d3Lm1pbmR3ZXJrcy5uZXQv
MjAxNC8wOS92aWRlb2NvcmVpdi1nbGFtb3Itb24teW91ci1yYXNwYmVycnktcGkvCgpUaGF0IHdh
eSB5b3UgdGVsbCBYMTEgdG8gdXNlIGdsYW1vciBhbmQgZm9yY2UgR2FsbGl1bSh0aGUgQnJvYWRj
b20gbWVzYSAKZHJpdmVyKS4gQnV0IHlvdSBuZWVkIHRvIGRvIHNvbWUgYXR0ZW1wdCwgSSBkb24n
dCBrbm93IGlmIGl0IHdpbGwgd29yayAKYXMgaXQgaXMuCgpTb21lIHRpbWUgcGFzc2VkIHNpbmNl
IEkndmUgaGFkIG15IGhhbmRzIG9uIFgxMSBvbiBhIFJvY2tjaGlwLiBCdXQgCmdsYW1vciBzaG91
bGQgYmUgdGhlIHdheS4KCkkgZGlkbid0IGNoZWNrIGV2ZXJ5dGhpbmcgSSd2ZSB3cml0dGVuIGFi
b3ZlLCBzbyB0YWtlIGl0IHdpdGggYSBncmFpbiBvZiAKc2FsdC4KCkJlc3QgcmVnYXJkcwotLSAK
R2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
