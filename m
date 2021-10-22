Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76095C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 17:42:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAE1861037
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 17:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAE1861037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88E0383BD1;
	Fri, 22 Oct 2021 17:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yDgnu8gJi25K; Fri, 22 Oct 2021 17:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05E5583BCD;
	Fri, 22 Oct 2021 17:42:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9531C1BF298
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 17:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8101A406BE
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 17:42:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECmDXoTAtB-i for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 17:42:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F2DA406A3
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 17:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634924539;
 bh=DNbzR4/6mlU7+s/aZRwQTdd2k4TP6kW5qFR6imkdGts=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=XZIrZINiJQSlV9JElbCk173gdcyP7ZiELmN0j9NUFHvU2AsGAfZ2TaBmVmmNhLXC6
 dfQF9Q177slsBw81p//RPa+Q1MdyBsREtp4bmUU1n0oRMQd9SIEGjmy1hYFkdGsyAm
 f0xvigxE1okvdZEig60vOUNhKmLTkp+ExBUpBNqA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV67y-1mE18u3WnW-00S9Ux; Fri, 22
 Oct 2021 19:42:18 +0200
Date: Fri, 22 Oct 2021 19:42:17 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Message-ID: <20211022194217.4a77a963@gmx.net>
In-Reply-To: <20211022114824.4e9ae29f@kmaincent-XPS-13-7390>
References: <DB6P194MB00220117F126EF57A84FB509B7B19@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211007235019.51751a53@gmx.net>
 <DB6P194MB0022286BBE77E2174FE40B87B7B29@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211008192555.6dbd67d2@gmx.net>
 <DB6P194MB0022742E4E1B12DFEAC7FD24B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <DB6P194MB0022C662CECD3D29EB4BA064B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211019002255.165e5e00@gmx.net>
 <AM0P194MB0706FB2963323BD5D657815EB7BD9@AM0P194MB0706.EURP194.PROD.OUTLOOK.COM>
 <20211019230252.324bbb61@gmx.net> <20211021175901.GE2400@scaer>
 <20211022114824.4e9ae29f@kmaincent-XPS-13-7390>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:JrTGTv1LfoJi8jCuaLO3AK9jgAE20Ssy1kGcXc88TACcI8cXFsR
 fP7n5wBNSoy0auIp1b8FKZrFekMZ2VWNbgvDq67Gw6HiPtR9WqGokpELDHPhIBGnZ/Cn+wH
 e26E8FjNqElHcXkNNGv9a4vBRTXbWWlW+Z9gGF2dfexo3m7CGvBQAttTTYdpkhKmlUyK9Yh
 vYHRh1jSv0yWJXG8ZiX2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GvWBD092gGA=:o88Je4xlOUI1arjxwW3V0o
 8+b9sIytkG5GBF/szPuYB2O71ttSL5ZSmuSyi6SlzNPQT2K/D65l6kFLdwHtp0i9Ahf9y3f3K
 bvLuftomXcuDiwIuGFqstsUHSwtNvbVjs8OvLWLuqxA8iITE0N3+Q3V6LACm763vtxBsE63ci
 mbXFka345sPgMqYjZ0rJmB/FFRcKaB5hXKASc+xRduMO/nUSSSwKtxukxNo3tINQxl+fxu64P
 dd009GBjdOpbKNcUVGs8H+8lnR7tBl62UbidCkJSi8gWbuISt6icHutSDdllJQ1EKkDZIQ06c
 u1ehF460E0cqP0XeYf3NAYPDhHxqdRJfa1416LpVNFjknsGUEIuaLJN6UtNcNolVHTEAK1+WS
 OcKq7vqjdVf4/TlohO24LIuDwbD8vGvP74cbf73vaxXIYc5tpGk3Flhdvfrd32rOx1hsuuA7g
 8DL6mA0PvGbvUT6uhnejyhe+F2hZbmtQQShUS+dZQ/CpCRklLtjIgRwNbc2bOYcZsT6rT3yWe
 VkCuicKItautE/KTJEyOMbqK/wouN6SQhqW83t2b7Rmk3C2PVeYp6cmBlIWw9r9GrQURc+8KC
 WyA0ETXSoDXfKDmYx6ZQSwbNsueNxFBsoGeqDmkZzCxUhXw0SA3ipBewLqUVEJRA5NiKbO37m
 EgqAWBlyH0he/86OY32vj+xaBB1Xx7F/jw3Yx9QeG0ntDM6tJFiFvhvBozjKybUz/q9k+lvqG
 VNNJ6Twcy0Fl5KobFT3EcBKwYyKWEH6QSQc+R7MtTY0D58BOI/J75HMeXLG0wCtQxQkb6TlRO
 pUhplm9E36j1nI8ZsaN+myfWGWkpRwh6tWi8Aahs0QnzuKtXMgAqJRL7EGlDcRj8QNhd0Nl+a
 V16dvbbPZEzNNMSB85f2LLw09GXIIRlaUSPeoML1klUX7cAsMtFHwWofb+xZymbyKWcZBz6zm
 q6DJ0/byTSgQj4EjSnc+JpQqxcULiMzAthJCTkGip/k/+78JZ0o+nYQANsoj8S34b3MOSdNLP
 pYbvO7Ndpm4COMMs09gLf0544ygRgpn1bENFjtC8TXMlBUD4uDPrXCpmOb3rLvExP6OA5zOGk
 PvbtMQeF5/5q+k=
