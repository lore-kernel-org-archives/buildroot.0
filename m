Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414DAC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 13:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF9C740AE5;
	Tue, 23 Jul 2024 13:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Ag4FogxZHZA; Tue, 23 Jul 2024 13:09:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B067740AF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B067740AF1;
	Tue, 23 Jul 2024 13:09:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E4401BF2F5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C37E60815
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zn16kardV0zM for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 13:09:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93E72606CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93E72606CC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93E72606CC
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:09:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.36.21]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8GQs-1sIxas3hYW-013vJu; Tue, 23
 Jul 2024 15:09:14 +0200
Date: Tue, 23 Jul 2024 15:09:14 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zp-relSpP6Pb5fw4@probook>
References: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
 <20240709-tipidee-v2-2-a69a8668005e@gmx.net>
 <20240722144759.4084dd9b@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240722144759.4084dd9b@windsurf>
X-Provags-ID: V03:K1:iB8gFz2tMrzXu9lX0QtL/pk9R+BK2B/FQ6nxVNjSH5ACY0T5I49
 3Vsd6MdVAjIEFhLZfITJHL8TOh5b4YIy9vNlj+a1oWtqNUilHh1dlOGwjyIZFGM/nLH4mHS
 6eRAnH/IwZpK4sfTzJUoFW5Yu3tV6GunIr84gyl4eLjchVIK6k4W2Rt/3Dd4RxgYffnfr/h
 +04zQNeGcv9LSBHRaWtlQ==
UI-OutboundReport: notjunk:1;M01:P0:ni7GMGZE5N4=;FwDwV4XmwL1PV0/v0dnJjVpKVq2
 GH/2xPqeL3npwaPs6zkbZPjyhjMUo+S+WQw29Mi3FnoXuPdBTQjl7E1bxPPXyvHzDnyXYLT/C
 pmAwbgwajSAxV0ZHnQRYjwo2E9TjLyc0rXDya7P7DC2u5nLMETEz5KnS4/dQ71r8YJ8b7AF4p
 tXtEc575Iq6Rsj0OGqC475oGbLpE6RI9fW+rBPHFTeJJd0lvact1ltZq6FlavpmuRO5jucvTm
 t59LiYSBrEANS5sTPg+DtETh0y+/hRc+pVSZ/rOHz8t7jDpMjlk7rRw/Es4pUPRdnA+urkN7/
 S12+0zTueKnXzSOG/ZSvdTLBZDBmvPgor9Khesbw+gEm4PvdHoLz8XIY7NMxY3xjVBUXMMCoA
 05dLTiGYgQyx5Z4YZswBq27RxKGXKBl1roj1aZplctu0QnvAV2LkHOdEJhdtR8lbSIIiggJn0
 m5isjGIL0vcK0KpiB+/MkO1qqOjoo7JDL3igMqv4/FgqAdacwFPH/r1cU43oEZsgsUaXidvCI
 WSnIkIXtOkkQ3MD/Ac2JQ/FbrmAKoLNzN1joKGkRmXpSnPLhCM2IhlpNNPqN2IJus6eD122Q6
 uwwNmZyybFWIDrjJBnR1jK7aYXOMvXIRWJrie+APwJ8qfYIXZSuZxk/H85yEmU5l+k37OIF/k
 VIRWXOHlEFl/gC+M6X4W49orF8vQDMUN6lGvNY0MwtSEyQpxOoscDvrTcPCIdWfvZNHPlWgfx
 8VSJDYJc5EWrawKq1+087Uuo/Deg3o5moZVWnIcbSXjuNv9E8ypQC2oZ22WP4nws9G/ndL0e6
 eGjKzD9qeolH4fIilpii4ejg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1721740155; x=1722344955; i=j.neuschaefer@gmx.net;
 bh=ahrwKcBQE2C7eH58ZYOy66Jte5VNLnqIUoVT3P6qD04=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Z0ZrGHT85+33JhJS9e2YOgL4Ocr4a9MiIto7QBb8jWXCx2Pm4G+rSjTD8BucOZCG
 qOWbY9aKrriUyXNY5mS+GPQ3V468lS1lHS8qdiiInUHXXLE3BXOBhOrH8eCWhqoCC
 eDp9zF9sMRWi7xVPvJj+g5q2X9tu5TtWHpintS+lyUT8HGXzTjC5v4cF/FW4kQ+w4
 ovQ44FyJlaVk9AqciPkBlZaxB9Ai3B1dJJH3U6iRnQQKY6oEIgesK+mZskSPju540
 dCN7Teizuw9G7ilYU41h8qLoDtNt+f+VrmuNsM5BXx9409vA3XotHHcWqfVyJkxmm
 oeg8bZ8/2u4n4HQ9UA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Z0ZrGHT8
Subject: Re: [Buildroot] [PATCH v2 2/8] s6: bump to version 2.13.0.1
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
 =?utf-8?Q?J=2E_Neusch=C3=A4fer?= via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKdWwgMjIsIDIwMjQgYXQgMDI6NDc6NTlQTSArMDIwMCwgVGhvbWFzIFBldGF6em9u
aSB3cm90ZToKPiBIZWxsbyBKLAo+Cj4gT24gVHVlLCAwOSBKdWwgMjAyNCAwMDo0NTozMyArMDIw
MAo+IEouIE5ldXNjaMOkZmVyIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
PiB3cm90ZToKPgo+ID4gU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVm
ZXJAZ214Lm5ldD4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvczYvczYuaGFzaCB8IDIgKy0KPiA+ICBw
YWNrYWdlL3M2L3M2Lm1rICAgfCAyICstCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBJIGRvbid0IGtub3cgZm9yIHN1cmUgaWYgaXQncyBy
ZWxhdGVkIHRvIHRoZSB2ZXJzaW9uIGJ1bXAsIGJ1dCBvdXIgczYKPiBydW50aW1lIHRlc3QgaXMg
ZmFpbGluZy4gU2VlOgo+Cj4gICBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9qb2JzLzczOTE3OTMxOTUKPgo+IFtCUlRFU1QjIHM2LXRlc3QgLXAgdGVzdHBpcGUK
PiAtc2g6IHM2LXRlc3Q6IG5vdCBmb3VuZAo+Cj4gQ291bGQgeW91IGhhdmUgYSBsb29rIHBlcmhh
cHMgPwoKVGhhbmtzIGZvciB0aGUgaGVhZHMtdXAsIEknbGwgaGF2ZSBhIGxvb2sgbGF0ZXIgKGlu
IGEgZmV3IGRheXMgcHJvYmFibHkpLgoKCi0tIGpuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
