Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C75C4829A
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 07:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51A3240558;
	Wed, 14 Feb 2024 07:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q82d_Lm-P503; Wed, 14 Feb 2024 07:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63D5440658
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63D5440658;
	Wed, 14 Feb 2024 07:25:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E767D1BF2C0
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 07:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E18F4815AB
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 07:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GC3_pYhxeFWn for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 07:25:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.134;
 helo=mout.kundenserver.de; envelope-from=laurent@vivier.eu;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 755F481458
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 755F481458
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 755F481458
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 07:25:23 +0000 (UTC)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MderZ-1r1MzP2u6z-00Zgjv; Wed, 14 Feb 2024 08:25:18 +0100
Message-ID: <c3ef3e7e-5a9f-4787-a3b0-0041924f3ab7@vivier.eu>
Date: Wed, 14 Feb 2024 08:25:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20240213152005.83369-1-arbab@linux.ibm.com>
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; keydata=
 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
In-Reply-To: <20240213152005.83369-1-arbab@linux.ibm.com>
X-Provags-ID: V03:K1:A/cwbYk2Nd2O0D7iO4QKbMdo2wyaBAKpOnDh80bHDmvpjAOdmNa
 TepF8MKxIiwlGb1R2dM8+YqhzN3Dajw19zvE1jxSYYrWTcXbuTdaPySdAh0fpT3j1xq6enW
 7syhQ5vO4qnVu5Rgtv/3X7/VCm85cqklMYsKiIKJ/PJ3MaMUIYk0g/a+l6NmYLloitspF+I
 YrElRtb7/0rm586S2+/tA==
UI-OutboundReport: notjunk:1;M01:P0:DKdnR7SqqWc=;eFrkfEnSwwWwjV1yB92WmVOXyod
 uoY0/J+VsQR+WCUacBRa6nfPxkf62Z7vnmOqHHXqaUf2z/L28fpsCqhYdn9kLkKgDGDFaA0BX
 FuB3yOdDBHO8LaKc/G/bYf5SEF2K2/3oWVlEmMXwu7XJFkrwGY9lPKRykxdI5T2fsb2CKd12b
 HkM4nhTeis9571TfZJLMM+RFdOAk7no994r2kPUhGHzdJEPI2QkjMvbmsNy17Fp5l7gnDC7/Z
 hdTqHP5NfQIVika3wXwUXmgnQ8TLE1AG+2LHY+ColrgrxpAl9r3FhN+jCJrq2uDjhoo3W3X8n
 nLU2Vkxc0fWWkE9Z1bV1pLbbUf4oDlGDV1FNg3U3z8vlegmwej3MaE4FsEznGgM75mQfrWhka
 6jOw7Shw91c2xG8Gc2bSRC/KvvbXxTvsonli6KKGypGSo3cRk2dqhfAIeBZWedH6D28Y2NByl
 3wMw8GT0wuoYZtWMyei/McdmD1d33LdSi32WZyHUn8gSYtz4CvQ/xSiSZW6Ub3L8hyYvBtEGP
 3aWMLbOfnCLAQwIpLYDR3qr99Im8l0XiyhEpnGs4v9iXBuOT15CqZs86PnDv+hJZMVDWl2Mzf
 EddwDx61xOOY5FxYSF0P0u7RBLFy4MrmO0dcZMVLUbeJ2G5fciCVgmsAXYhnWJQ1dWTBj9KU7
 Dg7fm+eEQWvQoClsn9YVWvEbqrMr7CdH1bXNvXRo/9XXeqQmMmwTmPjnbsoVehGxhkNIvPVi5
 qqwe+7uwx0qhCrq4L5KugDdRtWEh5fwnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vivier.eu
Subject: Re: [Buildroot] [PATCH] package/petitboot: bump to version 1.15
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTMvMDIvMjAyNCDDoCAxNjoyMCwgUmV6YSBBcmJhYiBhIMOpY3JpdMKgOgo+IFRoaXMgZml4
ZXMgYW4gaXNzdWUgd2hlcmUgdGhlIHBiLWNvbnNvbGUgaGVscGVyIHdhcyBub3QgcHJvcGVybHkK
PiBzaWxlbmNpbmcga2VybmVsIGxvZyBtZXNzYWdlcyBwcmludGVkIHRvIHRoZSBjb25zb2xlLgo+
IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuLXBvd2VyL3BldGl0Ym9vdC9yZWxlYXNlcy90YWcv
djEuMTUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSZXphIEFyYmFiIDxhcmJhYkBsaW51eC5pYm0uY29t
Pgo+IC0tLQo+ICAgcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lmhhc2ggfCAyICstCj4gICBw
YWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QubWsgICB8IDIgKy0KPiAgIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QuaGFzaCBiL3BhY2thZ2UvcGV0aXRib290L3BldGl0Ym9v
dC5oYXNoCj4gaW5kZXggYTlhMjFmMmMxYjY5Li4zYTkwYmM1Mjk2NzIgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lmhhc2gKPiArKysgYi9wYWNrYWdlL3BldGl0Ym9v
dC9wZXRpdGJvb3QuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAgIyBMb2NhbGx5IGNvbXB1dGVk
Cj4gLXNoYTI1NiAgZmEyMzY3MzcwZDNjZTVkZDk5MTBhYjA4YTA4MzIwNzFlMjUwOGM4YmY3NWNm
ZWM2ZDNiOTgwN2ZiZWZjNTA3YSAgcGV0aXRib290LXYxLjE0LnRhci5nego+ICtzaGEyNTYgIGVl
ZDI5ZWM4NDFjMmJjZDVlY2M2NTM0N2Y1Yjk1YTAwODdhNTQxYmQ5YzA0Y2EzYzE3YzU1ZDFmNzM1
N2QxODkgIHBldGl0Ym9vdC12MS4xNS50YXIuZ3oKPiAgIHNoYTI1NiAgMjA0ZDhlZmY5MmY5NWFh
YzRkZjZjODEyMmJjMTUwNWY0NjhmM2E5MDFlNWE0Y2MwODk0MGUwZWRlMTkzODk5NCAgQ09QWUlO
Rwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QubWsgYi9wYWNrYWdl
L3BldGl0Ym9vdC9wZXRpdGJvb3QubWsKPiBpbmRleCAyZjFlNDU5ZGQzZmEuLmE3NDk5MjM3NzEz
MSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QubWsKPiArKysgYi9w
YWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgICMKPiAg
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtUEVUSVRCT09UX1ZFUlNJT04gPSAxLjE0
Cj4gK1BFVElUQk9PVF9WRVJTSU9OID0gMS4xNQo+ICAgUEVUSVRCT09UX1NPVVJDRSA9IHBldGl0
Ym9vdC12JChQRVRJVEJPT1RfVkVSU0lPTikudGFyLmd6Cj4gICBQRVRJVEJPT1RfU0lURSA9IGh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuLXBvd2VyL3BldGl0Ym9vdC9yZWxlYXNlcy9kb3dubG9hZC92
JChQRVRJVEJPT1RfVkVSU0lPTikKPiAgIFBFVElUQk9PVF9ERVBFTkRFTkNJRVMgPSBcCgpSZXZp
ZXdlZC1ieTogTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
