Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6739FC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 10:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 127F340194;
	Sat, 10 Dec 2022 10:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 127F340194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mR4qga8Y19hM; Sat, 10 Dec 2022 10:13:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F32B40298;
	Sat, 10 Dec 2022 10:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F32B40298
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17C4C1BF3AA
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 10:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEEFE40194
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 10:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEEFE40194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbRNfHmOiUAl for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 10:12:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E629C40253
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E629C40253
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:12:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.110.151])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D39887802D6;
 Sat, 10 Dec 2022 11:12:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 10 Dec 2022 11:12:43 +0100
Date: Sat, 10 Dec 2022 11:12:43 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Etienne Carriere <etienne.carriere@linaro.org>
Message-ID: <20221210101243.GT2855@scaer>
References: <20221209075104.1168297-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221209075104.1168297-1-etienne.carriere@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670667167;
 bh=8UbZLvSab1TaL0cTbjjh7tgJ9VnPbIHJ4dCUA1NqAzQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M2azfPdsSM0Bw0l2Rc8VwWMxwlUDpDB4KGxYxWtzkdI09STgNBugkNwl0TDixkZQf
 /51uRPTLZRz2Lk59aoqTjSYaS+xAW725UIP878xRdFcQWVwx4AilQgxV/3J2OOPJ90
 6Nw4xSEoULJEtHyEkwfnWOP/YCicgUBZyIx5xS6EpVNXpLOnAqMZNCpNRGz2tMmVrb
 8rpuzXEMitj/TBFnhOpv1meL+lwIExRWRCVC3w8QCg7WPOMvAhhblfUUAynhTS9qiw
 ssXaSlwis4gyOkG8oTu5vlSdgz4ktn8Ln8TNDZWnrW/lZVVXGM/lqPZPKe22uSN0xg
 2wldgMHtHwyKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M2azfPds
Subject: Re: [Buildroot] [PATCH v2 1/5] boot/optee-os: bump to version 3.19.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

w4l0aWVubmUsIEFsbCwKCk9uIDIwMjItMTItMDkgMDg6NTEgKzAxMDAsIEV0aWVubmUgQ2Fycmll
cmUgc3Bha2UgdGh1c2x5Ogo+IEJ1bXBzIE9QLVRFRSBPUyBwYWNrYWdlIHZlcnNpb24gdG8gT1At
VEVFIHJlbGVhc2UgMy4xOS4wLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEV0aWVubmUgQ2FycmllcmUg
PGV0aWVubmUuY2FycmllcmVAbGluYXJvLm9yZz4KClNlcmllcyBhcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzLiBTZWUgcGF0Y2ggMywgb24gd2hpY2ggSSBoYWQgdG8gZG8KcXVpdGUgc29tZSBmaXh1
cHMuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiBObyBjaGFuZ2Ugc2luY2UgdjEK
PiAtLS0KPiAgYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gICAgIHwgNCArKy0tCj4gIGJvb3Qvb3B0
ZWUtb3Mvb3B0ZWUtb3MuaGFzaCB8IDQgKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC9vcHRlZS1vcy9D
b25maWcuaW4gYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgo+IGluZGV4IDUyNDQ3MDBiYzIuLjhi
Y2NlMjIzMDYgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4KPiArKysgYi9i
b290L29wdGVlLW9zL0NvbmZpZy5pbgo+IEBAIC0xOCw3ICsxOCw3IEBAIGNob2ljZQo+ICAJICBT
ZWxlY3QgdGhlIHZlcnNpb24gb2YgT1AtVEVFIE9TIHlvdSB3YW50IHRvIHVzZQo+ICAKPiAgY29u
ZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfTEFURVNUCj4gLQlib29sICIzLjE4LjAiCj4gKwlib29s
ICIzLjE5LjAiCj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfQVJDSF9TVVBQ
T1JUUwo+ICAJc2VsZWN0IEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dS
QVBIWQo+ICAJaGVscAo+IEBAIC03MCw3ICs3MCw3IEBAIGVuZGlmCj4gIAo+ICBjb25maWcgQlIy
X1RBUkdFVF9PUFRFRV9PU19WRVJTSU9OCj4gIAlzdHJpbmcKPiAtCWRlZmF1bHQgIjMuMTguMCIJ
aWYgQlIyX1RBUkdFVF9PUFRFRV9PU19MQVRFU1QKPiArCWRlZmF1bHQgIjMuMTkuMCIJaWYgQlIy
X1RBUkdFVF9PUFRFRV9PU19MQVRFU1QKPiAgCWRlZmF1bHQgImN1c3RvbSIJaWYgQlIyX1RBUkdF
VF9PUFRFRV9PU19DVVNUT01fVEFSQkFMTAo+ICAJZGVmYXVsdCBCUjJfVEFSR0VUX09QVEVFX09T
X0NVU1RPTV9SRVBPX1ZFUlNJT04gXAo+ICAJCQkJaWYgQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNU
T01fR0lUCj4gZGlmZiAtLWdpdCBhL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaCBiL2Jvb3Qv
b3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaAo+IGluZGV4IDM4ZjY4YmVjNWQuLmE4N2YyMWE5YmYgMTAw
NjQ0Cj4gLS0tIGEvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoCj4gKysrIGIvYm9vdC9vcHRl
ZS1vcy9vcHRlZS1vcy5oYXNoCj4gQEAgLTEsNCArMSw0IEBACj4gLSMgRnJvbSBodHRwczovL2dp
dGh1Yi5jb20vT1AtVEVFL29wdGVlX29zL2FyY2hpdmUvMy4xOC4wL29wdGVlLW9zLTMuMTguMC50
YXIuZ3oKPiAtc2hhMjU2ICBiZGQzMDk2OTc3NDVlYzQ0MDY5NTE2NTIwOTRiNTBkOWFkYjA2YzM2
MTJmMDFiZDhhM2Q3MjY4MmVjOGUwM2U4ICBvcHRlZS1vcy0zLjE4LjAudGFyLmd6Cj4gKyMgRnJv
bSBodHRwczovL2dpdGh1Yi5jb20vT1AtVEVFL29wdGVlX29zL2FyY2hpdmUvMy4xOS4wL29wdGVl
LW9zLTMuMTkuMC50YXIuZ3oKPiArc2hhMjU2ICA1ZTBjMDNiYmM0ZDEwNmYyNjJhNmJkMzMzMzNj
MDAyYzMzODAyMDVhZTZiODIzMzRhYTdiNjQ0NzIxZmY3ODY4ICBvcHRlZS1vcy0zLjE5LjAudGFy
Lmd6Cj4gICMgTG9jYWxseSBjb21wdXRlZAo+ICBzaGEyNTYgIDEyNDdlZTkwODU4ZjQwMzdiNmNh
YzYzY2JmZmRkZmVkNDM1ZDBkNzNjNjMxYjM3ZDc4YzFlNmU2YWIzZTVkMWEgIExJQ0VOU0UKPiAt
LSAKPiAyLjI1LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cnwg
KzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8
ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0t
LS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3lt
b3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNv
bnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
