Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26526CD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFA2A607C3;
	Tue,  3 Sep 2024 19:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdCYuDQZxSJV; Tue,  3 Sep 2024 19:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07D7F60773
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07D7F60773;
	Tue,  3 Sep 2024 19:51:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A7111BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1772840131
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9n28uqXrY_u for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:51:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C6BE40069
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C6BE40069
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C6BE40069
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:51:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 751D613F880;
 Tue,  3 Sep 2024 21:51:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Sep 2024 21:51:29 +0200
Date: Tue, 3 Sep 2024 21:51:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Message-ID: <ZtdowXG6bpz03MZ-@landeda>
References: <20240902192122.150821-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240902192122.150821-1-flavio.tapajos@newtesc.com.br>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725393094;
 bh=8yo9Cm1vV1NwFmAnNzOSWBOn/IqRLJjVQfv65g4XlXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RHmFpN1r2MQERIiZCGc4TyA23naDslOry+6oEoDwmX0TP7rePTbMbJ9LNLLnu1hC9
 DSF/9EObYzrMzcfih22xdct53rniLBH738gzYBblyy18n78lnT5vJg62GHq+tkb6Ze
 qj3f0FhURRwwFGU+JlgmTVbEFQmj/ZI/5zea4ZR6H8gVAMEREUVrbPi7GXTw5n7d3R
 F0nBX3+mBmjd60kXUDiyok/WYLyck0O6TPhO235YaF4eTtgYBVWYDZnD44AAFC/pVa
 MRfopt7NIRJespzQ5/YXkVhAzmFzZPpqf7J9mhvhQEOiSptZuXL1nUmmgqNV1a8eBg
 YWOmwgtdQFU1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RHmFpN1r
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: fix build
 issue with setuptools > 69.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmxhdmlvLCBBbGwsCgpPbiAyMDI0LTA5LTAyIDE2OjIxIC0wMzAwLCBGbMOhdmlvIFRhcGFqw7Nz
