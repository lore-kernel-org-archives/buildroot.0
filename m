Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC36C433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 17:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C17040A4C;
	Thu,  2 Dec 2021 17:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsek2bmfUypQ; Thu,  2 Dec 2021 17:29:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 468DB40A4E;
	Thu,  2 Dec 2021 17:29:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E9AA1BF3F9
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D3D540A4E
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rONuoYWULygJ for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 17:29:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E83040A4C
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 17:29:22 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id l22so218595lfg.7
 for <buildroot@buildroot.org>; Thu, 02 Dec 2021 09:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/usNeWa/8Z4bKdM7kpelSPkt0kD7zZ3k9GHyp0/BaiA=;
 b=V2nFOAWsE1Ao+GDS5u+N+SkI4StHpgstl4iCEYnZh7/Y6RjwEX0eq9QhjlO3NfKtnN
 Sg5t09a+nUfNfRl/afNSmX90+dleb3xdJ8BBWHk1opX+vS2HpLUr+YF6n8p+QqKdpp3f
 iS0cTJBdSzAYGgQern2lSrTlVipf5lhaA+zq/UeZjQB1YnSN61r8qtYQOpS0KNlcx7eC
 5XEdDaxG59Vih+qIxDyGK0Dv6iZGe4CwsyO5yuKZbJ0bYyN//CN/jtdrPttswXxTCpUL
 vYYqLIM48Ix5HYZGHLciGhaEsKtXCWEpPZlwVS4LQ6LBoH/Oqr+JfO2nKhwduxgv1LvC
 uNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/usNeWa/8Z4bKdM7kpelSPkt0kD7zZ3k9GHyp0/BaiA=;
 b=oXPA63fE0h03ELgnfVJGgsxfvwcQG5FaCAteTpTkLz3GhsdtA6PIDVtUHFI39xOzNM
 rDXHB4W/g9azwpJ1yjJS65dwg3DSV8840RjsF549Ia5Leq1FIqngdKYlqRLhpdLYJtUj
 iH3/lk5yMiKaoQbntp9L4sgwWTEGxl6jOoUNGB/Zxlhe2DruAkQkVXBpWcxm1VTymJpI
 rWmQ6smyynUnm4wdKjxRwe0TR2/Y7wK/HNUV/HNP2nMl/OUTps4UVVkhC/lztcqhLVY7
 17XHPFtTS3yVXTMV1Qce2vaLh0mhGfXt0ohtdljlrGIV6F4LsT6BsmVCNObOnrYMVVUF
 Bdgw==
X-Gm-Message-State: AOAM530BAjEYs1bIbQEQDI1hqKjnyHXP0+yDhJ9gNzh8Lgm1YLqOUc03
 MNJc08+uHvNWU2B4qZtCUjekAVzHcx6/ok5xvhNZBq5ylWcJEw==
X-Google-Smtp-Source: ABdhPJzVGXT+7E00/ma5OxPpfbTL5+p57cOjrrvz8hSF4l/qg3mMK++I+GL20AtG5slVj+7JOnjdaUDrHioUwGoa2Qg=
X-Received: by 2002:a19:4895:: with SMTP id
 v143mr12863944lfa.142.1638466160129; 
 Thu, 02 Dec 2021 09:29:20 -0800 (PST)
MIME-Version: 1.0
References: <20211201070004.563142-1-fontaine.fabrice@gmail.com>
 <875ys7diyy.fsf@dell.be.48ers.dk>
In-Reply-To: <875ys7diyy.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 2 Dec 2021 18:29:08 +0100
Message-ID: <CAPi7W83yET5Hu32DaboR8G3E2Eg-LkUMwhoxo4-5TU5Y1d758Q@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/diffutils: fix build with uclibc < 1.0.35
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

