Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB35C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 19:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6228E60BAA;
	Mon, 20 Jan 2025 19:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kY0X4laj_kB2; Mon, 20 Jan 2025 19:14:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65D5660B45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65D5660B45;
	Mon, 20 Jan 2025 19:14:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EEF8DD7
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDB5B405C4
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQR7kNGSNJFX for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 19:14:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73A7A405BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73A7A405BF
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73A7A405BF
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:14:17 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 320B82C80189;
 Mon, 20 Jan 2025 20:14:15 +0100 (CET)
Message-ID: <f03421cd-b630-4620-9d8f-8f34e0d5f69e@bubu1.eu>
Date: Mon, 20 Jan 2025 20:14:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>,
 buildroot@buildroot.org
References: <20240809191831.1389128-1-lazzer@gmail.com>
 <20240809191831.1389128-2-lazzer@gmail.com>
Content-Language: en-US
In-Reply-To: <20240809191831.1389128-2-lazzer@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1737400455; bh=5fQuCJ97PIJhVVgYGzfmTKqGzdda+4LJSlrnItkdWUo=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=GZ+S9Ggiw2bvQmv6GUiIAaLyT+djCgfoXm2OyVNQgVl5b76E/1ktFQcrAP70wL+a8
 fi11q2qoen+h/k5TpdU/DHqc7bJBXykXZIP+USPMh6X0DqEXYwc+bzA4yBmSKvXSNu
 F+E4x9RqcxAKMnwu42XI3ZH86gnqJFie9Lxips6fbBAqx+nArIoi1SmO4Xu8D9vjEu
 YRHW3j8cXdrhLCee4NtEV62yRlkdygjXVjUNcU4bfAaIC8UDz2O1d03v/R2T4nWNmx
 XAqKx2jbUbPRot8V6FQCQGudv/TMu8I3VqFFBojSZ/CO+2eggsBHiU5+1l3NUwi6R6
 wfzg3iI0w7UfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=GZ+S9Ggi
Subject: Re: [Buildroot] [PATCH v2 1/2] package/uboot-tools: bump to version
 2024.04
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWF0dGlhcywKCk9uIDA5LjA4LjI0IDIxOjE4LCBNYXR0aWFzIFdhbHN0csO2bSB3cm90ZToK
PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aWFzIFdhbHN0csO2bSA8bGF6emVyQGdtYWlsLmNvbT4KPiAt
LS0KPiAgIC4uLi8wMDAxLWRyb3AtY29uZmlnaC1mcm9tLXRvb2xzLnBhdGNoICAgICAgICB8IDIw
ICsrKysrKysrKysrCj4gICAuLi4tdG9vbHMtb25seS1pbi1uby1kb3QtY29uZmlnLXRhcmdldHMu
cGF0Y2ggfCAxMSArKystLS0KPiAgIHBhY2thZ2UvdWJvb3QtdG9vbHMvQ29uZmlnLmluICAgICAg
ICAgICAgICAgICB8ICAzICsrCj4gICBwYWNrYWdlL3Vib290LXRvb2xzL0NvbmZpZy5pbi5ob3N0
ICAgICAgICAgICAgfCAgOSArKysrKwo+ICAgcGFja2FnZS91Ym9vdC10b29scy91Ym9vdC10b29s
cy5oYXNoICAgICAgICAgIHwgIDIgKy0KPiAgIHBhY2thZ2UvdWJvb3QtdG9vbHMvdWJvb3QtdG9v
bHMubWsgICAgICAgICAgICB8IDM2ICsrKysrKysrKysrKysrLS0tLS0KPiAgIDYgZmlsZXMgY2hh
bmdlZCwgNjQgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvdWJvb3QtdG9vbHMvMDAwMS1kcm9wLWNvbmZpZ2gtZnJvbS10b29scy5wYXRjaCBi
L3BhY2thZ2UvdWJvb3QtdG9vbHMvMDAwMS1kcm9wLWNvbmZpZ2gtZnJvbS10b29scy5wYXRjaAoK
Wy4uLl0KCj4gQEAgLTIxMywxMiArMjI1LDE4IEBAIGRlZmluZSBIT1NUX1VCT09UX1RPT0xTX0JV
SUxEX0NNRFMKPiAgIAkkKEhPU1RfVUJPT1RfVE9PTFNfR0VORVJBVEVfQk9PVF9TQ1JJUFQpCj4g
ICBlbmRlZgo+ICAgCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfSE9TVF9VQk9PVF9UT09MU19NS0VG
SUNBUFNVTEUpLHkpCj4gK2RlZmluZSBIT1NUX1VCT09UX1RPT0xTX0lOU1RBTExfTUtFRklDQVBT
VUxFCj4gKyAgICAgICAgJChJTlNUQUxMKSAtbSAwNzU1IC1EICQoQEQpL3Rvb2xzL21rZWZpY2Fw
c3VsZSAkKEhPU1RfRElSKS9iaW4vbWtlZmljYXBzdWxlCgpUaGlzIGlzIGluZGVudGVkIHdyb25n
bHkgYW5kIGBtYWtlIGNoZWNrLXBhY2thZ2VgIGNvbXBsYWlucyBhYm91dCB0aGF0LgoKPiArZW5k
ZWYKPiArZW5kaWYKPiArCj4gICBkZWZpbmUgSE9TVF9VQk9PVF9UT09MU19JTlNUQUxMX0NNRFMK
PiAgIAkkKElOU1RBTEwpIC1tIDA3NTUgLUQgJChARCkvdG9vbHMvbWtpbWFnZSAkKEhPU1RfRElS
KS9iaW4vbWtpbWFnZQo+IC0JJChJTlNUQUxMKSAtbSAwNzU1IC1EICQoQEQpL3Rvb2xzL21rZWZp
Y2Fwc3VsZSAkKEhPU1RfRElSKS9iaW4vbWtlZmljYXBzdWxlCj4gICAJJChJTlNUQUxMKSAtbSAw
NzU1IC1EICQoQEQpL3Rvb2xzL21rZW52aW1hZ2UgJChIT1NUX0RJUikvYmluL21rZW52aW1hZ2UK
PiAgIAkkKElOU1RBTEwpIC1tIDA3NTUgLUQgJChARCkvdG9vbHMvZHVtcGltYWdlICQoSE9TVF9E
SVIpL2Jpbi9kdW1waW1hZ2UKPiAgIAkkKEhPU1RfVUJPT1RfVE9PTFNfSU5TVEFMTF9GSVRfQ0hF
Q0tfU0lHTikKPiArCSQoSE9TVF9VQk9PVF9UT09MU19JTlNUQUxMX01LRUZJQ0FQU1VMRSkKPiAg
IAkkKElOU1RBTEwpIC1tIDA3NTUgLUQgJChARCkvdG9vbHMvZW52L2Z3X3ByaW50ZW52ICQoSE9T
VF9ESVIpL2Jpbi9md19wcmludGVudgo+ICAgCWxuIC1zZiAkKEhPU1RfRElSKS9iaW4vZndfcHJp
bnRlbnYgJChIT1NUX0RJUikvYmluL2Z3X3NldGVudgo+ICAgCSQoSE9TVF9VQk9PVF9UT09MU19J
TlNUQUxMX0VOVklNQUdFKQoKQmVzdCwKTWFyY3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