IHNwYWtlIHRodXNseToKPiBUaGlzIGNvbW1pdCBhZGRzIHVwc3RyZWFtIHBhdGNoIHRoYXQgdW5w
aW5zIHNldHVwdG9vbHM6Cj4gICBodHRwczovL2dlcnJpdC5zcWxhbGNoZW15Lm9yZy9jL3NxbGFs
Y2hlbXkvc3FsYWxjaGVteS8rLzU0NzgKPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9zcWxhbGNoZW15
L3NxbGFsY2hlbXkvZGlzY3Vzc2lvbnMvMTE4MTgKPiAKPiBGaXhlczoKPiAgIGh0dHA6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2M1MzFiNmU2M2M1MTIxMTM4ZThlOGExYzVkMTUw
MWQ5ZDdlMTM5MWUvCj4gCj4gU2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8Zmxhdmlv
LnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+CgpUaGFua3MgZm9yIHRoZSByZXNwaW4uIEhvd2V2ZXIs
IHVwc3RyZWFtIGhhcyByZWxlYXNlZCAyLjAuMzMgd2l0aCB0aGlzCmZpeCBpbmNsdWRlZC4gU2lu
Y2UgdGhlIGZpeCBhcHBsaWVzIHRvIDIwLjAuMzIgdGhhdCBpcyBvbmx5IGluIHRoZSBuZXh0CmJy
YW5jaCwgd2UgY291bGQgcHJvYmFibHkgYnVtcCBub3csIG5vPwoKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9weXRob24tc3FsYWxjaGVteS8yLjAuMzIvMDAwMS11bnBpbi1zZXR1cHRvb2xzLnBhdGNo
IGIvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS8yLjAuMzIvMDAwMS11bnBpbi1zZXR1cHRvb2xz
LnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi45MmRkMTgy
NmE3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvMi4w
LjMyLzAwMDEtdW5waW4tc2V0dXB0b29scy5wYXRjaAoKRG9uJ3QgY3JlYXRlIHRoZSBwYXRjaGVz
IGluIGEgdmVyc2lvbmVkIHN1Yi1kaXJlY3RvcnksIGFzIHRoZSBwYWNrYWdlCmRvZXMgbm90IGhh
dmUgYSB2ZXJzaW9uIGNob2ljZS4KCktlZXBpbmcgdGhlIHBhdGNoIGF0IHRoZSByb290IG9mIHRo
ZSBwYWNrYWdlIGRpciB3aWxsIGFsbG93IHRvIG5vdGljZQp3aGVuIHdlIGJ1bXAgYW5kIHRoZSBw
YXRjaCBubyBsb25nZXIgYXBwbGllcyAoY2xlYW5seSkuIE90aGVyd2lzZSwgd2UKY2FuIGVhc2ls
eSBtaXNzIHRoZSBwYXRjaCBhbmQgaXQgd291bGQgbG9uZ2VyIHVudXNlZC4KClJlZ2FyZHMsCllh
bm4gRS4gTU9SSU4uCgo+IEBAIC0wLDAgKzEsNzIgQEAKPiArRnJvbSBiZjMzY2I0ZmZhNWYwNThi
NGJiOWU1MGVmYWE0MzAzOGYzN2NjNmUxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9t
OiBNaWtlIEJheWVyIDxtaWtlX21wQHp6emNvbXB1dGluZy5jb20+Cj4gK0RhdGU6IE1vbiwgMiBT
ZXAgMjAyNCAwOToxMzoyNyAtMDQwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIHVucGluIHNldHVwdG9v
bHMKPiArTUlNRS1WZXJzaW9uOiAxLjAKPiArQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFy
c2V0PVVURi04Cj4gK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiArCj4gK1RoaXMg
cmVtb3ZlcyB0aGUgcGluIHRoYXQgd2FzIHBsYWNlZCBpbiAyNjA3MjYyMTEwYmRjNWM1ZGM5NmZj
MTlkZGNhODk1YTE1YTU4ZTRlCj4gKwo+ICtUaGUgcGluIGZvciBgYHNldHVwdG9vbHM8NjkuM2Bg
IGluIGBgcHlwcm9qZWN0LnRvbWxgYCBoYXMgYmVlbgo+ICtyZW1vdmVkLiAgVGhpcyBwaW4gd2Fz
IHRvIHByZXZlbnQgYSBzdWRkZW4gY2hhbmdlIHRvIDpwZXA6YDYyNWAgaW4KPiArc2V0dXB0b29s
cyBmcm9tIHRha2luZyBwbGFjZSB3aGljaCBjaGFuZ2VzIHRoZSBmaWxlIG5hbWUgb2YgU1FMQWxj
aGVteSdzCj4gK3NvdXJjZSBkaXN0cmlidXRpb24gb24gcHlwaSB0byBiZSBhbiBhbGwgbG93ZXIg
Y2FzZSBuYW1lLCB3aGljaCBpcyB2ZXJ5Cj4gK2xpa2VseSB0byBjYXVzZSBwcm9ibGVtcyB3aXRo
IHZhcmlvdXMgYnVpbGQgZW52aXJvbm1lbnRzIHRoYXQgZXhwZWN0ZWQgYQo+ICtwYXJ0aWN1bGFy
IG5hbWluZyBzdHlsZS4gIEhvd2V2ZXIsIHRoZSBwcmVzZW5jZSBvZiB0aGlzIHBpbiBpcyBub3cg
aG9sZGluZwo+ICtiYWNrIGVudmlyb25tZW50cyB0aGF0IG90aGVyd2lzZSB3YW50IHRvIHVzZSBh
IG5ld2VyIHNldHVwdG9vbHMsIHNvIHdlJ3ZlCj4gK2RlY2lkZWQgdG8gbW92ZSBmb3J3YXJkIHdp
dGggdGhpcyBjaGFuZ2UsIHdpdGggdGhlIGFzc3VtcHRpb24gdGhhdCBidWlsZAo+ICtlbnZpcm9u
bWVudHMgd2lsbCBoYXZlIGxhcmdlbHkgYWNjb21tb2RhdGVkIHRoZSBzZXR1cHRvb2xzIGNoYW5n
ZSBieQo+ICtub3cuCj4gKwo+ICtSZWZlcmVuY2VzOiAjMTE4MTgKPiArQ2hhbmdlLUlkOiBJMGNk
OWFiMDUxMjAwNDY2OWE4ZjBhYTBjYjdmNTYwZDg5YTJkYTJiZAo+ICsKPiArVXBzdHJlYW06IGh0
dHBzOi8vZ2Vycml0LnNxbGFsY2hlbXkub3JnL3BsdWdpbnMvZ2l0aWxlcy9zcWxhbGNoZW15L3Nx
bGFsY2hlbXkvKy9jZjgyYmU2MGY4MTFlZDZiZGMxYThjNDIyMTE0OGQ5N2RkNmI3MDRkCj4gK1Np
Z25lZC1vZmYtYnk6IEZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29t
LmJyPgo+ICstLS0KPiArIGRvYy9idWlsZC9jaGFuZ2Vsb2cvdW5yZWxlYXNlZF8yMC8xMTgxOC5y
c3QgfCAxNiArKysrKysrKysrKysrKysrCj4gKyBweXByb2plY3QudG9tbCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICsgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICsgY3JlYXRlIG1vZGUgMTAwNjQ0IGRvYy9idWlsZC9j
aGFuZ2Vsb2cvdW5yZWxlYXNlZF8yMC8xMTgxOC5yc3QKPiArCj4gK2RpZmYgLS1naXQgYS9kb2Mv
YnVpbGQvY2hhbmdlbG9nL3VucmVsZWFzZWRfMjAvMTE4MTgucnN0IGIvZG9jL2J1aWxkL2NoYW5n
ZWxvZy91bnJlbGVhc2VkXzIwLzExODE4LnJzdAo+ICtuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ICtp
bmRleCAwMDAwMDAwMDAuLmM3NWE2YzY0Ygo+ICstLS0gL2Rldi9udWxsCj4gKysrKyBiL2RvYy9i
dWlsZC9jaGFuZ2Vsb2cvdW5yZWxlYXNlZF8yMC8xMTgxOC5yc3QKPiArQEAgLTAsMCArMSwxNiBA
QAo+ICsrLi4gY2hhbmdlOjoKPiArKyAgICA6dGFnczogY2hhbmdlLCBnZW5lcmFsCj4gKysgICAg
OnRpY2tldHM6IDExODE4Cj4gKysKPiArKyAgICBUaGUgcGluIGZvciBgYHNldHVwdG9vbHM8Njku
M2BgIGluIGBgcHlwcm9qZWN0LnRvbWxgYCBoYXMgYmVlbgo+ICsrICAgIHJlbW92ZWQuICBUaGlz
IHBpbiB3YXMgdG8gcHJldmVudCBhIHN1ZGRlbiBjaGFuZ2UgdG8gOnBlcDpgNjI1YCBpbgo+ICsr
ICAgIHNldHVwdG9vbHMgZnJvbSB0YWtpbmcgcGxhY2Ugd2hpY2ggY2hhbmdlcyB0aGUgZmlsZSBu
YW1lIG9mIFNRTEFsY2hlbXkncwo+ICsrICAgIHNvdXJjZSBkaXN0cmlidXRpb24gb24gcHlwaSB0
byBiZSBhbiBhbGwgbG93ZXIgY2FzZSBuYW1lLCB3aGljaCBpcyB2ZXJ5Cj4gKysgICAgbGlrZWx5
IHRvIGNhdXNlIHByb2JsZW1zIHdpdGggdmFyaW91cyBidWlsZCBlbnZpcm9ubWVudHMgdGhhdCBl
eHBlY3RlZCBhCj4gKysgICAgcGFydGljdWxhciBuYW1pbmcgc3R5bGUuICBIb3dldmVyLCB0aGUg
cHJlc2VuY2Ugb2YgdGhpcyBwaW4gaXMgbm93IGhvbGRpbmcKPiArKyAgICBiYWNrIGVudmlyb25t
ZW50cyB0aGF0IG90aGVyd2lzZSB3YW50IHRvIHVzZSBhIG5ld2VyIHNldHVwdG9vbHMsIHNvIHdl
J3ZlCj4gKysgICAgZGVjaWRlZCB0byBtb3ZlIGZvcndhcmQgd2l0aCB0aGlzIGNoYW5nZSwgd2l0
aCB0aGUgYXNzdW1wdGlvbiB0aGF0IGJ1aWxkCj4gKysgICAgZW52aXJvbm1lbnRzIHdpbGwgaGF2
ZSBsYXJnZWx5IGFjY29tbW9kYXRlZCB0aGUgc2V0dXB0b29scyBjaGFuZ2UgYnkKPiArKyAgICBu
b3cuCj4gKysKPiArKwo+ICtkaWZmIC0tZ2l0IGEvcHlwcm9qZWN0LnRvbWwgYi9weXByb2plY3Qu
dG9tbAo+ICtpbmRleCAwZjUzNTk0ZGYuLmY3NWJmMzE5MiAxMDA2NDQKPiArLS0tIGEvcHlwcm9q
ZWN0LnRvbWwKPiArKysrIGIvcHlwcm9qZWN0LnRvbWwKPiArQEAgLTEsOSArMSw3IEBACj4gKyBb
YnVpbGQtc3lzdGVtXQo+ICsgYnVpbGQtYmFja2VuZCA9ICJzZXR1cHRvb2xzLmJ1aWxkX21ldGEi
Cj4gKyByZXF1aXJlcyA9IFsKPiArLSAgICAjIGF2b2lkIG1vdmluZyB0byBodHRwczovL2dpdGh1
Yi5jb20vcHlwYS9zZXR1cHRvb2xzL2lzc3Vlcy8zNTkzCj4gKy0gICAgIyB1bnRpbCB3ZSdyZSBy
ZWFkeQo+ICstICAgICJzZXR1cHRvb2xzPj02MS4wLDw2OS4zIiwKPiArKyAgICAic2V0dXB0b29s
cz49NjEuMCIsCj4gKyAgICAgImN5dGhvbj49MC4yOS4yNDsgcGxhdGZvcm1fcHl0aG9uX2ltcGxl
bWVudGF0aW9uID09ICdDUHl0aG9uJyIsICMgU2tpcCBjeXRob24gd2hlbiB1c2luZyBweXB5Cj4g
KyBdCj4gKyAKPiArLS0gCj4gKzIuNDYuMAo+ICsKPiAtLSAKPiAyLjQ2LjAKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJ
IFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdh
cmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cnwg
KzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8
ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8v
KlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
