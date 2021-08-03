Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420CBC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 12:23:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98DF260F35
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 12:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98DF260F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B342835B9;
	Tue,  3 Aug 2021 12:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4sLf1ZvfwCMI; Tue,  3 Aug 2021 12:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97810835A6;
	Tue,  3 Aug 2021 12:23:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75EF71BF29F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 12:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72607835A6
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 12:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6oomY0cd1PY for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 12:23:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE1758356C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 12:23:03 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AtRjmvgC0rXl6AtRjmosqo; Tue, 03 Aug 2021 14:23:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627993380; bh=l1qwgnWEfy/P5ZBvg70861FBr5oLv2gI+IdJIZc9FNU=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=XRTl+YhaAWtfAGgBnlfvWpwJnzoKr2mASY8r9U1Viprd+C74fcVu7Q+g5bLvitN8z
 QtZbKOgmJDZI3kNO19LFqSMQXmUkKVtH+/MTYdfUkzkflwF1VyT2aH/0E/Is3Z38XY
 4F1Hg53kRuZUsCPU72wfg/UrlOVBkNkNqrsJfXzitDkn91lzySTmgLVB8ZSe61Fvlg
 c4eXHcVMa5kLSH0lXfvG6hhmTuijB/ojTW98Trb2IZA9vsZgigk+6C28InKyGOpr/h
 IqVUee90mDQCJwPfBGmL4d2P0crn99qEYquVWnPyL6zz3W9CmOM2XiLMO7xgsvdjX7
 /491UM+ckJtqA==
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210803120714.2797624-1-fontaine.fabrice@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <6c82ed45-85ae-caaf-84d5-7017b06786c3@benettiengineering.com>
Date: Tue, 3 Aug 2021 14:22:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803120714.2797624-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfBT1jiqbVo8W9hdxrhwsAVHD3KwdhNFREy46tUqLMoA9UzcacHhy2J7OghX9gMn/K0flWk2csRQnCGa4axIct4Q+KYTX4vULiJKTCnZSX1Xm/J8seY+4
 zXkcVo1aXsmD58RqrjiiFjY6+GWNw2zeK4k4F1B8NYBDUtYjfL0YUMYxECIiCpn+Ek/di+XvOuChEvISVgEVnMJRCIXAuSmc97dHBP2SnFoilk0Q5t+MJUn4
 j3kdtG268OOY+n6MvLG8rCutBy352M8AlzXvUkjVX6cY49zPANdjRKqjEmuF9109
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/gpsd: fix workaround for gcc bug 68485
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgRmFicmljZSwKCk9uIDgvMy8yMSAyOjA3IFBNLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+
IFdvcmthcm91bmQgZm9yIGdjYyBidWcgNjg0ODUgZG9lc24ndCB3b3JrIGFueW1vcmUgc2luY2Ug
YnVtcCB0byB2ZXJzaW9uCj4gMy4yMSBpbiBjb21taXQgNWIzZTcyMTM5OTUyZTBjOTUzYzg2NDlj
Y2E1NTU3MWNlYzVmMzgzNiBiZWNhdXNlIENYWEZMQUdTCj4gaXMgYXBwZW5kZWQgYWZ0ZXIgQ0ZM
QUdTIGFuZCBkb2VzIG5vdCBjb250YWluIC1PMDoKPiAKPiAvdG1wL2luc3RhbmNlLTcvb3V0cHV0
LTEvaG9zdC9iaW4vbWljcm9ibGF6ZWVsLWxpbnV4LWdjYyAtbyBydGNtMl9qc29uLm9zIC1jIC0t
c3lzcm9vdD0vdG1wL2luc3RhbmNlLTcvb3V0cHV0LTEvaG9zdC9taWNyb2JsYXplZWwtYnVpbGRy
b290LWxpbnV4LXVjbGliYy9zeXNyb290IC1wdGhyZWFkIC1XYWxsIC1XY2FzdC1hbGlnbiAtV2V4
dHJhIC1XaW1wbGljaXQtZmFsbHRocm91Z2ggLVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV21pc3Np
bmctcHJvdG90eXBlcyAtV25vLW1pc3NpbmctZmllbGQtaW5pdGlhbGl6ZXJzIC1Xbm8tdW5pbml0
aWFsaXplZCAtV3BvaW50ZXItYXJpdGggLVdyZXR1cm4tdHlwZSAtV3N0cmljdC1wcm90b3R5cGVz
IC1XdmxhIC1PMCAtT3MgLWcwIC1wdGhyZWFkIC1mUElDIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURf
TEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLUkvdG1wL2luc3RhbmNl
LTcvb3V0cHV0LTEvaG9zdC9taWNyb2JsYXplZWwtYnVpbGRyb290LWxpbnV4LXVjbGliYy9zeXNy
b290L3Vzci9pbmNsdWRlL2RidXMtMS4wIC1JL3RtcC9pbnN0YW5jZS03L291dHB1dC0xL2hvc3Qv
bWljcm9ibGF6ZWVsLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvc3lzcm9vdC91c3IvbGliL2RidXMt
MS4wL2luY2x1ZGUgcnRjbTJfanNvbi5jCj4gZHVyaW5nIFJUTCBwYXNzOiByZWxvYWQKPiBydGNt
Ml9qc29uLmM6IEluIGZ1bmN0aW9uIOKAmGpzb25fcnRjbTJfcmVhZOKAmToKPiBydGNtMl9qc29u
LmM6MjY3OjE6IGludGVybmFsIGNvbXBpbGVyIGVycm9yOiBpbiBnZW5fcmVnX3J0eCwgYXQgZW1p
dC1ydGwuYzoxMTU1Cj4gICAgMjY3IHwgfQo+ICAgICAgICB8IF4KPiAKPiBJdCBzaG91bGQgYmUg
bm90ZWQgdGhhdCBHUFNEX0NYWEZMQUdTIHdhcyBhZGRlZCA1IHllYXJzIGFnbyB3aXRoIGNvbW1p
dAo+IGI0YzA1MGU5YWZlZDdhOGRjMzAyZTZlMTAxNGNjNGZmYjUwODU5MGQgYnV0IHdhcyBub3Qg
cmVhbGx5IHVzZWQgc2luY2UKPiB0aGlzIGNvbW1pdC4KPiAKPiBGaXhlczoKPiAgIC0gaHR0cDov
L2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZmFiMzNmMjViMDhmYTIxOGFmOTE2NDBm
ZGJkOGMwZGNmMWQwNzIyOAo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZv
bnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxn
aXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgoKYW5kLi4uCgo+IC0tLQo+IENo
YW5nZXMgdjEgLT4gdjIgKGFmdGVyIHJldmlldyBvZiBUaG9tYXMgUGV0YXp6b25pKToKPiAgIC0g
U2V0IC1PMCBpbiBHUFNEX0NYWEZMQUdTIGluc3RlYWQgb2YgZmlsdGVyaW5nIG91dCAtT3MKCi4u
LnllcywgdGhhdCdzIHRoZSBzb2x1dGlvbiBJIG9mdGVuIGFkb3B0ZWQgb24gdGhlIGZpcnN0IHRy
eSBhbmQgb25seSBpZiAKbm90IHBvc3NpYmxlIEkndmUgdHJpZWQgdG8gd29yayBhcm91bmQgd2l0
aCBvdGhlciB2YXJpYWJsZXMuCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCBhbmQKQmVzdCByZWdh
cmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoKPiAgIHBhY2th
Z2UvZ3BzZC9ncHNkLm1rIHwgNSArKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dwc2QvZ3BzZC5t
ayBiL3BhY2thZ2UvZ3BzZC9ncHNkLm1rCj4gaW5kZXggMGZiYjVkZmExZC4uNDVmNmQzNWVmOCAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dwc2QvZ3BzZC5tawo+ICsrKyBiL3BhY2thZ2UvZ3BzZC9n
cHNkLm1rCj4gQEAgLTE2LDYgKzE2LDcgQEAgR1BTRF9ERVBFTkRFTkNJRVMgPSBob3N0LXB5dGhv
bjMgaG9zdC1zY29ucyBob3N0LXBrZ2NvbmYKPiAgIAo+ICAgR1BTRF9MREZMQUdTID0gJChUQVJH
RVRfTERGTEFHUykKPiAgIEdQU0RfQ0ZMQUdTID0gJChUQVJHRVRfQ0ZMQUdTKQo+ICtHUFNEX0NY
WEZMQUdTID0gJChUQVJHRVRfQ1hYRkxBR1MpCj4gICAKPiAgIEdQU0RfU0NPTlNfRU5WID0gJChU
QVJHRVRfQ09ORklHVVJFX09QVFMpCj4gICAKPiBAQCAtNDYsNiArNDcsNyBAQCBlbmRpZgo+ICAg
Cj4gICBpZmVxICgkKEJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfNjg0ODUpLHkpCj4gICBHUFNE
X0NGTEFHUyArPSAtTzAKPiArR1BTRF9DWFhGTEFHUyArPSAtTzAKPiAgIGVuZGlmCj4gICAKPiAg
ICMgSWYgbGlidXNiIGlzIGF2YWlsYWJsZSBidWlsZCBpdCBiZWZvcmUgc28gdGhlIHBhY2thZ2Ug
Y2FuIHVzZSBpdAo+IEBAIC0yMDMsNyArMjA1LDggQEAgZW5kaWYKPiAgIEdQU0RfU0NPTlNfRU5W
ICs9IFwKPiAgIAlMREZMQUdTPSIkKEdQU0RfTERGTEFHUykiIFwKPiAgIAlDRkxBR1M9IiQoR1BT
RF9DRkxBR1MpIiBcCj4gLQlDQ0ZMQUdTPSIkKEdQU0RfQ0ZMQUdTKSIKPiArCUNDRkxBR1M9IiQo
R1BTRF9DRkxBR1MpIiBcCj4gKwlDWFhGTEFHUz0iJChHUFNEX0NYWEZMQUdTKSIKPiAgIAo+ICAg
ZGVmaW5lIEdQU0RfQlVJTERfQ01EUwo+ICAgCShjZCAkKEBEKTsgXAo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
