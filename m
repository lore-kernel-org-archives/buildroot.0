Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26614C88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 21:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA03980C3F;
	Sun, 13 Sep 2026 21:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPEILCNZ8kFh; Sun, 13 Sep 2026 21:14:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 400B880AF5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789334076;
	b=ekEU4Lkhu5HQ9OZLgRMWR79fLSb3VadzU2CAMHHh5uCL3GWD1BXfgjngvrkWpvMEQ0GD
	 Y89XhhvABt1D/ABHc864vqyXTWpzZFrvooB6LAeObYB04LXI0PO7btRWqGV1uwAATIvyV
	 eJq+rrz6vEUlYkejwPSJQe+0QPFspubrVDceFlfGHgSJ5/EEkaRyFxx6bYcXggA41dIaF
	 kof73do3QTYenHLVcSMHtXB9wXRYJqU8tAHpxz5o7jyMExLz1o4xTJxiIRZlfymAUvDBW
	 iXCUQzubE7uJHVj2jIgnwIbb4kIPkHmPgUNMK7mZFZgCQgnZHavO6wmjZ3Kb6GUzflw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789334076;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:Errors-To:Sender;
	bh=LztNPRuEniebEmgd5ZioHhbZkWtxHZ454Aur6tIlzAU=;
	b=J4bg5IdahI4+fCa5tGbmyGIMsjn5nM1kgu1UC9r/WsF0WU4qGgjLRD5G5ynStaOKnYwf
	 17t0h4fwO3hpNRecRPBOR2Xr8Hl9YznDNkSon9Y54Z7qHW9ABB1qOBKTK4lRXbjjIOK1K
	 APht7VBYkOU8CpCNdhLXzcmNM7zXpouqZc92Nl3eD5wCYFFhppcQgabqFUuCRL/wG6ItH
	 iSUTtTByZ0VGPwnNv0Jm20+D1e4He0mwSwS4iBHgUC3869GNvtoQedNOoZhGBXlzbc1zf
	 Cn0mvCP8dm8d9sQz5hOo4cyR4dVRoMMGB0pMqaxsyRqw1pZ01YbjerWQLdHN+4clqiw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789334076;
	bh=LztNPRuEniebEmgd5ZioHhbZkWtxHZ454Aur6tIlzAU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/nEOedSzaHnJj1NiaIOqNrX/wMb0ZjhntCtfyAfqY9edq3sgXd/uxqNlJD9cx8Wk
	 dwiu5Y5m7OivRh0FO0bMxEZH/wUoBmB9f2srql/0TopGmwJSu23nxx+0WoNYztzXpk
	 1cI3i/1uiJrl/o9AWdDGhMUzXkP/QevPPBhy+70MREL9/5hH05mtw5jr5WqnFtPsTx
	 2/GqSwtpzFfUKPm1WpooGi+DCteLyStZlPciKc6xVgClZY6oe8E7i+lcGW1HkRALrj
	 CLwEHuZkK6DKLJtxfVS19lthTHD/qbqUJJih6bdOn2lTF46ob5fc2/lfWzDCtxP1bp
	 nACA2Q+PoPsvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 400B880AF5;
	Sun, 13 Sep 2026 21:14:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DB94259
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 21:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63595605E5
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 21:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5_kQ6bthwRg for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 21:14:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 07D93605C9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789334072;
 b=i2tvevitX4yktX/qe1L67ZmyTJXjxTxcZxwY+bil2PSmxatb8LGia+M0fKvIHq0p/j5s
 0eh5i86TtDxPyoAmyRRLHChMcaO2tVcE6JeJj43mX+sNGcyzwVoOuuMq70DyRdxGmB1JK
 9eEA3XNuXpf086yLpNqHeo5TU4/N7gReTSzSJ1eYA+bAbJd76ecrxQNNZ5bSM0Pd0pv3X
 8/mgWE7ZyFts+nkRpkUoANAaJr+DzRNxjJrtdTFLjNEkNHFXXM67VHJ+aehkGC/RJlcy4
 oyoCeIbex2vZQEgcX6QiMCCnzBC0G6Eub6EWyg/+BH3QVYlFUQMBduS/UWumkBp70OA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789334072;
 h=Received-SPF:DKIM-Signature:Received:Received:Date:Message-ID:From:
 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type;
 bh=cgCsUIs1w5GtoEHW5uz+HURbWvMEMGgbjgaMToOZ5UU=;
 b=qS7dxsP/ppr3sZ1q6YXm2ihnF863yt9laD6bZZjAPcfLeDctM5LnWimUPAsZmrwZ2Fy3
 dBOxoXMTQrrJ4SR3H2vMRpK1avwahyP6r8baKYmuL1bxLIJ0kKTcAN4089xQhiBDWaz/w
 enhO+zBcVmM/b3tfU4/OXTaPI2I0s/ZKj6o8V5GDrgJzC+ine+A3Mkl6Z7QnJFPYDwBvw
 p2A+0Sxx7hkGWlrUkGRUAFKcIvU2OFEeci0wISXgeo96Cl8Pt16pVaPZU/+UnM/PFZ0Zo
 VZqy0GaGORNGWiEIcKQQB12VcsWJac/C0Dit48g7ySw0JeSTm5nPNA7RUYs0TZbLObg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=igalia.com; 
 dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=MmTl906U; 
 arc=none smtp.remote-ip=213.97.179.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=MmTl906U
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07D93605C9
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 21:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Subject:Cc:To:From:Message-ID:Date:
 From:Reply-To; bh=cgCsUIs1w5GtoEHW5uz+HURbWvMEMGgbjgaMToOZ5UU=; b=MmTl906UTDC
 O2pOht3OTH7FuFMqcicopNJcOW8CPOJ2gyXedwyVFl3J/rGxcoIXwqdFoCTB2UF3+ipz35K4ddAC/
 dXg+MfbdwMXbO3uebH8onz2SNbPJli+Y5/KdiowBUmKVooIhgHl7lsZHYtThPEANiTVIySbiFhT5b
 VWSEXjAtKD0OHd0RxzDvatWdpfvBkUY4sVMDWUK2ZCa2YYEsshKp2YaS59EIScmLaNRG/c+A9CWiC
 G9JUhN174YhWq3gOYz+q4kd98SEGcbbvMpvZpqqIWvbba5tnrzx/rryUhkfwgMdvuDeRJUBB3zELO
 zuDH+u0ECHapNQNSKv71o/Q==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x5rWq-001bDB-3k; Sun, 13 Sep 2026 23:14:23 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 2b3b0259;
 Sun, 13 Sep 2026 21:14:23 +0000 (UTC)
