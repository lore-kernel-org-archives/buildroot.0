Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCB6C4828F
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 23:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C07F82F6C;
	Fri,  2 Feb 2024 23:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C07F82F6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ao1AUGBeiJ2w; Fri,  2 Feb 2024 23:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF19282F20;
	Fri,  2 Feb 2024 23:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF19282F20
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0B211BF3D2
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 23:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6508420AE
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 23:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6508420AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6drdPIxwc9T for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 23:38:54 +0000 (UTC)
X-Greylist: delayed 489 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 02 Feb 2024 23:38:54 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8510541E30
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8510541E30
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 23:38:54 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 1A417240B82
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 00:30:43 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id 010C980069;
 Sat,  3 Feb 2024 00:30:43 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id B6A002409EB;
 Sat,  3 Feb 2024 00:30:42 +0100 (CET)
To: buildroot@buildroot.org
Date: Sat,  3 Feb 2024 00:30:30 +0100
Message-Id: <20240202233030.1192392-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 4194
X-purgate-ID: 154282::1706916642-B77EF338-8BA3DBA7/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1706916643;
 bh=MW+ESEDPJ8wFFH4cvawqhTFGG958BhLnS26MYS3hpJ4=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=ajVnJPEQg0SDmh1uttxA2RV1A+Mzu9f7YJduCm4KpyJCcf0qnaUpcSbA5gJnZWc+I
 WecfHwctdpW8nNaKzSaVIKtOAG3Dt1wkl5EOeRUYkFlGHUKxm/Exd6mTYjiiP3mScG
 eDegPDowkv5niE640fsEAR0Ep8eUXL7OhDBCGNYd4jzGZUi32n8ZhqGP5DZMc2rL1e
 ne1vnp4cTFfynQ/rYKYBWckbSw9AjOkrVbxBgheXHfFy04dGFoeYrt0mWlfADC7NUR
 OALQvYY6ZA5o/bXraZ0kzv58DxJMwwTvz7F3n33PalsX1BkGvHJI2QeHD9iKV5zhYO
 vFkVF/Prl0Ozw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=ajVnJPEQ
