Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0493C5475B
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 15:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AA59400FD;
	Wed,  6 Mar 2024 15:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwJAb6DgPj17; Wed,  6 Mar 2024 15:52:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 568B14064A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 568B14064A;
	Wed,  6 Mar 2024 15:52:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2C821BF2FA
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 15:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D005A400FD
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 15:52:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RBxkRlUDlsbM for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 15:52:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3484B4064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3484B4064A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3484B4064A
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 15:52:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C339C20010;
 Wed,  6 Mar 2024 15:52:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rhtZ7-002lRq-0w;
 Wed, 06 Mar 2024 16:52:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240305171938.2252446-1-fontaine.fabrice@gmail.com>
Date: Wed, 06 Mar 2024 16:52:21 +0100
In-Reply-To: <20240305171938.2252446-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 5 Mar 2024 18:19:38 +0100")
Message-ID: <875xxzxsqy.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/esp-hosted: disable -Werror
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBEaXNhYmxlIC1XZXJyb3IgdG8gZml4IHRoZSBmb2xsb3dpbmcg
YnVpbGQgZmFpbHVyZSByYWlzZWQgYXQgbGVhc3Qgc2luY2UKID4gY29tbWl0IGEzODJhN2Q1NTQz
MjkxOGQyYTFlNDdhZTRjYmU3ZWQ1MGZhMTdhMDg6CgogPiBJbiBmdW5jdGlvbiDigJhkZXN0cm95
X2NtZF93ceKAmSwKID4gICAgIGlubGluZWQgZnJvbSDigJhlc3BfY29tbWFuZHNfdGVhcmRvd27i
gJkgYXQgL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS00L291dHB1dC0xL2J1aWxk
L2VzcC1ob3N0ZWQtY2UzYzUwYTMzZmE0YmM1NjJhMWI2Y2JjZWUyOTJjMWFlMGIwYTQwNC9lc3Bf
aG9zdGVkX25nL2hvc3QvZXNwX2NtZC5jOjE0Njc6MjoKID4gLi9pbmNsdWRlL2xpbnV4L3dvcmtx
dWV1ZS5oOjYzOTo5OiBlcnJvcjogY2FsbCB0byDigJhfX3dhcm5fZmx1c2hpbmdfc3lzdGVtd2lk
ZV93ceKAmSBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSB3YXJuaW5nOiBQbGVhc2UgYXZvaWQgZmx1
c2hpbmcgc3lzdGVtLXdpZGUgd29ya3F1ZXVlcy4gWy1XZXJyb3I9YXR0cmlidXRlLXdhcm5pbmdd
CiA+ICAgNjM5IHwgICAgICAgICBfX3dhcm5fZmx1c2hpbmdfc3lzdGVtd2lkZV93cSgpOyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogPiAvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3Rh
bmNlLTQvb3V0cHV0LTEvYnVpbGQvZXNwLWhvc3RlZC1jZTNjNTBhMzNmYTRiYzU2MmExYjZjYmNl
ZTI5MmMxYWUwYjBhNDA0L2VzcF9ob3N0ZWRfbmcvaG9zdC9lc3BfY21kLmM6NDA4OjE3OgogPiBu
b3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYZmx1c2hfc2NoZWR1bGVkX3dvcmvigJkKID4g
ICA0MDggfCAgICAgICAgICAgICAgICAgZmx1c2hfc2NoZWR1bGVkX3dvcmsoKTsKID4gICAgICAg
fCAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4KCiA+IEZpeGVzOgogPiAgLSBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy82YWM3YTQ2MDE5MzhkMzI5NmVk
MTY1N2MwNmY4Y2RmNDMzNzU3ZDczCiA+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9y
Zy9yZXN1bHRzLzc5OTdjYzhhNjc2NDVhNmUxY2Y0ZTI0ZDE3MmM2ZmVhZTQ1OWRjZmIKCiA+IFNp
Z25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29t
PgogPiAtLS0KID4gIHBhY2thZ2UvZXNwLWhvc3RlZC9lc3AtaG9zdGVkLm1rIHwgMSArCiA+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Vz
cC1ob3N0ZWQvZXNwLWhvc3RlZC5tayBiL3BhY2thZ2UvZXNwLWhvc3RlZC9lc3AtaG9zdGVkLm1r
CiA+IGluZGV4IGNjNjFlMzliMzYuLjAyZGUzZGJjNTIgMTAwNjQ0CiA+IC0tLSBhL3BhY2thZ2Uv
ZXNwLWhvc3RlZC9lc3AtaG9zdGVkLm1rCiA+ICsrKyBiL3BhY2thZ2UvZXNwLWhvc3RlZC9lc3At
aG9zdGVkLm1rCiA+IEBAIC0xMiw2ICsxMiw3IEBAIEVTUF9IT1NURURfTElDRU5TRV9GSUxFID0g
TElDRU5TRQogPiAgRVNQX0hPU1RFRF9NT0RVTEVfU1VCRElSUyA9IGVzcF9ob3N0ZWRfbmcvaG9z
dAogCiA+ICBkZWZpbmUgRVNQX0hPU1RFRF9MSU5VWF9DT05GSUdfRklYVVBTCiA+ICsJJChjYWxs
IEtDT05GSUdfRElTQUJMRV9PUFQsQ09ORklHX1dFUlJPUikKCkkgd29uZGVyIGlmIHdlIHNob3Vs
ZG4ndCB1bmNvbmRpdGlvbmFsbHkgZGlzYWJsZSBDT05GSUdfV0VSUk9SIGluCmxpbnV4Lm1rLCBz
aW1pbGFyIHRvIGhvdyB3ZSBkbyBmb3IgYSBudW1iZXIgb2Ygb3RoZXIgcGFja2FnZXMgLSBUaGUK
TGludXggYnVpbGQgY291bGQgZmFpbCB3aXRoIHdhcm5pbmdzIGlmIGEgdG9vIG9sZC9uZXcgdG9v
bGNoYWluIGlzIHVzZWQuCgpJIGRvdWJ0IGEgbG90IG9mIHJlYWwgZGVmY29uZmlncyB3YW50IHRv
IHVzZSBDT05GSUdfV0VSUk9SLCB0aGUgcHJvYmxlbQppcyBtb3N0IGxpa2VseSBvbmx5IGZvciB0
aGUgYXJjaCBkZWZjb25maWdzOgoKZ2l0IGdyZXAgQ09ORklHX1dFUlJPUj15CmFyY2gveDg2L2Nv
bmZpZ3MvaTM4Nl9kZWZjb25maWc6Q09ORklHX1dFUlJPUj15CmFyY2gveDg2L2NvbmZpZ3MveDg2
XzY0X2RlZmNvbmZpZzpDT05GSUdfV0VSUk9SPXkKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
