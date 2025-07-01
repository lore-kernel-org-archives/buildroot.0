Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD28C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 07:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A6FD614AB;
	Tue,  1 Jul 2025 07:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vXacdXgiBBF; Tue,  1 Jul 2025 07:44:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76CA460DBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76CA460DBD;
	Tue,  1 Jul 2025 07:44:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40888197
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3292440124
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljz--VAEi6kf for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 07:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.146.106.75;
 helo=smtp05-ext.udag.de; envelope-from=philipp.ludwig@passerro.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65D88400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65D88400C7
Received: from smtp05-ext.udag.de (smtp05-ext.udag.de [62.146.106.75])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65D88400C7
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:44:04 +0000 (UTC)
Received: from [192.168.15.156] (p578aae36.dip0.t-ipconnect.de [87.138.174.54])
 by smtp05-ext.udag.de (Postfix) with ESMTPA id C382CE03AB;
 Tue,  1 Jul 2025 09:44:01 +0200 (CEST)
Message-ID: <b3e0045b-bd0c-49ed-8ed2-87650175cb44@passerro.de>
Date: Tue, 1 Jul 2025 09:44:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <4946d64f-534f-4034-a2c6-f82bb0a32748@passerro.de>
 <c0d16962-62b2-4512-9f12-a61edb2aae1b@rnout.be>
Content-Language: en-US
From: Philipp Ludwig <philipp.ludwig@passerro.de>
In-Reply-To: <c0d16962-62b2-4512-9f12-a61edb2aae1b@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=passerro.de; s=uddkim-202310; 
 t=1751355842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FrFwmeeAww2ySrkQnezT5cBt5NDxg6zwBIAYmQtmSDg=;
 b=XsQpy9X6f29YGooNsSXoyBOLCMWPkQb6UgTn82QCWDHk9kJ2TLWqIVXaOhmaYQjQDIErgL
 KiEIoLhy48HAX6XKSZVQgq6DgO333XnCdlETzAT+7vCI4KJWcNgDDCFU5Yc/Yzlh4LVG4q
 Nr1f8SZMFfwHbEt3wglx0VymnDIzX0f55Gd+r3OXYvEwqMYgXe8K+9dJQrsd0cTDBzEsfv
 gknsQNFfUGBdAcC5B2Y22NpvIto2wrJsilRDkH5oIOQbP11sDOkcBqcYPrAfQDSnIAp9dk
 Zt0o9nwm2lYluSOT0zxJUVm4RRnF03N2Uvhx2tNyyyME9B43grKJsC5ICQFbFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=passerro.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=passerro.de header.i=@passerro.de header.a=rsa-sha256
 header.s=uddkim-202310 header.b=XsQpy9X6
X-Mailman-Original-Authentication-Results: smtp05-ext.udag.de;
 auth=pass smtp.auth=philipp.ludwig@passerro.de
 smtp.mailfrom=philipp.ludwig@passerro.de
