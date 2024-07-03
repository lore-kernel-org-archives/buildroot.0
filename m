Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9116C30653
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F5DE4063A;
	Wed,  3 Jul 2024 15:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hD7gnioI_3c7; Wed,  3 Jul 2024 15:46:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E67DE407C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E67DE407C6;
	Wed,  3 Jul 2024 15:46:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C21FD1BF33A
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF32F8451F
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNtaeEgNO3at for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:46:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D122780B05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D122780B05
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D122780B05
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:46:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.113.8]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGRp-1slmmx2VrR-00RRwN; Wed, 03
 Jul 2024 17:46:06 +0200
Message-ID: <c53f5d9b-2402-4759-ba38-ebc639c11f29@gmx.de>
Date: Wed, 3 Jul 2024 17:46:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240702165708.3796162-1-fiona.klute@gmx.de>
 <20240702165708.3796162-2-fiona.klute@gmx.de> <ZoRf7pXimhw4wh-s@landeda>
 <8fe270a0-708f-49f8-972e-221e99f23f08@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <8fe270a0-708f-49f8-972e-221e99f23f08@mind.be>
X-Provags-ID: V03:K1:5o0oIV9+531EIgiu3JSTi5lLGNa4dc4+kjF7trRtFDPTom+dAzh
 p0uSwxpO6GjG/fgJmjk4Xj1tZAqR3Ka2pOvFfBMrA+nbl/mnPxSNd+lD4ipS21tpeXohnOq
 k/O8KdFznjo5fQU+xTowSviH99PMMYNdIVOcTjPZfXfLZC055J/z63GC69lPuHDWvKZxmCH
 hFCinfKKuFhd+s7FNX2/w==
UI-OutboundReport: notjunk:1;M01:P0:MKcxRJ2eEB0=;jeqifjpQsFdDEcS9fHDifRQ+LQR
 D0CjM7ub02o8DLvdwray2aE2IP8mck8Q+WtT6erNKoT0ZJIJXZXgVJu/OG9GhfNwo437FNZ3Y
 gf431h7j9T2mXVxRdGGTj1CEa1reAQP46cxub6lb/lEFHKx1hylBPwQzeY6ovnNVL1E173JTP
 bqQlvAV8FR/KQpl91jU8+RAI7gXV5ryM51V865LenTBeYnluMLvTbJjYXRzfgIA3VVDtio4tu
 S9o/8+AUmgkb+76Kmtzab4bu6zEMhgZlPfrQICRwMKYB+FcLdboZnHhbvfjC/uWnKkXhydTgb
 kB/eNOI2IVVXZwALXUX53Pnuyy8XmDffuq9D7XnH/iMUXDKlnAYA9fAnCwMPCkEkdD3g79tmz
 p8WZroZPMOJWYsIef3D1GkEPP633BJ7jlCkQ19apBy/5LEecg5fn6dezVqGfvfogo1gOOuHET
 oRqr72uO5vF3c+ItL3u6xzsVZ1VcAm2bQOTBRXbf1CU1FxPqZ7aQ4f69cdyfgShHgDCXXDiK4
 ztlrG3XJDZMbOliaeFYm/djDbmCoz/sCGIojzervjauF1nhy3xrPdxX5GUg8vZVSgmQygyz8J
 NlGXdb/xopTSelXhTDymAk5PmYHXC2i/gUgM2jAhk9NvS//+nqJRCEsRp1zsfT3zbS4f2feIf
 H+QHYprvA0sRguXFvuXEr6t/BFksrCaIcUnOBqV8GsC8z5Qu7BuKnJkldw9/fm0WWkigKjjOV
 cAGSGmvU7p51/8Qs2kVti8yLB+OeeMw+9bT2mdPbRBdmqNgBAcoGdpMJc44ZmWtcXfN/KEqFF
 l+quCZVMUNkpvns1KLOpYtHgQDPeDoll1h32gDXNdGszY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720021566; x=1720626366; i=fiona.klute@gmx.de;
 bh=St1iKFl6DpxfcUX9lVkQpQquA+ea7WTw+22FJzBZGpM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ePSV+ZPtiArV81OF5G8lJa/UkUh9n7pliIfRHoWcOaCOjQJ09C1FjbCv6VkYJoul
 Rzf6FS9PLqZh89iNNMYo9PHx8kB+fe+u18eHVD8qG2iPIIvxsthyG/cYUSsjKqT5F
 lZ/OxHwqIbVl+/q68R7jeZNE/Sk1tnc3gX2++VUPW3KjrlctHVUEKiR4KNvT9GezH
 /Cf1yHgQwfTuANDd3w+AM+IX68XFmmyY5jB6b0okynpSBIinW3X526e2xs2FG5wJ2
 miiPlecSKiqH74d4SiUQmwh+CBOmYvbn/LeQUDs4KwqqCKnayjmE8QlocpIiM5R78
 DRfVq/uZkEX/HH3wRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ePSV+ZPt
