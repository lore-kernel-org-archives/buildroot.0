Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2180EE8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7E744079B;
	Mon, 29 Dec 2025 09:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erXyXKSIwqQx; Mon, 29 Dec 2025 09:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6EAA4079D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767000864;
	bh=VuOQ16YJtE0DltEUzIc/YbZrueOORYiPkGrxz72C0yY=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DsiHxKCfBd0FpzKD/fX/q6AbAMQagnTnr11ilgdjtXwlpSi59FYOe5E/xrOsXjS/m
	 sI5LaXjIdDtsGoFvOTc2l/IfoucaKvYSDf4O788u0436rLZzTaWh4pAJRHz2xVAKOf
	 GdzCxMRtKs9k/sMQPYlUarHz1EbXcdvIgDK9tDa7AUNGbTOeGgsoGU2PR0HWwL/ukc
	 nds2spIZjlOkqw3cr3E5V1R1TYyDLQIvR5BHiWvYhzBGxrDAh+P8ntJPU6Oyc02RHa
	 w3ujrQLYjPYxUCgvk+uJPQhiZgp0FajKSXPFuEI4bB+L75G0sugDzLTTap3fQkp8OU
	 NaFqj7V2C/8eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6EAA4079D;
	Mon, 29 Dec 2025 09:34:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A0FF1E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C4A481773
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xfHp1gAkwnd for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:34:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.41;
 helo=smtpcmd0641.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE67A81780
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE67A81780
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE67A81780
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:34:19 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id a9dovokjPdarQa9dov14vu; Mon, 29 Dec 2025 10:34:16 +0100
Message-ID: <64832874-8fc4-46ce-a4cc-86a2f555ac09@benettiengineering.com>
Date: Mon, 29 Dec 2025 10:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Edgar Bonet <bonet@grenoble.cnrs.fr>
References: <20251227194400.1108440-1-giulio.benetti@benettiengineering.com>
 <500fe026dc7e732e4c924ff46526fe70@free.fr>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <500fe026dc7e732e4c924ff46526fe70@free.fr>
X-CMAE-Envelope: MS4xfFlITQjLMaP6QYaq8y0PRqTtP8F0SZ89KUV9gNF4lLOfSOuJDIq/T6JKWKGwLCjyvUTw6dh3Vx2nzs3yJJFDtoaHmt5DbZ6m+FQDPlZygyKI07ZWAPq6
 6BujrNN3dPofR1NtW1Cl9FH31pY2UjHH9Y0D3Wt9voy6T4t5DflF19zZv8N1Rj7+U2fAIKjimbADIht3+fQ3HHJk7+QHrAXBQG19ECzPTN/jqzJM8n4jr0xj
 x+MNTr/9iJfLkhFfBhVGA7yJX1CUYTQZWEkGTCqDsWU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767000856; bh=sAUD4E53UmgIlcBv8xAF8zWOAo5dHp4fcCOVSHhSDWI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=EUgPmbHoGRSVIzyIOYnXCqrfrn6CcGeJGHT8Umr4LzuWS6a23PgeJarVzEZNmZchP
 IiJMsR3O7Mq3Q1Orhv4pyixbwMqQLBYkSz2aEY272VHL+S8M425hjKCq7Jcq+DJbvA
 ZR1LoeCQXGKyyiA2nWW7plmkwexkU/mzjV+oXOgR4llDt6RsXAOF3y/NdjHcEm9HKD
 8Fum0GqRCtpUGsSF1Zk7h7RClilFuo/sBipN3BfydC1hNzPICNIqX2Vth/wxu+87AZ
 UFyboEznnezEfvLWSG/fDlxkNMEAgEkSsMbmMKMKWjTCToxE5gfDdTbSg80xMVnSDs
 jPGG2HxTEGmFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=EUgPmbHo
