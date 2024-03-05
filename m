Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3028C54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 17:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B30141794;
	Tue,  5 Mar 2024 17:25:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PUdYSaMfvyt6; Tue,  5 Mar 2024 17:25:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57C6741799
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57C6741799;
	Tue,  5 Mar 2024 17:25:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FCFE1BF3A4
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 17:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 397354068E
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 17:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qlia3jovzBF2 for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 17:25:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.177;
 helo=smtpcmd15177.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E1394066D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E1394066D
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E1394066D
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 17:25:02 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hYXDr9PqoT8FyhYXDr4ERl; Tue, 05 Mar 2024 18:25:00 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 5 Mar 2024 18:24:59 +0100
Message-Id: <77002B85-B1D6-4731-80A8-E5510AE9566D@benettiengineering.com>
References: <20240305171938.2252446-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240305171938.2252446-1-fontaine.fabrice@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailer: iPhone Mail (21D61)
X-CMAE-Envelope: MS4xfB6TkZUEwQIC2VseKxr28/TdIq3u1q1o6nV8n5WAFIYpthysEG1ns367WgWbiDakxxOxeseFLm+mDHQoftRSk2FqrQpcQxrBO/R/pS5/1Y6uinkHgAzC
 errI3vzsVP1g3xHvlAj0U7PtZ4cF5RwAmZtQMsFktc2AjxfJXvXDFKESXInbLWN0iiuZOcffTaDp9LvNCV78ac1/hUomNSb3dDEwRdWt0yYkPcTVyHh+mGIw
 AxUVn6bwp083uyk3+jjSmg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1709659500; bh=5n6vVop/wVaVma9+ou2lg8b4/N8obyL/q/2RQzFcb3A=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=dT9DZ8oPm7MjcuFZyH107ClA3q2PjkU94UV78NwHGxBNhjsWUNNeFW8YZ6hYjaZLv
 6qBDzpJUkeFbM/9iI9d7/S63tei0sgcBKXj2NLDSWkxjT6A9WoLsHOCbdAahFPLeI1
 9RUEx0S9suRZTQ2tsETgm9sAly9QXg5mR0EYm8f8W/7Wlb6JdW49tnXx/fm0zJeCi+
 PlpbM06a9iTDqVxEtcuxYfUdc+xgQOzMKqX2+55b9ywbRLiDK5dbA7uxTP8vHbB3Zv
 Rj4MYnCPryrXnbzzEg7tjqMnZBlPqFJ6Xm3c8sjBncZhkidpG1klfuudtbQuVvexI7
 fiT/IKMukQDsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=dT9DZ8oP
Subject: Re: [Buildroot] [PATCH 1/1] package/esp-hosted: disable -Werror
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

