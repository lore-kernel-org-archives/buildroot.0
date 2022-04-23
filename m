Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E89C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20E85826AA;
	Sat, 23 Apr 2022 16:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IbtIYbwfAGpI; Sat, 23 Apr 2022 16:54:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F90982681;
	Sat, 23 Apr 2022 16:54:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BCC61BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 287C460671
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NUPVC3xQSF6Y for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:54:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E8EB605AB
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:54:51 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso11856527fac.2
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+lVvJXtrzsLyGD441GH3/g6MYBONTtyuEuVluLVX8Ws=;
 b=EuVzAHwKrMyWnijTS/Cl+hQLauF+agmER0SNiG2egeuQhXlk+OWfeMC77ycSGmfiyQ
 jOn2zSY22mVJoE7JUoX3TRMZH156dbbilfXB6g3V9019HZAk+v//o7JfDco9D21gAUdu
 Bnu3jQkLknfX4LN/7Z6ztv+kylxRZ51HJHInp6R3FXGVyH3mgD1B/LbJrJPcth2V0dtv
 TKy0H7sL3eMlbnICnxhkSolH/sHevvBLLZxIImojr5Ndw7P1LmXTqw0efFphQSC54zK7
 WtIycnCNPNGCgcFwuEOem3dc8j2jiW2Io6uerDmuyeU0IyYDHyKDW2EXcembNzvnXfux
 SLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+lVvJXtrzsLyGD441GH3/g6MYBONTtyuEuVluLVX8Ws=;
 b=AKkCct4C+zKjXYNAv45TcPvrNWPmpKmCEA3D7ZGc4hhPpcFApYAvjzXCvI/awfxDbL
 I8GiX0AschT1g6s8oRKYK3pmM4m+Jpnf6FvcD8Q/i21bXsG+H7BjztVb6UvM03gIyczf
 N147q4PSh/8W9nZuYQXcljnhEHiso/4niwrOcFO9c8inW7RazP98O2oAsdP7AJnRZu0M
 Yqjs7a4Q9xoWTJ5MPhfglWRvEkayg+gldzPPuSO4GdZC6rSdprtlm9gNs/m4hUVu/oZ8
 0uJvfFVzxDBous8afAJMvrGGkXCC+xftQg7FjU0QgZ5ws7HOV1itO+phvSCKYsgvWjfk
 GpJg==
X-Gm-Message-State: AOAM532dZkfeGv3gTQHK091AzbQSDadhgVcvoiIUAemUwe0Yz6JSk5fh
 WXLQ66jeh9BdSj2unDBEqPNNGRMrUjDEfZJSqr58lpD59Ao=
X-Google-Smtp-Source: ABdhPJz/RyUE2xfYBMyd8KS6L4pwxtzp0oksx9g4qpMi58yPDqO6lvjDjC2xThmupf+Ma/zvq+ayCPcGXunWokiEA7I=
X-Received: by 2002:a05:6871:70a:b0:e9:17b3:53c with SMTP id
 f10-20020a056871070a00b000e917b3053cmr1348354oap.228.1650732890081; Sat, 23
 Apr 2022 09:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220421115529.2625137-1-fontaine.fabrice@gmail.com>
 <79e52372-031a-2836-b2ab-2f78f629d29f@mind.be>
In-Reply-To: <79e52372-031a-2836-b2ab-2f78f629d29f@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 23 Apr 2022 18:52:45 +0200
Message-ID: <CAPi7W80tFnihc=+sKkxAwybV_gJ4cYDPSyxh=iSAO8sZdZLnvQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/arptables: fix build with
 BR2_OPTIMIZE_0
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

