Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B03C433FE
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 22:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A51540A4E;
	Mon, 24 Jan 2022 22:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gbqkyyrDF9hI; Mon, 24 Jan 2022 22:34:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA6CE40166;
	Mon, 24 Jan 2022 22:34:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB72A1BF3EC
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 22:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E59FC60AEF
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 22:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FJXCUBbdrgzK for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 22:34:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66A6260759
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 22:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643063646;
 bh=/0Rh/M0Hoi+KRLCOP+ZSTlApnVagw7QQGF2U5EY1Lq4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=d8RUqI2Woqu4NuEPGaLbftAr6r82iHjngVlQ7lheH9I3GqPfrQCPEQcClfHWdCTi2
 FIjDmPFay1sekpi397a2ptlc90SuWGN/jiQJJWKu9Pr9DtsscYUghG0FPXAC4SRiXp
 jZX92BTdCyfuq/Xmb2M+DAMrjj3A8A1ft8uyN38o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.192]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49hB-1mCQWN1AW1-01080J; Mon, 24
 Jan 2022 23:34:06 +0100
Date: Mon, 24 Jan 2022 23:34:05 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: =?UTF-8?B?VG9tYcW+IFNtb2RpxaE=?= <tomazsmodis73@hotmail.com>
Message-ID: <20220124233405.250ab307@gmx.net>
In-Reply-To: <VI1PR03MB36771B6256EEB933FE5C7DDDA95E9@VI1PR03MB3677.eurprd03.prod.outlook.com>
References: <VI1PR03MB36771B6256EEB933FE5C7DDDA95E9@VI1PR03MB3677.eurprd03.prod.outlook.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:0UCBRD2qwQ6NeU8DFswTOl8rBxQ/E5d2n5QCNbZtWYYJPkyzGdb
 HH0stmX7cdUic9PSOujf2AtiKvR1jVP0ge+9IcDve3v7Bp0zN31mpjXcF0CDS+jnK8w//7E
 bVCyRAZg/U3U2ODEDPUWEcTySbwGMI7DU9ZooHBWBS29GSln847dbMUiy4KYOGceT9Aj6G+
 YSaRXYTQIhOA7D8YFKIAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6uYs1S+Srcc=:Iy+75TpwEashSIeKW5BpI0
 M0XKQoEHih6Fk9lp6DM5VckXCemf+36YIYA7HdutWlsRwPishlDN4GjONMG/kZPitmx7LUg+P
 9fv/FGohB9BGZdvShVcciE9ezi7+Kq3STF3IaMDK5+DcY7ETt17khrqoZQ/V7oCQltZCdvZ7v
 Vyvfm8cj8paxlKXADJtbJohZVTIbz2IGfwTl1qk1H8gZ14bfVuUEk0qZ//HADCuya2hFb7ZnE
 HU57HVSwcW58owFiQ28j1E5BdR91lt6wFuIVLbRVCRWTpb1YMhpEOjTmXy05CYVfWCPv8OZQE
 0DD+VqRqlvmobYPeFQel3knas2B+FDYpAJG4hdq0KKm7BohIfeNq3YXndMBoBhC3LKHazQHlP
 tvr8KxwP51ZOR2HtDQXk2YjqfFtG6w5pYOB4wR97iVfZ24teJRGKkZPGGcddNL4o7ztsB6yug
 CM3/WPmUt9FUNuPpx1zbRcRb+/W/EZfB9SOFQxuxola6DI1jFZZC83d06pZotbZ2dXNChjYjS
 gR/SEWUXhAOF4Bc5kkYucOHL9NOkC4Sdqqj456WCk0YVPqYsKKW5zDQDAtsRYR3NQq5KvpajW
 GBxptZV1AQEvD+LAhbfrJ7eTFULSswBZRghQD+El/SLPba5EXQI3C69YwXVLBuDy4FpGHEaqc
 1oNlLHbXMd9QlOrnF/3c1Zhp0lQj61eQJgnZuQTIxKIsjs5CgUev0a6E68jFOxaP+ZJMpeIH1
 TXajceCBtTsOuS4Fl5DRDcIlATRsIumVyLzaVqPyS2SVKUF7cJZCSBgqEEBb04xOQvqzAx0c+
 x2Q24iFzGVsd1FybcGzHqjJl0+2s76YEXWGc3fCNj+fD62dXFdVrf6+noEezIpQQ5R/1BrgaD
 1pM5J+Lgk6pcgpbRCoSApdb648q9N6A6IbjSTYNS8rM4eDkzyzDh6Sg4WKFBQXoZ+dABY59c8
 vu8AsxfyydM96DftAYOtHOh1jjz3DXHDH5YBufnFDQeGfgjMOCDo8u1GCMndIEkAWD9rwZh3G
 KTpZ1kC6/IazcSwsMhY2zU4D1vGhNCtz6KsfaiBNKi03EwYfENWHXPH9o3kRafn1WUMI5RtPV
 5fnVAo9wTWflGc=
