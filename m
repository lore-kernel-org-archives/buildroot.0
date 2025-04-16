Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D42DC369C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6782D6F67E;
	Wed, 16 Apr 2025 20:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WlAylZsslgAI; Wed, 16 Apr 2025 20:54:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8992D61AD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8992D61AD9;
	Wed, 16 Apr 2025 20:54:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53F8A920
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4500A80DB9
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGDk-0AcXckT for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:54:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B8798136D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B8798136D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B8798136D
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:54:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D7C2F1C00C0; Wed, 16 Apr 2025 22:54:09 +0200 (CEST)
Message-ID: <0ba78584-7afd-4e6a-8953-a908986c33ef@rnout.be>
Date: Wed, 16 Apr 2025 22:54:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>, Alistair Francis
 <alistair@alistair23.me>, Anand Gadiyar <gadiyar@ti.com>,
 Bryan Brattlof <bb@ti.com>, Dick Olsson <hi@senzilla.io>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Lee Jones <lee.jones@linaro.org>, Sergey Matyukevich <geomatsi@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, Xuanhao Shi <X15000177@gmail.com>
References: <20250317-bootloaders-menuconfig-v1-0-8f893d3bcf5f@bootlin.com>
 <20250317-bootloaders-menuconfig-v1-1-8f893d3bcf5f@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20250317-bootloaders-menuconfig-v1-1-8f893d3bcf5f@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744836850; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EoEADyT1vifWso4bYqXSQAvGKfXRbDlgB0JbIHizPik=;
 b=dGvkokDXU/ZOTMtQg7I2l9FTXFPD5JICRYGbLTYiV2ofx/wgASdpavlNv7BSy17d2Y4Cr5
 Z23tEhb96HJPT17JqKNQWk513IPOOSlk8Cjrus7HMKK0dWJE1RsBScvNcJKYeyvXY1iGXy
 P5aZVa3g983ZdcLOrDojlgL4Sg2A5hU4THjkivS2yVyYetXbIIZ9c9TQb4AIwSaBl6LwP6
 cJioEY5UCjKqLNOANLN8p9gD6ThromrutkLMKhjARvbwGYOkImUGK8I9oPmF7zn3CLbllm
 skWRhcvxNcpRpamr9qeK8FD349c84AB29LSRzRwDRuDDLi3KadcDeHXWIC7AYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/2] boot/xilinx-embeddedsw: fix menuconfig
 visualization
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

