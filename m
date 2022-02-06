Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC20C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 19:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC0248139A;
	Sun,  6 Feb 2022 19:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-bJGfqMW9wh; Sun,  6 Feb 2022 19:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06860816F5;
	Sun,  6 Feb 2022 19:10:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07F531BF384
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB43F816F5
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3-UWLBUWhTk for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 19:10:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B70CD8139A
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 19:10:28 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so8485038ooi.7
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 11:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b01QWAF7ZvC0MP4uV10EyJsHgXD/EQGD6cGj8UtpSzw=;
 b=i2qm+pAMPaY/ctw3SSfl/7LKB4BVCPI4S8+bZ+mSfH0RMjypCpe7VzTRnxRB7jwePB
 ArrnCpsWpkvJk92nbPjYPwhz1Kg/NlYsS8nftuMh7fu5AY94nPNLLSl42CRNp6VzvdQ3
 2S1+kyh7Ga/KOrdJsoAr6ZCnrEdKA0lIxS2zXlHbawGrzGeffXBDoTTCN9ESav5Emrte
 cFN9RWmWGXg9zj5siq6gWjVWzfhmbuPGu3g3DkAv/62n5DWFPc9FXLxBNc9QccG24N9U
 AP88UcHtdgd9ESvTnLaGKAY7Iv+MAmfY5jVZnJ/q9ZZLl9DQkkqx6UHrk9NdV3p1k1Ep
 nTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b01QWAF7ZvC0MP4uV10EyJsHgXD/EQGD6cGj8UtpSzw=;
 b=4HNtkaLsDwu4tVlM4KH0FnBCuvsBu2/yLSlw36uDrhYDoDHobBzZnUkem82AmNwBK6
 Ek84YpooCa2KmlGrCpAIleQSDUnGPj9E36cRXKDyJs+SV6a4pJD3KVWsMBU1v5jC3xEY
 VDIcgolfMf4w/PaK6H1B8ynf/O/k/UOz3CbmsNQ7EEpglOKhjxtTexAiZyg3leHnCeBE
 SEhSUrefihzAfKVBhuy68f64P4NJifK0HspX9xGC7/MxjiN15mUwg9vVnTeZWFjzlO3y
 SPgQOO025jcF+VNmlOBTyxZ0qThGxaGELKSKp9qf2m7NMmTECIN82SpLz8Zj73VZIS/j
 Pcow==
X-Gm-Message-State: AOAM530/OszQLTAGUJ/Qy0M8Ilnkk5epQp3CCWHp6IMds+KD4plEM26T
 yfGcQ5CFKFqrIbHfV25JVHpGifFIwQ23VsdVf8w=
X-Google-Smtp-Source: ABdhPJzpaCXqsJjj7ORdJvJlEBUHef0+BLkePtfDfEbQyb2/c2DnhnJLn+oj7FcZ/+uN0HoBaqewpG2Vb/OHjTy0T9s=
X-Received: by 2002:a05:6870:9204:: with SMTP id
 e4mr3238777oaf.60.1644174627708; 
 Sun, 06 Feb 2022 11:10:27 -0800 (PST)
MIME-Version: 1.0
References: <20220206145740.1765660-1-fontaine.fabrice@gmail.com>
 <1644174029.436223773@f387.i.mail.ru>
