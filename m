Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9999BCCD1A5
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 08:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 506404036E;
	Tue, 21 Oct 2025 08:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNcUs249h6Kq; Tue, 21 Oct 2025 08:24:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AB2440534
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AB2440534;
	Tue, 21 Oct 2025 08:24:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E92BE277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 08:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB87240589
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 08:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTBaAL8iRItw for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 08:24:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF35E40400
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF35E40400
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF35E40400
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 08:24:55 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 8AB5B2C80CE3;
 Tue, 21 Oct 2025 10:24:53 +0200 (CEST)
Message-ID: <713c7303-361a-4ed7-9020-5f402ab8b742@bubu1.eu>
Date: Tue, 21 Oct 2025 10:24:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20251017080920.28339-1-buildroot@bubu1.eu>
 <30d188b1-5a62-49d3-bc2c-f7c26d3c560e@bubu1.eu>
 <0f8f74135f4c9f4521f540d27fc7d4c7@free.fr>
Content-Language: en-US
In-Reply-To: <0f8f74135f4c9f4521f540d27fc7d4c7@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1761035093; bh=JpoGWQjFVMgtG/HbTg507z2+hfIyO4UCjJ3KkTse6Cs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=XkfWljKJkbyYlxapHeEMtdEAdjRX9ortydTA4Lb9ZbY2/GqYpbTio5IppIVKL4sP3
 zIKbPCA/lvnuDxEVhR2BdoXTizEL7vmIEiB61RSMGd7y9rWMAnBnWb4PTknaEncU7B
 AILa90eRK/P6Qqeu5NMJsXZEgy5GQsMzXmveudkbS4YqQMcwqDHIr64tMgmZ/kFrQA
 cKPCgjiEUyEuXJNpMqNvKy0f6QlEWUk6Xl1u9O2uK8+rYCK0VBgEZGk3R2CxEzlIMy
 I3uzRBbacKAH8WvliCCVsr4C7xTHqsbVvteZNQNqTZXsazCvKQ2kwm1S0oPTEJTNHW
 7nidfcsMyzgGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=XkfWljKJ
Subject: Re: [Buildroot] [PATCH] package/python-uvloop: bump to v0.22.0
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

SGkgSnVsaWVuLAoKT24gMTAvMTcvMjUgMTg6NTksIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+IEhp
IE1hcmN1cywKPiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaC7CoCBJIGhhdmUgZmV3IGNvbW1lbnRz
LCBzZWUgYmVsb3cuCgpJIGp1c3Qgc2VudCBhIHYyLCBhZGRyZXNzaW5nIHlvdXIgY29tbWVudHMu
CgpbLi4uXQoKPj4+IC1zaGEyNTYgCj4+PiAzNzcwMjUyODc3OThmOWRjZDgxOWUxZjgyNmZhNWZj
NWUyZjM4MjUyODY5MWFiMDUyOGM1Y2Y4YzhjMjgyYzI3IAo+Pj4gTElDRU5TRS1BUEFDSEUKPj4+
IC1zaGEyNTYgCj4+PiA2ZGQ0YzM5OWYyNmRlMDQzZDc3YTJhZDdlMzFkYjRjYjViZjA4ZWE4MzY4
YjBhNDJkNmUxNTg2MzVjYzhhYjYyIAo+Pj4gTElDRU5TRS1NSVQKPj4+ICtzaGEyNTYgCj4+PiAx
NmRlMGMzMmIyNjVjYjdkNDZhNmQzYmQ2MTRmMjU5ZGQ0ZDY5M2E1ZTI2YjM0MDdiMDRhYWU4ZDcz
MDQxZjBjIAo+Pj4gdmVuZG9yL2xpYnV2L0xJQ0VOU0UKPiAKPiBIZXJlLCB5b3UgcmVtb3ZlIExJ
Q0VOU0UtQVBBQ0hFIGFuZCBMSUNFTlNFLU1JVCwgYW5kIGludHJvZHVjZSB2ZW5kb3IvIAo+IGxp
YnV2L0xJQ0VOU0UKPiBidXQgdGhpcyBwYXRjaCBkb2VzIG5vdCB1cGRhdGUgUFlUSE9OX1VWTE9P
UF9MSUNFTlNFIG5vcgo+IFBZVEhPTl9VVkxPT1BfTElDRU5TRV9GSUxFUyBpbiB0aGUgLm1rLgo+
IAo+IFJ1bm5pbmcgdGhlIGNvbW1hbmQ6Cj4gCj4gbWFrZSBweXRob24tdXZsb29wLWxlZ2FsLWlu
Zm8KPiAKPiBnZW5lcmF0ZXMgdGhlIHdhcm5pbmdzOgo+IAo+IEVSUk9SOiBObyBoYXNoIGZvdW5k
IGZvciBMSUNFTlNFLUFQQUNIRQo+IEVSUk9SOiBObyBoYXNoIGZvdW5kIGZvciBMSUNFTlNFLU1J
VAo+IAo+IFRoZSBmaWxlIHZlbmRvci9saWJ1di9MSUNFTlNFIG9ubHkgaW5jbHVkZXMgdGhlIE1J
VCBsaWNlbnNlLgo+IFdoYXQgdGhlIHVwc3RyZWFtIHJlbGljZW5zZWQ/Cj4gQ291bGQgeW91IGdp
dmVhIGp1c3RpZmljYXRpb24gaW4gdGhlIGNvbW1pdCBsb2cgd2h5IHlvdSBjaGFuZ2UKPiB0aG9z
ZSBsaWNlbnNlIGZpbGVzPyAoYmVjYXVzZSB0aGUgb3JpZ2luYWwgZmlsZXMgYXJlIHN0aWxsIHBy
ZXNlbnQKPiBpbiB0aGUgbmV3IHZlcnNpb24geW91IHVwZGF0ZSB0by4KClRoaXMgd2FzIChhZ2Fp
bikganVzdCB1dGlscy9zY2FucHlwaSBtaXNkZXRlY3RpbmcgdGhlIGxpY2Vuc2UgZmlsZXMgYW5k
IAptZSBub3Qgc3BvdHRpbmcgdGhlIGNoYW5nZSBpbiB0aGUgZGlmZiBhbmQgcmV2ZXJ0aW5nIGl0
IGJlZm9yZSBzdWJtaXR0aW5nLgoKWy4uLl0KCj4gCj4gQ2FuIHlvdSBzZW5kIGFuIHVwZGF0ZWQg
cGF0Y2ggcGxlYXNlPwo+IAo+IEJlc3QgcmVnYXJkcywKPiAKPiBKdWxpZW4uCgoKQmVzdCwKTWFy
Y3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
