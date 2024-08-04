Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408FEC3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 22:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C94D640223;
	Sun,  4 Aug 2024 22:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGdcb6pynBht; Sun,  4 Aug 2024 22:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7920A40227
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7920A40227;
	Sun,  4 Aug 2024 22:31:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C96D21BF338
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 22:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C37EE6065A
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 22:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVUbNAEaSP9K for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 22:31:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28BBC6062F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28BBC6062F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28BBC6062F
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 22:31:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.195]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1wq3-1sD3v91xvt-00sUzt; Mon, 05
 Aug 2024 00:31:46 +0200
Date: Mon, 5 Aug 2024 00:31:46 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZrABUhTs_V4enewk@probook>
References: <20240719-ztext-v5-1-ec46696d4ed9@gmx.net>
 <20240731000359.270740ba@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240731000359.270740ba@windsurf>
X-Provags-ID: V03:K1:1LCbWzVES5a5VyRmL8hDJxYZwBBPrm9/wkotwPqvPtJpXnxHRD/
 NIakkIWi9u/9wQBUvB+s2XM4lz+iSR3Ew8RiwDtVu1pjmA3tt0p9v/M1+mXbDqrJeMgg2QZ
 Fkpfgw/WiauygIacmTUQJ8CPMuQGcD84oUGT0GC3sJt4l5FhYRLF0dPpjR6JwjGyYKhAKmH
 EGX0n7EqYARF0w/7KKdNg==
UI-OutboundReport: notjunk:1;M01:P0:+nnLhIh+AZQ=;H6Vbtsp4b0ZynTmpOxlmKslnVJ2
 9mIwxvVfte/VaHe7VThLzRxt5WVbnBmwN+ToW8KjJDweKt3LHA0gLhpzYTNM6V069E+t4A9Qk
 jHwXZLtuh9TfK2hNiABZQQUP2uqxA1C9zG9Zr+QT39RrrTyc5J/6MxxHJt+5HXU8YI1NeCleh
 GlI+0g3XJ6kddzUUZR5deeC1AOq/faib6F+cSdM+l1mU9xrF1edLA1vOdldaotXsi9/VateQN
 GLPOz1Z54+ULcjOvBE9bmQqdbX4f+jLgnFagdqHdfJPsC9U+ar/9sm6oWnrVxQLDlUJukM3Tc
 q61IBi4NLmknCwKgf1Anl+JKTb0F2mSV8RFvj+XJXodFS8YVIKMY4NKyHo+zb9NnjDpZYZd3b
 KtYsLrI7GPkPZVlPyLRit7OrJ/U0xWgmAX8L1+LZCRQ77geQnAwWO1RESwpr5gStOD0wDcwzr
 J9qqr9yYJJqnW/2h1pi4hffy1RXiRBzApegoYTk5wIoAYWkICqGEiTn2t7ZiUF0n+Sic8rj0K
 zmAJnpLpkbbHhNxP9Zwv89lW+QQmEZ5+ud1kYnvtJzvBLWHVwZPDlnw0LNIAFAoFSOobeboKu
 eaJgatvHIyHTKMxMGkF+OVpy6GB2uReWgNbRZ5G8FZn/6lk4d8Zu+l24soOXpxip/0fa/Y9fG
 9BVENR1lhmKQhN/i+2IPiwkpWUerX0DMfJ9gPxt/N7UpUGizSPCz1XyAG6vVecJf+GvbpneRh
 lWJbhJ1oW0o8+4R0Z9G8MEZxrwlHF1liuwkhbvRkAfcGRnb+6id9SGmBUBB0ShffO6HEZ+bEi
 kJwgbuFN2Pgf/qi3gYMVDzUQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1722810706; x=1723415506; i=j.neuschaefer@gmx.net;
 bh=T5Mkh1NPQUAA8rqxENlNeWfibPXzZ/WKAO8CSwmfMx8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MAYbWm66b2SXJSK+u5wBe7xxyyEDn1sSpfhdHf+uyr1pb2p3yWt6IGKgYR0bade8
 bb5EBHwsI26IKG6ujuS33PBdhAM6Wlq/WxNRO/9IJmzZQC1PEVfF5AXAMM14PutHW
 UvZQM4LdvzeHxDvSM/F+8aY5dnc35N2n/GnD6KezUMOEBZbOtEkvd+xMrOIJ1mKu2
 AH7gXWw+ccBxgDJ0dkLkBEF+RQslWSoYW7az6VR+MWXrGwCcd7+YYngPzVtLZh4dz
 xrZJFCjtIaiUVrD4K799A5EbQ36IFDtmy3mlMVwHBWnv9lSchVf+gSUQqirIXHkEj
 /b8yE+LdBaVZiDq4UA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=MAYbWm66