Subject: Re: [Buildroot] buildroot EGLFS support
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVG9tYcW+LAoKT24gTW9uLCAyNCBKYW4gMjAyMiAxNjoyODowMCArMDEwMCwgVG9tYcW+
IFNtb2RpxaEgPHRvbWF6c21vZGlzNzNAaG90bWFpbC5jb20+IHdyb3RlOgoKPiBIaQo+IAo+IFdp
dGggaGVscCBvZiBNci4gUmljaGFyZCBBc2ggSSBtYW5hZ2VkIHRvIGJ1aWxkIG15IGJ1aWxkcm9v
dCBPcy4KPiAKPiBXaXRoIHRoZSBzYW1lIGNvbXBpbGVyIEkgYnVpZGwvY29tcGlsZWQgUXQgbGli
cmFyaWVzIGFnYWluc3QgYnVpbGRyb290IAo+IHN5c3Jvb3QuCgpXaHkgY29tcGlsZSBvdXRzaWRl
IG9mIGJ1aWxkcm9vdD8gUXQgaXMgd2VsbCBpbnRlZ3JhdGVkIGludG8gYnVpbGRyb290CihhcyBS
aWNoYXJkIGFscmVhZHkgcG9pbnRlZCBvdXQgWzFdKS4uLgoKPiAKPiBJIHdhcyBmaW5hbGx5IGFi
bGUgdG8gcnVuIHNvbWUgY3BwIGNvZGUuIEkgc3VjY2Vzc2Z1bGx5IHJhbiBRdCBjb25zb2xlIAo+
IGFwcGxpY2F0aW9uLgo+IAo+IEhvd2V2ZXIgaWYgSSB0cnkgdG8gcnVuIFF0IEdVSSBBcHBsaWNh
dGlvbiBJIGdvdCBlcnJvcnMuIEkgZW5hYmxlZCBlZ2xmcyAKPiBzdXBwb3J0IGluIG1lbnVjb25m
aWc6Cj4gCj4gSW4gdGFyZ2V0IHBhY2thZ2VzLCBncmFwaGljIGxpYnJhcmllcyBhbmQgYXBwbGlj
YXRpb25zIEkgZW5hYmxlZCBtZXNhM2QgCj4gb3B0aW9uIEdhbGxpdW0gc3dyYXN0IGRyaXZlciBh
bmQgT3BlbkdMIEVHTCBhbmQgT3BlbkdMIEVTIG9wdGlvbnMuCgpXaHkgc3dyYXN0IGFuZCBub3Qg
J0dhbGxpdW0gdmM0IGRyaXZlcic/Cgo+IAo+IEkgcmFuIG1ha2Ugc3VjY2Vzc2Z1bGx5LCBkZXBs
b3llZCB0byBSYXNwYmVycnkgUGkgMyBiKyBidXQgYWZ0ZXIgSSBydW4gCj4gbXkgYXBwIHdpdGg6
Cj4gCj4gc3RyYWNlIC4vbXlhcHAgLXBsYXRmb3JtIGVnbGZzCj4gCj4gSSBnb3QgZXJycm9yOgo+
IAo+IHdyaXRlKDIsICJFR0wgbGlicmFyeSBkb2Vzbid0IHN1cHBvcnQgRW11bCIuLi4sIDQ4RUdM
IGxpYnJhcnkgZG9lc24ndCAKPiBzdXBwb3J0IEVtdWxhdG9yIGV4dGVuc2lvbnMKPiAKPiBBbnkg
YWR2aWNlPwoKTXkgJ3N0YW5kYXJkJyBSUGkzICg2NC1iaXQpIGJ1aWxkcm9vdCB0ZXN0IGNvbmZp
Z3VyYXRpb24gaXMgbGlrZSB0aGUgZm9sbG93aW5nOgoKQlIyX2FhcmNoNjQ9eQpCUjJfQVJNX0ZQ
VV9WRlBWND15CkJSMl9PUFRJTUlaRV8zPXkKQlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfR0xJQkM9
eQpCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfMTA9eQpCUjJfUEFDS0FH
RV9HTElCQ19VVElMUz15CkJSMl9HQ0NfVkVSU0lPTl8xMV9YPXkKQlIyX1RPT0xDSEFJTl9CVUlM
RFJPT1RfQ1hYPXkKQlIyX1JPT1RGU19ERVZJQ0VfQ1JFQVRJT05fRFlOQU1JQ19FVURFVj15CkJS
Ml9TWVNURU1fREhDUD0iZXRoMCIKQlIyX0dFTkVSQVRFX0xPQ0FMRT0iZW5fVVMiCkJSMl9ST09U
RlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJkL3Jhc3BiZXJyeXBpMy02NC9wb3N0LWJ1aWxkLnNo
IgpCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC9yYXNwYmVycnlwaTMtNjQvcG9z
dC1pbWFnZS5zaCIKQlIyX0xJTlVYX0tFUk5FTD15CkJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RB
UkJBTEw9eQpCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9OPSIkKGNhbGwg
Z2l0aHViLHJhc3BiZXJyeXBpLGxpbnV4LDBiNTRkYmRhM2NjYTJiZWI1MWUyMzZhMjU3Mzg3ODRl
OTA4NTNiNjQpL2xpbnV4LTBiNTRkYmRhM2NjYTJiZWI1MWUyMzZhMjU3Mzg3ODRlOTA4NTNiNjQu
dGFyLmd6IgpCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0iYmNtcnBpMyIKQlIyX0xJTlVYX0tF
Uk5FTF9EVFNfU1VQUE9SVD15CkJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJicm9h
ZGNvbS9iY20yNzEwLXJwaS0zLWIgYnJvYWRjb20vYmNtMjcxMC1ycGktMy1iLXBsdXMgYnJvYWRj
b20vYmNtMjgzNy1ycGktMy1iIgpCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15
CkJSMl9QQUNLQUdFX1NUUkFDRT15CkJSMl9QQUNLQUdFX0RFSkFWVT15CkJSMl9QQUNLQUdFX01F
U0EzRD15CkJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9WQzQ9eQpCUjJfUEFDS0FH
RV9NRVNBM0RfT1BFTkdMX0VTPXkKQlIyX1BBQ0tBR0VfUVQ1PXkKQlIyX1BBQ0tBR0VfUVQ1QkFT
RV9FWEFNUExFUz15CkJSMl9QQUNLQUdFX1FUNUJBU0VfT1BFTkdMX0xJQj15CkJSMl9QQUNLQUdF
X1FUNUJBU0VfRUdMRlM9eQpCUjJfUEFDS0FHRV9RVDVCQVNFX0RFRkFVTFRfUVBBPSJlZ2xmcyIK
QlIyX1BBQ0tBR0VfUVQ1QkFTRV9GT05UQ09ORklHPXkKQlIyX1BBQ0tBR0VfUVQ1QkFTRV9IQVJG
QlVaWj15CkJSMl9QQUNLQUdFX1FUNUJBU0VfR0lGPXkKQlIyX1BBQ0tBR0VfUVQ1QkFTRV9KUEVH
PXkKQlIyX1BBQ0tBR0VfUVQ1QkFTRV9QTkc9eQpCUjJfUEFDS0FHRV9RVDVRVUlDS0NPTlRST0xT
PXkKQlIyX1BBQ0tBR0VfUVQ1UVVJQ0tDT05UUk9MUzI9eQpCUjJfUEFDS0FHRV9SUElfRklSTVdB
UkU9eQpCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfQk9PVENPREVfQklOPXkKQlIyX1BBQ0tBR0Vf
UlBJX0ZJUk1XQVJFX1ZBUklBTlRfUEk9eQpCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfQ09ORklH
X0ZJTEU9ImJvYXJkL3Jhc3BiZXJyeXBpMy02NC9jb25maWdfM182NGJpdC50eHQiCkJSMl9UQVJH
RVRfUk9PVEZTX0VYVDI9eQpCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9eQpCUjJfVEFSR0VUX1JP
T1RGU19FWFQyX1NJWkU9IjM4NE0iCiMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQK
QlIyX1BBQ0tBR0VfSE9TVF9ET1NGU1RPT0xTPXkKQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15
CkJSMl9QQUNLQUdFX0hPU1RfTVRPT0xTPXkKCk5lZWRzIG9ubHkgdGhlIGFkZGVkICdkdG92ZXJs
YXk9dmM0LWttcy12M2QnIHRvIHRoZSBib290LXBhcnRpdGlvbgpjb25maWcudHh0IGZpbGUsIG1v
c3QgcHJvdmlkZWQgUXQgZ3VpIGV4YW1wbGVzIHJ1biBmaW5lLCBlLmcuCgoJL3Vzci9saWIvcXQv
ZXhhbXBsZXMvZ3VpL2FuYWxvZ2Nsb2NrL2FuYWxvZ2Nsb2NrCgpvcgoKCS91c3IvbGliL3F0L2V4
YW1wbGVzL3F1aWNrY29udHJvbHMyL2dhbGxlcnkvZ2FsbGVyeQoKZXRjLgoKUmVnYXJkcywKUGV0
ZXIKClsxXSBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIy
LUphbnVhcnkvNjM0MDkzLmh0bWwKCgo+IAo+IGtpbmQgcmVnYXJkcyBUaG9tYXMKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
