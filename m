Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A92CCF9FA
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 09:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33C7741825;
	Fri, 31 Oct 2025 09:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GIs6QscsCS6; Fri, 31 Oct 2025 09:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59B5A4181B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59B5A4181B;
	Fri, 31 Oct 2025 09:50:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E12FA160
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 09:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D238084693
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 09:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZMi7PdNCyr2 for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 09:50:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D413A8468E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D413A8468E
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D413A8468E
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 09:50:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6CD7F4E4142A;
 Fri, 31 Oct 2025 09:50:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3ED2260704;
 Fri, 31 Oct 2025 09:50:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A3ED711810F13; Fri, 31 Oct 2025 10:50:10 +0100 (CET)
Mime-Version: 1.0
Date: Fri, 31 Oct 2025 10:50:10 +0100
Message-Id: <DDWEX0A8U40C.1J7DHEPBK82OY@bootlin.com>
Cc: "Romain Naour" <romain.naour@smile.fr>, "Thomas Perale"
 <thomas.perale@mind.be>
To: "Baruch Siach" <baruch@tkos.co.il>, "Thomas Perale via buildroot"
 <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250906162551.3715975-2-romain.naour@smile.fr>
 <20250911192608.2672637-1-thomas.perale@mind.be> <87ldmjesxl.fsf@tarshish>
In-Reply-To: <87ldmjesxl.fsf@tarshish>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1761904213; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Wx+VietkJrM3BO1dJK6497OLRRIsMGHj9z07JRX4ItA=;
 b=oCY6a6EKnF/7ZeEnPeVs0EpqyIG4VuHotv54lANBxmZyZ6sn/a3WzDxGeyjCfbEc8V5/W/
 tuTuiOcl8jS0PitdWeMbu8G/pVk1o+QPF1RjnUJEDc6eqzO1Ah3i3/69exfy9B2rFqf+eJ
 aJmbHtq7Cv0/PLmqnZX00o65aRwnomKfkmZJUF4sX3EMpfiSLb/s1iQbwqEj+d4CMet90J
 8MtkANGVp70ZDG/Ez5TpfWRiBKSk7WWasZhijpTs/SFyZsHksJaa2IFkoJFsEJB4b9ao4C
 je0H5S1tEfSKHYxlVjIYvy/v3AZC2YCW0Yw7WqZduyo+IQTxNz4H5HrjcEnjlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=oCY6a6EK
Subject: Re: [Buildroot] [PATCH 2/2] package/iozone: Fix parallel build
 problem
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBGcmkgU2VwIDEyLCAyMDI1IGF0IDI6NTAgUE0gQ0VTVCwgQmFydWNoIFNpYWNo
IHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gSGkgVGhvbWFzLAo+Cj4gT24gVGh1LCBTZXAgMTEgMjAy
NSwgVGhvbWFzIFBlcmFsZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBJbiByZXBseSBvZjoKPj4+
IEFwcGx5IGEgcGF0Y2ggZnJvbSBtZXRhLW9wZW5lbWJlZGRlZCBmaXhpbmcgYSBjcm9zcy1idWls
ZCBpc3N1ZSBbMV0uCj4+PiAKPj4+IFsxXQo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5lbWJl
ZGRlZC9tZXRhLW9wZW5lbWJlZGRlZC9ibG9iL3dhbG5hc2Nhci9tZXRhLW9lL3JlY2lwZXMtYmVu
Y2htYXJrL2lvem9uZTMvaW96b25lMy9wYXJhbGxlbGlzbS5wYXRjaAo+Pj4gCj4+PiBGaXhlczoK
Pj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTEx
NzY3NzQ0MDUgKFRlc3RJb3pvbmUpCj4+PiAKPj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91
ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+Pgo+PiBBcHBsaWVkIHRvIDIwMjUuMDIueCAmIDIw
MjUuMDUueC4gVGhhbmtzCj4KPiBOb3QgaW4gMjAyNS4wMi54IG9yIDIwMjUuMDUueCBhcyBvZiBh
NGFjNDJmNGU3YTc0ICgiUmV2ZXJ0Cj4gInBhY2thZ2UvZmlyZXdhbGxkOiBhZGQgbWlzc2luZyBu
ZnRhYmxlcyBqc29uIHJ1bnRpbWUgZGVwZW5kZW5jeSIiKSBhbmQKPiAwMmY0ZDYyYmJmOTUgKCJw
YWNrYWdlL3B5dGhvbjM6IGRvIGJ1aWxkLXRpbWUgZGV0ZWN0aW9uIG9mIG5vbi13b3JraW5nCj4g
dG9vbGNoYWluIiksIHJlc3BlY3RpdmVseS4KCkkgd2FzIGludmVzdGlnYXRpbmcgYSBidWlsZCBm
YWlsdXJlIG9uIHRoZSBpb3pvbmUgcGFja2FnZSBvbiBidWlsZHJvb3QKMjAyNS4wMi54LCBhbmQg
ZXZlbnR1YWxseSBmb3VuZCB0aGlzIHNlcmllcyB3aGljaCBpbmRlZWQgZml4ZXMgdGhlIGlzc3Vl
cwpvYnNlcnZlZCBsb2NhbGx5LiBBcyBCYXJ1Y2ggc3RhdGVkLCBpdCBkb2VzIG5vdCBzZWVtIHRv
IGJlIGFwcGxpZWQgb24KMjAyNS4wMi54LCBkZXNwaXRlIFRob21hcydzIG5vdGlmaWNhdGlvbi4K
CkFueSBwbGFuIHRvIGV2ZW50dWFsbHkgYXBwbHkgaXQgb24gMjAyNS4wMi54ID8KClRoYW5rcywK
CkFsZXhpcwoKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