Subject: Re: [Buildroot] Upgrading a postgres database in buildroot
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDcvMS8yNSAwOTozMSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4gIMKgVWdoIHRo
aXMgaXMgc3VwZXIgaG9ycmVuZG91cyEgSG93IGRvIG90aGVyIGRpc3Ryb3MgZGVhbCB3aXRoIHRo
YXQ/IAoKSSBkaWQgYSBxdWljayBsb29rIGluIHRoZSBEZWJpYW4gcGFja2FnZS4gVGhlIHVwZ3Jh
ZGUgaW5zdHJ1Y3Rpb25zIGFyZSAKb3V0bGluZWQgaW4gUkVBRE1FLkRlYmlhbiBpbiB0aGUgcG9z
dGdyZXNxbC1jb21tb24gcGFja2FnZS4KSXQgc2VlbXMgdGhhdCB0aGUgaW5zdHJ1Y3Rpb25zIGFy
ZSB2ZXJ5IGRpZmZlcmVudCBmb3IgdGhlIGN1cnJlbnQgc3RhYmxlCnZlcnNpb24gY29tcGFyZWQg
dG8gdGhlIHNpZCB2ZXJzaW9uLgpzdGFibGUvYm9va3dvcm0gc2F5czoKCiA+ICguLi4pIEUuIGcu
LCBpZiB5b3UgaGF2ZSBwb3N0Z3Jlc3FsLTkuNiBpbnN0YWxsZWQgYW5kIHdhbnQgdG8gdXBncmFk
ZQogPiB0byAxMSwgeW91IGZpcnN0IGluc3RhbGwgcG9zdGdyZXNxbC0xMToKID4KID4gIGFwdC1n
ZXQgaW5zdGFsbCBwb3N0Z3Jlc3FsLTExCiA+CiA+IFRoZW4gZHJvcCB0aGUgZGVmYXVsdCAxMSBj
bHVzdGVyIHRoYXQgd2FzIGp1c3QgY3JlYXRlZDoKID4KID4gIHBnX2Ryb3BjbHVzdGVyIDExIG1h
aW4gLS1zdG9wCiA+CiA+IEFuZCB0aGVuIHVwZ3JhZGUgdGhlIDkuNiBjbHVzdGVyIHRvIHRoZSBs
YXRlc3QgaW5zdGFsbGVkIHZlcnNpb24KID4gKGUuIGcuIDExKToKID4KID4gIHBnX3VwZ3JhZGVj
bHVzdGVyIDkuNiBtYWluCgpJIGhhdmUgc2VlbiByZWZlcmVuY2VzIHRvIHBnX3VwZ3JhZGVjbHVz
dGVyIGVsc2V3aGVyZSwgYnV0IHRoaXMgYmluYXJ5IAppcyBub3Qgc2hpcHBlZCBpbiBidWlsZHJv
b3QsIEkgYmVsaWV2ZS4KCkFueXdheSwgaW4gc2lkIGl0IGp1c3Qgc3RhdGVzOgoKID4gVG8gdXBn
cmFkZSBhIGNsdXN0ZXIgdG8gYSBuZXdlciBQb3N0Z3JlU1FMIG1ham9yIHZlcnNpb24sIGluc3Rh
bGwgdGhlCiA+IHBvc3RncmVzcWwtMTggcGFja2FnZSAoYW5kIGFueSBleHRlbnNpb24gcGFja2Fn
ZXMgcmVxdWlyZWQpLCBhbmQgcnVuCiA+IHRoZSBjb21tYW5kOgogPgogPiAgcGdfdXBncmFkZWNs
dXN0ZXIgMTcgbWFpbiAtdiAxOAogPgogPiBJZiB0aGUgInBvc3RncmVzcWwiIG1ldGEgcGFja2Fn
ZSBpcyBpbnN0YWxsZWQsIGl0IGF1dG9tYXRpY2FsbHkgcHVsbHMKID4gaW4gdGhlIHBvc3RncmVz
cWwtMTcgcGFja2FnZSBmb3IgdGhlIGxhdGVzdCBzdXBwb3J0ZWQgUG9zdGdyZVNRTAogPiB2ZXJz
aW9uIGluIHRoZSA+cGFja2FnZSByZXBvc2l0b3J5LiBMYXRlciwgb25jZSBhIG5ld2VyIFBvc3Rn
cmVTUUwKID4gdmVyc2lvbiAxOCBpcyB0aGUgbGF0ZXN0IHN1cHBvcnRlZCBvbmUsIHRoZSAicG9z
dGdyZXNxbCIgbWV0YSBwYWNrYWdlCiA+IGlzIHN3aXRjaGVkIHRvIHB1bGwgaW4gcG9zdGdyZXNx
bC0xOC4KClNvIGl0IHNlZW1zIHRoYXQgdGhleSBhbHdheXMgaGF2ZSBib3RoIHZlcnNpb25zIGF2
YWlsYWJsZSBmb3IgCmluc3RhbGxhdGlvbi4gQnV0IEkgZ3Vlc3MgdGhhdCBpcyByZWFzb25hYmxl
IGZvciBhIHN5c3RlbSBsaWtlIERlYmlhbiwKYnV0IGZvciBhbiBlbWJlZGRlZCBzeXN0ZW0gaXQg
ZG9lcyBub3QgcmVhbGx5IG1ha2Ugc2Vuc2UgdG8gaGF2ZSB0d28KdmVyc2lvbnMgb2YgdGhlIGRh
dGFiYXNlIHNlcnZlciBydW5uaW5nIGF0IGFsbCB0aW1lIElNSE8uCgogPiB5b3UgaGF2ZSB0byBi
ZSBhYmxlIHRvIGtlZXAgdXBkYXRpbmcgdGhhdCBzeXN0ZW0gZm9yIDE1LTIwIHllYXJzLAoKSSB3
b25kZXIgaWYgeW91IHlvdSBuZWVkIHRvIGtlZXAgNSB2ZXJzaW9ucyBvZiBwb3N0Z3JlcyB0byB1
cGRhdGUgCnN5c3RlbXMgdGhhdCBhcmUgdGhpcyBvbGQsIG9yIGlmIHBnX3VwZ3JhZGVjbHVzdGVy
IGNhbiBza2lwIHZlcnNpb25zIGluIApiZXR3ZWVuLgoKQmVzdCBSZWdhcmRzClBoaWxpcHAgTHVk
d2lnCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
