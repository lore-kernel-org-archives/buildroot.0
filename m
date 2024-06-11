Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F53C27C5E
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 14:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C33F40734;
	Tue, 11 Jun 2024 14:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tk2ej33qeqI4; Tue, 11 Jun 2024 14:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B4494028D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B4494028D;
	Tue, 11 Jun 2024 14:15:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 109761BF38D
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 14:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F22658110F
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 14:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzI8ZNyym2P8 for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 14:14:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47566810EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47566810EB
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47566810EB
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 14:14:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.76]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrQEx-1snuig37B9-00bjam; Tue, 11
 Jun 2024 16:14:53 +0200
Message-ID: <f6c57396-5a0b-4026-b61f-262a8b63475c@gmx.de>
Date: Tue, 11 Jun 2024 16:14:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
References: <20240419213216.518041-1-angelo.compagnucci@gmail.com>
 <20240419213216.518041-2-angelo.compagnucci@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240419213216.518041-2-angelo.compagnucci@gmail.com>
X-Provags-ID: V03:K1:l9wXt9f+azRx4fSHmDwbQnqnorgfsgx3tgcP9QjE/w7JK/t5+XP
 xu77UPy7qgSByf7+SN2qxsXArgP8+3QO+sszwSzxEEYTK/UuuImBaJ8l6W4G/oiFnbY0Ftv
 yxed2o09upWCeKWqnglBBAAxR4eOoZZj8rDMYKR3ZV8dZbJqmG7J7w10FP/23aeklNMgbrR
 +l7JJWAf/8F5JVRmpvXow==
UI-OutboundReport: notjunk:1;M01:P0:LabQuZ5Y/WQ=;oQYoDho+dXEdCLir1KgGtDQJquc
 Dpd2BHVXJuT1GMyW+iaXzrJ6h1DX4WKsqzuXAI9IuqUHFoOvlZRanroZFbWPYMyLX25xuIl8i
 wxTGh1usRcWNGYbvRfykigb64b3E2FRXzBW2XdT+y+yIY91dJAmOMSMOrdrwojlfOPhLDZzDO
 U5Hw9lsjcXZZoCdKJTTI2Bk9c5Hiv2/D271Pw8ksZAb3bAG0grKwK0Lon5F8hrtj4HZ6NqmhP
 TuDj7PjNfIVLnVF5syUDA4wczkI2Bjc3y+Rioj3vNlMksYppt8MU+npRZB7O5eOx2wXomQn/q
 maIzYm+mb5YLS3688cLclTKqW8sNVM1j5GP4hdtNwU8tY3rPNcXQlu4+6O9b772Tj2FXxYRhh
 C/iquIv3NJR3/YQC9Hv314MB9qxBKKy2y4osOIdM9vJTbn0I1WBDF+fQbqbm3eno30cLzpOGo
 OTABJf+weY56jVo/YwpYv9/PNkdACvkihkMaLWJkiewCrQHaC79pSviwP/y9Zg/lvIJ9zejmp
 TjLX6QqWsUH+HsqDTFLQf66mW7XJl06gK/2mU0igXqMIC+PnhTj+6QwazgtbHkV4p7W5UFGw7
 LGnmzDT7sSqrWs8XhynPU+FmzSmXvpyaVceIAHQwrSuWqhNW6hScdNJ66ehraWWqVUqPsGksw
 mgtlV9uNMBOJIX6pQIbmky1pm63Kskfnt7msCcBSfMLB+J0eSo1Ugto8/8Go0XGMbVBsJws5D
 MnS+4hT+3VxwYwEDu7aJmtxEiEflgtaGn2b7PW5kRHQsroKoNJsBYhHop6/tzwxWnz9VuOLh+
 968G0RMHp+rrdHMSgkEBfcTUdPr36EeIKHMG+U5NcOds0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1718115294; x=1718720094; i=fiona.klute@gmx.de;
 bh=BHKMCEKn42oXxunhZRtyVuqXrXgBdOW1ZA2EG2rbdcg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZSW9txYRwkTTXfyyW1YTCEO7fkacSWohduyiFMp9Ku9rcrIjxPc9UU5caeJ8/ACl
 HCeLNUnXpMhf/leiZyXUyl2FeYrfjMWFgZC9QlKCwMaf1Dst7hfDHAuyqJxxVKCNV
 vVg+nxJIzN3dHSFoEjp+1k3PnmRnT0NxMa5yBXUK3+fPo2G4G6yWkEJxLnwTBPlw2
 2q4ou7ajqZcwlHPIoZlfJd6CIe4KVp4ymR5TB6R+/L1VnmZfkgWAX5LRKRY8xB1xK
 Lt5G6/CLfEWEjjL46eo3EcpP7E+h/0JMU6u1ah0vX8Ndu7qEVyUxuRUoVbdBbD7bA
 V7s56Soxq2yPLd85JQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ZSW9txYR
