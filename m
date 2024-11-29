Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B08D6EBFF
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 11:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A7F760641;
	Fri, 29 Nov 2024 11:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3xH-pQXTGKt; Fri, 29 Nov 2024 11:47:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FD026064F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD026064F;
	Fri, 29 Nov 2024 11:47:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29A4FA6A
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 11:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0331F40992
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 11:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCvwtUBEKVkT for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 11:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 621C24074E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 621C24074E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 621C24074E
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 11:47:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.106] ([85.22.117.60]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7QxB-1tkJzw0m9F-016P2W; Fri, 29
 Nov 2024 12:47:29 +0100
Message-ID: <b7593736-6960-498a-9adc-61b11fa59874@gmx.de>
Date: Fri, 29 Nov 2024 12:47:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>,
 buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20240726162013.2183792-1-fiona.klute@gmx.de>
 <20240726162013.2183792-2-fiona.klute@gmx.de>
 <b739b503-eb5e-4604-9868-5127ec944624@green-communications.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <b739b503-eb5e-4604-9868-5127ec944624@green-communications.fr>
X-Provags-ID: V03:K1:Y9ZAsOY5OdCLW1f4sqJcs3dEBxFvoy1qCB0Xr/nhzZPAl1jcbs2
 w70GdE8Vb2VDnRSskINqJeVgRGjna2QPZQAGM7psZ9HP1tdev3I3NfwkXPJA+xg/BCTR03i
 tY2gWrooLyFhSlNQSEa3aMwJJ2H/d5/O97faj0NNJOD9YIebrov8q7aibxo1WsubvFRNfdd
 9+jYmEUlPg9bzMWtwg0eQ==
UI-OutboundReport: notjunk:1;M01:P0:M4aZMt7KyPc=;37q46ur3IHoAiUuTM14Pn4MRve0
 78ynl5KZ83LP5gU9W8cpBDiRNK9MKFHHUNX8U3JijUIf3UcBJ6nvt24w73dMiz2fWHdANMIon
 f+a12Q0hy1mS+bDjPyPfE6kEE1+8wb1TvVcECgE96Ks/7EAcEHwRfCBuempFY9LYoHRcufDGJ
 gSSMCBKXn2qlO9Sv67mHLQVeTUF86DAY+icD9sw6IvFLyMMm0Ls6oLMFZ347ymvh58KC/F0p4
 PKgGUlBfDapY2vP/fv32x8IE6qm6fQ2WLUD1QfoGDKzlb4VKj5J3gCmZ3UPXnn3fsMieMqT1+
 TJlYz4I5clX3sEJKu5L8y9lNWvxzz2dsSPXrVMP/kUzEf094/5wgPDto+7O5WoWXJSxZTrk9F
 POzgv2rDtkkCtmkebP2iUEkZJVnx5zuAcQ03gEn/wZ4jL8lv1n8UxwWCcv7GlbKdK6gsUD9/1
 ZBmdjoaW+EVng82503DWfgnj0DEdZxj2uv1EHs9b6Vm9yEWRZRg3e6aYMJI8qIAfhDISpFr2y
 I1r16S474bWDhvG+7QPerMd8OgGLuE4E4RIf8X1KgD7l354UGkDJHMeD2S0yXG5WrF5WuWwAc
 vB6E5FBwezUbOqeol9gx13opysuLesRMIDbDJavHhMzLJxLvcn6rsTAdGI+jWgvm1zmIYzsUD
 ZqHabWaP6ec5XWaHiLb8pY0GX+PLIHO+musoIENSo9001HJ0jvQIFrl3DkgTuXWy4iYJsIkuA
 bm88z+kQSlZSEQq4skeEUTb26KbkrAfT4WgxcOqA1IVdq4wPFkgw50lCUiGtgYdO8MDrMJlJy
 rqHmxxtjWXpjav5u8rKkACgJfRvCLCZx1ovMLXdmymDQ3L0F/xy4bcLXaCU9wjpvsOCp6/QSu
 uZBLmFJSqdaXZ8JnKBLKrlFkhkRiu5dVeoA0Fc5srU7MSP/ejeA+6+ZR99cEs3vnMi+VHlqR9
 PU9C/H4GtZpyGWte4ezpF3e5B6HeBI/gF4+CB2CQO8BnryWPfTH9q6oz90eHwSakOZIMNF4da
 l28rRfmqP9OA5i7iW8kKzvL+sxb5MbZSqpkq5lv0E+sXFeDtaaiATI2BXlh/hHrAdmnTfm3Jq
 6WfHiz/NOh0UTLdz7IXF+LzsP4Fc98
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1732880849; x=1733485649; i=fiona.klute@gmx.de;
 bh=MDpCWAsFM/Wmtq6zdx9bcWmEqSBJkWBaruQqYJT93/0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=aIamxFIFD2TSMXhOytEh8Iur1a8b+KpkE/YWqbFyAhm+pqkR8XmS9ohqOT8JSnX5
 nNieZp8iVyk+zjpI1uBcjgUObAiYfXu+U2N6mTMLJQo7dxUBBqgSDGJ7RiYmOCEV2
 eqAD0jpweyMir1i5YcwESW31+kmP8I/n9SXV/NMY8edb0Fvc+NhnjxcvIjC9vCdBH
 eGV6FhkYZXDEVLIApG/eK6ahAOm05lGin8uWPiSe4ngztIx2WApU6lnSNhJ0QQvOf
 VtcUFKTXFId9ZFdb5tBGl/vCNI4AGmGdHzSEevXHj53BZEZst8LUAtUeV936lvV71
 xbG5vLrd3Ns0RnaCsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=aIamxFIF
Subject: Re: [Buildroot] [PATCH v4 1/6] package/nftables: add init script
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMjguMTEuMjQgdW0gMTQ6MDEgc2NocmllYiBOaWNvbGFzIENhdmFsbGFyaToKPiBPbiAyNi8w
Ny8yMDI0IDE4OjIwLCBGaW9uYSBLbHV0ZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiArc3RhcnQo
KSB7Cj4+ICvCoMKgwqAgcHJpbnRmICJMb2FkaW5nIG5mdGFibGVzIHJ1bGVzOiAiCj4+ICvCoMKg
wqAgIyBSdW4gb25seSBpZiB0aGUgcnVsZXNldCBmaWxlIGV4aXN0cy4KPj4gK8KgwqDCoCBpZiBb
ICEgLWYgIiR7TkZUQUJMRVNfQ09ORklHfSIgXTsgdGhlbgo+PiArwqDCoMKgwqDCoMKgwqAgZWNo
byAiJHtORlRBQkxFU19DT05GSUd9IGRvZXMgbm90IGV4aXN0LCBub3RoaW5nIHRvIGRvLiIKPj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiAwCj4+ICvCoMKgwqAgZmkKPj4gK8KgwqDCoCAvdXNyL3Ni
aW4vbmZ0IC0tZmlsZSAiJHtORlRBQkxFU19DT05GSUd9Igo+PiArwqDCoMKgIHN0YXR1cz0kPwo+
PiArwqDCoMKgIGlmIFsgIiRzdGF0dXMiIC1lcSAwIF07IHRoZW4KPj4gK8KgwqDCoMKgwqDCoMKg
IGVjaG8gIk9LIgo+PiArwqDCoMKgIGVsc2UKPj4gK8KgwqDCoMKgwqDCoMKgIGVjaG8gIkZBSUwi
Cj4+ICvCoMKgwqAgZmkKPj4gK8KgwqDCoCByZXR1cm4gIiRzdGF0dXMiCj4+ICt9Cj4+ICsKPj4g
K3N0b3AoKSB7Cj4+ICvCoMKgwqAgcHJpbnRmICJDbGVhcmluZyBuZnRhYmxlcyBydWxlczogIgo+
PiArwqDCoMKgIC91c3Ivc2Jpbi9uZnQgZmx1c2ggcnVsZXNldAo+Cj4gVGhpcyB3aWxsIGJyZWFr
IGV4aXN0aW5nIHVzZXJzIHRoYXQgbWFuYWdlIG5mdGFibGVzIHZpYSBhbm90aGVyIHByb2dyYW0K
PiAob3IgbXVsdGlwbGUgcHJvZ3JhbXMpLiBJdCBzaG91bGQgcHJvYmFibHkgYmUgZG9uZSBvbmx5
IGlmIC9ldGMvCj4gbmZ0YWJsZXMuY29uZiBleGlzdHMuCgpNeSBjb25zaWRlcmF0aW9uIHdhcyB0
aGF0IHRoaXMgd2F5ICJzdG9wIiBpcyBzdGlsbCB1c2FibGUgYWZ0ZXIgZGVsZXRpbmcKdGhlIGNv
bmZpZywgaWYgb25lIHdhbnRzIHRvIGdldCByaWQgb2YgdGhlIGZpcmV3YWxsLiBCdXQgdGhhdCdz
IGEgdmFsaWQKcG9pbnQgdG9vLCBJIGNhbiBqdXN0IG1vdmUgdGhlIGNoZWNrIGZyb20gInN0YXJ0
IiB0byB0aGUgdG9wIG9mIHRoZSBzY3JpcHQuCgo+PiArwqDCoMKgIHN0YXR1cz0kPwo+PiArwqDC
oMKgIGlmIFsgIiRzdGF0dXMiIC1lcSAwIF07IHRoZW4KPj4gK8KgwqDCoMKgwqDCoMKgIGVjaG8g
Ik9LIgo+PiArwqDCoMKgIGVsc2UKPj4gK8KgwqDCoMKgwqDCoMKgIGVjaG8gIkZBSUwiCj4+ICvC
oMKgwqAgZmkKPj4gK8KgwqDCoCByZXR1cm4gIiRzdGF0dXMiCj4+ICt9Cj4+ICsKPj4gK3Jlc3Rh
cnQoKSB7Cj4+ICvCoMKgwqAgc3RvcAo+PiArwqDCoMKgIHN0YXJ0Cj4+ICt9Cj4+ICsKPj4gK3Jl
bG9hZCgpIHsKPj4gK8KgwqDCoCBGTFVTSD0nZmx1c2ggcnVsZXNldCcKPj4gK8KgwqDCoCBpZiAh
IGdyZXAgLXEgLXggIiRGTFVTSCIgIiR7TkZUQUJMRVNfQ09ORklHfSI7IHRoZW4KPj4gK8KgwqDC
oMKgwqDCoMKgIHByaW50ZiAnV0FSTklORzogbm8gIiVzIiBpbiAlcywgZHVwbGljYXRlZCBydWxl
cyBsaWtlbHlcbicgXAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiJEZMVVNIIiAiJHtORlRB
QkxFU19DT05GSUd9Igo+PiArwqDCoMKgIGZpCj4+ICvCoMKgwqAgc3RhcnQKPgo+IEl0IGlzIHBv
c3NpYmxlIHRvIGZsdXNoIGFuZCByZWFkZCB0aGUgcnVsZXNldCBhdG9taWNhbGx5IHdpdGggZS5n
Lgo+Cj4gbmZ0IGZsdXNoIHJ1bGVzZXQgJzsnIGluY2x1ZGUgJyIkTkZUQUJMRVNfQ09ORklHIicK
Pgo+IEkgZG9uJ3QgdGhpbmsgaXQgaXMgbmVjZXNzYXJ5LCBidXQgaXQgaXMgcHJvYmFibHkgYmV0
dGVyIHRoYW4gdHJ5aW5nIHRvCj4gcGFyc2UgbmZ0YWJsZXMuY29uZiB3aXRoIGdyZXAuCgpBbiBh
dXRvbWF0aWMgZmx1c2ggd291bGQgYmUgZWFzeSBlbm91Z2ggdG8gYWRkLCBidXQgSSBkaWRuJ3Qg
d2FudCB0bwpyZXN0cmljdCB3aGF0IHBlb3BsZSBjYW4gZG8gd2l0aCB0aGVpciBydWxlcyBmaWxl
cywgb25seSB3YXJuIGFib3V0IHdoYXQKc2VlbXMgbGlrZSBhIGxpa2VseSBtaXN0YWtlLiBJJ20g
aGFwcHkgdG8gZHJvcCB0aGUgd2FybmluZyBvciBhZGQgYW4KYXV0b21hdGljIGZsdXNoIGlmIHRo
ZXJlJ3MgY29uc2Vuc3VzIGZvciBlaXRoZXIuCgpPciBtYXliZSBhZGQgYSBwYXJhbWV0ZXIgdG8g
ZGlzYWJsZSB0aGUgd2FybmluZyB0aGF0IGNvdWxkIGJlIG92ZXJyaWRkZW4KaW4gL2V0Yy9kZWZh
dWx0L25mdGFibGVzLCBmb3IgcGVvcGxlIHdobyByZWFsbHkgZG9uJ3Qgd2FudCB0byB0aGF0CmZs
dXNoPyBPZiBjb3Vyc2UgaXQgY291bGQgYWxzbyBiZSBhIHBhcmFtZXRlciB0byBkaXNhYmxlIGF1
dG9tYXRpYwpmbHVzaCwgYnV0IEkgZG9uJ3QgbGlrZSBoaWRpbmcgaXNzdWVzIHRoYXQgc2hvdWxk
IGJlIGZpeGVkIGluIGNvbmZpZy4KCj4gKGFuZCB1bmxpa2Ugc3RvcCA7IHN0YXJ0LCBpdCB3aWxs
IGZhaWwgYW5kIGRvIG5vdGhpbmcgaWYgdGhlCj4gY29uZmlndXJhdGlvbiBmaWxlIGlzIGludmFs
aWQpCklmIHRoZSBncmVwIGNvbW1hbmQgZmFpbHMgdGhhdCB3b24ndCBwcmV2ZW50IHRoZSByZWxv
YWQsIGl0IGp1c3QgbGVhZHMKdG8gdGhlIHdhcm5pbmcuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
