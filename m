Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D867ECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 19:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94A28410D7;
	Thu, 15 Sep 2022 19:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94A28410D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kqRAq7ku5wRW; Thu, 15 Sep 2022 19:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9252340359;
	Thu, 15 Sep 2022 19:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9252340359
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C3C21BF309
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 19:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77B5740359
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 19:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77B5740359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WAuLVgyqJGws for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 19:07:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A670C401DF
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id A670C401DF
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 19:07:21 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.22.4])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YuClolWD34eE5YuClo2MXB; Thu, 15 Sep 2022 21:07:19 +0200
Message-ID: <c3cc6951-4e49-4da2-b5f5-7dd5523a3c5f@benettiengineering.com>
Date: Thu, 15 Sep 2022 21:07:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
References: <20220914140821.3158921-1-vincent.stehle@arm.com>
 <675b62b5-7999-36f2-4d73-3d65c17f645b@benettiengineering.com>
 <YyM+v4AYpVlZQFB6@debian>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <YyM+v4AYpVlZQFB6@debian>
X-CMAE-Envelope: MS4xfOd18zZuksLCMzzBIf9KrechI+0gxuQJn1n2FGeZw5knlvmdL90flvx4Ns42cFQBG/BIMumsdYh/mVpljDGrXCd3127SJMmRHpxAzfswC0LRtoOAsr2D
 NYWuJwojZkSMNENCCr4gOs66hOU2Xr/ILJ3hiy0HVw7VymHlcwY4NFx6QwU+9b2Gb80637SOYBZQZcL5/zV1nk0pDxQe3H9GdH4xvNHWP48d6dahKLannMtt
 JzjzjH/0oFZlCzJS/004mg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663268840; bh=OsleLLYCnAbeVjirD7glFdmkaPwSgP6Jyln/JS3UU+A=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=EhojEfZrDO1iBaMxBCkWvK3+CdEVhdcoayQSzzce/zjNTPVm+gybUC4JsCzk429lv
 hyqcxbw8S/Ob/vPhYb8a+ESGixFFWFx5Xidsfhyk8QJaa5bDZITjOX5lFI7h1siiLe
 9usqtCVOt2cE8gHD/w162P2fV/FlGs2oKzq4mHmktboQhz7t5vv/aaLCsYm0iuuBZ2
 hX7k8fm3BH2IEnC297V5aX3LLB5sclpg10drnD0MHK9GHy+gTXoAIeULTo4j++Xycp
 NDyBPHLIu1e1GFijjUbVtvR5XPAfhAx/5k9c1DkX67mj8i22M+k7xbBU3d1FvouVCJ
 JeAfG354/zauA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=EhojEfZr
Subject: Re: [Buildroot] [PATCH] configs/qemu_aarch64_ebbr: new defconfig
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