Subject: Re: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, "Walter,
 Stefan" <stefan.walter@iml.fraunhofer.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gS8O2cnksICosCgpPbiBGcmksIDIyIE9jdCAyMDIxIDExOjQ4OjI0ICswMjAwLCBLw7Zy
eSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4gd3JvdGU6Cgo+IFlhbm4sIFBl
dGVyLCBTdGVmYW4sIGFsbAo+IAo+IE9uIFRodSwgMjEgT2N0IDIwMjEgMTk6NTk6MDEgKzAyMDAK
PiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiAKPiA+
ID4gPHN0ZWZhbi53YWx0ZXJAaW1sLmZyYXVuaG9mZXIuZGU+IHdyb3RlOiBUaGUgaG9zdC1ncnVi
MiBtb2R1bGVzIGJ1aWxkIGNhbgo+ID4gPiBiZSBmaXhlZCBieSB0aGUgZm9sbG93aW5nIHBhdGNo
Ogo+ID4gPiAKPiA+ID4gLS0tIGEvYm9vdC9ncnViMi9ncnViMi5tawo+ID4gPiArKysgYi9ib290
L2dydWIyL2dydWIyLm1rCj4gPiA+IEBAIC0xMjUsNyArMTI1LDkgQEAgR1JVQjJfVFVQTEVTLSQo
QlIyX1RBUkdFVF9HUlVCMl9BUk02NF9FRkkpICs9IGFybTY0LWVmaQo+ID4gPiAgIyB1c2UgdGhl
IGNyb3NzIGNvbXBpbGUgdmFyaWFudCB0byBlbnN1cmUgZ3J1YjIgYnVpbGRzCj4gPiA+IAo+ID4g
PiAgSE9TVF9HUlVCMl9DT05GX0VOViA9IFwKPiA+ID4gLSAgICAgICBDUFA9IiQoSE9TVENDKSAt
RSIKPiA+ID4gKyAgICAgICBDUFA9IiQoSE9TVENDKSAtRSIgXAo+ID4gPiArICAgICAgIENGTEFH
Uz0iJChIT1NUX0NGTEFHUykgLU9zIiBcCj4gPiA+ICsgICAgICAgQ1BQRkxBR1M9IiQoSE9TVF9D
UFBGTEFHUykgLU9zIiAgICAKPiA+IAo+ID4gU3VyZSwgYnV0IHdoeSBkbyB3ZSBldmVuIG5lZWQg
dG8gYnVpbGQgdGhlIG1vZHVsZXMgaW4gdGhlIGhvc3QgdmVyc2lvbgo+ID4gdG8gYmVnaW4gd2l0
aD8gIAo+IAo+IEkgYWdyZWUuIFRoaXMgcGF0Y2ggc2VlbXMgbm90IHJlbGV2YW50LiBXZSBidWls
ZCBob3N0LWdydWIyIG9ubHkgZm9yIHRoZQo+IGJpbmFyaWVzLiBTdGVmYW4gc2hvdWxkIHVzZSB0
aGUgdGFyZ2V0IG1vZHVsZXMgZGlyZWN0b3J5IGFuZCBub3QgdGhlIG9uZQo+IGZyb20gdGhlIGhv
c3QuCgpTbyBTdGVmYW4gdXNlLWNhc2Ugb25seSB3b3JrZWQgYnkgY2hhbmNlIGluIHRoZSBwYXN0
IChiZWNhdXNlIGhvc3QvdGFyZ2V0CnNoYXJlZCB0aGUgc2FtZSBhcmNoIHg4NikuLi4KCj4gCj4g
PiBXZSBzaG91bGQgcHJvYmFibHkgYnVpbGQgdGhlIGhvc3QgdmVyc2lvbiB3aXRoIC0td2l0aC1w
bGF0Zm9ybT1ub25lIEkKPiA+IHRoaW5rLgo+ID4gCj4gPiBZZXMsIHdlIGRvIGN1cnJlbnRseSB1
c2UgY2Rib290LmltZyBmcm9tIHRoZSBob3N0LCBidXQgdGhhdCBpcyBwcm9iYWJseQo+ID4gYSBt
aXN0YWtlIGFuZCBhIHJlbW5hbnQgZm9yIGxvbmcgYWdvLi4uIEluc3RlYWQsIEkgdGhpbmsgd2Ug
c2hvdWxkIG9ubHkKPiA+IHVzZWQgbW9kdWxlcyBmcm9tIHRoZSB0YXJnZXQgYnVpbGQuICAKCk9u
ZSBjb3VsZCBhcmd1ZSB0aGF0IGl0IHdvdWxkIGJlIGEgbmljZSBmZWF0dXJlIHRvIGhhdmUgdGhl
IGhvc3QtdG9vbHMgYW5kCnRoZSAoY3Jvc3MtY29tcGlsZWQpIHRhcmdldC1tb2R1bGVzIGluIG9u
ZSBwbGFjZS4uLgo+IAo+IEkgd2lsbCBhZGQgdGhlIG5vbmUgcGxhdGZvcm0gYW5kIHRoZSByaWdo
dCBjZGJvb3QuaW1nIHBhdGggaW50byBteSB2MiBncnViIHBhdGNoCj4gc2VyaWVzLgoKLi4uYnV0
IEkgYW0gZmluZSB3aXRoIHRoaXMgc29sdXRpb24gOy0pCgpSZWdhcmRzLApQZXRlcgoKPiAKPiBS
ZWdhcmRzLAo+IEvDtnJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
