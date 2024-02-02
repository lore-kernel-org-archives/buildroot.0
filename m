Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AA4C47258
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 06:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17ADD6F545;
	Fri,  2 Feb 2024 06:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17ADD6F545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJ6U8LJ6UkdQ; Fri,  2 Feb 2024 06:21:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51A3E6F4EF;
	Fri,  2 Feb 2024 06:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51A3E6F4EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E6221BF842
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 06:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07BCE6F4EF
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 06:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07BCE6F4EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dKd3g3iXvTgU for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 06:21:26 +0000 (UTC)
Received: from cstnet.cn (smtp37.cstnet.cn [159.226.251.37])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8529B6F4CE
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 06:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8529B6F4CE
Received: from qiusihao23$mails.ucas.ac.cn ( [117.30.136.180] ) by
 ajax-webmail-APP-12 (Coremail) ; Fri, 2 Feb 2024 14:21:18 +0800 (GMT+08:00)
X-Originating-IP: [117.30.136.180]
Date: Fri, 2 Feb 2024 14:21:18 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6YKx5oCd6LGq?= <qiusihao23@mails.ucas.ac.cn>
To: buildroot@buildroot.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.15 build 20230921(8ad33efc)
 Copyright (c) 2002-2024 www.mailtech.cn cnic.cn
In-Reply-To: <7b899b93.ae5f.18d6546ee9a.Coremail.qiusihao23@mails.ucas.ac.cn>
References: <7b899b93.ae5f.18d6546ee9a.Coremail.qiusihao23@mails.ucas.ac.cn>
MIME-Version: 1.0
Message-ID: <2a6ae556.25c81.18d687a8cb8.Coremail.qiusihao23@mails.ucas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: tgCowABXbrvfibxlPZgAAA--.7046W
X-CM-SenderInfo: 5tlx2xxkdrjjo6pdxz3voxutnvoduhdfq/1tbiBwoPB2W8M93fFwA
	Bs7
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Subject: [Buildroot] Is host-clang available for compiling other packages
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
Content-Type: multipart/mixed; boundary="===============1790351000134641686=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1790351000134641686==
Content-Type: multipart/alternative; 
	boundary="----=_Part_528345_244161276.1706854878391"

------=_Part_528345_244161276.1706854878391
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