Ck9uIDE3LzAzLzIwMjUgMTg6NDAsIEx1Y2EgQ2VyZXNvbGkgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBEdWUgdG8gaG93IG1lbnVjb25maWcgd29ya3MsIGEgJ2NvbW1lbnQnIGVudHJ5IGZvbGxvd2lu
ZyBhICdjb25maWcnIGVudHJ5Cj4gcHJldmVudHMgY29ycmVjdCBpbmRlbnRhdGlvbiBvZiBpdGVt
cyBkZXBlbmRpbmcgb24gdGhlICdjb25maWcnCj4gZW50cnkuIHhpbGlueC1lbWJlZGRlZHN3IGN1
cnJlbnRseSBzaG93cyBhczoKPgo+ICAgIFsqXSB4aWxpbngtZW1iZWRkZWRzdwo+ICAgICAgICAq
KiogeGlsaW54LWVtYmVkZGVkc3cgbmVlZHMgYSBiYXJlIG1ldGFsIHRvb2xjaGFpbiBmb3IgdHVw
bGUgbWljcm9ibGF6ZWVsLXhpbGlueC1lbGYgKioqCj4gICAgKHhpbGlueF92MjAyNC4yKSB4aWxp
bngtZW1iZWRkZWRzdyB2ZXJzaW9uIChORVcpCj4gICAgWyBdIHZlcnNhbCBwbG0gKE5FVykKPiAg
ICBbIF0gdmVyc2FsIHBzbWZ3IChORVcpCj4gICAgWyBdIHp5bnFtcCBwbXVmdyAoTkVXKQo+ICAg
IFsgXSB4aWxpbngtcHJlYnVpbHQKPgo+IFNvIHRoZSAndmVyc2FsIConIGFuZCAnenlucW1wIHBt
dWZ3JyBpdGVtcyBhcmUgbm90IGluZGVudGVkIGV2ZW4gdGhvdWdoCj4gdGhleSBzaG91bGQgYmUu
Cj4KPiBEbyBsaWtlIG1vc3Qgb3RoZXIgQ29uZmlnLmluIGZpbGVzIHdoaWNoIGhhdmUgdGhlICdj
b21tZW50JyBiZWZvcmUgdGhlCj4gJ2NvbmZpZycgZW50cnksIG1ha2VpbmcgaXQgcmVuZGVyIGFz
IGV4cGVjdGVkOgo+Cj4gICAgICAgICoqKiB4aWxpbngtZW1iZWRkZWRzdyBuZWVkcyBhIGJhcmUg
bWV0YWwgdG9vbGNoYWluIGZvciB0dXBsZSBtaWNyb2JsYXplZWwteGlsaW54LWVsZiAqKioKPiAg
ICBbKl0geGlsaW54LWVtYmVkZGVkc3cKPiAgICAoeGlsaW54X3YyMDI0LjIpIHhpbGlueC1lbWJl
ZGRlZHN3IHZlcnNpb24gKE5FVykKPiAgICBbIF0gICB2ZXJzYWwgcGxtIChORVcpCj4gICAgWyBd
ICAgdmVyc2FsIHBzbWZ3IChORVcpCj4gICAgWyBdICAgenlucW1wIHBtdWZ3IChORVcpCj4gICAg
WyBdIHhpbGlueC1wcmVidWlsdAo+Cj4gU2lnbmVkLW9mZi1ieTogTHVjYSBDZXJlc29saSA8bHVj
YS5jZXJlc29saUBib290bGluLmNvbT4KCiDCoEFwcGxpZWQgdG8gMjAyNS4wMi54LCB0aGFua3Mu
CgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCj4gLS0tCj4gICBib290L3hpbGlueC1lbWJlZGRlZHN3
L0NvbmZpZy5pbiB8IDYgKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Jvb3QveGlsaW54LWVtYmVkZGVkc3cv
Q29uZmlnLmluIGIvYm9vdC94aWxpbngtZW1iZWRkZWRzdy9Db25maWcuaW4KPiBpbmRleCBiMDY5
MWQ3ZTdiNzUzYmJhMjQ4MjBhOWVjNzYyYzQwMzIxMzE1MGQ1Li4wMDdiMjRlNjY4NWI2M2MxNWFl
ZDQxN2UzOTZlMzMyMGZlN2JmYjI4IDEwMDY0NAo+IC0tLSBhL2Jvb3QveGlsaW54LWVtYmVkZGVk
c3cvQ29uZmlnLmluCj4gKysrIGIvYm9vdC94aWxpbngtZW1iZWRkZWRzdy9Db25maWcuaW4KPiBA
QCAtMSwzICsxLDYgQEAKPiArY29tbWVudCAieGlsaW54LWVtYmVkZGVkc3cgbmVlZHMgYSBiYXJl
IG1ldGFsIHRvb2xjaGFpbiBmb3IgdHVwbGUgbWljcm9ibGF6ZWVsLXhpbGlueC1lbGYiCj4gKwlk
ZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJPT1RfQVJDSCAhPSAibWlj
cm9ibGF6ZWVsLXhpbGlueC1lbGYiCj4gKwo+ICAgY29uZmlnIEJSMl9UQVJHRVRfWElMSU5YX0VN
QkVEREVEU1cKPiAgIAlib29sICJ4aWxpbngtZW1iZWRkZWRzdyIKPiAgIAlkZXBlbmRzIG9uIEJS
Ml9hYXJjaDY0Cj4gQEAgLTE0LDkgKzE3LDYgQEAgY29uZmlnIEJSMl9UQVJHRVRfWElMSU5YX0VN
QkVEREVEU1cKPiAgIAkgIEFwcGxpY2F0aW9ucyBjYW4gYmUgZm91bmQgb24gdGhlIFhpbGlueCBl
bWJlZGRlZHN3IHJlcG86Cj4gICAJICBodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2VtYmVkZGVk
c3cvdHJlZS9tYXN0ZXIvbGliL3N3X2FwcHMKPiAgIAo+IC1jb21tZW50ICJ4aWxpbngtZW1iZWRk
ZWRzdyBuZWVkcyBhIGJhcmUgbWV0YWwgdG9vbGNoYWluIGZvciB0dXBsZSBtaWNyb2JsYXplZWwt
eGlsaW54LWVsZiIKPiAtCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxE
Uk9PVF9BUkNIICE9ICJtaWNyb2JsYXplZWwteGlsaW54LWVsZiIKPiAtCj4gICBpZiBCUjJfVEFS
R0VUX1hJTElOWF9FTUJFRERFRFNXCj4gICAKPiAgIGNvbmZpZyBCUjJfVEFSR0VUX1hJTElOWF9F
TUJFRERFRFNXX1ZFUlNJT04KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
