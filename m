Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0769C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 23:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BF6C40178;
	Thu, 30 Dec 2021 23:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l9cS0A5RV5CQ; Thu, 30 Dec 2021 23:14:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7777F4038E;
	Thu, 30 Dec 2021 23:14:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C61DF1BF35B
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 23:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABDDD82741
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 23:14:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kdbb4b-BahXo for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 23:14:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5905782733
 for <buildroot@busybox.net>; Thu, 30 Dec 2021 23:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1640906055;
 bh=OA1rcXgydgxSIrHRezwieAi/gWCN8Dkny+lN9QJotak=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=N5BQ0Dt05YYh5znj37bX/0BZDIk57nKDiBI1YNnziF5brHBwypPzAxjVyEawVDs6r
 RZNLMW+EDEwQPEkxB+yGYifFTo3YNMg0Nide2XkgUlQ0Ipcu9q9o74mLyWf0FwQUOS
 yRFcnwprq7SVIeJpvQmMKGSEvMilJycENqiMP18E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.96]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4JmT-1n3Lbb3qkb-000LO7; Fri, 31
 Dec 2021 00:14:15 +0100
Date: Fri, 31 Dec 2021 00:14:13 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211231001413.26ef092b@gmx.net>
In-Reply-To: <20211230161150.7b073fc6@windsurf>
References: <20200306201022.22382-1-ps.report@gmx.net>
 <20211230161150.7b073fc6@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:x4e27T7Gse0xGrrsQM7UcJbdkELzszoTzjUPikQyFaKNRaZBesQ
 VouFdKdHOQK7N593xtoR6dQwIbTMu2sQ3T6c294VPf8jlt0fLrrNzlm+QUpfo9CLN2slwu6
 89CLq5U9V33qU205Jlaqvn/wH3B8OlpQd4MSxNGKZZgAaBRQ3Dx+s+i5fsDIzACtwc+fM7B
 fcHojNw39pqUlae9QlXrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lT4N0pzEoWw=:8Y7kQMBo1RXtSzAjWo5bek
 vxEeQ3gGOy2PVfGqQHtO6gBxtXwXn9AJBT5jWDp8dDgEccIOkgTgVJ5ng13eEiGF5iRKzwt5F
 Stg/V50Sq87S3x6SjmRoSa10EISRMOBqTVA8pIQMQNGpuwdvEf57IAi3KPV6tyZ9hn+fEG7Gi
 Y6rtH4DhsuiSjsMxCvAiB3H7zl1dAgucI54qtmfsQHXd7zBKm7j40Ejb1TRVNvTiWxqZsoRoM
 p+E4F9m+cPWShAy52HzjVt5XTsW2aRrUFLhavgeeJAmBwCEYieI+VsT+HR3QHn0D2KT4zBdri
 UD8P3qprclSltX3sj4by31ftQfl67dTtBuY2nBMOQlaBJTtDycdAqRt7DT66AbxzMrJeJlUUg
 OJ59R+yhLViCUbOXfpBg1VBzA+18/A9Y7PN/6kPE59y3UchudVVMtDxGiYbm9L6I41vLLNif/
 Vfjz1so8kKjBe+8diPH5g3gHier5loJCCuLpU4pT50RcbGGFDnD8Lzes/Ri0VYBPWcnDSD0jG
 ymSX8kLoZYenL97/8UeoHMMUHf3dTSlCZNUFupSKb8WzZx5QDAoVJrOmdweHvFpGP2vn07Tay
 LcKcqD7b69D1sfrZbj8juGJsux/qzlUeig9SxUZfcpbCAyjhmmRLky0mORHVMB79pSFGzL4rZ
 vKQuM4HjS8u+abPai1fC+wuLRrQL4kO3OXva1Dn1uJY+P/qq9v2UwAg2kGo/VGPBBuR5lk3x6
 Ue6FoCB+LuB/vjWlNnB7lk8UQk1fVMZqvPVYp9X6qfXUbzQ4Fphr/9ZCiN9dJb1spmhUVU6N6
 2eZJyfdij1UF3pSfaJorRYPl+1GxKvvHjyrbJTx33YGsxWp/e8liXIsl8RIbzEUL7MBPdKB2E
 9bowtS3lhQMNWFGNaaOxbXeLm7mr/5yOY3pIQjKL6oIREapQMvXYeKW/Yh14gPtzGsQgtBfd0
 qGbboxc767mA0GoPGnNnHNevllpIQdE3ONDQkFg1P+aTvARDkja7rTdgCIRAwELfjtevjVt3/
 bnmRyWIPQz/0XtOMuKFvqcmG77QFvIma8PUUTJGBldX6Rc6JIH1ZauuelHecnUVBgA24uLkcS
 DGir611yKNpVN8=
