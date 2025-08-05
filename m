Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EA5C87FD1
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 10:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF5D561792;
	Tue,  5 Aug 2025 10:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGpSAH8e9Ey5; Tue,  5 Aug 2025 10:00:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76B686177C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B686177C;
	Tue,  5 Aug 2025 10:00:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EEC9233
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 10:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 904D0827D2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 10:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSLz8EjCKMCB for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 10:00:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26AE58244D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26AE58244D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26AE58244D
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 10:00:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([176.3.36.174]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mj8mb-1u6IoL3bTJ-00bUrD; Tue, 05
 Aug 2025 12:00:29 +0200
Date: Tue, 5 Aug 2025 12:00:25 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org,
 J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <aJHWOTj4_yggJ4nM@probook>
References: <20250803133400.2759380-1-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250803133400.2759380-1-thomas.perale@mind.be>
X-Provags-ID: V03:K1:KPTztn8DEg6yx6+BTgXatUsYYSJcrxDANgDYsr0NOBaCNRGrWaL
 nzocuCxSpgLSfeTLUdR4GOEhbPp6g3WRHJGeGEJ+r/5ja0kIdunX4Uzg7pWNAhaeiUCbBLx
 5mRorrQ3Vy7xArNNV/i2pugTnE70Z8+w6WM/IFXHPLpKeS9lpcytnHsCZXFeYDsNtelI/fQ
 N1YPHJI92ijT0XBs1nifw==
UI-OutboundReport: notjunk:1;M01:P0:eHrENBRlt5g=;Z1i5phEugte+U+F8UeQWmtKDyir
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754388029; x=1754992829; i=j.neuschaefer@gmx.net;
 bh=68pfbA2uvHZUcHJxFJhT7E2qMthXAq5hhUuvWFP4QiU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ktaX+SkcnHAHa5qEpdk5Qmdqik7xHU8qPlty6ACayguo0HiFaRekGgocZbGeep6D
 hYOzzKa9PGRLQyUjGiJezVe9J5FjIwpWsE7KdJYSSClXMQFSvGCfv83o0DNH+R7u5
 C1uBxLhZRNHFWxF72sSrUcJ86kf02vfn2BjjYRK5IYyfaPY6tAmm98rTXnG03ruKS
 UjFtI0BBvJ7wfcQGJYFss79VE6FhKWV9uofN7BPKnjOeR+zfmTz47bAeg4Tg2MgCK
 sO5qjfk/ulBIxlojYrS7g1I7NOsS39xWbjtyf6WFn+kXD6fpQOUzs+x4ApV0o4ZBd
 HVHRiC8fIerET65F8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ktaX+Skc
Subject: Re: [Buildroot] [PATCH] package/snooze: fix build w/ uclibc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBBdWcgMDMsIDIwMjUgYXQgMDM6MzQ6MDBQTSArMDIwMCwgVGhvbWFzIFBlcmFsZSB3
cm90ZToKPiBUaGUgZm9sbG93aW5nIGVycm9yIG9jY3VyIG9uIHRoZSBhdXRvYnVpbGRlciBmb3Ig
c3RhdGljIGJ1aWxkIHVzaW5nCj4gYnVpbGRyb290IHRvb2xjaGFpbiBhbmQgdWNsaWJjOgo+IAo+
IGBgYAo+IC91c3IvYmluL21ha2UgLWoxNyAtQyAvaG9tZS9idWlsZHJvb3QvaW5zdGFuY2UtMC9v
dXRwdXQtMS9idWlsZC9zbm9vemUtMC41LyBQUkVGSVg9L3VzciBDQz0vaG9tZS9idWlsZHJvb3Qv
aW5zdGFuY2UtMC9vdXRwdXQtMS9ob3N0L2Jpbi9hcmMtYnVpbGRyb290LWxpbnV4LXVjbGliYy1n
Y2MgQ0ZMQUdTPSItRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9G
SUxFX09GRlNFVF9CSVRTPTY0ICAtT3MgLWcwICAtc3RhdGljICAtc3RhdGljIgo+IG1ha2VbMV06
IEVudGVyaW5nIGRpcmVjdG9yeSAnL2hvbWUvYnVpbGRyb290L2luc3RhbmNlLTAvb3V0cHV0LTEv
YnVpbGQvc25vb3plLTAuNScKPiAvaG9tZS9idWlsZHJvb3QvaW5zdGFuY2UtMC9vdXRwdXQtMS9o
b3N0L2Jpbi9hcmMtYnVpbGRyb290LWxpbnV4LXVjbGliYy1nY2MgLURfTEFSR0VGSUxFX1NPVVJD
RSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAgLU9zIC1nMCAg
LXN0YXRpYyAgLXN0YXRpYyAgICBzbm9vemUuYyAgIC1vIHNub296ZQo+IHNub296ZS5jOjIyOjEw
OiBmYXRhbCBlcnJvcjogc3lzL2F1eHYuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+ICAg
IDIyIHwgI2luY2x1ZGUgPHN5cy9hdXh2Lmg+Cj4gICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+
fn4KPiBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgo+IG1ha2VbMV06ICoqKiBbPGJ1aWx0aW4+OiBz
bm9vemVdIEVycm9yIDEKPiBgYGAKPiAKPiBUaGlzIGVycm9yIGNhbiBiZSByZXByb2R1Y2VkIHdp
dGg6Cj4gCj4gYGBgCj4gY2F0ID4uY29uZmlnIDw8RU9GCj4gQlIyX2FybT15Cj4gQlIyX2NvcnRl
eF9hNz15Cj4gQlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfVUNMSUJDPXkKPiBCUjJfU1RBVElDX0xJ
QlM9eQo+IEJSMl9QQUNLQUdFX1NOT09aRT15Cj4gRU9GCj4gbWFrZSBvbGRkZWZjb25maWcKPiBt
YWtlIHNub296ZQo+IGBgYAo+IAo+IFRoZSBlcnJvciBkb2Vzbid0IG9jY3VyIG9uIGV4dGVybmFs
IHRvb2xjaGFpbnMuCj4gCj4gVGhlIGAjaW5jbHVkZSA8c3lzL2F1eHYuaD5gIHdhcyBvcmluYWxs
eSBpbmNsdWRlZCBpbiB0aGUgaW5pdGlhbCBjb21taXQKPiAoc2VlIFsxXSkgdG8gdXNlIHRoZSBg
Z2V0YXV4dmFsYCBmdW5jdGlvbiBkZWNsYXJhdGlvbi4gVGhpcyBmdW5jdGlvbgo+IHVzYWdlIGhh
cyBzaW5jZSBiZWVuIHJlbW92ZWQgaW4gY29tbWl0IFsyXS4KPiAKPiBUaGlzIHBhdGNoIHJlbW92
ZXMgdGhlIGluY2x1ZGUgdGhhdCBpcyBubyBsb25nZXIgbmVlZGVkLgo+IAo+IFsxXSBodHRwczov
L2dpdGh1Yi5jb20vbGVhaG5ldWtpcmNoZW4vc25vb3plL2NvbW1pdC81NjQ4MDg4MTk3OGE0Y2I1
ODEzNzQ2MjMyZGU5OTUwZDQ2Y2IzMzY5Cj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9sZWFobmV1
a2lyY2hlbi9zbm9vemUvY29tbWl0LzYxMGU2YjM1ZWM2MTQ3NjQ3NzBkNDdiNTk3NGIzMGZkOTBk
Y2U2ZmUKPiAKPiBGaXhlczogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRz
L2FlYy9hZWM0NjNmODcwOTRhNDdlZTA1OTExM2YwOGU4ZWUzNjA0ZGNlYTliCj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgoKVGhhbmtzIQoKUmV2
aWV3ZWQtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Cgo+IC0tLQo+IEhpLAo+
IAo+IE5vdCBzdXJlIHdoeSB0aGUgZXJyb3Igb25seSBoYXBwZW5zIG9uIHRoZSBzcGVjaWZpYyBj
b21iaW5hdGlvbiBvZgo+IGJ1aWxkcm9vdCB0b29sY2hhaW4gYW5kIHN0YXRpYyBidWlsZC4gVGhl
IGBfX2xpbnV4X19gIGRlZmluaXRpb24gaXMKPiBwcmVzZW50IG9uIG90aGVyIHRvb2xjaGFpbiBh
cyB3ZWxsIHNvIGl0IHNob3VsZCBmYWlsIGluIG90aGVyCj4gc2NlbmFyaW8uCj4gCj4gUmVnYXJk
cywKPiBUaG9tYXMKPiAtLS0KPiAgLi4uLzAwMDItc25vb3plLXJlbW92ZS11bnVzZWQtaW5jbHVk
ZS5wYXRjaCAgIHwgMzYgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzYg
aW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zbm9vemUvMDAwMi1z
bm9vemUtcmVtb3ZlLXVudXNlZC1pbmNsdWRlLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2Uvc25vb3plLzAwMDItc25vb3plLXJlbW92ZS11bnVzZWQtaW5jbHVkZS5wYXRjaCBiL3BhY2th
Z2Uvc25vb3plLzAwMDItc25vb3plLXJlbW92ZS11bnVzZWQtaW5jbHVkZS5wYXRjaAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZmJhOTJjZDZiNQo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9wYWNrYWdlL3Nub296ZS8wMDAyLXNub296ZS1yZW1vdmUtdW51c2VkLWlu
Y2x1ZGUucGF0Y2gKPiBAQCAtMCwwICsxLDM2IEBACj4gK0Zyb20gMmVlYmQzM2MxMGQ1YTBmMWE5
ODMxZTNlNDkyMTU4NTdhYjQxZWMwMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTog
VGhvbWFzIFBlcmFsZSA8cGVyYWxlLnRob21hc0BnbWFpbC5jb20+Cj4gK0RhdGU6IFNhdCwgMiBB
dWcgMjAyNSAyMzowOTozMSArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIHNub296ZTogcmVtb3Zl
IHVudXNlZCBpbmNsdWRlCj4gKwo+ICtUaGUgYCNpbmNsdWRlIDxzeXMvYXV4di5oPmAgd2FzIG9y
aW5hbGx5IGluY2x1ZGVkIGluIHRoZSBpbml0aWFsIGNvbW1pdAo+ICsoc2VlIFsxXSkgdG8gdXNl
IHRoZSBgZ2V0YXV4dmFsYCBmdW5jdGlvbiBkZWNsYXJhdGlvbi4KPiArCj4gK1RoaXMgZnVuY3Rp
b24gdXNhZ2UgaGFzIHNpbmNlIGJlZW4gcmVtb3ZlZCBpbiBjb21taXQgWzJdLgo+ICsKPiArVGhp
cyBjb21taXQgcmVtb3ZlcyB0aGUgaW5jbHVkZSB0aGF0IGlzIG5vIGxvbmdlciBuZWVkZWQuCj4g
Kwo+ICtbMV0gaHR0cHM6Ly9naXRodWIuY29tL2xlYWhuZXVraXJjaGVuL3Nub296ZS9jb21taXQv
NTY0ODA4ODE5NzhhNGNiNTgxMzc0NjIzMmRlOTk1MGQ0NmNiMzM2OQo+ICtbMl0gaHR0cHM6Ly9n
aXRodWIuY29tL2xlYWhuZXVraXJjaGVuL3Nub296ZS9jb21taXQvNjEwZTZiMzVlYzYxNDc2NDc3
MGQ0N2I1OTc0YjMwZmQ5MGRjZTZmZQo+ICsKPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNv
bS9sZWFobmV1a2lyY2hlbi9zbm9vemUvcHVsbC8yNAo+ICtTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
UGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+Cj4gKy0tLQo+ICsgc25vb3plLmMgfCA0IC0t
LS0KPiArIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBh
L3Nub296ZS5jIGIvc25vb3plLmMKPiAraW5kZXggZTQ3YWQxMS4uMTE5MjVjYSAxMDA2NDQKPiAr
LS0tIGEvc25vb3plLmMKPiArKysrIGIvc25vb3plLmMKPiArQEAgLTE4LDEwICsxOCw2IEBACj4g
KyAjaW5jbHVkZSA8dGltZS5oPgo+ICsgI2luY2x1ZGUgPHVuaXN0ZC5oPgo+ICsgCj4gKy0jaWZk
ZWYgX19saW51eF9fCj4gKy0jaW5jbHVkZSA8c3lzL2F1eHYuaD4KPiArLSNlbmRpZgo+ICstCj4g
KyBzdGF0aWMgbG9uZyBzbGFjayA9IDYwOwo+ICsgI2RlZmluZSBTTEVFUF9QSEFTRSAzMDAKPiAr
IHN0YXRpYyBpbnQgbmZsYWcsIHZmbGFnOwo+IC0tIAo+IDIuNTAuMQo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
