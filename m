Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641D6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 21:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F46C40AD8;
	Wed, 27 Apr 2022 21:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yvbcg7b4QTW6; Wed, 27 Apr 2022 21:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD21A40A19;
	Wed, 27 Apr 2022 21:12:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA931BF2C7
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 21:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A34240A19
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 21:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id owzNwKHIUlPX for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 21:12:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C40EF4010D
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 21:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oFFJ79/g4gXSnP9vHU6X395D3e1rSgQyZAXGIzhUOB4=; b=TLiW5MB9sMJeGvZjBQsLUu8FXO
 oc+7lelDOuE0qW4UUnvR1dEB5y2hSLGyhZ3Ghw/5R5eJDoHSbBCfeE7WH4uDpg9JEmtaEQC9QYEg7
 xY1BQAKLPoJmvO3XZRYXXCf9SwfynS6SKjpqsVyQdqVvlBpytaEi8FODX4cSWQEFLOsmKm7j1GCUs
 WJx6+uXEhjsVAuWhbytJq6k6QORPsgI2cXFYS6BQhoY/NmG9tFv7ka3rIV2jDoXuII9wT2CxZT/c6
 RHF/leYgwQwrS1fRxYPVtfRHWgOJEwid/OBFW+8D1i0ITZUYTXUvYA6Pzfjpvbkg67zR83UsqO3RX
 yz5dFC1Q==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1njoxP-000AtG-Jf; Wed, 27 Apr 2022 23:12:19 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id e40fe939;
 Wed, 27 Apr 2022 21:12:07 +0000 (UTC)