Subject: Re: [Buildroot] [PATCH v2 1/4] package/openssh: don't kill open
 sessions on restart
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMDMuMDcuMjQgdW0gMDk6MDEgc2NocmllYiBBcm5vdXQgVmFuZGVjYXBwZWxsZToKPiBPbiAw
Mi8wNy8yMDI0IDIyOjE1LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+PiBGaW9uYSwgQWxsLAo+Pgo+
PiBPbiAyMDI0LTA3LTAyIDE4OjU3ICswMjAwLCBGaW9uYSBLbHV0ZSB2aWEgYnVpbGRyb290IHNw
YWtlIHRodXNseToKPj4+IEZyb206ICJGaW9uYSBLbHV0ZSAoV0lXQSkiIDxmaW9uYS5rbHV0ZUBn
bXguZGU+Cj4+Pgo+Pj4gVGhlIHByZXZpb3VzbHkgdXNlZCAia2lsbGFsbCBzc2hkIiBzdG9wcGVk
IGFsbCBpbnN0YW5jZXMgb2Ygc3NoZC4gV2l0aAo+Pj4gT3BlblNTSCBiZWZvcmUgOS44IHRoYXQg
bWVhbnQgbm90IG9ubHkgdGhlIGxpc3RlbmluZyBzZXJ2ZXIsIGJ1dCBhbHNvCj4+PiBpbnN0YW5j
ZXMgc2VydmluZyBjdXJyZW50bHkgb3BlbiBzZXNzaW9ucywgcG9zc2libHkgaW5jbHVkaW5nIHRo
ZSBvbmUKPj4+IHVzZWQgdG8gc2VuZCB0aGUgcmVzdGFydCBjb21tYW5kLCBwcmV2ZW50aW5nIGl0
IGZyb20gY29tcGxldGluZyB0aGUKPj4+ICJzdGFydCIgcGFydCBvZiAicmVzdGFydCIgYW5kIGxl
YXZpbmcgdGhlIHN5c3RlbSB1bnJlYWNoYWJsZSBvdmVyIFNTSC4KPj4+Cj4+PiBJbnN0ZWFkLCB1
c2UgdGhlIFBJRCBmaWxlIHRoYXQgc3NoZCBjcmVhdGVzIGJ5IGRlZmF1bHQgdG8gdGFyZ2V0IG9u
bHkKPj4+IHRoZSBsaXN0ZW5pbmcgc2VydmVyLiBUaGlzIGxlYXZlcyBhbnkgb3BlbiBTU0ggc2Vz
c2lvbnMgdW5hZmZlY3RlZC4KPj4KPj4gUmF0aGVyIHRoYW4gcGxheSB3aXRoIHRoZSBQSUQgb3Vy
c2VsdmVzLCBjYW4gd2UgdXNlIHN0YXJ0LXN0b3AtZGFlbW9uCj4+IGluc3RlYWQ/IEN1cnJlbnRs
eSwgd2UgcnVuIHNzaGQgYW5kIGl0IGRhZW1vbmlzZXMgYWxsIGJ5IGl0c2VsZiwgYnV0IGlmCj4+
IHdlIHBhc3MgLUQsIHRoZW4gc3RhcnQtc3RvcC1kYWVtb24gd2lsbCBiZSBhYmxlIHRvIGRvIHRo
YXQsIGFuZCBoYW5kbGUKPj4gdGhlIFBJRCBmaWxlIGF1dG9tYXRpY2FsbHkgZm9yIHVzLgo+Cj4g
IMKgTm90ZSB0aGF0IHRoZXJlJ3MgYSBsaXR0bGUgZGlzYWR2YW50YWdlIG9mIHRoYXQ6IHdoZW4g
c3NoZCBkYWVtb25pemVzCj4gYnkgaXRzZWxmLCBpdCB3aWxsIG9ubHkgcmV0dXJuIGFmdGVyIHRo
ZSByZWFsIGRhZW1vbiBoYXMgc3RhcnRlZAo+IGxpc3RlbmluZy4gSWYgc3RhcnQtc3RvcC1kYWVt
b24gZG9lcyB0aGUgZGFlbW9uaXNhdGlvbiwgaXQgd2lsbCByZXR1cm4KPiBpbW1lZGlhdGVseS4K
CkkgbG9va2VkIGNsb3NlciBhdCBzdGFydC1zdG9wLWRhZW1vbiwgYW5kIHRoZXJlJ3MgYSBzb2x1
dGlvbiB0aGF0IGF2b2lkcwp0aGF0IHByb2JsZW0gYW5kIHNpbXBsaWZpZXMgdGhlIGluaXQgc2Ny
aXB0LCB0b286IGRvbid0IHVzZSAiLUQiIGZvcgpzc2hkLiBzdGFydC1zdG9wLWRhZW1vbiBleHBl
Y3RzIHRoZSBkYWVtb24gdG8gd3JpdGUgaXRzIG93biBQSUQgZmlsZSBhbmQKcHV0IGl0c2VsZiBp
bnRvIHRoZSBiYWNrZ3JvdW5kLCBvcHRpb25zIHRvIGhhbmRsZSBhIHNlcnZpY2UgdGhhdCBkb2Vz
bid0CmFyZSBkZXNjcmliZWQgYXMgZmFsbGJhY2tzIGluIHRoZSBtYW4gcGFnZS4KCkkndmUgdGVz
dGVkIGl0LCBhbmQgbGV0dGluZyBzdGFydC1zdG9wLWRhZW1vbiBtYW5hZ2Ugc3NoZCB0aGF0IHdh
eSB3b3JrcwpwZXJmZWN0bHkgZmluZS4gSSBhbHNvIGZvdW5kIGl0IGhhcyBhIGJ1aWx0LWluIG9w
dGlvbiAoLS1yZXRyeSkgdG8gYXZvaWQKImhhcyB0aGUgc2VydmljZSByZWFsbHkgc3RvcHBlZCIg
bG9vcHMuIEknbGwgc2VuZCB0aGUgcmVmYWN0b3JlZCBwYXRjaApzZXQgaW4gYSBmZXcgbWludXRl
cy4KClRoYW5rcyBmb3IgdGhlIHJldmlldyEKCkJlc3QgcmVnYXJkcywKRmlvbmEKCj4gIMKgSSBk
b24ndCB0aGluayB0aGlzIGlzIGltcG9ydGFudCBlbm91Z2ggdG8gbm90IGRhZW1vbmlzZSB3aXRo
Cj4gc3RhcnQtc3RvcC1kYWVtb24gLSBpZiB5b3UgbmVlZCBmaW5lLWdyYWluIGNvbnRyb2wgYnkg
dGhlIGluaXQgc3lzdGVtCj4geW91IHNob3VsZCB1c2UgYSBwcm9wZXIgaW5pdCBzeXN0ZW0uIEJ1
dCBpdCdzIGltcG9ydGFudCB0byBiZSBhd2FyZSBvZgo+IHRoZSBpbXBsaWVkIGxpbWl0YXRpb25z
Lgo+Cj4gIMKgUmVnYXJkcywKPiAgwqBBcm5vdXQKPgo+Pgo+PiBSZWdhcmRzLAo+PiBZYW5uIEUu
IE1PUklOLgo+Pgo+Pj4gV2l0aCBPcGVuU1NIIDkuOCBvcGVuIHNlc3Npb25zIGFyZSBoYW5kbGVk
IGJ5IHRoZSBzZXBhcmF0ZQo+Pj4gc3NoZC1zZXNzaW9uIGJpbmFyeSBzbyBraWxsYWxsIGRvZXMg
bm90IGhpdCB0aGVtIGFueSBtb3JlLCBidXQKPj4+IGEgdGFyZ2V0ZWQgImtpbGwiIGNvbW1hbmQg
aXMgc3RpbGwgZGVzaXJhYmxlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEZpb25hIEtsdXRlIChX
SVdBKSA8ZmlvbmEua2x1dGVAZ214LmRlPgo+Pj4gLS0tCj4+IFstLVNOSVAtLV0KPj4+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL29wZW5zc2gvUzUwc3NoZCBiL3BhY2thZ2Uvb3BlbnNzaC9TNTBzc2hk
Cj4+PiBpbmRleCAyMmRhNDFkMWNhLi5mMWZmOWRmZWMxIDEwMDY0NAo+Pj4gLS0tIGEvcGFja2Fn
ZS9vcGVuc3NoL1M1MHNzaGQKPj4+ICsrKyBiL3BhY2thZ2Uvb3BlbnNzaC9TNTBzc2hkCj4+PiBA
QCAtMyw2ICszLDggQEAKPj4+IMKgICMgc3NoZMKgwqDCoMKgwqDCoMKgIFN0YXJ0cyBzc2hkLgo+
Pj4gwqAgIwo+Pj4KPj4+ICtQSURGSUxFPSIvdmFyL3J1bi9zc2hkLnBpZCIKPj4+ICsKPj4+IMKg
ICMgTWFrZSBzdXJlIHRoZSBzc2gta2V5Z2VuIHByb2dhbSBleGlzdHMKPj4+IMKgIFsgLWYgL3Vz
ci9iaW4vc3NoLWtleWdlbiBdIHx8IGV4aXQgMAo+Pj4KPj4+IEBAIC0xNCwxNSArMTYsMjUgQEAg
c3RhcnQoKSB7Cj4+Pgo+Pj4gwqDCoMKgwqDCoCBwcmludGYgIlN0YXJ0aW5nIHNzaGQ6ICIKPj4+
IMKgwqDCoMKgwqAgL3Vzci9zYmluL3NzaGQKPj4+IC3CoMKgwqAgdG91Y2ggL3Zhci9sb2NrL3Nz
aGQKPj4+IMKgwqDCoMKgwqAgZWNobyAiT0siCj4+PiDCoCB9Cj4+PiArCj4+PiDCoCBzdG9wKCkg
ewo+Pj4gwqDCoMKgwqDCoCBwcmludGYgIlN0b3BwaW5nIHNzaGQ6ICIKPj4+IC3CoMKgwqAga2ls
bGFsbCBzc2hkCj4+PiAtwqDCoMKgIHJtIC1mIC92YXIvbG9jay9zc2hkCj4+PiArwqDCoMKgIHBp
ZD0iJCggY2F0ICIke1BJREZJTEV9IiAyPi9kZXYvbnVsbCB8fCB0cnVlICkiCj4+PiArwqDCoMKg
IGlmIFsgLXogIiR7cGlkfSIgXTsgdGhlbgo+Pj4gK8KgwqDCoMKgwqDCoMKgIGVjaG8gIkVSUk9S
OiBub3QgcnVubmluZyIKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMQo+Pj4gK8KgwqDCoCBm
aQo+Pj4gK8KgwqDCoCBraWxsICIke3BpZH0iCj4+PiArwqDCoMKgICMgU1NIRCBkZWxldGVzIGl0
cyBQSUQgZmlsZSB3aGVuIGV4aXRpbmcsIHdhaXQgZm9yIGl0IHRvCj4+PiArwqDCoMKgICMgZGlz
YXBwZWFyLgo+Pj4gK8KgwqDCoCB3aGlsZSBbIC1mICIke1BJREZJTEV9IiBdOyBkbwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHNsZWVwIDAuMQo+Pj4gK8KgwqDCoCBkb25lCj4+PiDCoMKgwqDCoMKgIGVj
aG8gIk9LIgo+Pj4gwqAgfQo+Pj4gKwo+Pj4gwqAgcmVzdGFydCgpIHsKPj4+IMKgwqDCoMKgwqAg
c3RvcAo+Pj4gwqDCoMKgwqDCoCBzdGFydAo+Pj4gQEAgLTQ0LDQgKzU2LDMgQEAgY2FzZSAiJDEi
IGluCj4+PiDCoCBlc2FjCj4+Pgo+Pj4gwqAgZXhpdCAkPwo+Pj4gLQo+Pj4gLS0KPj4+IDIuNDUu
Mgo+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+
Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cj4+CgotLQpEaXBsLi1JbmcuIEZpb25hIEtsdXRlCk1vbGx3aXR6ZXIgU3RyLiAyCjQ0MTQxIERv
cnRtdW5kCkdlcm1hbnkKClVTdC4tSUQvVkFUIG51bWJlcjogREUzNjM0ODg5NDQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