IEkgbm90aWNlZCB0aGF0IHRoZXJlIGlzIGEgJ2hvc3QtY2xhbmcnIHBhY2thZ2UuIEkgd29uZGVy
IGlmIGl0IGNhbiBiZSB1c2VkIHdoZW4gY29tcGlsaW5nIG90aGVyIHBhY2thZ2VzLiBGb3Igbm93
LCBJIHNpbXBseSBhZGQgJ0NDID0gIiQoSE9TVF9ESVIpL2Jpbi9jbGFuZyIgaW4gc29tZSBwYWNr
YWdlcycgLm1rIGZpbGUsIGJ1dCBzZWVtIG5vIHVzZSB3aGVuIGNvbXBpbGluZy4gVGhlIGZvbGRl
ciBnZW5lcmF0ZWQgYWZ0ZXIgJ21ha2UgaG9zdC1jbGFuZycgY2Fubm90IGJlIHVzZWQgZm9yIHN5
c3Jvb3QgZWl0aGVyLgoKLS0tLS3ljp/lp4vpgq7ku7YtLS0tLQrlj5Hku7bkuro6IumCseaAneix
qiIgPHFpdXNpaGFvMjNAbWFpbHMudWNhcy5hYy5jbj4K5Y+R6YCB5pe26Ze0OjIwMjQtMDItMDEg
MjM6MjY6MDMgKOaYn+acn+WbmykK5pS25Lu25Lq6OiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwrm
ioTpgIE6CuS4u+mimDogVXNlIENsYW5nIGFzIHRvb2xjaGFpbiBmb3IgYnVpbGRyb290CgoKCgoK
CiBIaSwgSSdtIG5vdCBzdXJlIGlmIG15IG9yaWdpbmFsIGxldHRlciBzZW50IGJ5IG15IGFub3Ro
ZXIgbWFpbCBhY2NvdW50IHJlYWNoZWQgcHJvcGVybHksIEknbSBzb3JyeSBpZiB0aGlzIGlzIGEg
ZHVwbGljYXRlIG9uZS4KCiBJJ20gbmV3IHRvIHRoZSBlbWJlZGRpbmcgdGhpbmdzLCBhbmQgSSdt
IGxvb2tpbmcgdG8gdXNlIGJ1aWxkcm9vdCB0byBnZXQgYy9jKysgcGFja2FnZXMgY29tcGlsZWQg
d2l0aCBtdWx0aXBsZSBwYXJhbWV0ZXJzIGxpa2UgY29tcGlsZXIsIGFyY2hpdGVjdHVyZSBhbmQg
b3B0aW1pemF0aW9uIGxldmVsLCBmb3IgYWNhZGVtaWMgcHVycG9zZS4gRS5nLCBpbiBteSBkYXRh
c2V0LCBCaW51dGlscyAyLjMyIHdpbGwgYmUgY29tcGlsZWQgaW4gW2djYzExLCBhcm02NCwgTzBd
LCBbZ2NjMTEsIGFybTY0LCBPMV0sIC4uLiBhbG9uZyB3aXRoIG90aGVyIHZhcmlhYmxlIHNldHRp
bmdzLgoKIEkgbm90aWNlZCB0aGF0IGJ1aWxkcm9vdCBjYW4gc2V0IG1vc3Qgb2YgdmFyaWFibGVz
IGluIC5jb25maWcgZmlsZSwgYnV0IHJlZ2FyZGluZyBhZGRpbmcgZXh0ZXJuYWwgdG9vbGNoYWlu
cywgaW5mb3JtYXRpb24gYXJlIHJlbGF0aXZlbHkgaW5zdWZmaWNpZW50LiBJIHdvdWxkIGxpa2Ug
dG8ga25vdyBpZiB0aGVyZSBhcmUgc29tZSB3YXlzIHRvIGFkZCBjb21waWxlcnMgbGlrZSBjbGFu
ZyBpbnRvIHRoZSBwaGFzZSBvZiBidWlsZGluZyB0YXJnZXQgcGFja2FnZXMuCgoKCgoK
------=_Part_528345_244161276.1706854878391
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHA+CgkmbmJzcDtJIG5vdGljZWQgdGhhdCB0aGVyZSBpcyBhICdob3N0LWNsYW5nJyBwYWNrYWdl
LiBJIHdvbmRlciBpZiBpdCBjYW4gYmUgdXNlZCB3aGVuIGNvbXBpbGluZyBvdGhlciBwYWNrYWdl
cy4gRm9yIG5vdywgSSBzaW1wbHkgYWRkICdDQyA9ICIkKEhPU1RfRElSKS9iaW4vY2xhbmciIGlu
IHNvbWUgcGFja2FnZXMnIC5tayBmaWxlLCBidXQgc2VlbSBubyB1c2Ugd2hlbiBjb21waWxpbmcu
IFRoZSBmb2xkZXIgZ2VuZXJhdGVkIGFmdGVyICdtYWtlIGhvc3QtY2xhbmcnIGNhbm5vdCBiZSB1
c2VkIGZvciBzeXNyb290IGVpdGhlci4KPC9wPgo8YmxvY2txdW90ZSBuYW1lPSJyZXBseUNvbnRl
bnQiIGNsYXNzPSJSZWZlcmVuY2VRdW90ZSIgc3R5bGU9InBhZGRpbmctbGVmdDo1cHg7bWFyZ2lu
LWxlZnQ6NXB4O2JvcmRlci1sZWZ0OiNiNmI2YjYgMnB4IHNvbGlkO21hcmdpbi1yaWdodDowOyI+
CgktLS0tLeWOn+Wni+mCruS7ti0tLS0tPGJyPgo8Yj7lj5Hku7bkuro6PC9iPjxzcGFuIGlkPSJy
Y19mcm9tIj4i6YKx5oCd6LGqIiAmbHQ7cWl1c2loYW8yM0BtYWlscy51Y2FzLmFjLmNuJmd0Ozwv
c3Bhbj48YnI+CjxiPuWPkemAgeaXtumXtDo8L2I+PHNwYW4gaWQ9InJjX3NlbnR0aW1lIj4yMDI0
LTAyLTAxIDIzOjI2OjAzICjmmJ/mnJ/lm5spPC9zcGFuPjxicj4KPGI+5pS25Lu25Lq6OjwvYj4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc8YnI+CjxiPuaKhOmAgTo8L2I+IDxicj4KPGI+5Li76aKY
OjwvYj4gVXNlIENsYW5nIGFzIHRvb2xjaGFpbiBmb3IgYnVpbGRyb290PGJyPgo8YnI+Cgk8cD4K
CQk8YnI+Cgk8L3A+Cgk8cCBzdHlsZT0idGV4dC13cmFwOndyYXA7YmFja2dyb3VuZC1jb2xvcjoj
RkZGRkZGO2ZvbnQtZmFtaWx5OuWui+S9kywgYXJpYWwsIFZlcmRhbmEsIHNhbnMtc2VyaWY7Zm9u
dC1zaXplOjE0cHg7Ij4KCQkmbmJzcDtIaSwgSSdtIG5vdCBzdXJlIGlmIG15IG9yaWdpbmFsIGxl
dHRlciBzZW50IGJ5IG15IGFub3RoZXIgbWFpbCBhY2NvdW50IHJlYWNoZWQgcHJvcGVybHksIEkn
bSBzb3JyeSBpZiB0aGlzIGlzIGEgZHVwbGljYXRlIG9uZS4KCTwvcD4KCTxwIHN0eWxlPSJ0ZXh0
LXdyYXA6d3JhcDtiYWNrZ3JvdW5kLWNvbG9yOiNGRkZGRkY7Zm9udC1mYW1pbHk65a6L5L2TLCBh
cmlhbCwgVmVyZGFuYSwgc2Fucy1zZXJpZjtmb250LXNpemU6MTRweDsiPgoJCSZuYnNwO0knbSBu
ZXcgdG8gdGhlIGVtYmVkZGluZyZuYnNwO3RoaW5ncywgYW5kIEknbSBsb29raW5nJm5ic3A7dG8g
dXNlIGJ1aWxkcm9vdCB0byBnZXQgYy9jKysgcGFja2FnZXMgY29tcGlsZWQmbmJzcDt3aXRoIG11
bHRpcGxlJm5ic3A7cGFyYW1ldGVycyZuYnNwO2xpa2UgY29tcGlsZXIsJm5ic3A7YXJjaGl0ZWN0
dXJlIGFuZCBvcHRpbWl6YXRpb24gbGV2ZWwsIGZvciBhY2FkZW1pYyBwdXJwb3NlLiBFLmcsIGlu
IG15IGRhdGFzZXQsIEJpbnV0aWxzIDIuMzIgd2lsbCBiZSBjb21waWxlZCBpbiBbZ2NjMTEsIGFy
bTY0LCBPMF0sIFtnY2MxMSwgYXJtNjQsIE8xXSwgLi4uIGFsb25nIHdpdGggb3RoZXIgdmFyaWFi
bGUgc2V0dGluZ3MuCgk8L3A+Cgk8cCBzdHlsZT0idGV4dC13cmFwOndyYXA7YmFja2dyb3VuZC1j
b2xvcjojRkZGRkZGO2ZvbnQtZmFtaWx5OuWui+S9kywgYXJpYWwsIFZlcmRhbmEsIHNhbnMtc2Vy
aWY7Zm9udC1zaXplOjE0cHg7Ij4KCQkmbmJzcDtJIG5vdGljZWQgdGhhdCBidWlsZHJvb3QgY2Fu
IHNldCBtb3N0IG9mIHZhcmlhYmxlcyBpbiAuY29uZmlnIGZpbGUsIGJ1dCByZWdhcmRpbmcgYWRk
aW5nIGV4dGVybmFsIHRvb2xjaGFpbnMsIGluZm9ybWF0aW9uIGFyZSByZWxhdGl2ZWx5IGluc3Vm
ZmljaWVudC4gSSB3b3VsZCBsaWtlIHRvIGtub3cgaWYgdGhlcmUgYXJlIHNvbWUgd2F5cyB0byBh
ZGQgY29tcGlsZXJzIGxpa2UgY2xhbmcgaW50byB0aGUgcGhhc2Ugb2YgYnVpbGRpbmcgdGFyZ2V0
IHBhY2thZ2VzLgoJPC9wPgoJPHA+CgkJPGJyPgoJPC9wPgoJPHA+CgkJPGJyPgoJPC9wPgo8L2Js
b2NrcXVvdGU+
------=_Part_528345_244161276.1706854878391--


--===============1790351000134641686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1790351000134641686==--