Date: Thu, 28 Apr 2022 00:12:03 +0300
Message-ID: <20220428001203.GB634665@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20220427200838.2896323-1-fontaine.fabrice@gmail.com>
References: <20220427200838.2896323-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bubblewrap: disable tests
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0218467468744310928=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0218467468744310928==
Content-Type: multipart/signed; boundary="ShWY3GRvttIWdfuN"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--ShWY3GRvttIWdfuN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgRmFicmljZSwgYWxsLAoKT24gV2VkLCAyNyBBcHIgMjAyMiAyMjowODozOCArMDIwMCBGYWJy
aWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cj4gRGlzYWJs
ZSB0ZXN0cyB0byBhdm9pZCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgb24gbWlwczMyOgo+
IAo+IFs5LzEwXSBDb21waWxpbmcgQyBvYmplY3QgdGVzdHMvdHJ5LXN5c2NhbGwucC90cnktc3lz
Y2FsbC5jLm8KPiBGQUlMRUQ6IHRlc3RzL3RyeS1zeXNjYWxsLnAvdHJ5LXN5c2NhbGwuYy5vCj4g
L2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0xMS9vdXRwdXQtMS9ob3N0L2Jpbi9t
aXBzZWwtYnVpbGRyb290LWxpbnV4LW11c2wtZ2NjIC1JdGVzdHMvdHJ5LXN5c2NhbGwucCAtSXRl
c3RzIC1JLi4vdGVzdHMgLWZkaWFnbm9zdGljcy1jb2xvcj1hbHdheXMgLVdhbGwgLVdpbnZhbGlk
LXBjaCAtV2V4dHJhIC1PMyAtRF9HTlVfU09VUkNFIC1XZXJyb3I9c2hhZG93IC1XZXJyb3I9ZW1w
dHktYm9keSAtV2Vycm9yPXN0cmljdC1wcm90b3R5cGVzIC1XZXJyb3I9bWlzc2luZy1wcm90b3R5
cGVzIC1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb24gLVdlcnJvcj1wb2ludGVy
LWFyaXRoIC1XZXJyb3I9aW5pdC1zZWxmIC1XZXJyb3I9bWlzc2luZy1kZWNsYXJhdGlvbnMgLVdl
cnJvcj1yZXR1cm4tdHlwZSAtV2Vycm9yPW92ZXJmbG93IC1XZXJyb3I9aW50LWNvbnZlcnNpb24g
LVdlcnJvcj1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlcyAtV2Vycm9yPW1pc2xlYWRpbmctaW5k
ZW50YXRpb24gLVdlcnJvcj1taXNzaW5nLWluY2x1ZGUtZGlycyAtV2Vycm9yPWFnZ3JlZ2F0ZS1y
ZXR1cm4gLVdlcnJvcj1zd2l0Y2gtZGVmYXVsdCAtV3N3aXRjaC1lbnVtIC1Xbm8tc2lnbi1jb21w
YXJlIC1Xbm8tZXJyb3I9c2lnbi1jb21wYXJlIC1Xbm8tbWlzc2luZy1maWVsZC1pbml0aWFsaXpl
cnMgLVduby1lcnJvcj1taXNzaW5nLWZpZWxkLWluaXRpYWxpemVycyAtRF9MQVJHRUZJTEVfU09V
UkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1PMSAtZzAg
LU1EIC1NUSB0ZXN0cy90cnktc3lzY2FsbC5wL3RyeS1zeXNjYWxsLmMubyAtTUYgdGVzdHMvdHJ5
LXN5c2NhbGwucC90cnktc3lzY2FsbC5jLm8uZCAtbyB0ZXN0cy90cnktc3lzY2FsbC5wL3RyeS1z
eXNjYWxsLmMubyAtYyAuLi90ZXN0cy90cnktc3lzY2FsbC5jCj4gLi4vdGVzdHMvdHJ5LXN5c2Nh
bGwuYzozNDo1OiBlcnJvcjogI2Vycm9yICJVbmtub3duIE1JUFMgQUJJIgo+ICAgIDM0IHwgIyAg
IGVycm9yICJVbmtub3duIE1JUFMgQUJJIgo+ICAgICAgIHwgICAgIF5+fn5+CgpZb3UgYmVhdCBt
ZSB0byB0aGUgc3VibWlzc2lvbiBvZiB0aGlzIGZpeCwgdGhhbmtzIQoKPiBGaXhlczoKPiAgLSBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9jZjAzNjUzNTRmYzhjMTZlNTg3
MWQ1NjFkYWFlMGZhNTAzOWQwYmVlCgouLi5hbmQgYSBmZXcgb3RoZXIgYXV0b2J1aWxkZXIgZmFp
bHVyZXMgSSBoYXZlIHNlZW4gZmx5aW5nIGJ5IDopCgo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2Ug
Rm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgoKQWNrZWQtYnk6IEFkcmlhbiBQ
ZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgoKPiAtLS0KPiAgLi4uLzAwMDEtbWVz
b24tYWRkLXRlc3RzLW9wdGlvbi5wYXRjaCAgICAgICAgIHwgNTQgKysrKysrKysrKysrKysrKysr
Kwo+ICBwYWNrYWdlL2J1YmJsZXdyYXAvYnViYmxld3JhcC5tayAgICAgICAgICAgICAgfCAgMyAr
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvYnViYmxld3JhcC8wMDAxLW1lc29uLWFkZC10ZXN0
cy1vcHRpb24ucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9idWJibGV3cmFwLzAwMDEt
bWVzb24tYWRkLXRlc3RzLW9wdGlvbi5wYXRjaCBiL3BhY2thZ2UvYnViYmxld3JhcC8wMDAxLW1l
c29uLWFkZC10ZXN0cy1vcHRpb24ucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAuLjMyODM2ZjkyNWQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9i
dWJibGV3cmFwLzAwMDEtbWVzb24tYWRkLXRlc3RzLW9wdGlvbi5wYXRjaAo+IEBAIC0wLDAgKzEs
NTQgQEAKPiArRnJvbSAzNGVhMGFkODQxZDZmOTE2N2RiMzkxYzA4ZTZjZDUxNDcxZmVkNmJlIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWlu
ZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiArRGF0ZTogU3VuLCAzIEFwciAyMDIyIDExOjI3OjA2ICsw
MjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gbWVzb246IGFkZCB0ZXN0cyBvcHRpb24KPiArCj4gK0Fs
bG93IHRoZSB1c2VyIHRvIGRpc2FibGUgdGVzdHMsIGZvciBleGFtcGxlIHRvIGF2b2lkIHRoZSBm
b2xsb3dpbmcKPiArYnVpbGQgZmFpbHVyZSBvbiBtaXBzMzI6Cj4gKwo+ICtGQUlMRUQ6IHRlc3Rz
L3RyeS1zeXNjYWxsLnAvdHJ5LXN5c2NhbGwuYy5vCj4gKy9ob21lL2F1dG9idWlsZC9hdXRvYnVp
bGQvaW5zdGFuY2UtMTEvb3V0cHV0LTEvaG9zdC9iaW4vbWlwc2VsLWJ1aWxkcm9vdC1saW51eC1t
dXNsLWdjYyAtSXRlc3RzL3RyeS1zeXNjYWxsLnAgLUl0ZXN0cyAtSS4uL3Rlc3RzIC1mZGlhZ25v
c3RpY3MtY29sb3I9YWx3YXlzIC1XYWxsIC1XaW52YWxpZC1wY2ggLVdleHRyYSAtTzMgLURfR05V
X1NPVVJDRSAtV2Vycm9yPXNoYWRvdyAtV2Vycm9yPWVtcHR5LWJvZHkgLVdlcnJvcj1zdHJpY3Qt
cHJvdG90eXBlcyAtV2Vycm9yPW1pc3NpbmctcHJvdG90eXBlcyAtV2Vycm9yPWltcGxpY2l0LWZ1
bmN0aW9uLWRlY2xhcmF0aW9uIC1XZXJyb3I9cG9pbnRlci1hcml0aCAtV2Vycm9yPWluaXQtc2Vs
ZiAtV2Vycm9yPW1pc3NpbmctZGVjbGFyYXRpb25zIC1XZXJyb3I9cmV0dXJuLXR5cGUgLVdlcnJv
cj1vdmVyZmxvdyAtV2Vycm9yPWludC1jb252ZXJzaW9uIC1XZXJyb3I9aW5jb21wYXRpYmxlLXBv
aW50ZXItdHlwZXMgLVdlcnJvcj1taXNsZWFkaW5nLWluZGVudGF0aW9uIC1XZXJyb3I9bWlzc2lu
Zy1pbmNsdWRlLWRpcnMgLVdlcnJvcj1hZ2dyZWdhdGUtcmV0dXJuIC1XZXJyb3I9c3dpdGNoLWRl
ZmF1bHQgLVdzd2l0Y2gtZW51bSAtV25vLXNpZ24tY29tcGFyZSAtV25vLWVycm9yPXNpZ24tY29t
cGFyZSAtV25vLW1pc3NpbmctZmllbGQtaW5pdGlhbGl6ZXJzIC1Xbm8tZXJyb3I9bWlzc2luZy1m
aWVsZC1pbml0aWFsaXplcnMgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VS
Q0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAtTzEgLWcwIC1NRCAtTVEgdGVzdHMvdHJ5LXN5c2Nh
bGwucC90cnktc3lzY2FsbC5jLm8gLU1GIHRlc3RzL3RyeS1zeXNjYWxsLnAvdHJ5LXN5c2NhbGwu
Yy5vLmQgLW8gdGVzdHMvdHJ5LXN5c2NhbGwucC90cnktc3lzY2FsbC5jLm8gLWMgLi4vdGVzdHMv
dHJ5LXN5c2NhbGwuYwo+ICsuLi90ZXN0cy90cnktc3lzY2FsbC5jOjM0OjU6IGVycm9yOiAjZXJy
b3IgIlVua25vd24gTUlQUyBBQkkiCj4gKyAgIDM0IHwgIyAgIGVycm9yICJVbmtub3duIE1JUFMg
QUJJIgo+ICsgICAgICB8ICAgICBefn5+fgo+ICsKPiArRml4ZXM6Cj4gKyAtIGh0dHA6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2NmMDM2NTM1NGZjOGMxNmU1ODcxZDU2MWRhYWUw
ZmE1MDM5ZDBiZWUKPiArCj4gK1NpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRh
aW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ICtbUmV0cmlldmVkIGZyb206Cj4gK2h0dHBzOi8vZ2l0
aHViLmNvbS9jb250YWluZXJzL2J1YmJsZXdyYXAvY29tbWl0LzM0ZWEwYWQ4NDFkNmY5MTY3ZGIz
OTFjMDhlNmNkNTE0NzFmZWQ2YmVdCj4gKy0tLQo+ICsgbWVzb24uYnVpbGQgICAgICAgfCA0ICsr
Ky0KPiArIG1lc29uX29wdGlvbnMudHh0IHwgNiArKysrKysKPiArIDIgZmlsZXMgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvbWVzb24u
YnVpbGQgYi9tZXNvbi5idWlsZAo+ICtpbmRleCA1YjYzYWE2NC4uOTI3N2FjNGUgMTAwNjQ0Cj4g
Ky0tLSBhL21lc29uLmJ1aWxkCj4gKysrKyBiL21lc29uLmJ1aWxkCj4gK0BAIC0xNTIsNCArMTUy
LDYgQEAgaWYgbm90IG1lc29uLmlzX3N1YnByb2plY3QoKQo+ICsgICBzdWJkaXIoJ2NvbXBsZXRp
b25zJykKPiArIGVuZGlmCj4gKyAKPiArLXN1YmRpcigndGVzdHMnKQo+ICsraWYgZ2V0X29wdGlv
bigndGVzdHMnKQo+ICsrICBzdWJkaXIoJ3Rlc3RzJykKPiArK2VuZGlmCj4gK2RpZmYgLS1naXQg
YS9tZXNvbl9vcHRpb25zLnR4dCBiL21lc29uX29wdGlvbnMudHh0Cj4gK2luZGV4IDJmYTNhOGMz
Li5hMTM2YTNjMyAxMDA2NDQKPiArLS0tIGEvbWVzb25fb3B0aW9ucy50eHQKPiArKysrIGIvbWVz
b25fb3B0aW9ucy50eHQKPiArQEAgLTM4LDYgKzM4LDEyIEBAIG9wdGlvbigKPiArICAgZGVzY3Jp
cHRpb24gOiAnZW5hYmxlIG9wdGlvbmFsIFNFTElOVVggc3VwcG9ydCcsCj4gKyAgIHZhbHVlIDog
J2F1dG8nLAo+ICsgKQo+ICsrb3B0aW9uKAo+ICsrICAndGVzdHMnLAo+ICsrICB0eXBlIDogJ2Jv
b2xlYW4nLAo+ICsrICBkZXNjcmlwdGlvbiA6ICdidWlsZCB0ZXN0cycsCj4gKysgIHZhbHVlIDog
J3RydWUnLAo+ICsrKQo+ICsgb3B0aW9uKAo+ICsgICAnenNoX2NvbXBsZXRpb24nLAo+ICsgICB0
eXBlIDogJ2ZlYXR1cmUnLAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2J1YmJsZXdyYXAvYnViYmxl
d3JhcC5tayBiL3BhY2thZ2UvYnViYmxld3JhcC9idWJibGV3cmFwLm1rCj4gaW5kZXggNTg3NWIw
ZDZlMi4uODE0NTZlOWUwZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2J1YmJsZXdyYXAvYnViYmxl
d3JhcC5tawo+ICsrKyBiL3BhY2thZ2UvYnViYmxld3JhcC9idWJibGV3cmFwLm1rCj4gQEAgLTE3
LDcgKzE3LDggQEAgQlVCQkxFV1JBUF9DT05GX09QVFMgPSBcCj4gIAktRHpzaF9jb21wbGV0aW9u
PWRpc2FibGVkIFwKPiAgCS1EbWFuPWRpc2FibGVkIFwKPiAgCS1EcHl0aG9uPSQoSE9TVF9ESVIp
L2Jpbi9weXRob24gXAo+IC0JLURyZXF1aXJlX3VzZXJucz1mYWxzZQo+ICsJLURyZXF1aXJlX3Vz
ZXJucz1mYWxzZSBcCj4gKwktRHRlc3RzPWZhbHNlCj4gIAo+ICBpZmVxICgkKEJSMl9QQUNLQUdF
X0JBU0hfQ09NUExFVElPTikseSkKPiAgQlVCQkxFV1JBUF9DT05GX09QVFMgKz0gXAo+IC0tIAo+
IDIuMzUuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpD
aGVlcnMsCuKAlEFkcmnDoW4K

--ShWY3GRvttIWdfuN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYmmxowAKCRCRxVnb5MkS
O137AJ95Sbg2l9gko2Gr6SUKfmAEOaxqoACbBMnkhzt5jz5t9DpWsHLS0boF7HU=
=sIOo
-----END PGP SIGNATURE-----

--ShWY3GRvttIWdfuN--

--===============0218467468744310928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0218467468744310928==--