SGVsbG8gRmFicmljZSwKCj4gSWwgZ2lvcm5vIDUgbWFyIDIwMjQsIGFsbGUgb3JlIDE4OjE5LCBG
YWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gaGEgc2NyaXR0bzoK
PiAKPiDvu79EaXNhYmxlIC1XZXJyb3IgdG8gZml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVy
ZSByYWlzZWQgYXQgbGVhc3Qgc2luY2UKPiBjb21taXQgYTM4MmE3ZDU1NDMyOTE4ZDJhMWU0N2Fl
NGNiZTdlZDUwZmExN2EwODoKPiAKPiBJbiBmdW5jdGlvbiDigJhkZXN0cm95X2NtZF93ceKAmSwK
PiAgICBpbmxpbmVkIGZyb20g4oCYZXNwX2NvbW1hbmRzX3RlYXJkb3du4oCZIGF0IC9ob21lL2F1
dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtNC9vdXRwdXQtMS9idWlsZC9lc3AtaG9zdGVkLWNl
M2M1MGEzM2ZhNGJjNTYyYTFiNmNiY2VlMjkyYzFhZTBiMGE0MDQvZXNwX2hvc3RlZF9uZy9ob3N0
L2VzcF9jbWQuYzoxNDY3OjI6Cj4gLi9pbmNsdWRlL2xpbnV4L3dvcmtxdWV1ZS5oOjYzOTo5OiBl
cnJvcjogY2FsbCB0byDigJhfX3dhcm5fZmx1c2hpbmdfc3lzdGVtd2lkZV93ceKAmSBkZWNsYXJl
ZCB3aXRoIGF0dHJpYnV0ZSB3YXJuaW5nOiBQbGVhc2UgYXZvaWQgZmx1c2hpbmcgc3lzdGVtLXdp
ZGUgd29ya3F1ZXVlcy4gWy1XZXJyb3I9YXR0cmlidXRlLXdhcm5pbmddCj4gIDYzOSB8ICAgICAg
ICAgX193YXJuX2ZsdXNoaW5nX3N5c3RlbXdpZGVfd3EoKTsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+Cj4gL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS00L291dHB1dC0xL2J1aWxk
L2VzcC1ob3N0ZWQtY2UzYzUwYTMzZmE0YmM1NjJhMWI2Y2JjZWUyOTJjMWFlMGIwYTQwNC9lc3Bf
aG9zdGVkX25nL2hvc3QvZXNwX2NtZC5jOjQwODoxNzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1h
Y3JvIOKAmGZsdXNoX3NjaGVkdWxlZF93b3Jr4oCZCj4gIDQwOCB8ICAgICAgICAgICAgICAgICBm
bHVzaF9zY2hlZHVsZWRfd29yaygpOwo+ICAgICAgfCAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn4KPiAKPiBGaXhlczoKPiAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9y
Zy9yZXN1bHRzLzZhYzdhNDYwMTkzOGQzMjk2ZWQxNjU3YzA2ZjhjZGY0MzM3NTdkNzMKPiAtIGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzc5OTdjYzhhNjc2NDVhNmUxY2Y0
ZTI0ZDE3MmM2ZmVhZTQ1OWRjZmIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5l
IDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgpS
ZXZpZXdlZC1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVl
cmluZy5jb20+CgpCZXN0IHJlZ2FyZHMKR2l1bGlvCgo+IC0tLQo+IHBhY2thZ2UvZXNwLWhvc3Rl
ZC9lc3AtaG9zdGVkLm1rIHwgMSArCj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZXNwLWhvc3RlZC9lc3AtaG9zdGVkLm1rIGIvcGFja2Fn
ZS9lc3AtaG9zdGVkL2VzcC1ob3N0ZWQubWsKPiBpbmRleCBjYzYxZTM5YjM2Li4wMmRlM2RiYzUy
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZXNwLWhvc3RlZC9lc3AtaG9zdGVkLm1rCj4gKysrIGIv
cGFja2FnZS9lc3AtaG9zdGVkL2VzcC1ob3N0ZWQubWsKPiBAQCAtMTIsNiArMTIsNyBAQCBFU1Bf
SE9TVEVEX0xJQ0VOU0VfRklMRSA9IExJQ0VOU0UKPiBFU1BfSE9TVEVEX01PRFVMRV9TVUJESVJT
ID0gZXNwX2hvc3RlZF9uZy9ob3N0Cj4gCj4gZGVmaW5lIEVTUF9IT1NURURfTElOVVhfQ09ORklH
X0ZJWFVQUwo+ICsgICAgJChjYWxsIEtDT05GSUdfRElTQUJMRV9PUFQsQ09ORklHX1dFUlJPUikK
PiAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19ORVQpCj4gICAgJChjYWxsIEtD
T05GSUdfRU5BQkxFX09QVCxDT05GSUdfV0lSRUxFU1MpCj4gICAgJChjYWxsIEtDT05GSUdfRU5B
QkxFX09QVCxDT05GSUdfQ0ZHODAyMTEpCj4gLS0KPiAyLjQzLjAKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
