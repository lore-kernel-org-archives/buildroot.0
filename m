Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DA3C197A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Nov 2023 22:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF3AC40A76;
	Mon, 20 Nov 2023 22:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF3AC40A76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7iGiTohY6dLJ; Mon, 20 Nov 2023 22:11:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77C2340A78;
	Mon, 20 Nov 2023 22:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77C2340A78
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58E351BF3FD
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 22:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3181981C6E
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 22:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3181981C6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qKhblYy-vmON for <buildroot@lists.busybox.net>;
 Mon, 20 Nov 2023 22:11:30 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9789981C19
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 22:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9789981C19
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.67]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M26vL-1r2iRg430T-002bml; Mon, 20
 Nov 2023 23:11:26 +0100
Date: Mon, 20 Nov 2023 23:11:25 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <20231120231125.2ba705f9@gmx.net>
In-Reply-To: <20231120214150.671145-1-gael.portay@rtone.fr>
References: <20231120214150.671145-1-gael.portay@rtone.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:MwYPPNTeo8Qm74YrH+k0wl7+Joqtdn2EjCrtzCaoFIKOqMzqIDa
 WTRlMabt6UbLgBZJrcHsEhfJNHRD5tB/QxnUpwApW3qgCjPFnu/RwQgFw6ZG3iMiVV30Wic
 t9MuNCkvCfKf+G1rLzt1rbsx+seFL1xVNpbS/1YHXDd7R1OZhXr5lFAwg3urKY4/4isRlG5
 9WZjzq2JfvgbyBpoLY8tg==
UI-OutboundReport: notjunk:1;M01:P0:AGOkr+9yTIc=;Tnr5GVzBaNB6fh59z1yMrqeVTO+
 nR+psepsKZWT6pSbEb8e0FCKD3LSfpDdYJmHswsnrjBaOf1YekvTs3EXzzwB+2jJGqcPmoMGQ
 tKLAgp7A94XxoBPmtnKxLDNlKonUU13AuMx9N2zcFvPgwb0nsCura7jVe1PjHv99KVM8U4tOc
 7y3/PSY6/3Au48kdt3R2TJD0KCiZp2jPdlNN7h9JYuY4xuBXj8AvAMtjmw/16NrnYhHoiqmMC
 OM0en3rTxivJ9tKEm6Yg302Q3IkycWzE+cF6Ef7sB2OKtrnGqE+DvvYwqCfDVNq99uDz+UAiA
 09tJBMncflBFxlxBcAEi6B82c/1x9UcB4vINoVRDkiYN7e1AxdMnpuIfDcM5SFWw4NJ1AZLhi
 WjnFjuUmeMp47H0t2cmZD3y6uiFSYDjUlXqqA5ukYBkLc0HTaHzLppsN/XZAG1EFlr+ZchrPJ
 gLN6YLaq1JvfJ5vWQSkOns8fh2NUxZKCgZ6qQlA1SdcVamsGnOEfHq42qyz/drQgGds/KQ2jQ
 JZI1IiwTvpypvs7CqoU0gytN6plz9a67pQsgdIaQll/oYBw19qmOVh9kymTL3faOU4SLoS2h6
 Uxdm7K/pc9aEbg5qTrpBrUVdr3PYZXIfTf0gzX543Dzyjyt/jVo6ugin/TVke9bVksjYrONG5
 lzEos4+si31phdGKNrHu/zPqc+8TtfO50d5fdPHVoCZtigY+tfnzp3+ziN5t2tycLYxDW8T+Y
 9wT+EjykWv81g0yq54JhMU6NqYV83YxiIZFdnMGYdYNwF3Sb6Gx5JDDoLPrLlBHRGFkcL3SbV
 UKiIVeN6xnb5pIWkUGO+anFPCod3Aa5YtNgcUl7YkUnxvbqml6FwfOko94TqezjQZKRPj/99Z
 MppQuQX0TMoLYXhFk8YEZ4et8INmxs9PTOR8n88trkoOXze17BT9Nm2C5L60oZ5pANLsZJMdH
 6SqUIqns/ViFJ8FBCuYw4JBG7RI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1700518286; x=1701123086; i=ps.report@gmx.net;
 bh=w38/7YDb2xwm3sCRlUtaKzJQvm8Fav3WcKwLR1P4U2A=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:
 References;
 b=kl2KMz5Ub7qQL3OQr0IUlxsh2hdIgX7Pb/RCJqkEW5/xVQfJymKhO7FEsdiQSek6
 ZkYdOsjWi2t+xQCzv6tyv5S2HOKqGHTBXyq35uYPSDXef742acT+Rod3mTX6vJiTY
 f3qWTqIC64YU4cP1MBNlN/9+DEwRPTFmR8CgDVWN/JkE2fT+EHYMz/FVX7GST9uKx
 LEwyauD3LpSBKBFookpOq6y8bHWyuR975cBqX34X9lxt4p9nXTWwZEeKEowUwuUih
 J0MYXDP3xLkvP1SGfcr8A8UqytMA2Hnm+sPINJg+B+7tVvRzZEx8uTdH8TUVZkLG4
 HBgq228DdCXlhL+9dQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=kl2KMz5U