Date: Sun, 13 Sep 2026 23:14:18 +0200
Message-ID: <20260913231418.GE163018209104943@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <87v78bewvz.fsf@dell.be.48ers.dk>
References: <20260910095223.1597453-1-aperez@igalia.com>
 <87v78bewvz.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: security bump to
 version 0.12.0
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
Content-Type: multipart/mixed; boundary="===============2207310154138371526=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2207310154138371526==
Content-Type: multipart/signed; boundary="SDIEqETleSG3Orgw"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--SDIEqETleSG3Orgw
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"; hp="clear"
Date: Sun, 13 Sep 2026 23:14:18 +0200
Message-ID: <20260913231418.GE163018209104943@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: security bump to version
 0.12.0
In-Reply-To: <87v78bewvz.fsf@dell.be.48ers.dk>
References: <20260910095223.1597453-1-aperez@igalia.com>
 <87v78bewvz.fsf@dell.be.48ers.dk>
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gUGV0ZXIsCgpPbiBGcmksIDExIFNlcCAyMDI2IDE1OjMyOjQ4ICswMjAwIFBldGVyIEtv
cnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4gPj4+Pj4gIkFkcmlhbiIgPT0g
QWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IHdyaXRlczoKPiAKPiAg
PiBGaXhlcyBhIHNhbmRib3ggZXNjYXBlIHRocm91Z2ggc3ltbGluayB0cmF2ZXJzYWwgdHJhY2tl
ZCBpbgo+ICA+IENWRS0yMDI2LTg3NzY2LCB3aGljaCBhZmZlY3RzIGFsbCBwcmV2aW91cyB2ZXJz
aW9ucy4KPiAKPiAgPiBVc2luZyB0aGUgYndyYXAgYmluYXJ5IHdpdGggdGhlIHNldHVpZCBiaXQg
c2V0IGlzIG5vIGxvbmdlciBzdXBwb3J0ZWQKPiAgPiBhbmQgdXNlciBuYW1lc3BhY2VzIGFyZSBu
b3cgYWx3YXlzIHJlcXVpcmVkLCBzbyBhIGtlcm5lbCBjb25maWcgZml4dXAKPiAgPiBpcyBhcHBs
aWVkLgo+IAo+ICA+IEEgbmV3IGJ1aWxkIG9wdGlvbiBhbGxvd3MgaW5kaWNhdGluZyB0aGUgbWlu
aW11bSBrZXJuZWwgdmVyc2lvbiB0aGF0Cj4gID4gd2lsbCBiZSB1c2VkLCB3aGljaCByZW1vdmVz
IGNvZGUgdXNlZCBmb3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgd2l0aAo+ICA+IGtlcm5lbHMg
b2xkZXIgdGhhbiA1LjYuMCB3aGVuIGEgbmV3ZXIgdmVyc2lvbiBpcyBzcGVjaWZpZWQuIFBhc3Np
bmcKPiAgPiAkKExJTlVYX1ZFUlNJT05fUFJPQkVEKSBzZWVtcyByZWFzb25hYmxlIGhlcmUuCj4g
Cj4gID4gVGhpcyB2ZXJzaW9uIGFsc28gY2hhbmdlZCB0aGUgbGljZW5zZSBmcm9tIExHUEwtMi4w
KyB0byBMR1BMLTIuMSssCj4gID4gaGVuY2UgdGhlIHVwZGF0ZWQgaGFzaC4KPiAKPiAgPiBSZWxl
YXNlIG5vdGVzOgo+IAo+ICA+ICAgaHR0cHM6Ly9naXRodWIuY29tL2NvbnRhaW5lcnMvYnViYmxl
d3JhcC9yZWxlYXNlcy90YWcvdjAuMTIuMAo+IAo+ICA+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBQ
ZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgo+ICA+IC0tLQo+ICA+ICBwYWNrYWdl
L2J1YmJsZXdyYXAvYnViYmxld3JhcC5oYXNoIHwgIDYgKysrLS0tCj4gID4gIHBhY2thZ2UvYnVi
Ymxld3JhcC9idWJibGV3cmFwLm1rICAgfCAxNyArKysrKysrLS0tLS0tLS0tLQo+ICA+ICAyIGZp
bGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+IAo+ICA+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2J1YmJsZXdyYXAvYnViYmxld3JhcC5oYXNoIGIvcGFja2FnZS9i
dWJibGV3cmFwL2J1YmJsZXdyYXAuaGFzaAo+ICA+IGluZGV4IGU4N2QzYzgxY2IuLmUxNTBlMTQ5
NWQgMTAwNjQ0Cj4gID4gLS0tIGEvcGFja2FnZS9idWJibGV3cmFwL2J1YmJsZXdyYXAuaGFzaAo+
ICA+ICsrKyBiL3BhY2thZ2UvYnViYmxld3JhcC9idWJibGV3cmFwLmhhc2gKPiAgPiBAQCAtMSw1
ICsxLDUgQEAKPiAgPiAtIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9jb250YWluZXJzL2J1YmJs
ZXdyYXAvcmVsZWFzZXMvZG93bmxvYWQvdjAuMTEuMi9idWJibGV3cmFwLTAuMTEuMi50YXIueHou
c2hhMjU2c3VtCj4gID4gLXNoYTI1NiAgNjlhYmMzMDAwNWQyMTg2YmFmNzczN2ZlYWNkOGRhMzU2
MzNiOTNjZjVhZjM4ODM4ZWNmZjE3YzVmOGU5MjRmNiAgYnViYmxld3JhcC0wLjExLjIudGFyLnh6
Cj4gID4gKyMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vY29udGFpbmVycy9idWJibGV3cmFwL3Jl
bGVhc2VzL2Rvd25sb2FkL3YwLjEyLjAvYnViYmxld3JhcC0wLjEyLjAudGFyLnh6LnNoYTI1NnN1
bQo+ICA+ICtzaGEyNTYgIDk3NjBkMDA3MzYzZTNhYmJhN2M3NDc0ODk5MTBmOWY4MmQ5ZmNhNTNi
YTNiZDMyODJlMzk2ZmEzYzk3YTMzMTQgIGJ1YmJsZXdyYXAtMC4xMi4wLnRhci54ego+ICAKPiAg
PiAgIyBIYXNoIGZvciBsaWNlbnNlIGZpbGVzOgo+ICA+IC1zaGEyNTYgIGI3OTkzMjI1MTA0ZDkw
ZGRkODAyNGZkODM4ZmFmMzAwYmVhNWU4M2Q5MTIwM2VhYjk4ZTI5NTEyYWNlYmQ2OWMgIENPUFlJ
TkcKPiAgPiArc2hhMjU2ICBkYzYyNjUyMGRjZDUzYTIyZjcyN2FmM2VlNDJjNzcwZTU2Yzk3YTY0
ZmUzYWRiMDYzNzk5ZDhhYjAzMmZlNTUxICBDT1BZSU5HCj4gID4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvYnViYmxld3JhcC9idWJibGV3cmFwLm1rIGIvcGFja2FnZS9idWJibGV3cmFwL2J1YmJsZXdy
YXAubWsKPiAgPiBpbmRleCA3ODM4YWI5MGIzLi40MGE4MTQ4ZTE0IDEwMDY0NAo+ICA+IC0tLSBh
L3BhY2thZ2UvYnViYmxld3JhcC9idWJibGV3cmFwLm1rCj4gID4gKysrIGIvcGFja2FnZS9idWJi
bGV3cmFwL2J1YmJsZXdyYXAubWsKPiAgPiBAQCAtNCwyMSArNCwyNCBAQAo+ICA+ICAjCj4gID4g
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+ICA+IC1CVUJCTEVXUkFQX1ZFUlNJT04gPSAw
LjExLjIKPiAgPiArQlVCQkxFV1JBUF9WRVJTSU9OID0gMC4xMi4wCj4gID4gIEJVQkJMRVdSQVBf
U0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9jb250YWluZXJzL2J1YmJsZXdyYXAvcmVsZWFzZXMv
ZG93bmxvYWQvdiQoQlVCQkxFV1JBUF9WRVJTSU9OKQo+ICA+ICBCVUJCTEVXUkFQX1NPVVJDRSA9
IGJ1YmJsZXdyYXAtJChCVUJCTEVXUkFQX1ZFUlNJT04pLnRhci54ego+ICA+ICBCVUJCTEVXUkFQ
X0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBsaWJjYXAKPiAgCj4gID4gLUJVQkJMRVdSQVBf
TElDRU5TRSA9IExHUEwtMi4wKwo+ICA+ICtCVUJCTEVXUkFQX0xJQ0VOU0UgPSBMR1BMLTIuMSsK
PiAgPiAgQlVCQkxFV1JBUF9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICA+ICBCVUJCTEVXUkFQ
X0NQRV9JRF9WRU5ET1IgPSBwcm9qZWN0YXRvbWljCj4gIAo+ICA+ICtkZWZpbmUgQlVCQkxFV1JB
UF9DT05GSUdfRklYVVBTCj4gID4gKwkkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19V
U0VSX05TKQo+ICA+ICtlbmRlZgo+ICA+ICsKPiAgPiAgQlVCQkxFV1JBUF9DT05GX09QVFMgPSBc
Cj4gID4gKwktRGFzc3VtZV9rZXJuZWw9JChMSU5VWF9WRVJTSU9OX1BST0JFRCkgXAo+IAo+IFdo
YXQgaGFwcGVucyBpZiB0aGUgY29uZmlnIGRvZXMgbm90IGJ1aWxkIGEgTGludXgga2VybmVsICh0
aGVuIHRoaXMKPiBwcmVzdW1hYmx5IGV4cGFuZHMgdG8gLURhc3N1bWVfa2VybmVsPSk/CgpFeGFj
dGx5LCBhbmQgdGhlIGVtcHR5IHZhbHVlIGlzIHRoZSBkZWZhdWx0IGFzIHdlbGwgZm9yIHRoZSBv
cHRpb24uIEluCnRoYXQgY2FzZSB0aGUgZmFsbGJhY2sgY29kZSBmb3Igb2xkZXIga2VybmVsIHZl
cnNpb25zIGlzIGVuYWJsZWQgZm9yIHRoZQpCdWJibGV3cmFwIGJ1aWxkLiBJTU8gdGhhdCBpcyB0
aGUgcmlnaHQgdGhpbmcgdG8gZG8gYmVjYXVzZSB3ZSBjYW5ub3QKZ3Vlc3Mgd2hpY2gga2VybmVs
IHZlcnNpb24gd2lsbCBiZSB1c2VkIGF0IHJ1bnRpbWUuCiAKQ2hlZXJzLArigJRBZHJpw6FuCg==

--SDIEqETleSG3Orgw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaqcSKwAKCRCRxVnb5MkS
O+a9AJ0cMy8ZxAantbWmmwOM7GhK9MQuUACdEWU8D1W4ZAf2dDuSUYT9mmu73Ac=
=OwbY
-----END PGP SIGNATURE-----

--SDIEqETleSG3Orgw--

--===============2207310154138371526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2207310154138371526==--