Subject: Re: [Buildroot] [PATCH 1/2] package/fail2ban: fix data_files
 installation path
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMTkuMDQuMjQgdW0gMjM6MzIgc2NocmllYiBBbmdlbG8gQ29tcGFnbnVjY2k6Cj4gV2hlbiBw
YWNrYWdpbmcgZGF0YV9maWxlcyBpbiBhIHdoZWVsLCB0aG9zZSBmaWxlcyBzaGFsbCBoYXZlIHRo
ZSBkZXN0aW5hdGlvbgo+IHBhdGggZXhwcmVzc2VkIGFzIHJlbGF0aXZlIHRvIHRoZSB3aGVlbCBp
bnN0YWxsYXRpb24uCj4gVGhlIHJlYXNvbiBmb3IgdGhhdCBpcyB0aGUgd2hlZWwgaW5zdGFsbGF0
aW9uIHNoYWxsIGJlIGNvbnRhaW5lZCBpbnNpZGUgYQo+IHNwZWNpZmljIGZvbGRlciBhbmQvb3Ig
aW4gc2l0ZS1wYWNrYWdlcy4KPiBXaGVuIGJ1aWxkaW5nIHRoZSB3aGVlbCBmaWxlIGJ5IHRoZSBi
ZGlzdF93aGVlbCBjb21tYW5kLCBweXRob24gd2lsbCBwYWNrYWdlCj4gZmlsZXMgd2l0aCBhYnNv
bHV0ZSBwYXRzIGFzIHB5dGhvbiBmaWxlcyBlbmRpbmcgdXAgaW5zdGFsbGluZyB0aGVtIGluCj4g
c2l0ZS1wYWNrYWdlcy4KPgo+IEZpeGVzOgo+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5l
dC9yZXN1bHRzLzM2YWM1Mjc4ZDE5MTk1YTIxYzNkMDJkMDg3OTY1ZTA4ZjQ5MjI4ZWYKPgo+IFNp
Z25lZC1vZmYtYnk6IEFuZ2VsbyBDb21wYWdudWNjaSA8YW5nZWxvLmNvbXBhZ251Y2NpQGdtYWls
LmNvbT4KClRlc3RlZC1ieTogRmlvbmEgS2x1dGUgPGZpb25hLmtsdXRlK3dpd2FAZ214LmRlPgoK
VGVzdGluZyBpbmNsdWRlZDogQnVpbGQgZm9yIGFhcmNoNjQsIGNvbmZpZ3VyaW5nIGZhaWwyYmFu
IGZvciBzc2hkLAp0ZXN0aW5nIHRoYXQgYSBob3N0IGluZGVlZCBnZXRzIGJhbm5lZCBhZnRlciBy
ZXBlYXRlZCBmYWlsZWQgbG9naW4KYXR0ZW1wdHMgKHBhc3N3b3JkIGF1dGgpLCB3aXRoIHN5c2xv
Zy1uZyAodGhlIGRlZmF1bHQgZmFpbDJiYW4gcGF0dGVybnMKZG9uJ3Qgd29yayB3aXRoIEJ1c3li
b3ggc3lzbG9nZCkgYW5kIG5mdGFibGVzLgoKVGhhbmtzIGZvciBmaXhpbmcgdGhlIGJ1aWxkLCBB
bmdlbG8hCgpCZXN0IHJlZ2FyZHMsCkZpb25hCgo+IC0tLQo+ICAgLi4uMDAxLXNldHVwLnB5LWZp
eC1kYXRhLXJlbGF0aXZlLXBhdGhzLnBhdGNoIHwgNzMgKysrKysrKysrKysrKysrKysrKwo+ICAg
MSBmaWxlIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL2ZhaWwyYmFuLzAwMDEtc2V0dXAucHktZml4LWRhdGEtcmVsYXRpdmUtcGF0aHMucGF0
Y2gKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2ZhaWwyYmFuLzAwMDEtc2V0dXAucHktZml4LWRh
dGEtcmVsYXRpdmUtcGF0aHMucGF0Y2ggYi9wYWNrYWdlL2ZhaWwyYmFuLzAwMDEtc2V0dXAucHkt
Zml4LWRhdGEtcmVsYXRpdmUtcGF0aHMucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAuLmUxYjViYzQ5MGIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2Fn
ZS9mYWlsMmJhbi8wMDAxLXNldHVwLnB5LWZpeC1kYXRhLXJlbGF0aXZlLXBhdGhzLnBhdGNoCj4g
QEAgLTAsMCArMSw3MyBAQAo+ICtGcm9tIDdiN2ZhM2MwMmQ0NTc1YzA5MzYyMzM2YmMzMTA4MzVj
Mzc4NTlmMWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IEFuZ2VsbyBDb21wYWdu
dWNjaSA8YW5nZWxvLmNvbXBhZ251Y2NpQGdtYWlsLmNvbT4KPiArRGF0ZTogRnJpLCAxOSBBcHIg
MjAyNCAyMjo0NzoyMCArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIHNldHVwLnB5OiBmaXggZGF0
YSByZWxhdGl2ZSBwYXRocwo+ICtNSU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRl
eHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJp
dAo+ICsKPiArQXMgcGVyIGRpc3R1dGlscyBkb2N1bWVudGF0aW9uOgo+ICsKPiArVGhlIGRpcmVj
dG9yeSBzaG91bGQgYmUgYSByZWxhdGl2ZSBwYXRoLiBJdCBpcyBpbnRlcnByZXRlZCByZWxhdGl2
ZSB0byB0aGUKPiAraW5zdGFsbGF0aW9uIHByZWZpeCAoUHl0aG9u4oCZcyBzeXMucHJlZml4IGZv
ciBzeXN0ZW0gaW5zdGFsbGF0aW9uczsKPiArc2l0ZS5VU0VSX0JBU0UgZm9yIHVzZXIgaW5zdGFs
bGF0aW9ucykuIERpc3R1dGlscyBhbGxvd3MgZGlyZWN0b3J5IHRvIGJlIGFuCj4gK2Fic29sdXRl
IGluc3RhbGxhdGlvbiBwYXRoLCBidXQgdGhpcyBpcyBkaXNjb3VyYWdlZCBzaW5jZSBpdCBpcyBp
bmNvbXBhdGlibGUKPiArd2l0aCB0aGUgd2hlZWwgcGFja2FnaW5nIGZvcm1hdCBbMV0uCj4gKwo+
ICtXaGVuIHBhY2thZ2luZyB0byBhIGJkaXN0X3doZWVsIGluZGVlZCwgdGhlIGZpbGVzIGluIHRo
ZSAiZGF0YV9maWxlcyIgZGljdGlvbmFyeQo+ICthcmUgbm90IHBpY2tlZCBhdCBhbGwgYXMgZGF0
YSBmaWxlcyBpZiB0aGV5IGhhdmUgYW4gYWJzb2x1dGUgcGF0aCwKPiArYnV0IHRoZXkgYXJlIGlu
c3RlYWQgYWRkZWQgdG8gdGhlIHdoZWVsIGFzIHB5dGhvbiBmaWxlcy4KPiArVGhpcyBoYXMgdGhl
IGVmZmVjdCBvZiBpbnN0YWxsaW5nIHRoZW0gYXMgcGFydCBvZiBweXRob24gZmlsZXMgaW4gdGhl
Cj4gK3NpdGUtcGFja2FnZXMgZm9sZGVyIHdoZW4gdGhlIHdoZWVsIGlzIGluc3RhbGxlZC4KPiAr
Cj4gK1RoaXMgcGF0Y2ggY2Fubm90IGJlIHNlbnQgdXBzdHJlYW0gYmVjYXVzZSBpdCBicmVha3Mg
dGhlIGxlZ2FjeSB3YXkgb2YKPiAraW5zdGFsbGluZyB0aGUgcGFja2FnZSB3aXRoICpweXRob24g
c2V0dXAucHkgaW5zdGFsbCogYW5kIGl0IGlzIG5lZWRlZCBvbmx5IHRvCj4gK2NvbXBseSB3aXRo
IHRoZSBwZXA1MTcgYnVpbGRyb290IGNvbXBhdGliaWxpdHkgbGF5ZXIuCj4gKwo+ICtbMV0gaHR0
cHM6Ly9kb2NzLnB5dGhvbi5vcmcvMy4xMC9kaXN0dXRpbHMvc2V0dXBzY3JpcHQuaHRtbCNpbnN0
YWxsaW5nLWFkZGl0aW9uYWwtZmlsZXMKPiArU2lnbmVkLW9mZi1ieTogQW5nZWxvIENvbXBhZ251
Y2NpIDxhbmdlbG8uY29tcGFnbnVjY2lAZ21haWwuY29tPgo+ICstLS0KPiArIHNldHVwLnB5IHwg
MTQgKysrKysrKy0tLS0tLS0KPiArIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvc2V0dXAucHkgYi9zZXR1cC5weQo+ICtp
bmRleCA5MWY3MWNmMi4uOTliYTJlMzIgMTAwNzU1Cj4gKy0tLSBhL3NldHVwLnB5Cj4gKysrKyBi
L3NldHVwLnB5Cj4gK0BAIC0yMzgsMjYgKzIzOCwyNiBAQCBzZXR1cCgKPiArIAkJCQlmb3IgZiBp
biB3WzJdXQo+ICsgCX0gaWYgd2l0aF90ZXN0cyBlbHNlIHt9LAo+ICsgCWRhdGFfZmlsZXMgPSBb
Cj4gKy0JCSgnL2V0Yy9mYWlsMmJhbicsCj4gKysJCSgnZXRjL2ZhaWwyYmFuJywKPiArIAkJCWds
b2IoImNvbmZpZy8qLmNvbmYiKQo+ICsgCQkpLAo+ICstCQkoJy9ldGMvZmFpbDJiYW4vZmlsdGVy
LmQnLAo+ICsrCQkoJ2V0Yy9mYWlsMmJhbi9maWx0ZXIuZCcsCj4gKyAJCQlnbG9iKCJjb25maWcv
ZmlsdGVyLmQvKi5jb25mIikKPiArIAkJKSwKPiArLQkJKCcvZXRjL2ZhaWwyYmFuL2ZpbHRlci5k
L2lnbm9yZWNvbW1hbmRzJywKPiArKwkJKCdldGMvZmFpbDJiYW4vZmlsdGVyLmQvaWdub3JlY29t
bWFuZHMnLAo+ICsgCQkJW3AgZm9yIHAgaW4gZ2xvYigiY29uZmlnL2ZpbHRlci5kL2lnbm9yZWNv
bW1hbmRzLyoiKSBpZiBpc2ZpbGUocCldCj4gKyAJCSksCj4gKy0JCSgnL2V0Yy9mYWlsMmJhbi9h
Y3Rpb24uZCcsCj4gKysJCSgnZXRjL2ZhaWwyYmFuL2FjdGlvbi5kJywKPiArIAkJCWdsb2IoImNv
bmZpZy9hY3Rpb24uZC8qLmNvbmYiKSArCj4gKyAJCQlnbG9iKCJjb25maWcvYWN0aW9uLmQvKi5w
eSIpCj4gKyAJCSksCj4gKy0JCSgnL2V0Yy9mYWlsMmJhbi9mYWlsMmJhbi5kJywKPiArKwkJKCdl
dGMvZmFpbDJiYW4vZmFpbDJiYW4uZCcsCj4gKyAJCQknJwo+ICsgCQkpLAo+ICstCQkoJy9ldGMv
ZmFpbDJiYW4vamFpbC5kJywKPiArKwkJKCdldGMvZmFpbDJiYW4vamFpbC5kJywKPiArIAkJCScn
Cj4gKyAJCSksCj4gKy0JCSgnL3Zhci9saWIvZmFpbDJiYW4nLAo+ICsrCQkoJ3Zhci9saWIvZmFp
bDJiYW4nLAo+ICsgCQkJJycKPiArIAkJKSwKPiArIAldICsgZGF0YV9maWxlc19leHRyYSwKPiAr
LS0KPiArMi4zNC4xCj4gKwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