Subject: Re: [Buildroot] [PATCH v1 1/3] package/liboping: add patch to fix
 gcc-8/gcc-9 snprintf truncation compile failure
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
Cc: buildroot@busybox.net, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maik Brenke <Maik.Brenke@continental-corporation.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gVGh1LCAzMCBEZWMgMjAyMSAxNjoxMTo1MCArMDEwMCwgVGhvbWFz
IFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cgo+IEhlbGxv
IFBldGVyLAo+IAo+IE9uIEZyaSwgIDYgTWFyIDIwMjAgMjE6MTA6MjAgKzAxMDAKPiBQZXRlciBT
ZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IHdyb3RlOgo+IAo+ID4gQWRkIHBhdGNoIGZyb20g
dXBzdHJlYW0gbWVyZ2UgcmVxdWVzdCAoWzFdKSB0byBmaXggZml4IGdjYy04L2djYy05IHNucHJp
bnRmCj4gPiB0cnVuY2F0aW9uIHJlbGF0ZWQgY29tcGlsZSBmYWlsdXJlICgtV2FsbC8tV2Vycm9y
KSwgcmVwb3J0ZWQgb24gdGhlCj4gPiBtYWlsaW5nIGxpc3QgKFsyXSkuCj4gPiAKPiA+IEZpeGVz
Ogo+ID4gCj4gPiAgIGxpYm9waW5nLmM6IEluIGZ1bmN0aW9uIOKAmHBpbmdfc2V0X3R0bOKAmToK
PiA+ICAgbGlib3BpbmcuYzoyMDc6OTogZXJyb3I6IOKAmCVz4oCZIGRpcmVjdGl2ZSBvdXRwdXQg
bWF5IGJlIHRydW5jYXRlZCB3cml0aW5nIHVwIHRvIDI1NSBieXRlcyBpbnRvIGEgcmVnaW9uIG9m
IHNpemUgMjQyIFstV2Vycm9yPWZvcm1hdC10cnVuY2F0aW9uPV0KPiA+ICAgICAyMDcgfCAgICAi
JXM6ICVzIiwgZnVuY3Rpb24sIG1lc3NhZ2UpOwo+ID4gICAgICAgICB8ICAgICAgICAgXn4KPiA+
IAo+ID4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9vY3RvL2xpYm9waW5nL3B1bGwvNTAKPiA+IFsy
XSBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIwLU1hcmNo
LzI3NTg2MS5odG1sCj4gPiAKPiA+IFJlcG9ydGVkLWJ5OiBNYWlrIEJyZW5rZSA8TWFpay5CcmVu
a2VAY29udGluZW50YWwtY29ycG9yYXRpb24uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIg
U2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0Pgo+ID4gLS0tCj4gPiAgLi4uZC1zbnByaW50Zi10
cnVuY2F0aW9uLXdhcm5pbmctd0Vycm9yLnBhdGNoIHwgMzEgKysrKysrKysrKysrKysrKysrKwo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvbGlib3BpbmcvMDAwMi1NaXRpZ2F0ZWQtc25wcmludGYtdHJ1bmNhdGlvbi13
YXJuaW5nLXdFcnJvci5wYXRjaCAgCj4gCj4gU28gSSdtIHNvcnJ5LCBidXQgdGhlIHByb2JsZW0g
c3RpbGwgZGlkbid0IG9jY3VyLiBJJ3ZlIHRyaWVkIHVzaW5nIGdjYwo+IDgueCBhbmQgOS54IHRv
b2xjaGFpbnMsIGhhdmVuJ3QgYmVlbiBhYmxlIHRvIHNlZSwgYW5kIG5laXRoZXIgd2VyZSB0aGUK
PiBhdXRvYnVpbGRlcnMuCj4gCj4gU28gZm9yIG5vdywgSSdsbCBtYXJrIHRoaXMgcGF0Y2ggYXMg
UmVqZWN0ZWQsIGJ1dCBpZiB5b3UgaGF2ZSBhCj4gcmVwcm9kdWNlciwgd2UgY2FuIGNlcnRhaW5s
eSByZWNvbnNpZGVyIHRoaXMuCgpTdGlsbCByZXByb2R1Y2libGUgd2l0aCB0aGUgZm9sbG93aW5n
IGRlZmNvbmZpZzoKCkJSMl9hcm09eQpCUjJfYXJtMTE3Nmp6Zl9zPXkKQlIyX09QVElNSVpFXzM9
eQpCUjJfRk9SVElGWV9TT1VSQ0VfTk9ORT15CkJSMl9UT09MQ0hBSU5fQlVJTERST09UX0dMSUJD
PXkKQlIyX0dDQ19WRVJTSU9OXzlfWD15CkJSMl9UT09MQ0hBSU5fQlVJTERST09UX0NYWD15CkJS
Ml9QQUNLQUdFX0xJQk9QSU5HPXkKClJlZ2FyZHMsClBldGVyCgo+IAo+IEJlc3QgcmVnYXJkcywK
PiAKPiBUaG9tYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