Subject: Re: [Buildroot] [PATCH v2] package/dash: fix build failure due to
 wchar
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKT24gMjkvMTIvMjAyNSAwMDoyNSwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4g
SGkgR2l1bGlvLAo+IAo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZWQgcGF0Y2guCj4gCj4gT24gMjcv
MTIvMjAyNSAyMDo0NCwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IFNpbmNlIGNvbW1pdCBbMV0g
cGFja2FnZSBkYXNoIHJlcXVpcmVzIHdjaGFyIHNvIGxldCdzIGRlcGVuZCBvbiBpdCB0bwo+PiBm
aXggYnVpbGQgZmFpbHVyZS4KPj4KPj4gWzFdOgo+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vdXRpbHMvZGFzaC9kYXNoLmdpdC9jb21taXQvPyAKPj4gaWQ9YzA2NzRmNDg3YzdhZWMy
YTNiZGY2Nzk1Y2VhN2U2MGM5NTMwYzM2MAo+Pgo+PiBGaXhlczoKPj4gaHR0cHM6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLyAKPj4gZTkxMDhlYmQ5ZmI4YzQ3MWFkZDFjNWE3ZjU4
MTc1NzE3NWZhNWYxNS8KPj4KPj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxp
by5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4+IC0tLQo+PiBWMS0+VjI6Cj4+ICog
Zml4ZWQgY29tbWl0IGxvZyBhbmQgQ29uZmlnLmluIGNvbW1lbnQgYXMgc3VnZ2VzdGVkIGJ5IEVk
Z2FyIEJvbmV0Cj4+IC0tLQo+PiDCoHBhY2thZ2UvZGFzaC9Db25maWcuaW4gfCA2ICsrKysrKwo+
PiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZGFzaC9Db25maWcuaW4gYi9wYWNrYWdlL2Rhc2gvQ29uZmlnLmluCj4+IGluZGV4IGI4
MTZhYzc4MzcuLjM1NzNhNDBhYTMgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvZGFzaC9Db25maWcu
aW4KPj4gKysrIGIvcGFja2FnZS9kYXNoL0NvbmZpZy5pbgo+PiBAQCAtMiw2ICsyLDcgQEAgY29u
ZmlnIEJSMl9QQUNLQUdFX0RBU0gKPj4gwqDCoMKgwqAgYm9vbCAiZGFzaCIKPj4gwqDCoMKgwqAg
ZGVwZW5kcyBvbiBCUjJfVVNFX01NVSAjIGZvcmsoKQo+PiDCoMKgwqDCoCBkZXBlbmRzIG9uIEJS
Ml9QQUNLQUdFX0JVU1lCT1hfU0hPV19PVEhFUlMKPj4gK8KgwqDCoCBkZXBlbmRzIG9uIEJSMl9V
U0VfV0NIQVIKPiAKPiBUaGUgZGFzaCBwYWNrYWdlIGlzIHNlbGVjdGVkIGhlcmU6Cj4gaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi8yMDI1LjExL3N5c3Rl
bS8gCj4gQ29uZmlnLmluI0w0MTcKPiBTbyB0aGlzIG5ldyBkZXBlbmRlbmN5IHNob3VsZCBhbHNv
IGJlIHByb3BhZ2F0ZWQgdGhlcmUuCgpqdXN0IHVwZGF0ZWQKCj4gVGhpcyBpbnRyb2R1Y2UgYSBu
ZXcgcHJvYmxlbToKPiBEYXNoIGlzIGN1cnJlbnRseSB0aGUgZGVmYXVsdCBzaGVsbCB3aGVuIEJ1
c3lib3ggaXMgbm90IHNlbGVjdGVkLgo+IFNlZToKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRy
b290Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjUuMTEvc3lzdGVtLyAKPiBDb25maWcuaW4jTDQw
MgoKSSBzZWUsCgo+IFRoaXMgY3JlYXRlcyBhIG5ldyBjb3JuZXIgY2FzZTogd2hpY2ggc2hlbGwg
c2hvdWxkIHdlIHNlbGVjdCBieSBkZWZhdWx0Cj4gd2hlbiBCdXN5Ym94IGlzIG5vdCBzZWxlY3Rl
ZCBhbmQgdGhlIHRvb2xjaGFpbiBkb2VzIG5vdCBzdXBwb3J0IHdjaGFyLgo+IAo+IFdlIGNvdWxk
LCBmb3IgZXhhbXBsZSwgc3dpdGNoIHRvIGFub3RoZXIgc2hlbGwgc3VwcG9ydGluZyB0aGF0IGNh
c2UKPiAoZS5nLiBCYXNoKSwgb3IgZm9yY2UgQnVzeWJveCBzaGVsbCBpbiB0aGF0IHNwZWNpZmlj
IGNhc2UuIEkgd291bGQKPiBiZSBoYXBweSB0byBoYXZlIHN1Z2dlc3Rpb25zIGZyb20gb3RoZXIg
bWFpbnRhaW5lcnMvdXNlcnMgb24gdGhhdAo+IHRvcGljLgoKSSdkIHBlcnNvbmFsbHkgZ28gd2l0
aCBCYXNoLiBJIGFkZCB0aGlzIGNoYW5nZSB0byB0aGUgdjMgcGF0Y2ggdG9vLgoKQmVzdCByZWdh
cmRzCkdpdWxpbwoKPiAKPj4gwqDCoMKgwqAgaGVscAo+PiDCoMKgwqDCoMKgwqAgREFTSCBpcyBh
IFBPU0lYLWNvbXBsaWFudCBpbXBsZW1lbnRhdGlvbiBvZiAvYmluL3NoIHRoYXQKPj4gwqDCoMKg
wqDCoMKgIGFpbXMgdG8gYmUgYXMgc21hbGwgYXMgcG9zc2libGUuIEl0IGRvZXMgdGhpcyB3aXRo
b3V0Cj4+IEBAIC0xMCwzICsxMSw4IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9EQVNICj4+IMKgwqDC
oMKgwqDCoCBmb3IgbW9zdCB0YXNrcy4KPj4KPj4gwqDCoMKgwqDCoMKgIGh0dHA6Ly9nb25kb3Iu
YXBhbmEub3JnLmF1L35oZXJiZXJ0L2Rhc2gKPj4gKwo+PiArY29tbWVudCAiZGFzaCBuZWVkcyBh
IHRvb2xjaGFpbiB3LyB3Y2hhciIKPj4gK8KgwqDCoCBkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCj4+
ICvCoMKgwqAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9CVVNZQk9YX1NIT1dfT1RIRVJTCj4+ICvC
oMKgwqAgZGVwZW5kcyBvbiAhQlIyX1VTRV9XQ0hBUgo+PiAtLSAKPj4gMi40Ny4zCj4gCj4gQmVz
dCByZWdhcmRzLAo+IAo+IEp1bGllbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
