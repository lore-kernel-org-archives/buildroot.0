Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD48BC4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 14:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7903640293;
	Tue, 28 Nov 2023 14:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7903640293
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wq41VIisMaCe; Tue, 28 Nov 2023 14:10:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D60574027B;
	Tue, 28 Nov 2023 14:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D60574027B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D02001BF2C6
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 14:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B63F64027B
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 14:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B63F64027B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kdW3iyc_leKN for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 14:10:09 +0000 (UTC)
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AA6F4026E
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 14:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AA6F4026E
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id BC2DD4403F6;
 Tue, 28 Nov 2023 16:08:45 +0200 (IST)
References: <20231128134301.6018-1-flavio.tapajos@newtesc.com.br>
 <20231128134301.6018-2-flavio.tapajos@newtesc.com.br>
User-agent: mu4e 1.10.8; emacs 29.1
To: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Date: Tue, 28 Nov 2023 16:07:59 +0200
In-reply-to: <20231128134301.6018-2-flavio.tapajos@newtesc.com.br>
Message-ID: <87edgax937.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1701180525;
 bh=6ByPNb/3GOeuPWS7iEvN8DT20dtd8bJ6kWRJedmD6AE=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=NgpbtUvf9VPGJqEkcOd5F1nmYlohqHXjZ73aEc76kmKBX0Zgucj7KnMCiUcaWRgxy
 6gXdLMRF5o/r4GMoP0udy/fnTp6Whx8rnCVX/Lc+inzJgB3j3epU5LMNc80lbpoi5p
 Nre07FHdkPhI/17+WnaA12HZq+PYGAndIc4XzSAXU6cgRBFCI9FZVGwjzSSFkqCN2P
 TqfhEklFg+6P07n87k4lfFRCghBpLp7E8W+psvMdwkl4tDCsOUngg38CEK3RBpprKa
 FpWR/D2wKvM968JV0GZx9Ggom8zzyw81RYsoB3SEvYlpPcQ4ALpbix70I4TbIcrnjr
 Tn1F5X2u4RM+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=NgpbtUvf
Subject: Re: [Buildroot] [PATCH 2/2] package/rsyslog: add libdbi-drivers
 optional dependency
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmzDoXZpbywKCk9uIFR1ZSwgTm92IDI4IDIwMjMsIEZsw6F2aW8gVGFwYWrDs3Mgd3JvdGU6
Cj4gTmVlZGVkIGluIG9yZGVyIHRvIHVzZSBvbWxpYmRiaSBtb2R1bGUKPgo+IFNpZ25lZC1vZmYt
Ynk6IEZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgo+IC0t
LQo+ICBwYWNrYWdlL3JzeXNsb2cvQ29uZmlnLmluICB8IDEgKwo+ICBwYWNrYWdlL3JzeXNsb2cv
cnN5c2xvZy5tayB8IDcgKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnN5c2xvZy9Db25maWcuaW4gYi9wYWNrYWdlL3Jz
eXNsb2cvQ29uZmlnLmluCj4gaW5kZXggM2JhMzI2MTkxYS4uZTA3ZGI4MThlMiAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3JzeXNsb2cvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9yc3lzbG9nL0Nv
bmZpZy5pbgo+IEBAIC0xMyw2ICsxMyw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9SU1lTTE9HCj4g
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRVNUUgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkxP
R0dJTkcKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJGQVNUSlNPTgo+ICsJc2VsZWN0IEJSMl9Q
QUNLQUdFX0xJQkRCSV9EUklWRVJTCgpUaGUgY29kZSBiZWxvdyBpbmRpY2F0ZXMgdGhhdCBCUjJf
UEFDS0FHRV9MSUJEQklfRFJJVkVSUyBpcyBhbiBvcHRpb25hbApkZXBlbmRlbmN5LiBObyBuZWVk
IHRvIGZvcmNlICdzZWxlY3QnIGluIHRoYXQgY2FzZS4gVGhlIHVzZXIgY2FuIGVuYWJsZQpCUjJf
UEFDS0FHRV9MSUJEQklfRFJJVkVSUyBmb3IgdGhlIG9tbGliZGJpIGZ1bmN0aW9uYWxpdHkuCgpi
YXJ1Y2gKCj4gIAloZWxwCj4gIAkgIFJzeXNsb2cgaXMgYSBwb3dlcmZ1bCBhbmQgZmxleGlibGUg
c3lzbG9nIGltcGxlbWVudGF0aW9uCj4gIAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cv
cnN5c2xvZy5tayBiL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCj4gaW5kZXggY2Y5ZjJjMGU3
OS4uOGVhOTJlYTc4NSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tawo+
ICsrKyBiL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCj4gQEAgLTE1MSw2ICsxNTEsMTMgQEAg
UlNZU0xPR19DT05GX09QVFMgKz0gXAo+ICAJLS1kaXNhYmxlLW9tam91cm5hbAo+ICBlbmRpZgo+
ICAKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9MSUJEQklfRFJJVkVSUykseSkKPiArUlNZU0xPR19D
T05GX09QVFMgKz0gLS1lbmFibGUtbGliZGJpCj4gK1JTWVNMT0dfREVQRU5ERU5DSUVTICs9IGxp
YmRiaS1kcml2ZXJzCj4gK2Vsc2UKPiArUlNZU0xPR19DT05GX09QVFMgKz0gLS1kaXNhYmxlLWxp
YmRiaQo+ICtlbmRpZgo+ICsKPiAgZGVmaW5lIFJTWVNMT0dfSU5TVEFMTF9JTklUX1NZU1RFTUQK
PiAgCSQoSU5TVEFMTCkgLW0gMDY0NCAtRCBwYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5zZXJ2aWNl
IFwKPiAgCQkkKFRBUkdFVF9ESVIpL3Vzci9saWIvc3lzdGVtZC9zeXN0ZW0vcnN5c2xvZy5zZXJ2
aWNlCgoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfi4gLn4gICBUayBPcGVuIFN5c3RlbXMKPX0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1vb08tLVUtLU9vby0tLS0tLS0tLS0tLXs9CiAgIC0gYmFy
dWNoQHRrb3MuY28uaWwgLSB0ZWw6ICs5NzIuNTIuMzY4LjQ2NTYsIGh0dHA6Ly93d3cudGtvcy5j
by5pbCAtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
