Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1B2C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F9C86070E;
	Wed, 16 Apr 2025 21:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ooB9NYsrKHQ; Wed, 16 Apr 2025 21:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C483660E02
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C483660E02;
	Wed, 16 Apr 2025 21:04:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12CA7159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04AA842531
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbM11G54vTTl for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:04:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1FB94424F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FB94424F5
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FB94424F5
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:04:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC3CC1C00C0; Wed, 16 Apr 2025 23:04:18 +0200 (CEST)
Message-ID: <bd79e4ab-22ce-4d10-a4ff-2f965e059092@rnout.be>
Date: Wed, 16 Apr 2025 23:04:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250323190705.3336274-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20250323190705.3336274-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837459; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kZroFt2UMWoo5rs4BLRdixsk//4JSHrisRYW1mENmo8=;
 b=aZpwSDrnS1qe8guF6hqVpQvOQ76+yT8DvdFFSYIoA2qZQzNkNnMuGtcT+1ySWtdrxcrSl7
 pR4N2zukD8thKWqm59zVr2dEWKVqaenhpMfiGm/lluZN8+hH+4xILZrefmmE7vdXToca2v
 2IvW1X0L+WvUjnjfZWfWilMqr8dVVq0mkR4a+q1hFGC2RuofuOCrm1Gq9F3Qa5kewuoSO+
 eQI9rxHAyx3AFrcI9C52gdiaQokXbJYeC8RGF33d34fMYdB5URuAzeZhK3BT+Qe2W1plWe
 Zqkb3bJIrDmmtkIgC1iDS1rQhobCEEBEWrBiITC44ooZ97FPcDKC36qoYskZaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] {linux, linux-headers}: bump 6.{6, 12,
 13}.x series
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIzLzAzLzIwMjUgMjA6MDcsIEJlcm5kIEt1aGxzIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6
IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgogwqBBcHBsaWVkIHRvwqAyMDI1LjAyLngs
IDIwMjQuMTEueCBhbmQgMjAyNC4wMi54IChhZnRlciBkcm9wcGluZyB0aGUgb25lcyB0aGF0IApk
b24ndCBleGlzdCBpbiB0aGVyZSksIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAt
LS0KPiAgIGxpbnV4L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgIGxp
bnV4L2xpbnV4Lmhhc2ggICAgICAgICAgICAgICAgICAgICB8IDYgKysrLS0tCj4gICBwYWNrYWdl
L2xpbnV4LWhlYWRlcnMvQ29uZmlnLmluLmhvc3QgfCA2ICsrKy0tLQo+ICAgMyBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGlu
dXgvQ29uZmlnLmluIGIvbGludXgvQ29uZmlnLmluCj4gaW5kZXggYzJmNzMwNzA5Yi4uY2RjZjdl
OGMyMyAxMDA2NDQKPiAtLS0gYS9saW51eC9Db25maWcuaW4KPiArKysgYi9saW51eC9Db25maWcu
aW4KPiBAQCAtMTM3LDcgKzEzNyw3IEBAIGNvbmZpZyBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9S
RVBPX0dJVF9TVUJNT0RVTEVTCj4gICAKPiAgIGNvbmZpZyBCUjJfTElOVVhfS0VSTkVMX1ZFUlNJ
T04KPiAgIAlzdHJpbmcKPiAtCWRlZmF1bHQgIjYuMTMuNyIgaWYgQlIyX0xJTlVYX0tFUk5FTF9M
QVRFU1RfVkVSU0lPTgo+ICsJZGVmYXVsdCAiNi4xMy44IiBpZiBCUjJfTElOVVhfS0VSTkVMX0xB
VEVTVF9WRVJTSU9OCj4gICAJZGVmYXVsdCAiNS4xMC4xNjItY2lwMjQiIGlmIEJSMl9MSU5VWF9L
RVJORUxfTEFURVNUX0NJUF9WRVJTSU9OCj4gICAJZGVmYXVsdCAiNS4xMC4xNjItY2lwMjQtcnQx
MCIgaWYgQlIyX0xJTlVYX0tFUk5FTF9MQVRFU1RfQ0lQX1JUX1ZFUlNJT04KPiAgIAlkZWZhdWx0
IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUUgXAo+IGRpZmYgLS1naXQgYS9s
aW51eC9saW51eC5oYXNoIGIvbGludXgvbGludXguaGFzaAo+IGluZGV4IGE4ZjM3ZmQwOTcuLjEw
YWFlZDFkM2YgMTAwNjQ0Cj4gLS0tIGEvbGludXgvbGludXguaGFzaAo+ICsrKyBiL2xpbnV4L2xp
bnV4Lmhhc2gKPiBAQCAtMSw3ICsxLDcgQEAKPiAgICMgRnJvbSBodHRwczovL3d3dy5rZXJuZWwu
b3JnL3B1Yi9saW51eC9rZXJuZWwvdjYueC9zaGEyNTZzdW1zLmFzYwo+IC1zaGEyNTYgIDNhMzli
NjIwMzhiN2FjMmY0M2QyNmExZjg0YjQyODNlMTk3ODA0ZTFlODE3YWQ2MzdlOWEzZDg3NGM0Nzgw
MWQgIGxpbnV4LTYuMTMuNy50YXIueHoKPiAtc2hhMjU2ICBkNzNiZjA1N2JlYzA0NDM0YjE2OWQx
YjYxNjQxOTM2ZjdkMGM5N2NlYjkyM2EyODFmMzJlMzVkZDRkY2M2NTMxICBsaW51eC02LjEyLjE5
LnRhci54ego+IC1zaGEyNTYgIDg5NGJiYmU2M2I3NDg0YTBiYzU3NmExZTExYThkYmMwOTBmYmQ0
NzZkNjQyNDQzMWJkYzg0MzVlMDNjMmMyMDggIGxpbnV4LTYuNi44My50YXIueHoKPiArc2hhMjU2
ICAyNTlhZmE1OWQ3M2Q2NzZiZWMyYWU4OWJlYWNkOTQ5ZTA4ZDU0ZDNmNzBhN2Y4YjBhNzQyMzE1
MDk1NzUxYWJiICBsaW51eC02LjEzLjgudGFyLnh6Cj4gK3NoYTI1NiAgMjMwZTg5YjA3YjBhYjgy
ZTc0ZjA3ZWNjMWJlZTMxMDVkY2E4MWQwZWY0YTk3ZjkwMDkyOWM0MDcyNDliNmFjNyAgbGludXgt
Ni4xMi4yMC50YXIueHoKPiArc2hhMjU2ICA3ZmQyMDcyMTU1MWE2MWRiMzQ3YzVhYzZjYTA1ODE4
ZTI0MDU4NjgyYmU0ZTQzODlkYzUxZTg4ZDRhYzE3YmE3ICBsaW51eC02LjYuODQudGFyLnh6Cj4g
ICBzaGEyNTYgIDQ0Y2FmNTEwNjAzYjRjYmJlNzhlZjgyODYyMDA5OWQyMDA1MzZkNjY2ZTkwOWRk
YjczYmIyOTM4YzdkZTViMTYgIGxpbnV4LTYuMS4xMzEudGFyLnh6Cj4gICAjIEZyb20gaHR0cHM6
Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgva2VybmVsL3Y1Lngvc2hhMjU2c3Vtcy5hc2MKPiAg
IHNoYTI1NiAgOTMxOWE0N2IxZTliNWQzNDRmZjYwMTU0MzE4NTZkMGM5NjQwZTRmYWVkYzUyN2M4
N2Y5MTI5MDYxYTI3MTM2ZiAgbGludXgtNS4xNS4xNzkudGFyLnh6Cj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbGludXgtaGVhZGVycy9Db25maWcuaW4uaG9zdCBiL3BhY2thZ2UvbGludXgtaGVhZGVy
cy9Db25maWcuaW4uaG9zdAo+IGluZGV4IDliZTU5NTc1OTYuLjBhMDdkNjU3YjIgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9saW51eC1oZWFkZXJzL0NvbmZpZy5pbi5ob3N0Cj4gKysrIGIvcGFja2Fn
ZS9saW51eC1oZWFkZXJzL0NvbmZpZy5pbi5ob3N0Cj4gQEAgLTQ0MCw5ICs0NDAsOSBAQCBjb25m
aWcgQlIyX0RFRkFVTFRfS0VSTkVMX0hFQURFUlMKPiAgIAlkZWZhdWx0ICI1LjEwLjIzNSIJaWYg
QlIyX0tFUk5FTF9IRUFERVJTXzVfMTAKPiAgIAlkZWZhdWx0ICI1LjE1LjE3OSIJaWYgQlIyX0tF
Uk5FTF9IRUFERVJTXzVfMTUKPiAgIAlkZWZhdWx0ICI2LjEuMTMxIglpZiBCUjJfS0VSTkVMX0hF
QURFUlNfNl8xCj4gLQlkZWZhdWx0ICI2LjYuODMiCWlmIEJSMl9LRVJORUxfSEVBREVSU182XzYK
PiAtCWRlZmF1bHQgIjYuMTIuMTkiCWlmIEJSMl9LRVJORUxfSEVBREVSU182XzEyCj4gLQlkZWZh
dWx0ICI2LjEzLjciCWlmIEJSMl9LRVJORUxfSEVBREVSU182XzEzCj4gKwlkZWZhdWx0ICI2LjYu
ODQiCWlmIEJSMl9LRVJORUxfSEVBREVSU182XzYKPiArCWRlZmF1bHQgIjYuMTIuMjAiCWlmIEJS
Ml9LRVJORUxfSEVBREVSU182XzEyCj4gKwlkZWZhdWx0ICI2LjEzLjgiCWlmIEJSMl9LRVJORUxf
SEVBREVSU182XzEzCj4gICAJZGVmYXVsdCBCUjJfREVGQVVMVF9LRVJORUxfVkVSU0lPTiBpZiBC
UjJfS0VSTkVMX0hFQURFUlNfVkVSU0lPTgo+ICAgCWRlZmF1bHQgImN1c3RvbSIJaWYgQlIyX0tF
Uk5FTF9IRUFERVJTX0NVU1RPTV9UQVJCQUxMCj4gICAJZGVmYXVsdCBCUjJfS0VSTkVMX0hFQURF
UlNfQ1VTVE9NX1JFUE9fVkVSU0lPTiBcCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
