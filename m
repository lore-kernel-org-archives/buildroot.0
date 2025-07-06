Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48712C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 16:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2EFB81425;
	Sun,  6 Jul 2025 16:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTQe57r8qIvO; Sun,  6 Jul 2025 16:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D637281493
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D637281493;
	Sun,  6 Jul 2025 16:51:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A365212E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 898EA41129
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkiihbpNaOUw for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 16:51:53 +0000 (UTC)
X-Greylist: delayed 316 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 06 Jul 2025 16:51:53 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 59192410F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59192410F1
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59192410F1
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:51:53 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:d64f:2ea2:86b1:9101] (unknown
 [IPv6:2a01:e0a:12:eba0:d64f:2ea2:86b1:9101])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 608CAC0437;
 Sun,  6 Jul 2025 18:46:35 +0200 (CEST)
Message-ID: <c649e56a-9d61-4db5-bb5f-71195ff17e0a@grenoble.cnrs.fr>
Date: Sun, 6 Jul 2025 18:46:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
Cc: Simon Dawson <spdawson@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1751820395;
 bh=+SqK4aTa9ySUIkqhQ4cwES1FWxuigukXQTo/Fp++oMc=;
 h=Date:To:Cc:From:Subject:From;
 b=d/VHK9LUK2nCGle6OIRpsUMuJrhN8y6jZmytAq3R5vY0s0GLHVeb9MYY8kbNRJzqN
 KyLGwGpsU16pgYD0XU826vcgEmcTqvfm0N4UpN8B1vB9EDAE8LghPZKqDm5MgGfJsl
 pZtroV2I+RSY+flA2kFChV2O7lEs8TbeRpofpbc1bk2qdLnb9Uq7WgvyFAnynimu/d
 lE/O2rPgJYS6Z8sJfJOE9FYMGOEh1KnUdSNMBqmgIIT6Q4OIDuzubGEYy8pGpIpg/e
 xFbPp2hCrvgLwVJJBEcWVdJor72oQxxH/+gecgxsf2MinUQtA5ZmQKm6P2xTXYywzT
 vbfowmN46IKvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=d/VHK9LU