Subject: Re: [Buildroot] [PATCH v5] Config.in: ban textrels on musl
 toolchains
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 =?utf-8?Q?J=2E_Neusch=C3=A4fer?= via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgMTI6MDM6NTlBTSArMDIwMCwgVGhvbWFzIFBldGF6em9u
aSB3cm90ZToKPiBIZWxsbyBKLAo+Cj4gT24gRnJpLCAxOSBKdWwgMjAyNCAxNzoyNzoxOSArMDIw
MAo+IEouIE5ldXNjaMOkZmVyIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
PiB3cm90ZToKPgo+ID4gKyMgU2VlIGFsc286IGh0dHBzOi8vd3d3Lm9wZW53YWxsLmNvbS9saXN0
cy9tdXNsLzIwMjAvMDkvMjUvNAo+ID4gK2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wp
OiQoQlIyX1NUQVRJQ19MSUJTKSx5OikKPiA+ICtUQVJHRVRfTERGTEFHUyArPSAtV2wsLXosdGV4
dAo+ID4gK2VuZGlmCj4KPiBVbmZvcnR1bmF0ZWx5LCB0aGlzIGNoYW5nZSBpcyBicmVha2luZyB0
aGUgYnVpbGQgb2YgZ251LWVmaToKPgo+ICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0
L3Jlc3VsdHMvZTNkL2UzZGVjN2UwMzIzYTNmY2IwNzI2OWIzZjllNzNiZWNhYWZlZWRlY2QvYnVp
bGQtZW5kLmxvZwo+Cj4gSXQgc2VlbXMgbGlrZSBnbnUtZWZpIHVzZXMgJChUQVJHRVRfTERGTEFH
UykgZGlyZWN0bHkgYXMgYXJndW1lbnRzIHRvCj4gdGhlIGxpbmtlciwgbm90IGFzIGFyZ3VtZW50
cyB0byBnY2MtdXNlZC1hcy1hLWxpbmtlciwgYW5kIHRoZSBsaW5rZXIKPiBkb2Vzbid0IGtub3cg
YWJvdXQgLVdsLC16LC10ZXh0LgoKSG0sIHRoaXMgaXMgYW4gaW50ZXJlc3RpbmcgY2FzZSwgYmVj
YXVzZSBBRkFJVSBnbnUtZWZpIGlzIGEgYmFyZS1tZXRhbApsaWJyYXJ5IChtb3JlIG9yIGxlc3Mp
LCBzbyBpdCB3b24ndCBiZSB1c2luZyB0aGUgbXVzbCBsZC5zbyBhbnl3YXkuClNvIGl0IHdvdWxk
IGJlIGNvbXBsZXRlbHkgcmVhc29uYWJsZSB0byBzdHJpcCBvdXQgdGhlIC16IHRleHQgaGVyZS4K
Cj4gU28sIGVpdGhlciB3ZSB0byAiLXogdGV4dCIgd2hpY2ggSSBiZWxpZXZlIGlzIHVuZGVyc3Rv
b2QgYnkgYm90aCBnY2MKPiBhbmQgbGQsIG9yIHdlIHNvbWVob3cgZml4IGdudS1lZmkuCgpJIHRo
aW5rIEkgcHJlZmVyIHRoZSBmaXJzdCBvcHRpb24gKHdpdGggYW4gZXhwbGFuYXRvcnkgY29tbWVu
dCkuIEknbGwKc2VuZCBhIHBhdGNoIHdoZW4gSSBnZXQgYXJvdW5kIHRvIGl0LgoKCi0tIGpuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