In-Reply-To: <1644174029.436223773@f387.i.mail.ru>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 6 Feb 2022 20:08:09 +0100
Message-ID: <CAPi7W81KLDbDm2GQzxezEZADFh-iUVEAnr8LvnLtCq7=a1VoOQ@mail.gmail.com>
To: =?UTF-8?B?0JrQvtGH0LXRgtC60L7QsiDQnNCw0LrRgdC40Lw=?= <fido_max@inbox.ru>
Subject: Re: [Buildroot] [PATCH 1/1] package/protozero: bump to version 1.7.1
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpMZSBkaW0uIDYgZsOpdnIuIDIwMjIgw6AgMjA6MDAsINCa0L7Rh9C10YLQutC+0LIg0JzQ
sNC60YHQuNC8IDxmaWRvX21heEBpbmJveC5ydT4gYSDDqWNyaXQgOgo+Cj4gSSBqdXN0IHNlbnQg
dGhlIHNhbWUgcGF0Y2ggdGhpcyB3ZWVrLgoKVGhhbmtzLCBJIG1pc3NlZCBpdCwgSSBzZXQgdGhp
cyBvbmUgYXMgc3VwZXJzZWRlZC4KCj4KPiAtLQo+INCe0YLQv9GA0LDQstC70LXQvdC+INC40Lcg
TWFpbC5ydSDQtNC70Y8gQW5kcm9pZAo+Cj4g0LLQvtGB0LrRgNC10YHQtdC90YzQtSwgMDYg0YTQ
tdCy0YDQsNC70Y8gMjAyMtCzLiwgMTc6NTkgKzAzOjAwINC+0YIgRmFicmljZSBGb250YWluZSBm
b250YWluZS5mYWJyaWNlQGdtYWlsLmNvbToKPgo+IERyb3AgcGF0Y2ggKGFscmVhZHkgaW4gdmVy
c2lvbikKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9tYXBib3gvcHJvdG96ZXJvL3JlbGVhc2VzL3Rh
Zy92MS43LjEKPgo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZh
YnJpY2VAZ21haWwuY29tPgo+IC0tLQo+ICAuLi5DTWFrZUxpc3RzLnR4dC1yZXNwZWN0LUJVSUxE
X1RFU1RJTkcucGF0Y2ggfCA0NyAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHBhY2thZ2UvcHJvdG96
ZXJvL3Byb3RvemVyby5oYXNoIHwgMiArLQo+ICBwYWNrYWdlL3Byb3RvemVyby9wcm90b3plcm8u
bWsgfCAyICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0OSBkZWxldGlv
bnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHJvdG96ZXJvLzAwMDEtQ01ha2VM
aXN0cy50eHQtcmVzcGVjdC1CVUlMRF9URVNUSU5HLnBhdGNoCj4KPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9wcm90b3plcm8vMDAwMS1DTWFrZUxpc3RzLnR4dC1yZXNwZWN0LUJVSUxEX1RFU1RJTkcu
cGF0Y2ggYi9wYWNrYWdlL3Byb3RvemVyby8wMDAxLUNNYWtlTGlzdHMudHh0LXJlc3BlY3QtQlVJ
TERfVEVTVElORy5wYXRjaAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IGQwMjY3
ZTMyODMuLjAwMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdlL3Byb3RvemVyby8wMDAxLUNNYWtlTGlz
dHMudHh0LXJlc3BlY3QtQlVJTERfVEVTVElORy5wYXRjaAo+ICsrKyAvZGV2L251bGwKPiBAQCAt
MSw0NyArMCwwIEBACj4gLUZyb20gMDNkYWFlNDljOGZhOTQ1MTNiNTA4YmQxMmYxNTk3ZThlNWUw
ODZmMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAtRnJvbTogRmFicmljZSBGb250YWluZSA8
Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gLURhdGU6IFNhdCwgMTcgQXByIDIwMjEgMTM6
MDY6NDQgKzAyMDAKPiAtU3ViamVjdDogW1BBVENIXSBDTWFrZUxpc3RzLnR4dDogcmVzcGVjdCBC
VUlMRF9URVNUSU5HCj4gLQo+IC1Eb24ndCBidWlsZCB0ZXN0cyBpZiB0aGUgc3RhbmRhcmQgY21h
a2UgQlVJTERfVEVTVElORyB2YXJpYWJsZSBpcyBzZXQgdG8KPiAtT0ZGLgo+IC0KPiAtU2lnbmVk
LW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4g
LVtVcHN0cmVhbSBzdGF0dXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9tYXBib3gvcHJvdG96ZXJvL3B1
bGwvMTA1XQo+IC0tLS0KPiAtIENNYWtlTGlzdHMudHh0IHwgOSArKysrKy0tLS0KPiAtIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gLQo+IC1kaWZmIC0t
Z2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAo+IC1pbmRleCBmOTcwMmQ2Li43
YTQwMjEyIDEwMDY0NAo+IC0tLS0gYS9DTWFrZUxpc3RzLnR4dAo+IC0rKysgYi9DTWFrZUxpc3Rz
LnR4dAo+IC1AQCAtMjMsNiArMjMsNyBAQCBzZXQoQ01BS0VfRVhQT1JUX0NPTVBJTEVfQ09NTUFO
RFMgT04pCj4gLQo+IC0gIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gLQo+IC0rb3B0aW9uKEJVSUxE
X1RFU1RJTkcgIkJ1aWxkIHRlc3RzIiBPTikKPiAtIG9wdGlvbihXRVJST1IgIkFkZCAtV2Vycm9y
IGZsYWcgdG8gYnVpbGQgKHR1cm5zIHdhcm5pbmdzIGludG8gZXJyb3JzKSIgT04pCj4gLQo+IC0g
aWYoTVNWQykKPiAtQEAgLTEzNCwxMyArMTM1LDEzIEBAIGluc3RhbGwoRElSRUNUT1JZIGluY2x1
ZGUvcHJvdG96ZXJvIERFU1RJTkFUSU9OIGluY2x1ZGUpCj4gLQo+IC0gIy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gLQo+IC0tZW5hYmxlX3Rlc3RpbmcoKQo+IC0tCj4gLSBhZGRfc3ViZGlyZWN0b3J5
KGRvYykKPiAtCj4gLSBhZGRfc3ViZGlyZWN0b3J5KHRvb2xzKQo+IC0KPiAtLWFkZF9zdWJkaXJl
Y3RvcnkodGVzdCkKPiAtLQo+IC0raWYoQlVJTERfVEVTVElORykKPiAtKyBlbmFibGVfdGVzdGlu
ZygpCj4gLSsgYWRkX3N1YmRpcmVjdG9yeSh0ZXN0KQo+IC0rZW5kaWYoKQo+IC0KPiAtICMtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+IC0tLQo+IC0yLjMwLjIKPiAtCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcHJvdG96ZXJvL3Byb3RvemVyby5oYXNoIGIvcGFja2FnZS9wcm90b3plcm8vcHJvdG96ZXJv
Lmhhc2gKPiBpbmRleCA1NDUzZTAxZWNmLi5mMGI4ZTM5MDA5IDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvcHJvdG96ZXJvL3Byb3RvemVyby5oYXNoCj4gKysrIGIvcGFja2FnZS9wcm90b3plcm8vcHJv
dG96ZXJvLmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAt
c2hhMjU2IGJlZmZiZGZhYjA2MDg1NGZkNzcwMTc4YThkYjljMDI4YjViNmVlNGEwNTlhMmZlZDgy
YzQ2MzkwYTg1ZjNmMzEgcHJvdG96ZXJvLTEuNy4wLnRhci5nego+ICtzaGEyNTYgMjdlMDAxN2Q1
YjNiYTA2ZDY0NmEzZWM2MzkxZDVjY2M4NTAwZGI4MjFiZTQ4MGFlZmQyZTRkZGMzZGU1ZmY5OSBw
cm90b3plcm8tMS43LjEudGFyLmd6Cj4gIHNoYTI1NiAxZjRkNDc3ZTNjMmQ3NGQ4NzA2YzhmMDU0
MzdiZDg2ODA0YWJlNDY4NTNiMWYyMzNjZTE1NDlhNGRlNzZmYTQ5IExJQ0VOU0UubWQKPiAgc2hh
MjU2IDBkNTQyZTBjODgwNGUzOWFhN2YzN2ViMDBkYTVhNzYyMTQ5ZGM2ODJkNzgyOTQ1MTI4N2Ux
MWI5MzhlOTQ1OTQgTElDRU5TRS5mcm9tX2ZvbGx5Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHJv
dG96ZXJvL3Byb3RvemVyby5tayBiL3BhY2thZ2UvcHJvdG96ZXJvL3Byb3RvemVyby5tawo+IGlu
ZGV4IDgwZDE2MTkyZTMuLmE0NmUzN2Q2OWIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wcm90b3pl
cm8vcHJvdG96ZXJvLm1rCj4gKysrIGIvcGFja2FnZS9wcm90b3plcm8vcHJvdG96ZXJvLm1rCj4g
QEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPgo+IC1QUk9U
T1pFUk9fVkVSU0lPTiA9IDEuNy4wCj4gK1BST1RPWkVST19WRVJTSU9OID0gMS43LjEKPiAgUFJP
VE9aRVJPX1NJVEUgPSAkKGNhbGwgZ2l0aHViLG1hcGJveCxwcm90b3plcm8sdiQoUFJPVE9aRVJP
X1ZFUlNJT04pKQo+ICBQUk9UT1pFUk9fTElDRU5TRSA9IEJTRC0yLUNsYXVzZSwgQXBhY2hlLTIu
MAo+ICBQUk9UT1pFUk9fTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UubWQgTElDRU5TRS5mcm9tX2Zv
bGx5Cj4gLS0KPiAyLjM0LjEKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
