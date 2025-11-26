Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C29D10386
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 07:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C41160A55;
	Wed, 26 Nov 2025 07:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPhZgJnzeMbr; Wed, 26 Nov 2025 07:58:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75DC260AC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75DC260AC3;
	Wed, 26 Nov 2025 07:58:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5A262A9
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 07:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AFFD40388
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 07:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJWte5RoHjUP for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 07:58:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1183840283
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1183840283
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1183840283
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 07:58:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1465200985; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 26 Nov 2025 07:58:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vOAPt-0000000BKM5-1dDf;
 Wed, 26 Nov 2025 08:58:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20251125131312.3956875-1-neal.frager@amd.com> (Neal Frager's
 message of "Tue, 25 Nov 2025 13:13:12 +0000")
References: <20251125131312.3956875-1-neal.frager@amd.com>
Date: Wed, 26 Nov 2025 08:58:21 +0100
Message-ID: <87zf89gr8i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=gFtvfNzaMDKAGU5clpyLPXjHXn3ZtjBlNaieGbXbm6Ar+FLhcTPyJ6sN9fy994Ep9puAIntnf8nDQRJByUsaO5dyRgfGR/9nXfmYVmVb8AoRLPUHRHeKEXMPM2H/+/E3Lr2sgOc61buerQCZapzpwg4kFggWIZgM95m+m/qTfAUBfHYA9QrLRpHdTmlx0QmJaAOagAPdmm1JhYxqk02FPvVbrrhOzkoqGS89ryKPjFKkdk0P7Ss7/zrNOBVYzrzj3qBr+Qqk4MDvHxVGNzFCyOhkfCfdYIoDxMrg6+dHqvtFwQXlOG5skhF9Vf54epS0sgrjxkna/+UE2/IRVfrVqA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=i+975HkqCXEigKBYN58ParSIFt/ylkTGlroEHsTVrWc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=gFtvfNza
Subject: Re: [Buildroot] [PATCH v2 1/1] package/bootgen: bump to
 xilinx_v2025.2
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
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, buildroot@buildroot.org, brandon.maier@collins.com,
 ju.o@free.fr, thomas.petazzoni@bootlin.com, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIk5lYWwiID09IE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPiB3cml0ZXM6
CgogPiBCdW1wIGJvb3RnZW4gdG8geGlsaW54X3YyMDI1LjIgdmVyc2lvbi4KID4gVGhlIDAwMDEt
Ymlzb25mbGV4LUZpeC1idWlsZC1vbi1tYWNoaW5lcy13aXRoLW1vZGVybi1mbGV4LnBhdGNoIGlz
IG5vIGxvbmdlcgogPiBuZWVkZWQgYmVjYXVzZSBpdCBoYXMgYmVlbiBjb21taXR0ZWQgdXBzdHJl
YW0gYW5kIGluY2x1ZGVkIHdpdGggdGhlCiA+IHhpbGlueF92MjAyNS4yIHZlcnNpb24uCgogPiBo
dHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2Jvb3RnZW4vY29tbWl0LzA0NzFmMDg0YjA1NzY5MTQz
ZWE5ZTczZjljNDRiMDc1ZmU0MGM4MDEKCiA+IFRoZSAwMDAxLWxtcy1oYXNoLXNpZ3MtaHNzX3Bh
cmFtLmMtYWRkLXN0ZGlvLmgtaW5jbHVkZS5wYXRjaCBoYXMgbm93IGJlZW4KID4gYWRkZWQgdG8g
dGhlIHBhY2thZ2UgdG8gZml4IHRoZSBmb2xsb3dpbmcgcG90ZW50aWFsIGJ1aWxkIGVycm9yOgoK
ID4gVGhlIGxtcy1oYXNoLXNpZ3MvaHNzX3BhcmFtLmMgaXMgbWlzc2luZyBhbiBpbmNsdWRlIG9m
IHN0ZGlvLmguIFdpdGhvdXQgaXQsCiA+IHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3IgY2FuIG9j
Y3VyOgoKID4gaHNzX3BhcmFtLmM6IEluIGZ1bmN0aW9uIOKAmGhzc19nZXRfcGFyYW1ldGVyX3Nl
dOKAmToKID4gaHNzX3BhcmFtLmM6MTU3OjEzOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24g
b2YgZnVuY3Rpb24g4oCYcHJpbnRm4oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9u
XQogPiAgIDE1NyB8ICAgICAgICAgICAgIHByaW50ZigiUHJpdmF0ZSBrZXkgZXhwaXJlZFxuIik7
CiA+ICAgICAgIHwgICAgICAgICAgICAgXn5+fn5+CiA+IGhzc19wYXJhbS5jOjc6MTogbm90ZTog
aW5jbHVkZSDigJg8c3RkaW8uaD7igJkgb3IgcHJvdmlkZSBhIGRlY2xhcmF0aW9uIG9mIOKAmHBy
aW50ZuKAmQogPiAgICAgNiB8ICNpbmNsdWRlICJsbV9jb21tb24uaCIKID4gICArKysgfCsjaW5j
bHVkZSA8c3RkaW8uaD4KID4gICAgIDcgfAogPiBoc3NfcGFyYW0uYzoxNTc6MTM6IHdhcm5pbmc6
IGluY29tcGF0aWJsZSBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBidWlsdC1pbiBmdW5jdGlvbiDi
gJhwcmludGbigJkgWy1XYnVpbHRpbi1kZWNsYXJhdGlvbi1taXNtYXRjaF0KID4gICAxNTcgfCAg
ICAgICAgICAgICBwcmludGYoIlByaXZhdGUga2V5IGV4cGlyZWRcbiIpOwogPiAgICAgICB8ICAg
ICAgICAgICAgIF5+fn5+fgogPiBoc3NfcGFyYW0uYzoxNTc6MTM6IG5vdGU6IGluY2x1ZGUg4oCY
PHN0ZGlvLmg+4oCZIG9yIHByb3ZpZGUgYSBkZWNsYXJhdGlvbiBvZiDigJhwcmludGbigJkKID4g
bWFrZVszXTogKioqIFtNYWtlZmlsZTozODogaHNzX3BhcmFtLm9dIEVycm9yIDEKID4gbWFrZVsz
XTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KID4gbWFrZVsyXTogKioqIFtN
YWtlZmlsZTo4NDogYnVpbGQvYmluL2Jvb3RnZW5dIEVycm9yIDIKCiA+IFRoZSBhYm92ZSBlcnJv
ciB3YXMgcmVwb3J0ZWQgb24gRGViaWFuIDEzIC8gZ2NjIDE0LjIuMC4KCiA+IFJlcG9ydGVkLWJ5
OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+CiA+IFVwc3RyZWFtOiBzdWJt
aXR0ZWQgdG8gWGlsaW54IGJvb3RnZW4gcmVwbyB3aXRoIENSLTEyNTY3NDEKCiA+IFNpZ25lZC1v
ZmYtYnk6IE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPgogPiAtLS0KID4gVjEtPiBW
MjoKID4gLSBBZGRlZCBwYXRjaCBmb3IgZml4aW5nIG1pc3Npbmcgc3RkaW8uaCBoZWFkZXIgZmls
ZS4KCkNvbW1pdHRlZCB0byBuZXh0IGFmdGVyIGFkZGluZyB0aGUgVXBzdHJlYW06IHRhZyB0byB0
aGUgcGF0Y2ggZmlsZQppdHNlbGYgdG8gbWFrZSBjaGVjay1wYWNrYWdlIGhhcHB5LCB0aGFua3Mu
CgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