TGUgamV1LiAyIGTDqWMuIDIwMjEgw6AgMTg6MTcsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+Cj4gPj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9u
dGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cml0ZXM6Cj4KPiAgPiBGaXggdGhl
IGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHdpdGggdWNsaWJjIDwgMS4wLjM1IHJhaXNlZCBzaW5j
ZSBidW1wCj4gID4gdG8gdmVyc2lvbiAzLjggaW4gY29tbWl0IDFmODljODA0MTdhZDAzMTI3NjUw
YjIyYzQxZWM0ZTMwZDQyYzU0OWY6Cj4KPiAgPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9zeXMv
cmFuZG9tLmg6NDAsCj4gID4gICAgICAgICAgICAgICAgICBmcm9tIGdldHJhbmRvbS5jOjIyOgo+
ICA+IC9ob21lL2dpdWxpb2JlbmV0dGkvYXV0b2J1aWxkL3J1bi9pbnN0YW5jZS0wL291dHB1dC0x
L2hvc3QveDg2XzY0LWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvc3lzcm9vdC91c3IvaW5jbHVkZS9z
eXMvcmFuZG9tLmg6Mjc6MzU6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAnc2l6ZV90Jwo+ICA+
ICAgIDI3IHwgZXh0ZXJuIGludCBnZXRyYW5kb20odm9pZCAqX19idWYsIHNpemVfdCBjb3VudCwg
dW5zaWduZWQgaW50IGZsYWdzKQo+ICA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fgo+ICA+IC9ob21lL2dpdWxpb2JlbmV0dGkvYXV0b2J1aWxkL3J1bi9p
bnN0YW5jZS0wL291dHB1dC0xL2hvc3QveDg2XzY0LWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvc3lz
cm9vdC91c3IvaW5jbHVkZS9zeXMvcmFuZG9tLmg6ODoxOiBub3RlOiAnc2l6ZV90JyBpcyBkZWZp
bmVkIGluIGhlYWRlciAnPHN0ZGRlZi5oPic7IGRpZCB5b3UgZm9yZ2V0IHRvICcjaW5jbHVkZSA8
c3RkZGVmLmg+Jz8KPiAgPiAgICAgNyB8ICNpbmNsdWRlIDxmZWF0dXJlcy5oPgo+ICA+ICAgKysr
IHwrI2luY2x1ZGUgPHN0ZGRlZi5oPgo+ICA+ICAgICA4IHwKPgo+ICA+IEZpeGVzOgo+ICA+ICAt
IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2FkZWNjM2U1ZGVmMTQwMzQ4
ZGZmZjMwOTYxZmU2NTE0YzlhOGU3YjUKPgo+ICA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9u
dGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ICA+IC0tLQo+ICA+IENoYW5nZXMg
djEgLT4gdjI6Cj4gID4gIC0gVXNlIHVwc3RyZWFtIHBhdGNoCj4KPiAgPiAgLi4uX3JhbmRvbS1w
b3J0LWJldHRlci10by11Q2xpYmMtMS0wLTM1LnBhdGNoIHwgMzkgKysrKysrKysrKysrKysrKysr
Kwo+ICA+ICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQo+ICA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9kaWZmdXRpbHMvMDAwMy1zeXNfcmFuZG9tLXBvcnQtYmV0dGVyLXRv
LXVDbGliYy0xLTAtMzUucGF0Y2gKPgo+ICA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2RpZmZ1dGls
cy8wMDAzLXN5c19yYW5kb20tcG9ydC1iZXR0ZXItdG8tdUNsaWJjLTEtMC0zNS5wYXRjaCBiL3Bh
Y2thZ2UvZGlmZnV0aWxzLzAwMDMtc3lzX3JhbmRvbS1wb3J0LWJldHRlci10by11Q2xpYmMtMS0w
LTM1LnBhdGNoCj4gID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiAgPiBpbmRleCAwMDAwMDAwMDAw
Li5mOWRkMTJmOGU2Cj4gID4gLS0tIC9kZXYvbnVsbAo+ICA+ICsrKyBiL3BhY2thZ2UvZGlmZnV0
aWxzLzAwMDMtc3lzX3JhbmRvbS1wb3J0LWJldHRlci10by11Q2xpYmMtMS0wLTM1LnBhdGNoCj4g
ID4gQEAgLTAsMCArMSwzOSBAQAo+ICA+ICtGcm9tIDEzNTQxNGE3ZjU0M2U0ZDQwYWQwYTdjYmQ1
MTg4NWUxNTlhNmUwZjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gID4gK0Zyb206IFBhdWwg
RWdnZXJ0IDxlZ2dlcnRAY3MudWNsYS5lZHU+Cj4gID4gK0RhdGU6IFR1ZSwgMzAgTm92IDIwMjEg
MTc6NTA6MDEgLTA4MDAKPiAgPiArU3ViamVjdDogc3lzX3JhbmRvbTogcG9ydCBiZXR0ZXIgdG8g
dUNsaWJjIDwgMS4wLjM1Cj4gID4gKwo+ICA+ICtQcm9ibGVtIHJlcG9ydGVkIGJ5IEZhYnJpY2Ug
Rm9udGFpbmUgaW46Cj4gID4gK2h0dHBzOi8vbGlzdHMuZ251Lm9yZy9yL2J1Zy1nbnVsaWIvMjAy
MS0xMS9tc2cwMDA0My5odG1sCj4gID4gKyogbGliL3N5c19yYW5kb20uaW4uaCBbSEFWRV9TWVNf
UkFORE9NX0ggJiYgIV9fR0xJQkNfXyAmJiBfX1VDTElCQ19fXToKPiAgPiArSW5jbHVkZSA8c3Rk
ZGVmLmg+LCBpbiBjYXNlIHRoaXMgZmlsZSBpcyBpbmNsdWRlZCBiZWZvcmUKPiAgPiArX19VQ0xJ
QkNfXyBpcyBkZWZpbmVkLgo+ICA+ICsKPiAgPiArW1JldHJpZXZlZCAoYW5kIGJhY2twb3J0ZWQg
dG8gcmVtb3ZlIENoYW5nZUxvZyB1cGRhdGUpIGZyb206Cj4gID4gK2h0dHBzOi8vZ2l0LnNhdmFu
bmFoLmdudS5vcmcvY2dpdC9nbnVsaWIuZ2l0L2NvbW1pdC8/aWQ9MTM1NDE0YTdmNTQzZTRkNDBh
ZDBhN2NiZDUxODg1ZTE1OWE2ZTBmNF0KPiAgPiArU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gID4gKy0tLQo+ICA+ICsgQ2hhbmdl
TG9nICAgICAgICAgICB8IDkgKysrKysrKysrCj4gID4gKyBsaWIvc3lzX3JhbmRvbS5pbi5oIHwg
NiArKysrLS0KPiAgPiArIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAgPiArCj4gID4gK2RpZmYgLS1naXQgYS9saWIvc3lzX3JhbmRvbS5pbi5oIGIv
bGliL3N5c19yYW5kb20uaW4uaAo+ICA+ICtpbmRleCAxYWJkNmM1NDQuLjhiNGI5MzRhMSAxMDA2
NDQKPiAgPiArLS0tIGEvbGliL3N5c19yYW5kb20uaW4uaAo+ICA+ICsrKysgYi9saWIvc3lzX3Jh
bmRvbS5pbi5oCj4gID4gK0BAIC0yMyw4ICsyMywxMCBAQAo+ICA+ICsKPiAgPiArICNpZiBASEFW
RV9TWVNfUkFORE9NX0hACj4gID4gKwo+ICA+ICstLyogT24gdUNsaWJjLCA8c3lzL3JhbmRvbS5o
PiBhc3N1bWVzIHByaW9yIGluY2x1c2lvbiBvZiA8c3RkZGVmLmg+LiAgKi8KPiAgPiArLSMgaWYg
ZGVmaW5lZCBfX1VDTElCQ19fCj4gID4gKysvKiBPbiB1Q2xpYmMgPCAxLjAuMzUsIDxzeXMvcmFu
ZG9tLmg+IGFzc3VtZXMgcHJpb3IgaW5jbHVzaW9uIG9mIDxzdGRkZWYuaD4uCj4gID4gKysgICBE
byBub3QgdXNlIF9fVUNMSUJDX18gaGVyZSwgYXMgaXQgbWlnaHQgbm90IGJlIGRlZmluZWQgeWV0
Lgo+ICA+ICsrICAgQnV0IGF2b2lkIG5hbWVzcGFjZSBwb2xsdXRpb24gb24gZ2xpYmMgc3lzdGVt
cy4gICovCj4gID4gKysjIGlmbmRlZiBfX0dMSUJDX18KPiAgPiArICMgIGluY2x1ZGUgPHN0ZGRl
Zi5oPgo+Cj4gQXJlIHlvdSBzdXJlIHRoYXQgd29ya3M/IHVDbGliYy1uZyBkZWZpbmVzIF9fR0xJ
QkNfXy4KSW5kZWVkLCBidXQgYXMgZmVhdHVyZXMuaCBpcyBub3QgaW5jbHVkZWQgYmVmb3JlIHRo
aXMgaWZuZGVmLCBpdCB3b3JrcwooSSBidWlsZCB0ZXN0ZWQgaXQpLgpJbiBteSBpbml0aWFsIHBy
b3Bvc2FsLCBJIGluY2x1ZGVkIGZlYXR1cmVzLmggYW5kIGtlcHQgdGhlIGlmZGVmCl9fVUNMSUJD
X18gOiBodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL2J1Zy1nbnVsaWIvMjAyMS0x
MS9tc2cwMDA0NS5odG1sCkhvd2V2ZXIsIHVwc3RyZWFtIHByZWZlcnJlZCB0aGlzIHNvbHV0aW9u
LgpJIGRvbid0IHJlYWxseSBrbm93IGlmIGZlYXR1cmVzLmggaXMgYSB1Y2xpYmMtaGVhZGVyIG9y
IG5vdC4KPgo+IC0tCj4gQnllLCBQZXRlciBLb3JzZ2FhcmQKQmVzdCBSZWdhcmRzLAoKRmFicmlj
ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