Subject: [Buildroot] [PATCH 1/1] board/radxa/rock5b: Disable FIQ debug
 interface
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGN1c3RvbSBrZXJuZWwgdXNlZCBmb3IgdGhlIFJvY2s1QiBmZWF0dXJlcyBhbiBGSVEgZGVi
dWcKaW50ZXJmYWNlIHdoaWNoIGlzIGVuYWJsZWQgYnkgZGVmYXVsdC4gQXMgaXQgaXMgbm90IG5l
ZWRlZCwgaXQgaXMKZGlzYWJsZWQuIFRoZSBkb2N1bWVudGF0aW9uIGZlYXR1cmVzIGluc3RydWN0
aW9ucyBvbiBob3cgdG8KcmUtZW5hYmxlIGl0LCBpZiBpdCBpcyBuZWVkZWQuCgpTaWduZWQtb2Zm
LWJ5OiBLaWxpYW4gWmlubmVja2VyIDxraWxpYW4uemlubmVja2VyQG1haWwuZGU+Ci0tLQogYm9h
cmQvcmFkeGEvcm9jazViL2xpbnV4LmZyYWdtZW50IHwgIDEgKwogYm9hcmQvcmFkeGEvcm9jazVi
L3JlYWRtZS50eHQgICAgIHwgMjAgKysrKysrKysrKysrKysrKysrKysKIGJvYXJkL3JhZHhhL3Jv
Y2s1Yi9yb2NrNWIuZHRzICAgICB8IDEyICsrKysrKysrKysrKwogYm9hcmQvcmFkeGEvcm9jazVi
L3JvY2s1Yi5pdHMgICAgIHwgIDIgKy0KIGNvbmZpZ3Mvcm9jazViX2RlZmNvbmZpZyAgICAgICAg
ICB8ICAzICsrLQogNSBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3JhZHhhL3JvY2s1Yi9yb2NrNWIuZHRzCgpk
aWZmIC0tZ2l0IGEvYm9hcmQvcmFkeGEvcm9jazViL2xpbnV4LmZyYWdtZW50IGIvYm9hcmQvcmFk
eGEvcm9jazViL2xpbnV4LmZyYWdtZW50CmluZGV4IDZkNjVjYjdiYjguLjI4YmIzNzNlZjIgMTAw
NjQ0Ci0tLSBhL2JvYXJkL3JhZHhhL3JvY2s1Yi9saW51eC5mcmFnbWVudAorKysgYi9ib2FyZC9y
YWR4YS9yb2NrNWIvbGludXguZnJhZ21lbnQKQEAgLTEsNCArMSw1IEBACiBDT05GSUdfUjgxNjk9
eQorIyBDT05GSUdfUk9DS0NISVBfRklRX0RFQlVHR0VSIGlzIG5vdCBzZXQKICMgRGlzYWJsZSBS
b2NrY2hpcCBzcGVjaWZpYyBXaUZpIGRyaXZlcnMsIGFzIHRoZSBrZXJuZWwKICMgY29kZSBjYW5u
b3QgYmUgYnVpbGQgd2l0aCBHQ0MgMTIgZHVlIHRvIHNldmVyYWwgV2Vycm9ycwogIyBDT05GSUdf
V0xfUk9DS0NISVAgaXMgbm90IHNldApkaWZmIC0tZ2l0IGEvYm9hcmQvcmFkeGEvcm9jazViL3Jl
YWRtZS50eHQgYi9ib2FyZC9yYWR4YS9yb2NrNWIvcmVhZG1lLnR4dAppbmRleCBmMDJmM2QzODBl
Li5iM2ViMDY4NTFhIDEwMDY0NAotLS0gYS9ib2FyZC9yYWR4YS9yb2NrNWIvcmVhZG1lLnR4dAor
KysgYi9ib2FyZC9yYWR4YS9yb2NrNWIvcmVhZG1lLnR4dApAQCAtMjAsNiArMjAsNyBAQCBvdXRw
dXQvaW1hZ2VzCiDilJzilIDilIAgcmszNTg4LXJvY2stNWIuZHRiCiDilJzilIDilIAgcmszNTg4
X2JsMzFfdjEuNDAuZWxmCiDilJzilIDilIAgcmszNTg4X2Rkcl9scDRfMjExMk1Iel9scDVfMjcz
Nk1Iel92MS4xMi5iaW4KK+KUnOKUgOKUgCByb2NrNWIuZHRzCiDilJzilIDilIAgcm9jazViLml0
cwog4pSc4pSA4pSAIHJvb3Rmcy5leHQyCiDilJzilIDilIAgcm9vdGZzLmV4dDQKQEAgLTY0LDYg
KzY1LDggQEAgaHR0cHM6Ly9mb3J1bS5yYWR4YS5jb20vYy9yb2NrNQogSXNzdWVzOgogPT09PT09
PQogCitXaUZpCistLS0tCiBUaGUgY3VzdG9tIFJhZHhhIGtlcm5lbCBwcm92aWRlcyBjdXN0b20g
Y29kZSB0byBzdXBwb3J0IFdpRmkuIEhvd2V2ZXIsCiB0aGF0IGNvZGUgZG9lcyBub3QgY29tcGls
ZSB3aXRoIEdDQyAxMiwgd2hpY2ggaXMgdGhlIGN1cnJlbnQgZGVmYXVsdAogdmVyc2lvbiBpbiBi
dWlsZHJvb3QuIEhlbmNlLCB0aGUgV2lGaSBrZXJuZWwgZHJpdmVycyBhcmUgZGlzYWJsZWQsIHVu
dGlsCkBAIC04MCwzICs4MywyMCBAQCBCUjJfR0NDX1ZFUlNJT05fMTFfWD15CiBib2FyZC9yYWR4
YS9yb2NrNWIvbGludXguZnJhZ21lbnQ6CiAKICMgQ09ORklHX1dMX1JPQ0tDSElQIGlzIG5vdCBz
ZXQKKworUm9ja2NoaXAgRklRIERlYnVnZ2VyCistLS0tLS0tLS0tLS0tLS0tLS0tLS0KK1RoZSBj
dXN0b20ga2VybmVsIHVzZWQgZm9yIHRoaXMgYm9hcmQgZmVhdHVyZXMgYW4gRklRIGRlYnVnZ2Vy
LCB3aGljaAorY2FuIGJlIGFjdGl2YXRlZCBieSB0eXBpbmcgImZpcSIgb24gdGhlIHNlcmlhbCBp
bnRlcmZhY2UuIEFzIHRoaXMgY2FuIGJlCithbm5veWluZyBpZiBhIHVzZXIgd2FudHMgdG8gdHlw
ZSB0aGVzZSBjaGFyYWt0ZXJzIGFuZCBpdCBpcyBub3QgbmVlZGVkCitmb3IgbW9zdCB1c2Vycywg
dGhpcyBib2FyZCBzdXBwb3J0IGRpc2FibGVzIHRoZSBGSVEgZGVidWdnZXIgYnkgZGVmYXVsdC4K
K1RvIHJlLWVuYWJsZSB0aGUgRklRIGRlYnVnZ2VyIGZvbGxvdyB0aGUgc3RlcHM6CisKKzEuIElu
IGJvYXJkL3JhZHhhL3JvY2s1Yi9yb2NrNWIuZHRzIHNldCB0aGUgc3RhdHVzIHByb3BlcnR5IG9m
IHRoZQorZmlxX2RlYnVnZ2VyIG5vZGUgdG8gIm9rYXkiIGFuZCBzZXQgdGhlIHN0YXR1cyBwcm9w
ZXJ0eSBvZiB0aGUgdWFydDIKK25vZGUgdG8gImRpc2FibGVkIgorCisyLiBSZS1lbmFibGUgdGhl
IGZpcSBkZWJ1Z2dlciBtb2R1bGUgIGJ5IHJlbW92aW5nIHRoZSBmb2xsb3dpbmcgbGluZQorZnJv
bSBib2FyZC9yYWR4YS9yb2NrNWIvbGludXguZnJhZ21lbnQ6CisKKyMgQ09ORklHX1JPQ0tDSElQ
X0ZJUV9ERUJVR0dFUiBpcyBub3Qgc2V0CmRpZmYgLS1naXQgYS9ib2FyZC9yYWR4YS9yb2NrNWIv
cm9jazViLmR0cyBiL2JvYXJkL3JhZHhhL3JvY2s1Yi9yb2NrNWIuZHRzCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjcxYTRlNDJiNWUKLS0tIC9kZXYvbnVsbAorKysgYi9i
b2FyZC9yYWR4YS9yb2NrNWIvcm9jazViLmR0cwpAQCAtMCwwICsxLDEyIEBACisvZHRzLXYxLzsK
KworI2luY2x1ZGUgInJvY2tjaGlwL3JrMzU4OC1yb2NrLTViLmR0cyIKKworJmZpcV9kZWJ1Z2dl
ciB7CisJc3RhdHVzID0gImRpc2FibGVkIjsKK307CisKKyZ1YXJ0MiB7CisJcGluY3RybC0wID0g
PCZ1YXJ0Mm0wX3hmZXI+OworCXN0YXR1cyA9ICJva2F5IjsKK307CmRpZmYgLS1naXQgYS9ib2Fy
ZC9yYWR4YS9yb2NrNWIvcm9jazViLml0cyBiL2JvYXJkL3JhZHhhL3JvY2s1Yi9yb2NrNWIuaXRz
CmluZGV4IGQ3MzY1OWE1NmUuLjljZTIzNWQwNDEgMTAwNjQ0Ci0tLSBhL2JvYXJkL3JhZHhhL3Jv
Y2s1Yi9yb2NrNWIuaXRzCisrKyBiL2JvYXJkL3JhZHhhL3JvY2s1Yi9yb2NrNWIuaXRzCkBAIC0y
MCw3ICsyMCw3IEBACiAJCX07CiAJCWZkdCB7CiAJCQlkZXNjcmlwdGlvbiA9ICJEZXZpY2UgVHJl
ZSI7Ci0JCQlkYXRhID0gL2luY2Jpbi8oInJrMzU4OC1yb2NrLTViLmR0YiIpOworCQkJZGF0YSA9
IC9pbmNiaW4vKCJyb2NrNWIuZHRiIik7CiAJCQl0eXBlID0gImZsYXRfZHQiOwogCQkJYXJjaCA9
ICJhcm02NCI7CiAJCQljb21wcmVzc2lvbiA9ICJub25lIjsKZGlmZiAtLWdpdCBhL2NvbmZpZ3Mv
cm9jazViX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvcm9jazViX2RlZmNvbmZpZwppbmRleCAyZTcyYjM4
NmIxLi43MTc1YWE2NmJmIDEwMDY0NAotLS0gYS9jb25maWdzL3JvY2s1Yl9kZWZjb25maWcKKysr
IGIvY29uZmlncy9yb2NrNWJfZGVmY29uZmlnCkBAIC0xNCw3ICsxNCw4IEBAIEJSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX1JFUE9fVVJMPSJodHRwczovL2dpdGh1Yi5jb20vcmFkeGEva2VybmVsLmdp
dCIKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1JFUE9fVkVSU0lPTj0iNTJmNTFhMmI1YmExNzhm
MzMxYWY2MjI2MGQyZGE4NmQ3NDcyYzE0YiIKIEJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJy
b2NrY2hpcF9saW51eCIKIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQotQlIyX0xJTlVY
X0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9InJvY2tjaGlwL3JrMzU4OC1yb2NrLTViIgorIyBCUjJf
TElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRSBpcyBub3Qgc2V0CitCUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9EVFNfUEFUSD0iYm9hcmQvcmFkeGEvcm9jazViL3JvY2s1Yi5kdHMiCiBCUjJfTElO
VVhfS0VSTkVMX0RUQl9PVkVSTEFZX1NVUFBPUlQ9eQogQlIyX0xJTlVYX0tFUk5FTF9DT05GSUdf
RlJBR01FTlRfRklMRVM9ImJvYXJkL3JhZHhhL3JvY2s1Yi9saW51eC5mcmFnbWVudCIKIEJSMl9U
QVJHRVRfUk9PVEZTX0VYVDI9eQotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
