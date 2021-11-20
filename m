Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862A5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 19:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2DB24038F;
	Sat, 20 Nov 2021 19:54:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6-g_aHUMHEs; Sat, 20 Nov 2021 19:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34F9540569;
	Sat, 20 Nov 2021 19:54:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 915EF1BF396
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 19:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B3EC80F17
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 19:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zLF9rFBiTFmh for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 19:54:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34A4980DF8
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 19:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637438041;
 bh=zEU6JsoADvwzSIQP6kJqp4NuA6YJgrI93RdBUBZ9wjM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=MAgp+Xut6lwBoD7MeSB4W8xP7YCTWoVTcCCisuG3qAK4SzsKLkiEoatMGmBfCt1JQ
 MK8NKKcOJuUmOs2OAy2VyCVR5kZGN3Gv1pabisaqynjTyR7gvWgJ06s23jnXxWlouj
 zXGIFpFN4bPKmG940W9DzkrzTSfqVXdz4B1i9XbM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.105]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmfi-1nDF5u3dzW-00TBGi; Sat, 20
 Nov 2021 20:54:01 +0100
Date: Sat, 20 Nov 2021 20:53:59 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211120205359.0213edde@gmx.net>
In-Reply-To: <CAPi7W81xnSeS3w+mswu1ALNKSQVphfyim5jkFDmJgLJmj=dopA@mail.gmail.com>
References: <20211118210623.1598934-1-fontaine.fabrice@gmail.com>
 <20211120003256.61693b53@gmx.net>
 <CAPi7W81xnSeS3w+mswu1ALNKSQVphfyim5jkFDmJgLJmj=dopA@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:4gz0g3Lh8VIJkfbfb15deB68FTnaYG4l9OFnHUqYhyUeeqScyZF
 NCvaF5hwkTkiRKUmwMNlrEV7CTowYqDiQQztQWFpzH18yN2yPg4zt8YBAdDtYFLCLNNimdy
 LYtr0TfIbyS7LUdmKxnj8kgZrblx7nHasmqXxLYQfnZ0VTkCD3g+Q+7oECtaxHEzmgpAThb
 12CPf7enII6L8LS8GB/5Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IVZyWiZGuls=:EhMWUgVc87SKQczkQQ4vVu
 F0ZowKV/zsPxATo8Mg3z7sQ2mOulog0zP4HBjFlBj8TOCLQJe97EB6ztxvIpkDvGTJyCwjfBm
 7lolscRqwUYlmQoptJfKIDbI/a6fssaAZsRsZLV0xZe9cY4zQr1GrkVMcRaTN+7RFbezExnO6
 y0TL7as3EUnLs3U0KmSVQR22af55SpOJk+FEVUDdjCe5QYppGT9B4s1NZh8Xmi8uBTiytCO9o
 laaKWjpTAcMl3flSvIV7ekdm0SreCDENjReAt4bllv55mf0JL+aXHzZs/SRle0Ii1Qm35a+zX
 AkpSPwCjWNn1oJKsJ+UKmQtlUmZiWKJ1RS0vF7sAIgvLYQL83to0d/dxHbnHWfCFAjT0MxNn9
 qHDjqWqVESegiszrZqL7ZCBUghGpxyWOwYc4Q4qzsY+qBiRCJpwsXhrsgsOh8KLo/EAa6/u+l
 MDOoi5AY11BNv5OSoNcvTzN/rBytaqzzglZczS7ds0KlgX2lMFFzgEqXoa0BjV1MpHMybTUcR
 K0qliv7VUH9wZo+0L5n8U+fhZZmr1ps4h1BkKlIACUDVYf+Q6ftjyiLs2NVUHNwiNTmqY+zMF
 al0YNYkoXU/jWKlesJYtCWTSwL7aHlavconFNsNcTmndGMRug9nyKPBgCOnKanng4jgsk9WCx
 HVNj8oEVA2QoMXZ0X1YkTe3+dN8A4TtQLmi7ZFdTZYOREyBCA5M9qflrScfDBb2yHvBuGbuVP
 4ZGaku0BkYI2zby+FQ48NVF6Q3ottieiAtlRomqqqS0dV6uDovpAxQZ1k+Lxhgq8OEcmMQCnu
 3Nz6Ins7uYy/a7lLAfqrlsARHw44YNidJ1iCo97Jn9nQz5OkonPzYn77oZOD2trtEnCX99tEn
 CktUzE5hFkQTODk66Opz5tf1sVo7MJ2tzh8o0LdFGFnezmJGDHSuVqZqjE9S0yTEberTFDZFg
 OJxsixr5IxInyhyvM7Nmyb9WginKx3YJ/Aa53ji8Htl86Vn4EykagkcXv+8NWWjsBC3XzZkUD
 MUJM1yTlDXc/WXSBE6TnxQd2rITMJtaWjVwuCy+ZnOZ8ElVnQ38369/y4gUjOwjgpvk8Ss69Z
 kUzOH+v6YjvfhA=
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: run autoreconf
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwKCk9uIFNhdCwgMjAgTm92IDIwMjEgMTA6MjM6MTEgKzAxMDAsIEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKCj4gSGVsbG8g
UGV0ZXIsCj4gCj4gTGUgc2FtLiAyMCBub3YuIDIwMjEgw6AgMDA6MzMsIFBldGVyIFNlaWRlcmVy
IDxwcy5yZXBvcnRAZ214Lm5ldD4gYSDDqWNyaXQgOgo+ID4KPiA+IEhlbGxvIEZhYnJpY2UsCj4g
Pgo+ID4gT24gVGh1LCAxOCBOb3YgMjAyMSAyMjowNjoyMyArMDEwMCwgRmFicmljZSBGb250YWlu
ZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gIAo+ID4gPiBGb3IgYW4g
dW5rbm93biByZWFzb24sIHRoZSBidWlsZCBmYWlscyBzaW5jZSBidW1wIHRvIHZlcnNpb24gMS40
LjYwIGluCj4gPiA+IGNvbW1pdCBkNjJiN2Y1NGYwMDI5MWE1MDI3NDQwOWZiNTUxMDUyN2ZkNzI1
ZmZlIG9uOgo+ID4gPgo+ID4gPiBhcnJheS5jOjE0MDoyOiBlcnJvcjogJ2ZvcicgbG9vcCBpbml0
aWFsIGRlY2xhcmF0aW9ucyBhcmUgb25seSBhbGxvd2VkIGluIEM5OSBtb2RlCj4gPiA+ICAgZm9y
ICh1aW50MzJfdCBpID0gMDsgaSA8IHN6OyArK2kpIHsKPiA+ID4gICBeCj4gPiA+Cj4gPiA+IFJ1
bm5pbmcgYXV0b3JlY29uZiBmaXhlcyB0aGUgYnVpbGQuICAKPiA+Cj4gPiBUaGUgZGlmZmVyZW5j
ZSBpcyBkdXJpbmcgdGhlIGNvbmZpZ3VyZSBzdGVwOgo+ID4KPiA+IC0gY2hlY2tpbmcgZm9yIC4u
Li9ob3N0L2Jpbi9hcm0tbm9uZS1saW51eC1nbnVlYWJpLWdjYyBvcHRpb24gdG8gYWNjZXB0IElT
TyBDODkuLi4gbm9uZSBuZWVkZWQKPiA+ICsgY2hlY2tpbmcgZm9yIC4uLi9ob3N0L2Jpbi9hcm0t
bm9uZS1saW51eC1nbnVlYWJpLWdjYyBvcHRpb24gdG8gZW5hYmxlIEMxMSBmZWF0dXJlcy4uLiAt
c3RkPWdudTExCj4gPgo+ID4gQW5kIHRoZSB1c2Ugb2YgdGhlICctc3RkPWdudTExJyBmbGFnIGZv
ciB0aGUgY29tcGlsZSBzdGVwcy4uLiwgYW55IG1vcmUKPiA+IGxpZ2h0d2VpZ2h0IG9wdGlvbiB0
byBlbmFibGUgQzExPyAgCj4gVGhlbiwgSSBhc3N1bWUgdGhhdCB1cHN0cmVhbSBmb3Jnb3QgdG8g
cmVnZW5lcmF0ZSB0aGUgY29uZmlndXJlIHNjcmlwdCBhZnRlcgo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9saWdodHRwZC9saWdodHRwZDEuNC9jb21taXQvNzM4NjUwMjU3Mjk4OTdkMTE0OTRkZTU2YTI5
Yzc3YzRmYzhlNTcwMgo+IEkgb3BlbmVkIGFuIGlzc3VlIGhlcmU6IGh0dHBzOi8vcmVkbWluZS5s
aWdodHRwZC5uZXQvaXNzdWVzLzMxMTYKCgpUaGFua3MgZm9yIGVmZm9ydCwgYnV0IHVwc3RyZWFt
IHNlZW1zIHZlcnkgY29udmluY2VkIG9mIGRvaW5nIG5vdGhpbmcgd3JvbmcgKGFuZApub3QgcmVh
ZHkgdG8gaW52ZXN0aWdhdGUgZnVydGhlcikuLi4uLCBkZXNwaXRlIHVzaW5nIGF1dG9jb25mLTIu
NjkgKGZyb20gMjAxMiwKc2VlIGxpZ2h0dHBkLTEuNC42MS9jb25maWd1cmUpIGFuZDoKCgkkIGRp
ZmYgLXUgbGlnaHR0cGQtMS40LjU5L2NvbmZpZ3VyZSBsaWdodHRwZC0xLjQuNjEvY29uZmlndXJl
ClsuLi5dCkBAIC00NDQwLDI5OCArNDQ2MCw2IEBACiBmaQogCiAKLSAgIGNhc2UgJGFjX2N2X3By
b2dfY2Nfc3RkYyBpbiAjKAotICBubykgOgotICAgIGFjX2N2X3Byb2dfY2NfYzk5PW5vOyBhY19j
dl9wcm9nX2NjX2M4OT1ubyA7OyAjKAotICAqKSA6Ci0gICAgeyAkYXNfZWNobyAiJGFzX21lOiR7
YXNfbGluZW5vLSRMSU5FTk99OiBjaGVja2luZyBmb3IgJENDIG9wdGlvbiB0byBhY2NlcHQgSVNP
IEM5OSIgPiY1Ci0kYXNfZWNob19uICJjaGVja2luZyBmb3IgJENDIG9wdGlvbiB0byBhY2NlcHQg
SVNPIEM5OS4uLiAiID4mNjsgfQotaWYgJHthY19jdl9wcm9nX2NjX2M5OSs6fSBmYWxzZTsgdGhl
biA6Ci0gICRhc19lY2hvX24gIihjYWNoZWQpICIgPiY2Ci1lbHNlCi0gIGFjX2N2X3Byb2dfY2Nf
Yzk5PW5vCi1hY19zYXZlX0NDPSRDQwpbLi4uXQoKClRoZSB3aG9sZSBjOTkgY2hlY2sgdmFuaXNo
ZWQuLi4uLCBhbmQ6CgoJJCBkaWZmIC11IGxpZ2h0dHBkLTEuNC41OS9jb25maWd1cmUuYWMgbGln
aHR0cGQtMS40LjYxL2NvbmZpZ3VyZS5hYwpbLi4uXQpAQCAtNjEsNyArNjEsNiBAQAogCiBkbmwg
Q2hlY2tzIGZvciBwcm9ncmFtcy4KIEFDX1BST0dfQ0MKLUFDX1BST0dfQ0NfU1REQwogQVhfUFJP
R19DQ19GT1JfQlVJTEQKIExUX1BBVEhfTEQKIEFDX1BST0dfSU5TVEFMTAoKCkJ1dCB0aGVyZSBp
cyBhbHRob3VnaCBzdXBwb3J0IGZvciB0aGUgbWVzb24gYnVpbGQgc3lzdGVtIGluIHRoZSBzb3Vy
Y2VzLi4uLAptYXliZSB0aW1lIHRvIGNoYW5nZSB0byBpdD8KClJlZ2FyZHMsClBldGVyCgo+IAo+
ID4KPiA+IFJlZ2FyZHMsCj4gPiBQZXRlcgo+ID4gIAo+ID4gPgo+ID4gPiBGaXhlczoKPiA+ID4g
IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMDM0OWQ4ZmVkMzViMDc2
Njc5NmRkOWJhM2I4ZGU2ZmY4YmQ2OGZlNwo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJy
aWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+
ICBwYWNrYWdlL2xpZ2h0dHBkL2xpZ2h0dHBkLm1rIHwgMiArKwo+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWdo
dHRwZC9saWdodHRwZC5tayBiL3BhY2thZ2UvbGlnaHR0cGQvbGlnaHR0cGQubWsKPiA+ID4gaW5k
ZXggOWMxOGE2MDM4ZS4uYzM5YTVkYjIwZiAxMDA2NDQKPiA+ID4gLS0tIGEvcGFja2FnZS9saWdo
dHRwZC9saWdodHRwZC5tawo+ID4gPiArKysgYi9wYWNrYWdlL2xpZ2h0dHBkL2xpZ2h0dHBkLm1r
Cj4gPiA+IEBAIC0xMiw2ICsxMiw4IEBAIExJR0hUVFBEX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UK
PiA+ID4gIExJR0hUVFBEX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gPiA+ICBMSUdIVFRQRF9D
UEVfSURfVkVORE9SID0gbGlnaHR0cGQKPiA+ID4gIExJR0hUVFBEX0RFUEVOREVOQ0lFUyA9IGhv
c3QtcGtnY29uZgo+ID4gPiArIyBJc3N1ZSBpbiBjb25maWd1cmUgc2NyaXB0IHByb3ZpZGVkIGlu
IHRhcmJhbGwKPiA+ID4gK0xJR0hUVFBEX0FVVE9SRUNPTkYgPSBZRVMKPiA+ID4gIExJR0hUVFBE
X0NPTkZfT1BUUyA9IFwKPiA+ID4gICAgICAgLS13aXRob3V0LXdvbGZzc2wgXAo+ID4gPiAgICAg
ICAtLWxpYmRpcj0vdXNyL2xpYi9saWdodHRwZCBcICAKPiA+ICAKPiBCZXN0IFJlZ2FyZHMsCj4g
Cj4gRmFicmljZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