Subject: [Buildroot] [PATCH v2 1/1] boot/at91bootstrap3: fix build with host
 GCC 15
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVpbGRpbmcgYXQ5MWJvb3RzdHJhcDMgd2l0aCBHQ0MgMTUgZmFpbHMgd2l0aDoKCiAgICBpbmNs
dWRlL3R5cGVzLmg6MjM6MjM6IGVycm9yOiDigJhib29s4oCZIGNhbm5vdCBiZSBkZWZpbmVkIHZp
YSDigJh0eXBlZGVm4oCZCiAgICAgICAyMyB8IHR5cGVkZWYgdW5zaWduZWQgY2hhciBib29sOwog
ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXn5+fgogICAgaW5jbHVkZS90eXBlcy5o
OjIzOjIzOiBub3RlOiDigJhib29s4oCZIGlzIGEga2V5d29yZCB3aXRoIOKAmC1zdGQ9YzIz4oCZ
IG9ud2FyZHMKClRoaXMgaXMgZHVlIHRvIEdDQyAxNSBkZWZhdWx0aW5nIHRvIHRoZSBDMjMgbGFu
Z3VhZ2UgZGlhbGVjdC4KClNpZ25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2Js
ZS5jbnJzLmZyPgotLS0KQ2hhbmdlcyB2MSAtPiB2MjoKICAtIGFkZGVkIG5vdGUgIltFZGdhcjog
YmFja3BvcnQgdG8gdjMuMTAuM10iIHRvIHYzIHBhdGNoCi0tLQogLi4uY29uZGl0aW9uYWxseS1k
ZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoIHwgNDggKysrKysrKysrKysrKysrKysrKwogLi4u
Y29uZGl0aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoIHwgNDYgKysrKysrKysr
KysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDk0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBib290L2F0OTFib290c3RyYXAzL3YzLjEwLjMvMDAwMS1pbmNsdWRlLXR5cGVzLmgt
Y29uZGl0aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgYm9vdC9hdDkxYm9vdHN0cmFwMy92NC4wLjAvMDAwMS1pbmNsdWRlLXR5cGVzLmgtY29u
ZGl0aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoCgpkaWZmIC0tZ2l0IGEvYm9v
dC9hdDkxYm9vdHN0cmFwMy92My4xMC4zLzAwMDEtaW5jbHVkZS10eXBlcy5oLWNvbmRpdGlvbmFs
bHktZGVmaW5lLWJvb2wtZmFsc2UtYW5kLS5wYXRjaCBiL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvdjMu
MTAuMy8wMDAxLWluY2x1ZGUtdHlwZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNl
LWFuZC0ucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uM2ZlYTM1
ZmM2MAotLS0gL2Rldi9udWxsCisrKyBiL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvdjMuMTAuMy8wMDAx
LWluY2x1ZGUtdHlwZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0
Y2gKQEAgLTAsMCArMSw0OCBAQAorRnJvbSA5MDhjNjU2Nzg4Njc1NjVhOTM0ZWE1YTk2N2JmZTdl
MjA0ZDFjY2FmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogRWRnYXIgQm9uZXQgPGJv
bmV0QGdyZW5vYmxlLmNucnMuZnI+CitEYXRlOiBXZWQsIDI1IEp1biAyMDI1IDExOjEzOjQzICsw
MjAwCitTdWJqZWN0OiBbUEFUQ0hdIGluY2x1ZGUvdHlwZXMuaDogY29uZGl0aW9uYWxseSBkZWZp
bmUgYm9vbCwgZmFsc2UgYW5kIHRydWUKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6
IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKKworaW5jbHVkZS90eXBlcy5oIHR5cGVkZWZzIOKAmGJvb2zigJkgYW5kIG1hY3JvLWRlZmlu
ZXMg4oCYZmFsc2XigJkgYW5kIOKAmHRydWXigJkuCitIb3dldmVyLCBzaW5jZSBDMjMsIHRoZXNl
IGFyZSBwcmVkZWZpbmUga2V5d29yZHMuIEFzIEMyMyBpcyB0aGUgZGVmYXVsdAorQyBkaWFsZWN0
IGZvciBHQ0MgMTUsIGJ1aWxkaW5nIHdpdGggdGhpcyBjb21waWxlciBmYWlscyB3aXRoOgorCisg
ICAgaW5jbHVkZS90eXBlcy5oOjIzOjIzOiBlcnJvcjog4oCYYm9vbOKAmSBjYW5ub3QgYmUgZGVm
aW5lZCB2aWEg4oCYdHlwZWRlZuKAmQorICAgICAgIDIzIHwgdHlwZWRlZiB1bnNpZ25lZCBjaGFy
IGJvb2w7CisgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXn5+fgorICAgIGluY2x1
ZGUvdHlwZXMuaDoyMzoyMzogbm90ZTog4oCYYm9vbOKAmSBpcyBhIGtleXdvcmQgd2l0aCDigJgt
c3RkPWMyM+KAmSBvbndhcmRzCisKK0ZpeCB0aGlzIGJ1aWxkIGZhaWx1cmUgYnkgb25seSBkZWZp
bmluZyDigJhib29s4oCZLCDigJhmYWxzZeKAmSBhbmQg4oCYdHJ1ZeKAmSBvbiBDCitkaWFsZWN0
cyBvbGRlciB0aGFuIEMyMy4KKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eDRz
YW0vYXQ5MWJvb3RzdHJhcC9wdWxsLzE4OAorW0VkZ2FyOiBiYWNrcG9ydCB0byB2My4xMC4zXQor
CitTaWduZWQtb2ZmLWJ5OiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KKyhj
aGVycnkgcGlja2VkIGZyb20gY29tbWl0IDRhYWI2MGU2MzRkNTg4ZGZmYmQzMTU0ZmQwY2ZjZTc4
MjcyYjc1MGEpCistLS0KKyBpbmNsdWRlL3R5cGVzLmggfCAzICsrKworIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKKworZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHlwZXMuaCBiL2luY2x1
ZGUvdHlwZXMuaAoraW5kZXggMTI0NmE0ZGYuLjJjMWE0MWNmIDEwMDY0NAorLS0tIGEvaW5jbHVk
ZS90eXBlcy5oCisrKysgYi9pbmNsdWRlL3R5cGVzLmgKK0BAIC00Miw4ICs0MiwxMSBAQCB0eXBl
ZGVmIHNpZ25lZCBsb25nIGxvbmcgczY0OworIHR5cGVkZWYgdW5zaWduZWQgbG9uZyBzaXplX3Q7
CisgdHlwZWRlZiBzaWduZWQgbG9uZyBzc2l6ZV90OworIAorKy8qIGJvb2wsIGZhbHNlIGFuZCB0
cnVlIGFyZSBwcmVkZWZpbmVkIHNpbmNlIEMyMy4gKi8KKysjaWYgX19TVERDX1ZFUlNJT05fXyA8
IDIwMjMxMUwKKyB0eXBlZGVmIHVuc2lnbmVkIGNoYXIgYm9vbDsKKyAjZGVmaW5lIGZhbHNlCTBV
CisgI2RlZmluZSB0cnVlCTFVCisrI2VuZGlmCisgCisgI2VuZGlmIC8qIFRZUEVTX0hfICovCist
LSAKKzIuNDMuMAorCmRpZmYgLS1naXQgYS9ib290L2F0OTFib290c3RyYXAzL3Y0LjAuMC8wMDAx
LWluY2x1ZGUtdHlwZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0
Y2ggYi9ib290L2F0OTFib290c3RyYXAzL3Y0LjAuMC8wMDAxLWluY2x1ZGUtdHlwZXMuaC1jb25k
aXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMC4uNzcyYTgwODY5MAotLS0gL2Rldi9udWxsCisrKyBiL2Jvb3Qv
YXQ5MWJvb3RzdHJhcDMvdjQuMC4wLzAwMDEtaW5jbHVkZS10eXBlcy5oLWNvbmRpdGlvbmFsbHkt
ZGVmaW5lLWJvb2wtZmFsc2UtYW5kLS5wYXRjaApAQCAtMCwwICsxLDQ2IEBACitGcm9tIDRhYWI2
MGU2MzRkNTg4ZGZmYmQzMTU0ZmQwY2ZjZTc4MjcyYjc1MGEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tOiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KK0RhdGU6IFdl
ZCwgMjUgSnVuIDIwMjUgMTE6MTM6NDMgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gaW5jbHVkZS90
eXBlcy5oOiBjb25kaXRpb25hbGx5IGRlZmluZSBib29sLCBmYWxzZSBhbmQgdHJ1ZQorTUlNRS1W
ZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29u
dGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitpbmNsdWRlL3R5cGVzLmggdHlwZWRlZnMg
4oCYYm9vbOKAmSBhbmQgbWFjcm8tZGVmaW5lcyDigJhmYWxzZeKAmSBhbmQg4oCYdHJ1ZeKAmS4K
K0hvd2V2ZXIsIHNpbmNlIEMyMywgdGhlc2UgYXJlIHByZWRlZmluZSBrZXl3b3Jkcy4gQXMgQzIz
IGlzIHRoZSBkZWZhdWx0CitDIGRpYWxlY3QgZm9yIEdDQyAxNSwgYnVpbGRpbmcgd2l0aCB0aGlz
IGNvbXBpbGVyIGZhaWxzIHdpdGg6CisKKyAgICBpbmNsdWRlL3R5cGVzLmg6MjM6MjM6IGVycm9y
OiDigJhib29s4oCZIGNhbm5vdCBiZSBkZWZpbmVkIHZpYSDigJh0eXBlZGVm4oCZCisgICAgICAg
MjMgfCB0eXBlZGVmIHVuc2lnbmVkIGNoYXIgYm9vbDsKKyAgICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICBefn5+CisgICAgaW5jbHVkZS90eXBlcy5oOjIzOjIzOiBub3RlOiDigJhib29s
4oCZIGlzIGEga2V5d29yZCB3aXRoIOKAmC1zdGQ9YzIz4oCZIG9ud2FyZHMKKworRml4IHRoaXMg
YnVpbGQgZmFpbHVyZSBieSBvbmx5IGRlZmluaW5nIOKAmGJvb2zigJksIOKAmGZhbHNl4oCZIGFu
ZCDigJh0cnVl4oCZIG9uIEMKK2RpYWxlY3RzIG9sZGVyIHRoYW4gQzIzLgorCitVcHN0cmVhbTog
aHR0cHM6Ly9naXRodWIuY29tL2xpbnV4NHNhbS9hdDkxYm9vdHN0cmFwL3B1bGwvMTg4CisKK1Np
Z25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgorLS0tCisg
aW5jbHVkZS90eXBlcy5oIHwgMyArKysKKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
CisKK2RpZmYgLS1naXQgYS9pbmNsdWRlL3R5cGVzLmggYi9pbmNsdWRlL3R5cGVzLmgKK2luZGV4
IDk1MGIxYTQ2Li4wYWQ5YWU2MSAxMDA2NDQKKy0tLSBhL2luY2x1ZGUvdHlwZXMuaAorKysrIGIv
aW5jbHVkZS90eXBlcy5oCitAQCAtMjAsOCArMjAsMTEgQEAgdHlwZWRlZiBzaWduZWQgbG9uZyBs
b25nIHM2NDsKKyB0eXBlZGVmIHVuc2lnbmVkIGxvbmcgc2l6ZV90OworIHR5cGVkZWYgc2lnbmVk
IGxvbmcgc3NpemVfdDsKKyAKKysvKiBib29sLCBmYWxzZSBhbmQgdHJ1ZSBhcmUgcHJlZGVmaW5l
ZCBzaW5jZSBDMjMuICovCisrI2lmIF9fU1REQ19WRVJTSU9OX18gPCAyMDIzMTFMCisgdHlwZWRl
ZiB1bnNpZ25lZCBjaGFyIGJvb2w7CisgI2RlZmluZSBmYWxzZQkwVQorICNkZWZpbmUgdHJ1ZQkx
VQorKyNlbmRpZgorIAorICNlbmRpZiAvKiBUWVBFU19IXyAqLworLS0gCisyLjQzLjAKKwotLSAK
Mi4zNC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