SGkgVmluY2VudCwKCk9uIDE1LzA5LzIyIDE3OjAzLCBWaW5jZW50IFN0ZWhsw6kgd3JvdGU6Cj4g
T24gV2VkLCBTZXAgMTQsIDIwMjIgYXQgMTA6MjU6MTVQTSArMDIwMCwgR2l1bGlvIEJlbmV0dGkg
d3JvdGU6Cj4+IEhpIFZpbmNlbnQsCj4gCj4gSGkgR2l1bGlvLAo+IAo+IFRoYW5rIHlvdSBmb3Ig
dGhlIHJldmlldy4gTW9yZSBjb21tZW50cyBiZWxvdywgYnV0IEkgd291bGQgbGlrZSB0byBhc2sg
YWxyZWFkeToKPiBzaGFsbCBJIGFkZCB5b3VyICJyZXZpZXdlZC1ieSIgd2hlbiBJIHNlbmQgYSB2
MiwgcGxlYXNlPwoKV2l0aCBldmVyeXRoaW5nIGxpc3RlZCBmcm9tIGFuZCBtZSBSb21haW4odGhh
dCBhcmUgYmFzaWNhbGx5IHRoZSBzYW1lCjotKSkgeWVzLCBidXQgeW91IHNob3VsZCB1c3VhbGx5
IHdhaXQgZm9yIHRoZSByZXZpZXdlciB0byB3cml0ZSBpdApleHBsaWNpdGx5LgoKPj4gT24gMTQv
MDkvMjIgMTY6MDgsIFZpbmNlbnQgU3RlaGzDqSB3cm90ZToKPiAuLgo+Pj4gSSB3b3VsZCBwcmVm
ZXIgdG8gYWRkIG15IHdvcmsgZS1tYWlsIGluIERFVkVMT1BFUlMgZm9yIHRoaXMgZGVmY29uZmln
Lgo+Pj4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoaXMgaXMgb2sgb3IgaWYgSSBzaG91bGQga2Vl
cCBhIHNpbmdsZSBlLW1haWwKPj4+IGFkZHJlc3MuCj4+Cj4+IEl0IGlzIHBvc3NpYmxlLCB0aGVy
ZSBpcyBhIHBlbmRpbmcgcGF0Y2ggZXhhY3RseSBmb3IgdGhpczoKPj4gaHR0cHM6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC83MTQ5XzE2NjMwNzk4ODNfNjMy
MDk1Q0JfNzE0OV8xNTNfMV84NGYxNDQ1NDI3OGM4MjNmMjM2NTRiMjBlNDRhZjdkYzY0NmI2ZmRk
LjE2NjMwNzk4NzkuZ2l0Lnlhbm4ubW9yaW5Ab3JhbmdlLmNvbS8KPj4gYW5kIGNvbWVzIGZyb20g
b25lIG9mIHRoZSBtYWludGFpbmVycy4KPiAKPiBUaGFua3MgZm9yIHRoZSBjb25maXJtYXRpb24u
Cj4gCj4gLi4KPj4+ICsJcGFydGl0aW9uIGJvb3Qgewo+Pj4gKwkJaW1hZ2UgPSAiZWZpLXBhcnQu
dmZhdCIKPj4+ICsJCXBhcnRpdGlvbi10eXBlLXV1aWQgPSBjMTJhNzMyOC1mODFmLTExZDItYmE0
Yi0wMGEwYzkzZWM5M2IKPj4KPj4gSGVyZSBeXl4gaXQncyBiZWVuIGRlY2lkZWQgdG8gdXNlIGdl
bmltYWdlIHNob3J0Y3V0IGxldHRlcnMsIGluIHRoaXMgY2FzZSBVCj4+IHNpbmNlIGl0J3MgRUZJ
Lgo+IAo+IE9rLCB3aWxsIGRvLgo+IAo+Pj4gKwkJb2Zmc2V0ID0gMzJLCj4+PiArCQlib290YWJs
ZSA9IHRydWUKPj4+ICsJfQo+Pj4gKwo+Pj4gKwlwYXJ0aXRpb24gcm9vdCB7Cj4+PiArCQlwYXJ0
aXRpb24tdHlwZS11dWlkID0gYjkyMWIwNDUtMWRmMC00MWMzLWFmNDQtNGM2ZjI4MGQzZmFlCj4+
Cj4+IEhlcmUgXl5eIGluc3RlYWQgaXMgY29ycmVjdCBhY2NvcmRpbmcgdG8gQnVpbGRyb290IG1h
bnVhbC4KPj4gWW91IGNhbiBjaGVjayBpdCBvbiBmb2xsb3dpbmcgbGluazoKPj4gaHR0cHM6Ly9i
dWlsZHJvb3Qub3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjd3JpdGluZy1nZW5pbWFn
ZS1jZmcKPiAKPiBPbiBzZWNvbmQgdGhvdWdodCBJIHRoaW5rIEkgbWlnaHQgYXMgd2VsbCBub3Qg
c3BlY2lmeSB0aGUgdXVpZCBhdCBhbGwgYW5kIHJlbHkKPiBvbiB0aGUgZGVmYXVsdCBiZWluZyAn
TCcuCgpObywgYXMgc3RhdGVkIGluIEJ1aWxkcm9vdCBtYW51YWxbMF06CiJFdmVuIHRob3VnaCBM
IGlzIHRoZSBkZWZhdWx0IHZhbHVlIG9mIGdlbmltYWdlLCB3ZSBwcmVmZXIgdG8gaGF2ZSBpdCAK
ZXhwbGljaXRseSBzcGVjaWZpZWQgaW4gb3VyIGdlbmltYWdlLmNmZyBmaWxlcyIKU28geW91IHNo
b3VsZCBzcGVjaWZ5IHRoZSBwYXJ0aXRpb24tdHlwZS11dWlkID0gCmI5MjFiMDQ1LTFkZjAtNDFj
My1hZjQ0LTRjNmYyODBkM2ZhZSBhcyBpdCBpcyBub3cuCgpbMF06IGh0dHBzOi8vYnVpbGRyb290
Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5odG1sI3dyaXRpbmctZ2VuaW1hZ2UtY2ZnCgo+
IC4uCj4+PiArIyBUb29sY2hhaW4sIHJlcXVpcmVkIGZvciBHUlVCCj4+PiArQlIyX1RPT0xDSEFJ
Tl9CVUlMRFJPT1RfV0NIQVI9eQo+Pgo+PiBUaGlzIF5eXiBpcyBvbmx5IG5lZWRlZCBmb3IgdWNs
aWJjLCBidXQgdGhlIGRlZmF1bHQgbGliYyBub3cgaXMgZ2xpYmMsCj4+IHNvIHlvdSBkb24ndCBu
ZWVkIHRvIHNwZWNpZnkgaXQuCj4gCj4gT2ssIHdpbGwgcmVtb3ZlLgo+IAo+IC4uCj4+PiArIyBM
aW51eCBoZWFkZXJzCj4+PiArQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81
XzE3PXkKPj4KPj4gRm9yIHRoaXMgXl5eIHBsZWFzZSBzcGVjaWZ5IGluIGNvbW1pdCBsb2cgdGhh
dCBhdCB0aGUgbW9tZW50IHdlIGRvbid0Cj4+IGhhdmUgNS4xOSBoZWFkZXJzIGF2YWlsYWJsZSBh
bmQgc28gd2UgcmVseSBvbiA1LjE3Lgo+IAo+IE9rLCB3aWxsIGRvLgo+IAo+IC4uCj4+IEl0IGJ1
aWxkcyBmaW5lIHVzaW5nIHV0aWxzL2RvY2tlci1ydW4gYW5kIEkndmUgcnVuIGl0IHN1Y2Nlc3Nm
dWxseSB3aXRoCj4+IHFlbXUuCj4gCj4gVGhhbmsgeW91IGZvciB0ZXN0aW5nIQoKWW91J3JlIHdl
bGNvbWUgYW5kIHNvIHdpdGggYWxsIHRoZSBjb3JyZWN0ZWQgcG9pbnRzOgpSZXZpZXdlZC1ieTog
R2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+PgoK
QmVzdCByZWdhcmRzIQotLSAKR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