TGUgc2FtLiAyMyBhdnIuIDIwMjIgw6AgMTg6MzAsIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5v
dXRAbWluZC5iZT4gYSDDqWNyaXQgOgo+Cj4KPgo+IE9uIDIxLzA0LzIwMjIgMTM6NTUsIEZhYnJp
Y2UgRm9udGFpbmUgd3JvdGU6Cj4gPiBGaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHdp
dGggQlIyX09QVElNSVpFXzAgcmFpc2VkIHNpbmNlIHRoZQo+ID4gYWRkaXRpb24gb2YgdGhlIHBh
Y2thZ2UgaW4gY29tbWl0Cj4gPiBlZmMxMGViNmI4Nzg4NGYxZjc5MTc0NjJkNzhhZjY5NTNmY2Q5
OWUzIGFuZAo+ID4gaHR0cHM6Ly9naXQubmV0ZmlsdGVyLm9yZy9hcnB0YWJsZXMvY29tbWl0Lz9p
ZD0zNjlhZmMxNGRlMWQ4OWZmNTYyN2ZmNGM1ZjcyZjZmODM5MjQ0YjUwOgo+ID4KPiA+IGxpYmFy
cHRjL2xpYmFycHRjLmM6NDg6MjE6IGVycm9yOiByZWRlZmluaXRpb24gb2YgJ2FycHRfZ2V0X3Rh
cmdldCcKPiA+ICAgICA0OCB8ICNkZWZpbmUgR0VUX1RBUkdFVCAgYXJwdF9nZXRfdGFyZ2V0Cj4g
PiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgo+ID4gbGliYXJw
dGMvbGliYXJwdGNfaW5jbC5jOjE2OjE6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyAnR0VU
X1RBUkdFVCcKPiA+ICAgICAxNiB8IEdFVF9UQVJHRVQoU1RSVUNUX0VOVFJZICplKQo+ID4gICAg
ICAgIHwgXn5+fn5+fn5+fgo+ID4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vL2luY2x1ZGUvbGli
YXJwdGMvbGliYXJwdGMuaDo3LAo+ID4gICAgICAgICAgICAgICAgICAgZnJvbSBsaWJhcnB0Yy9s
aWJhcnB0Yy5jOjI2Ogo+ID4gLi8vaW5jbHVkZS9saW51eC9uZXRmaWx0ZXJfYXJwL2FycF90YWJs
ZXMuaDoxOTY6NDM6IG5vdGU6IHByZXZpb3VzIGRlZmluaXRpb24gb2YgJ2FycHRfZ2V0X3Rhcmdl
dCcgd2FzIGhlcmUKPiA+ICAgIDE5NiB8IHN0YXRpYyBfX2lubGluZV9fIHN0cnVjdCB4dF9lbnRy
eV90YXJnZXQgKmFycHRfZ2V0X3RhcmdldChzdHJ1Y3QgYXJwdF9lbnRyeSAqZSkKPiA+ICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fgo+ID4KPiA+IEZpeGVzOgo+ID4gICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9y
Zy9yZXN1bHRzLzczMGRjZTQxMDFlN2FmY2VlMjMzMDY3ZTI4NzA2MDNjZDY0YjhhNDgKPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4KPiA+IC0tLQo+ID4gICAuLi50Yy1saWJhcnB0Y19pbmNsLmMtZml4LWJ1aWxkLXdpdGgt
TzAucGF0Y2ggfCA0OSArKysrKysrKysrKysrKysrKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0
OSBpbnNlcnRpb25zKCspCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2FycHRhYmxl
cy8wMDAyLWxpYmFycHRjLWxpYmFycHRjX2luY2wuYy1maXgtYnVpbGQtd2l0aC1PMC5wYXRjaAo+
ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2FycHRhYmxlcy8wMDAyLWxpYmFycHRjLWxpYmFy
cHRjX2luY2wuYy1maXgtYnVpbGQtd2l0aC1PMC5wYXRjaCBiL3BhY2thZ2UvYXJwdGFibGVzLzAw
MDItbGliYXJwdGMtbGliYXJwdGNfaW5jbC5jLWZpeC1idWlsZC13aXRoLU8wLnBhdGNoCj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uMjlmMmQ3MTRlMgo+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2FnZS9hcnB0YWJsZXMvMDAwMi1saWJhcnB0Yy1s
aWJhcnB0Y19pbmNsLmMtZml4LWJ1aWxkLXdpdGgtTzAucGF0Y2gKPiA+IEBAIC0wLDAgKzEsNDkg
QEAKPiA+ICtGcm9tIDdkODI4NWFlOTIyNTMwMTdhMTUyODJkZDI1Zjc2ZDc2ZWVkNDk1MTggTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCj4gPiArRnJvbTogRmFicmljZSBGb250YWluZSA8Zm9udGFp
bmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiArRGF0ZTogVGh1LCAyMSBBcHIgMjAyMiAxMzo0Mzoy
MyArMDIwMAo+ID4gK1N1YmplY3Q6IFtQQVRDSF0gbGliYXJwdGMvbGliYXJwdGNfaW5jbC5jOiBm
aXggYnVpbGQgd2l0aCAtTzAKPiA+ICsKPiA+ICtGaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWls
dXJlIHdpdGggLU8wOgo+ID4gKwo+ID4gK2xpYmFycHRjL2xpYmFycHRjLmM6NDg6MjE6IGVycm9y
OiByZWRlZmluaXRpb24gb2YgJ2FycHRfZ2V0X3RhcmdldCcKPiA+ICsgICA0OCB8ICNkZWZpbmUg
R0VUX1RBUkdFVCAgYXJwdF9nZXRfdGFyZ2V0Cj4gPiArICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fgo+ID4gK2xpYmFycHRjL2xpYmFycHRjX2luY2wuYzoxNjoxOiBu
b3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ0dFVF9UQVJHRVQnCj4gPiArICAgMTYgfCBHRVRf
VEFSR0VUKFNUUlVDVF9FTlRSWSAqZSkKPiA+ICsgICAgICB8IF5+fn5+fn5+fn4KPiA+ICtJbiBm
aWxlIGluY2x1ZGVkIGZyb20gLi8vaW5jbHVkZS9saWJhcnB0Yy9saWJhcnB0Yy5oOjcsCj4gPiAr
ICAgICAgICAgICAgICAgICBmcm9tIGxpYmFycHRjL2xpYmFycHRjLmM6MjY6Cj4gPiArLi8vaW5j
bHVkZS9saW51eC9uZXRmaWx0ZXJfYXJwL2FycF90YWJsZXMuaDoxOTY6NDM6IG5vdGU6IHByZXZp
b3VzIGRlZmluaXRpb24gb2YgJ2FycHRfZ2V0X3RhcmdldCcgd2FzIGhlcmUKPiA+ICsgIDE5NiB8
IHN0YXRpYyBfX2lubGluZV9fIHN0cnVjdCB4dF9lbnRyeV90YXJnZXQgKmFycHRfZ2V0X3Rhcmdl
dChzdHJ1Y3QgYXJwdF9lbnRyeSAqZSkKPiA+ICsgICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgo+ID4gKwo+ID4gK0ZpeGVzOgo+
ID4gKyAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzczMGRjZTQxMDFl
N2FmY2VlMjMzMDY3ZTI4NzA2MDNjZDY0YjhhNDgKPiA+ICsKPiA+ICtTaWduZWQtb2ZmLWJ5OiBG
YWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPgo+ICAgTm8gdXBz
dHJlYW0gcmVmZXJlbmNlPyBJcyB1cHN0cmVhbSBkZWFkPwoKdXBzdHJlYW0gc2VlbXMgZGVhZDog
bm8gY29tbWl0IHNpbmNlIERlY2VtYmVyIDIwMTk6Cmh0dHBzOi8vZ2l0Lm5ldGZpbHRlci5vcmcv
YXJwdGFibGVzLgoKPgo+ICAgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KPgo+ICAgUmVnYXJk
cywKPiAgIEFybm91dAo+Cj4gPiArLS0tCj4gPiArIGxpYmFycHRjL2xpYmFycHRjX2luY2wuYyB8
IDggLS0tLS0tLS0KPiA+ICsgMSBmaWxlIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCj4gPiArCj4g
PiArZGlmZiAtLWdpdCBhL2xpYmFycHRjL2xpYmFycHRjX2luY2wuYyBiL2xpYmFycHRjL2xpYmFy
cHRjX2luY2wuYwo+ID4gK2luZGV4IGM0ZDVkZTMuLjQ0MWYyZGUgMTAwNjQ0Cj4gPiArLS0tIGEv
bGliYXJwdGMvbGliYXJwdGNfaW5jbC5jCj4gPiArKysrIGIvbGliYXJwdGMvbGliYXJwdGNfaW5j
bC5jCj4gPiArQEAgLTExLDE0ICsxMSw2IEBACj4gPiArIC8qIChDKTE5OTkgUGF1bCBgYFJ1c3R5
JycgUnVzc2VsbCAtIFBsYWNlZCB1bmRlciB0aGUgR05VIEdQTCAoU2VlCj4gPiArICAgIENPUFlJ
TkcgZm9yIGRldGFpbHMpLiAqLwo+ID4gKwo+ID4gKy0jaWZuZGVmIF9fT1BUSU1JWkVfXwo+ID4g
Ky1TVFJVQ1RfRU5UUllfVEFSR0VUICoKPiA+ICstR0VUX1RBUkdFVChTVFJVQ1RfRU5UUlkgKmUp
Cj4gPiArLXsKPiA+ICstICAgIHJldHVybiAodm9pZCAqKWUgKyBlLT50YXJnZXRfb2Zmc2V0Owo+
ID4gKy19Cj4gPiArLSNlbmRpZgo+ID4gKy0KPiA+ICsgc3RhdGljIGludCBzb2NrZmQgPSAtMTsK
PiA+ICsgc3RhdGljIHZvaWQgKmFycHRjX2ZuID0gTlVMTDsKPiA+ICsKPiA+ICstLQo+ID4gKzIu
MzUuMQo+ID4gKwoKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