Subject: Re: [Buildroot] [PATCH 1/1] board/raspberrypi: fix autoprobing of
 bluetooth driver
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gKiwKCk9uIE1vbiwgMjAgTm92IDIwMjMgMjI6NDE6NTAgKzAxMDAsIEdhw6tsIFBPUlRB
WSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+IHdyb3RlOgoKPiBUaGUgY29tbWl0IDY4OWI5YWM0Mzkg
KHBhY2thZ2UvcnBpLWZpcm13YXJlOiByZXdvcmsgYm9vdC9jb25maWcgZmlsZQo+IGhhbmRsaW5n
KSBoYXMgc3BsaXQgaW4gdHdvIHRoZSBwcm9wZXJ0eToKPiAKPiAJZHRvdmVybGF5PW1pbml1YXJ0
LWJ0LGtybmJ0PW9uCj4gCj4gSW50bzoKPiAKPiAJZHRvdmVybGF5PW1pbml1YXJ0LWJ0Cj4gCWR0
b3ZlcmxheT1rcm5idD1vbgo+IAo+IFRoZSBpbml0aWFsIHByb3BlcnR5IGNvbnRhaW5lZCB0aGUg
ZHRibyBmaWxlIG1pbml1YXJ0LWJ0WzFdIGFuZCBpdHMKPiBwYXJhbWV0ZXIga3JuYnQ9b25bMl1b
M10uCj4gCj4gVGhlIGZpcnN0IHN5bnRheCBpcyBjb3JyZWN0IHdoaWxlIHRoZSBzZWNvbmQgaXMg
bm90LiBUaGUga3JuYnQ9b24gaXMgbm90Cj4gYSBkdG92ZXJsYXlbNF0gYnV0IGEgZHRwYXJhbVs1
XS4gVGhlcmVmb3JlIHRoZSBwcm9wZXJ0eSBkdHBhcmFtIG11c3QgYmUKPiB1c2VkIGluc3RlYWQu
Cj4gCj4gVGhpcyBmaXhlczoKPiAKPiAJIyBjYXQgL3N5cy9maXJtd2FyZS9kZXZpY2V0cmVlL2Jh
c2UvY2hvc2VuL3VzZXItd2FybmluZ3MKPiAJRmFpbGVkIHRvIGxvYWQgb3ZlcmxheSAna3JuYnQ9
b24nCj4gCj4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvYmxvYi9y
cGktNS4xMC55L2FyY2gvYXJtL2Jvb3QvZHRzL292ZXJsYXlzL21pbml1YXJ0LWJ0LW92ZXJsYXku
ZHRzCj4gWzJdOiBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvYmxvYi9ycGkt
NS4xMC55L2FyY2gvYXJtL2Jvb3QvZHRzL292ZXJsYXlzL21pbml1YXJ0LWJ0LW92ZXJsYXkuZHRz
I0w5MQo+IFszXTogaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4L2Jsb2IvcnBp
LTUuMTAueS9hcmNoL2FybS9ib290L2R0cy9vdmVybGF5cy9SRUFETUUjTDIxMy1MMjE1Cj4gWzRd
OiBodHRwczovL3d3dy5yYXNwYmVycnlwaS5jb20vZG9jdW1lbnRhdGlvbi9jb21wdXRlcnMvY29u
ZmlnX3R4dC5odG1sI2R0b3ZlcmxheQo+IFs1XTogaHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkuY29t
L2RvY3VtZW50YXRpb24vY29tcHV0ZXJzL2NvbmZpZ190eHQuaHRtbCNkdHBhcmFtCj4gCj4gU2ln
bmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4KPiAtLS0KPiAg
Ym9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzB3LnR4dCAgICAgIHwgMiArLQo+ICBib2FyZC9yYXNw
YmVycnlwaS9jb25maWdfMy50eHQgICAgICAgfCAyICstCj4gIGJvYXJkL3Jhc3BiZXJyeXBpL2Nv
bmZpZ18zXzY0Yml0LnR4dCB8IDIgKy0KPiAgYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzQudHh0
ICAgICAgIHwgMiArLQo+ICBib2FyZC9yYXNwYmVycnlwaS9jb25maWdfNF82NGJpdC50eHQgfCAy
ICstCj4gIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ196ZXJvMncudHh0ICB8IDIgKy0KPiAgNiBm
aWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18wdy50eHQgYi9ib2FyZC9yYXNwYmVycnlw
aS9jb25maWdfMHcudHh0Cj4gaW5kZXggMTk1YmFkNDQ5ZS4uYmM1OWQ1ZmFkMiAxMDA2NDQKPiAt
LS0gYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfMHcudHh0Cj4gKysrIGIvYm9hcmQvcmFzcGJl
cnJ5cGkvY29uZmlnXzB3LnR4dAo+IEBAIC0yNiw0ICsyNiw0IEBAIGdwdV9tZW1fMTAyND0xMDAK
PiAgZHRvdmVybGF5PW1pbml1YXJ0LWJ0Cj4gCj4gICMgZW5hYmxlIGF1dG9wcm9iaW5nIG9mIEJs
dWV0b290aCBkcml2ZXIgd2l0aG91dCBuZWVkIG9mIGhjaWF0dGFjaC9idGF0dGFjaAo+IC1kdG92
ZXJsYXk9a3JuYnQ9b24KPiArZHRwYXJhbT1rcm5idD1vbgo+IGRpZmYgLS1naXQgYS9ib2FyZC9y
YXNwYmVycnlwaS9jb25maWdfMy50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfMy50eHQK
PiBpbmRleCAxOTViYWQ0NDllLi5iYzU5ZDVmYWQyIDEwMDY0NAo+IC0tLSBhL2JvYXJkL3Jhc3Bi
ZXJyeXBpL2NvbmZpZ18zLnR4dAo+ICsrKyBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18zLnR4
dAo+IEBAIC0yNiw0ICsyNiw0IEBAIGdwdV9tZW1fMTAyND0xMDAKPiAgZHRvdmVybGF5PW1pbml1
YXJ0LWJ0Cj4gCj4gICMgZW5hYmxlIGF1dG9wcm9iaW5nIG9mIEJsdWV0b290aCBkcml2ZXIgd2l0
aG91dCBuZWVkIG9mIGhjaWF0dGFjaC9idGF0dGFjaAo+IC1kdG92ZXJsYXk9a3JuYnQ9b24KPiAr
ZHRwYXJhbT1rcm5idD1vbgo+IGRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdf
M182NGJpdC50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfM182NGJpdC50eHQKPiBpbmRl
eCAzNDQxMmZhOWU4Li42NjcyODcxMTI1IDEwMDY0NAo+IC0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBp
L2NvbmZpZ18zXzY0Yml0LnR4dAo+ICsrKyBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18zXzY0
Yml0LnR4dAo+IEBAIC0yNiw3ICsyNiw3IEBAIGdwdV9tZW1fMTAyND0xMDAKPiAgZHRvdmVybGF5
PW1pbml1YXJ0LWJ0Cj4gCj4gICMgZW5hYmxlIGF1dG9wcm9iaW5nIG9mIEJsdWV0b290aCBkcml2
ZXIgd2l0aG91dCBuZWVkIG9mIGhjaWF0dGFjaC9idGF0dGFjaAo+IC1kdG92ZXJsYXk9a3JuYnQ9
b24KPiArZHRwYXJhbT1rcm5idD1vbgo+IAo+ICAjIGVuYWJsZSA2NGJpdHMgc3VwcG9ydAo+ICBh
cm1fNjRiaXQ9MQo+IGRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfNC50eHQg
Yi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfNC50eHQKPiBpbmRleCBlYTAyZDNmMDcxLi43NGE3
YjI3MGNkIDEwMDY0NAo+IC0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180LnR4dAo+ICsr
KyBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180LnR4dAo+IEBAIC0yNiw0ICsyNiw0IEBAIGdw
dV9tZW1fMTAyND0xMDAKPiAgZHRvdmVybGF5PW1pbml1YXJ0LWJ0Cj4gCj4gICMgZW5hYmxlIGF1
dG9wcm9iaW5nIG9mIEJsdWV0b290aCBkcml2ZXIgd2l0aG91dCBuZWVkIG9mIGhjaWF0dGFjaC9i
dGF0dGFjaAo+IC1kdG92ZXJsYXk9a3JuYnQ9b24KPiArZHRwYXJhbT1rcm5idD1vbgo+IGRpZmYg
LS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfNF82NGJpdC50eHQgYi9ib2FyZC9yYXNw
YmVycnlwaS9jb25maWdfNF82NGJpdC50eHQKPiBpbmRleCA0MWM3ZTk3ZTk5Li4yYTk4MTQyNzRm
IDEwMDY0NAo+IC0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180XzY0Yml0LnR4dAo+ICsr
KyBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180XzY0Yml0LnR4dAo+IEBAIC0yNiw3ICsyNiw3
IEBAIGdwdV9tZW1fMTAyND0xMDAKPiAgZHRvdmVybGF5PW1pbml1YXJ0LWJ0Cj4gCj4gICMgZW5h
YmxlIGF1dG9wcm9iaW5nIG9mIEJsdWV0b290aCBkcml2ZXIgd2l0aG91dCBuZWVkIG9mIGhjaWF0
dGFjaC9idGF0dGFjaAo+IC1kdG92ZXJsYXk9a3JuYnQ9b24KPiArZHRwYXJhbT1rcm5idD1vbgo+
IAo+ICBkdG92ZXJsYXk9dmM0LWttcy12M2QtcGk0Cj4gIGR0b3ZlcmxheT1pbXgyMTkKPiBkaWZm
IC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX3plcm8ydy50eHQgYi9ib2FyZC9yYXNw
YmVycnlwaS9jb25maWdfemVybzJ3LnR4dAo+IGluZGV4IDllNmI3ZjVjY2YuLjU1MDk1ZjY0YTcg
MTAwNjQ0Cj4gLS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX3plcm8ydy50eHQKPiArKysg
Yi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfemVybzJ3LnR4dAo+IEBAIC0yNiw0ICsyNiw0IEBA
IGdwdV9tZW1fMTAyND0xMDAKPiAgZHRvdmVybGF5PW1pbml1YXJ0LWJ0Cj4gCj4gICMgZW5hYmxl
IGF1dG9wcm9iaW5nIG9mIEJsdWV0b290aCBkcml2ZXIgd2l0aG91dCBuZWVkIG9mIGhjaWF0dGFj
aC9idGF0dGFjaAo+IC1kdG92ZXJsYXk9a3JuYnQ9b24KPiArZHRwYXJhbT1rcm5idD1vbgo+IC0t
Cj4gMi40Mi4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
Ci4uLmFsdGVybmF0aXZlIHBhdGNoIChyZW1vdmluZyB0aGUgZmFpbGluZyBsaW5lKSBhbHJlYWR5
IHN1Z2dlc3RlZCwgc2VlIFs2XSBmb3IKZGV0YWlscyBhbmQgcmVhc29uaW5nLi4uCgpSZWdhcmRz
LApQZXRlcgoKWzZdIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJv
b3QvcGF0Y2gvMjAyMzA4MDgxODA5NTkuMjgwOTEtMi1wcy5yZXBvcnRAZ214Lm5ldC8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
