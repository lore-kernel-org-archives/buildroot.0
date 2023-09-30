Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F270E77365
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 10:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A59B260FA4;
	Sat, 30 Sep 2023 10:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A59B260FA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w640daXHMJ9l; Sat, 30 Sep 2023 10:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A792B60F9E;
	Sat, 30 Sep 2023 10:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A792B60F9E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9D2B1BF2F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 10:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C195242D54
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 10:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C195242D54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cAErc9aM7MA for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 10:23:44 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAFF642D4F
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 10:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAFF642D4F
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.166] ([178.115.66.189]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MybGX-1rZXHt1tKn-00z2Xz; Sat, 30
 Sep 2023 12:23:40 +0200
Message-ID: <a846027a-93c3-4ea5-93a1-fae021f5653b@gmx.at>
Date: Sat, 30 Sep 2023 12:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20230930092150.526483-1-thomas.petazzoni@bootlin.com>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <20230930092150.526483-1-thomas.petazzoni@bootlin.com>
X-Provags-ID: V03:K1:r6XhUy6NtNtQSpEeJyazFh0vEIOYiDZPrmyLno2wjI7hF7gUeId
 TOmB8s+m4M25qKh3gqkfzbJv18fpRxS1FrNuT6zeMQ6tg/Y6bhxYSxSXRsYade2IL/V2L4N
 2QFDrj2xmXqdsigHH65VqRbG9a7dmjbgM9LszCmqdejs9MYt1PWkd7SFWWsRKzA624tk12g
 1O/f47i/8Zjx3m9TSo8Tg==
UI-OutboundReport: notjunk:1;M01:P0:kK/kyeGPmhk=;ZCDbjfxiSXmumHkwZ6uCB0LoFPA
 GgHcjZz2P8DOIadYMJMaPOXmVeHA1vgmioZ9nzxyG57Nc2Fn0hSeH/cplhWRJ9W8C/EQ4V0jR
 9cVgBumJ6tQ/Vcd27tGWsqp0Dwr6DjYPVnn2XgZ9ZCr/EGRxyc88cvjO8lPIK/3iECIif5Re5
 tNfw//TCvC5LV/0gJi0xhFAW4DeRlLUohoGhk5dWYDLBnoDHjxSk9djA/4qQRbR0D7I5DbLij
 A1mKuvkWJnmnA6LB190Up7IkudLSuPW0zW5fxVu5VYselzAlBLax85VnIcqDWleBfmW+qIMi9
 P1k7dh90Geoz6W/sFa1ncVxZcsQDksx7kQ3Z+da+nXU+T59y+ZKdvZ8l+JQVm4tkMyqLwwZ6n
 cznThFr+HRUuxP87nZrb+M2e7cxP2/njHy+NeCIZfIBSg4D0M8h0XB3aCQcEj5VUghiKrzRwb
 9n9Aj1kcRYesSLa9OKvv+ZAR8tdt6Ws8fb2iKgJM3cVRSPaLytqaEhboTczyD9Ea9OdnUoyHk
 qHbZ9fa1s2eyTshUFVCqZMAtmN5/1hXUGcVqlrtT21tDpqSNGtCyzcPxCxLonIjHURbcKa/Lu
 1FYZZYuKjKQ0kosBRo87oKs24KTpEhKiTh9xf+tnjP4ve/Chz14wXSD/PbEoezHxxhNgXxJ5G
 1iWkO5JPVvNweS+UDxlDpsl4LzPUjhW8GqnZ3ikzSQknEib+nzvo4BsnFoQqd3BEQCmpaRqCm
 nQ4/5Vxjq7nzE9I147lYrPV97pE7FIi6CFdWjQ60ySZcNAAtbcOKH6rPNupy+2QARFNZ97Znp
 SepJDuf02ZALCb2TSrBr5lXk9z24wJ5X9FfxCP2oVRnD4B8kGI3SmroTTodl+B1y2i0evjuLx
 0b1O87K1fgSoqd3AfOgQWSwHhwGjhCIl7vxtR6GQrSL8q1o9orrEpyO30azj0B9ry6sqmYij8
 RxNn4A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1696069420; x=1696674220; i=dalang@gmx.at;
 bh=um4Ukb8WGIauVSzgLM/LEgFTue1Uls7eG2A2L6t8Zv4=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=YNAjx57nh7Na3ZIP3Z4dFC1nGBRQm0NwJQ9XRptTDXeHJP/04rSrl4rXX1QKV29Z1bVIVcSP4dq
 4n4CSo8fYzoGit/GxpcPr7zMEheszkwrWhJl2AU1NS9SsruZR71bek+9oiWNeYv0RKYfLa7npxqgL
 etTLkArQ7xwDkszWRvRibm2O7SzKhVi6NtTMbIn1pvqanifzJNm8sm/OpkbRsbmZe/s5SYtBsK0AQ
 zu+wLF8ku2daLb8VoYSSPI4N6pFfvEiPMa17EUOK9s+V6kqivcBOMzhdvcgmQMMG4NUWQtumtR5fq
 nijaiHTr7OP5a+m4HghDFBchGN8yTGD+gvAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=YNAjx57n
Subject: Re: [Buildroot] [PATCH] docs/website/association.html: move
 buildroot-association to Gitlab
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGV5IFRob21hcywKCk9uIDMwLjA5LjIzIDExOjIxLCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWls
ZHJvb3Qgd3JvdGU6Cj4gVGhlIGJ1aWxkcm9vdC1hc3NvY2lhdGlvbiByZXBvc2l0b3J5IHVzZWQg
dG8gYmUgaG9zdGVkIG9uIEdpdGh1YiwgdGhlbgo+IHdhcyBjbG9zZWQgZm9yIHNvbWUgYmFua2lu
ZyBpc3N1ZXMuIFdlJ3JlIG5vdyBtYWtpbmcgaXQgcHVibGljIGFnYWluLAo+IGJ1dCBvbiBHaXRs
YWIgbGlrZSB0aGUgcmVzdCBvZiBCdWlsZHJvb3QuCgpHcmVhdCBtb3ZlIQoKSSB0aGluayBJIGZv
dW5kIGFub3RoZXIgaW5zdGFuY2Ugd2hlcmUgR2l0aHViCm5lZWRzIHRvIGJlIHJlcGxhY2VkIHdp
dGggR2l0bGFiLgpTZWUgYmVsb3cuCgo+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiAtLS0KPiAgZG9jcy93ZWJzaXRlL2Fz
c29jaWF0aW9uLmh0bWwgfCAxMiArKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kb2NzL3dlYnNpdGUv
YXNzb2NpYXRpb24uaHRtbCBiL2RvY3Mvd2Vic2l0ZS9hc3NvY2lhdGlvbi5odG1sCj4gaW5kZXgg
MDIxNWY4NTg3NC4uZGE3MzNjNTAxMyAxMDA2NDQKPiAtLS0gYS9kb2NzL3dlYnNpdGUvYXNzb2Np
YXRpb24uaHRtbAo+ICsrKyBiL2RvY3Mvd2Vic2l0ZS9hc3NvY2lhdGlvbi5odG1sCj4gQEAgLTMy
LDIxICszMiwyMSBAQAo+ICAJICA8L3VsPgo+Cj4gIAkgIDxwPlRoZSBieWxhd3Mgb2YgdGhlIGFz
c29jaWF0aW9uIGFyZSBhdmFpbGFibGUKPiAtCSAgaW4gPGEgaHJlZj0iaHR0cHM6Ly9yYXcuZ2l0
aHVidXNlcmNvbnRlbnQuY29tL2J1aWxkcm9vdC9idWlsZHJvb3QtYXNzb2NpYXRpb24vbWFzdGVy
L3N0YXR1dHNfZnIudHh0Ij5GcmVuY2g8L2E+Cj4gKwkgIGluIDxhIGhyZWY9Imh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC1hc3NvY2lhdGlvbi8tL3Jhdy9tYXN0ZXIv
c3RhdHV0c19mci50eHQiPkZyZW5jaDwvYT4KPiAgCSAgKG9mZmljaWFsKSBhbmQKPiAtCSAgaW4g
PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWlsZHJvb3QtYXNzb2NpYXRp
b24vYmxvYi9tYXN0ZXIvc3RhdHV0ZXNfZW4udHh0Ij5FbmdsaXNoPC9hPgo+ICsJICBpbiA8YSBo
cmVmPSJodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QtYXNzb2NpYXRp
b24vLS9yYXcvbWFzdGVyL3N0YXR1dGVzX2VuLnR4dCI+RW5nbGlzaDwvYT4KPiAgCSAgKHVub2Zm
aWNpYWwgdHJhbnNsYXRpb24pLiBUaGUgYXNzb2NpYXRpb24gd2FzIGRlY2xhcmVkIG9uCj4gIAkg
IE1hcmNoIDE0LCAyMDE2IHRvIHRoZSA8ZW0+UHLDqWZlY3R1cmUgZGUgSGF1dGUtR2Fyb25uZTwv
ZW0+Cj4gIAkgIChGcmFuY2UpIGFuZCBpcyByZWdpc3RlcmVkIHVuZGVyIHRoZSBuwrBXMzEzMDI0
Mjc4LiBTZWUgdGhpcwo+IC0JICBvZmZpY2lhbCA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
YnVpbGRyb290L2J1aWxkcm9vdC1hc3NvY2lhdGlvbi9ibG9iL21hc3Rlci9wZGYvUmVjZXBpc3Nl
X0NSLnBkZiI+cmVjZWlwdDwvYT4KPiArCSAgb2ZmaWNpYWwgPGEgaHJlZj0iaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290LWFzc29jaWF0aW9uLy0vcmF3L21hc3Rlci9w
ZGYvUmVjZXBpc3NlX0NSLnBkZiI+cmVjZWlwdDwvYT4KPiAgCSAgZnJvbSB0aGUgRnJlbmNoIGF1
dGhvcml0aWVzLjwvcD4KPgo+ICAJICA8cD5PdXIgYWNjb3VudGluZyBpcyBmdWxseSBwdWJsaWMs
IGluY2x1ZGluZyB0aGUgYmFuawo+ICAJICBhY2NvdW50IHN1bW1hcmllcywKPiAtCSAgc2VlIDxh
IGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9idWlsZHJvb3QvYnVpbGRyb290LWFzc29jaWF0aW9u
L3RyZWUvbWFzdGVyL2FjY291bnRpbmciPmFjY291bnRpbmc8L2E+LiBOdW1lcm91cwo+ICsJICBz
ZWUgPGEgaHJlZj0iaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290LWFz
c29jaWF0aW9uLy0vdHJlZS9tYXN0ZXIvYWNjb3VudGluZyI+YWNjb3VudGluZzwvYT4uIE51bWVy
b3VzCj4gIAkgIG90aGVyIGFkbWluaXN0cmF0aXZlIGRvY3VtZW50cyByZWxhdGVkIHRvIHRoZSBh
c3NvY2lhdGlvbgo+ICAJICBhcmUgYXZhaWxhYmxlIG9uCj4gLQkgIGl0cyA8YSBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vYnVpbGRyb290L2J1aWxkcm9vdC1hc3NvY2lhdGlvbi8iPkdpdGh1Ygo+
ICsJICBpdHMgPGEgaHJlZj0iaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290LWFzc29jaWF0aW9uLyI+R2l0aHViCgpUaGUgdGV4dCBuZWVkcyB0byBiZSBjaGFuZ2VkIHRv
IEdpdGxhYiBhcyB3ZWxsOgoKLQkgIGl0cyA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vYnVp
bGRyb290L2J1aWxkcm9vdC1hc3NvY2lhdGlvbi8iPkdpdGh1YgorCSAgaXRzIDxhIGhyZWY9Imh0
dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC1hc3NvY2lhdGlvbi8iPkdp
dGxhYgoKPiAgCSAgcmVwb3NpdG9yeTwvYT48L3A+Cj4gIAk8L2Rpdj4KPiAgICAgICAgPC9kaXY+
Cj4gQEAgLTY4LDcgKzY4LDcgQEAKPgo+ICAJICA8cD5PbmNlIHRoZSBtZW1iZXJzaGlwIGZlZSBp
cyByZWNlaXZlZCwgaXQgd2lsbCBiZSBsaXN0ZWQgaW4KPiAgCSAgdGhlCj4gLQkgIGFzc29jaWF0
aW9uIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9idWlsZHJvb3QvYnVpbGRyb290LWFzc29j
aWF0aW9uL3RyZWUvbWFzdGVyL2FjY291bnRpbmciPmFjY291bnRpbmc8L2E+Cj4gKwkgIGFzc29j
aWF0aW9uIDxhIGhyZWY9Imh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9v
dC1hc3NvY2lhdGlvbi8tL3RyZWUvbWFzdGVyL2FjY291bnRpbmciPmFjY291bnRpbmc8L2E+Cj4g
IAkgIGZpbGVzLCB3aGljaCBzZXJ2ZSBhcyB0aGUgb2ZmaWNpYWwgbGlzdCBvZgo+ICAJICBtZW1i
ZXJzLiBUaGVyZWZvcmUsIG1lbWJlcnMgYWNjZXB0IHRoYXQgdGhlaXIgbmFtZSBhbmQgdGhlCj4g
IAkgIGFtb3VudCBvZiB0aGVpciBtZW1iZXJzaGlwIGZlZSBpcyBtYWRlIHB1YmxpYy48L3A+CgpS
ZWdhcmRzCkRhbmllbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
