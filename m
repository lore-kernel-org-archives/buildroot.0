Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D07CC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDA666F5A5;
	Wed, 16 Apr 2025 21:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkQqSnyIp16Y; Wed, 16 Apr 2025 21:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72E56617BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E56617BB;
	Wed, 16 Apr 2025 21:21:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08104159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04A596059F
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9plwsqqugsi for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:21:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9CA060751
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9CA060751
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9CA060751
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:21:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A04941C00C0; Wed, 16 Apr 2025 23:21:13 +0200 (CEST)
Message-ID: <569bc00f-1306-472d-a9f9-24de71743ccf@rnout.be>
Date: Wed, 16 Apr 2025 23:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20250328213824.4079072-1-yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <20250328213824.4079072-1-yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838473; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KVFaAkuZ/U2mYug/cGy1Z9Ah1VkLq75SrGeTIPH3qbY=;
 b=Jle1uwn9XZbAyWlRB5haAgY16do3P0MnewbJHSGFz4iyAAkm/kk0Jsr3rrWfTsGKgvNTw6
 fMNsEYSMxSA1z1D3IYNOWAe2GfexLTEoLvAKbld12bg9VtLeH2bZCHn1X1+4+/wODgaKh9
 wqtSCfABzGbnDd4siWFYF7thzTblWDCvYgnseu5tVxb++0x/P3ieGSHLS1r5u8dMFVhTSs
 SwUNOPyHnrH+9XCwxFna1bmQ2HpEd1m1w9rq1+dvjzaq5zRw8LUu9twslH3AQA+1UnjvyD
 2ZBhY+GvGp1yqL77N7r5V9t9LjzsiYQVfieNDpL9Fsoz2+6fiR9M11APUz1gQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/freerdp: bump to latest commit on
 legacy stable branch
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

Ck9uIDI4LzAzLzIwMjUgMjI6MzgsIFlhbm4gRS4gTU9SSU4gd3JvdGU6Cj4gRnJlZVJEUCBmYWls
cyB0byBidWlsZCBvbiBuZXdlciBnY2M6Cj4KPiAgICAgIC9mcmVlcmRwLTIuMTEuNy9saWJmcmVl
cmRwL2NvcmUvaW5mby5jOjg4OjM5OiBlcnJvcjogaW5pdGlhbGl6YXRpb24gb2YgJ2NvbnN0IFdD
SEFSIConIHtha2EgJ2NvbnN0IHNob3J0IHVuc2lnbmVkIGludCAqJ30gZnJvbSBpbmNvbXBhdGli
bGUgcG9pbnRlciB0eXBlICdCWVRFIConIHtha2EgJ3Vuc2lnbmVkIGNoYXIgKid9IFstV2luY29t
cGF0aWJsZS1wb2ludGVyLXR5cGVzXQo+ICAgICAgICAgODggfCAgICAgICAgICAgICAgICAgY29u
c3QgV0NIQVIqIGRvbWFpbiA9IFN0cmVhbV9Qb2ludGVyKHMpOwo+ICAgICAgICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+Cj4KPiBUaGVy
ZSBpcyBhIHBhdGNoIHVwc3RyZWFtIFswXSB0byBmaXggdGhhdCBvbmUsIGJ1dCB0aGVuIGFub3Ro
ZXIgc2ltaWxhcgo+IGJ1aWxkIGZhaWx1cmUgdHJpZ2dlcnMsIHdoaWNoIGlzIGFsc28gZml4ZWQg
dXBzdHJlYW0sIGJ1dCB0aGVuIGEgdGhpcmQKPiBmYWlscmUgdHJpZ2dlcnMsIGFnYWluIGZpeGVk
IHVwc3RyZWFtIFsyXSwgYnV0IHRoZW4uLi4KPgo+IEZyZWVSRFAgMi54IGhhcyBiZWVuIGtpbmRh
IGRpc2NvbnRpbnVlZCwgYW5kIHRoZSBuZXcgc3RhYmxlIGlzIDMueC4KPiBIb3dldmVyLCBidW1w
aW5nIHRvIDMueCBsb29rcyBsaWtlIGEgaHVnZSBsZWFwLgo+Cj4gU28sIHJhdGhlciB0aGFuIGJh
Y2twb3J0LCBqdXN0IGJ1bXAgdG8gdGhlIGxhdGVzdCBjb21taXQgb24gdGhlCj4gc3RhYmxlLTIu
MCBicmFuY2gsIHdoaWNoIGNhcnJpZXMgMTIgbm9uLW1lcmdlIGNvbW1pdHMgd2l0aCBidWlsZCBm
aXhlczoKPiAgICAgIDU2MmFlMzU4OCBbd2lucHIscHVic3ViXSBhZGQgTlVMTCBwYXJhbWV0ZXIg
Y2hlY2tzCj4gICAgICA2OGM3YzIxYjkgWDExIGNsaWVudDogaWdub3JlIGdyYWIgcmVsYXRlZCBM
ZWF2ZU5vdGlmeSBldmVudHMKPiAgICAgIGE5ZGVlY2M5OSBmaXggW2NvcmVdOiAnaW52YWxpZCBo
SGFuZGxlJyBlcnJvcnMKPiAgICAgIDA1MmM1MjVlMCBbY29yZV0gZWxpbWluYXRlIHJkcFJkcDo6
aW5zdGFuY2UKPiAgICAgIGJlMjNlZDRiYSBbc2VydmVyLHByb3h5XSBkZWFjdGl2YXRlIGNhcHR1
cmUgbW9kdWxlCj4gICAgICA1YjJiNTNiMTUgW3dhcm5pbmdzXSBmaXggLVdpbmNvbXBhdGlibGUt
cG9pbnRlci10eXBlcwo+ICAgICAgNjc4MThiZGRiIFtjbGllbnQsd2F5bGFuZF0gZml4IGNvbnN0
IGNvcnJlY3RuZXNzCj4gICAgICBkMmI2NzcxYzcgWDExOiBmaXggcG9pbnRlci9pbnRlZ2VyIHR5
cGUgbWlzbWF0Y2gKPiBbMl0gNzg5NGE3ZGZjIHJlZGlyZWN0aW9uOiBGaXggaW5jb21wYXRpYmxl
IHBvaW50ZXIgdHlwZQo+IFsxXSBmM2VkMWYxYWMgcmVkaXJlY3Rpb246IEZpeCBpbmNvbXBhdGli
bGUgcG9pbnRlciB0eXBlCj4gWzBdIDRmNDExMTk3ZCBpbmZvOiBGaXggaW5jb21wYXRpYmxlIHBv
aW50ZXIgdHlwZQo+ICAgICAgYTM4Mzc0MGEyIG5leHQtZGV2LTIuMTEuOC1kZXYKPgo+IEZpeGVz
Ogo+ICAgICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZTFiL2UxYjk1
YjRmYjAwMDVkNGU5MzNiMDI3YjUwOGNlYzlhZDUxMGJkNzMvCj4gICAgICBodHRwOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9iYTAvYmEwYmVhZTEzZTFiZTI1NzM4NzhlZTUwYjE1
NjZmNDQyN2IyNjlhMy8KPiAgICAgIC4uLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJ
TiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+CgogwqBBcHBsaWVkIHRvwqAyMDI1LjAyLnggYW5k
IDIwMjQuMTEueCwgdGhhbmtzLgoKIMKgUmVnYXJkcywKIMKgQXJub3V0Cgo+IC0tLQo+ICAgcGFj
a2FnZS9mcmVlcmRwL2ZyZWVyZHAuaGFzaCB8IDQgKy0tLQo+ICAgcGFja2FnZS9mcmVlcmRwL2Zy
ZWVyZHAubWsgICB8IDYgKysrKy0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVyZHAvZnJlZXJk
cC5oYXNoIGIvcGFja2FnZS9mcmVlcmRwL2ZyZWVyZHAuaGFzaAo+IGluZGV4IDEwMDcyMTVjZDYu
LjgzYjgzZGIxMjEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9mcmVlcmRwL2ZyZWVyZHAuaGFzaAo+
ICsrKyBiL3BhY2thZ2UvZnJlZXJkcC9mcmVlcmRwLmhhc2gKPiBAQCAtMSw1ICsxLDMgQEAKPiAt
IyBGcm9tIGh0dHBzOi8vcHViLmZyZWVyZHAuY29tL3JlbGVhc2VzL2ZyZWVyZHAtMi4xMS43LnRh
ci5nei5zaGEyNTYKPiAtc2hhMjU2ICA1YTJkNTRlMWNhMGYxZmFjZDE2MzJiY2M5NGM3M2I5ZjA3
MWE4MGM1ZmRiYmIzZjI2ZTc5ZjAyYWFhNTg2Y2EzICBmcmVlcmRwLTIuMTEuNy50YXIuZ3oKPiAt
Cj4gICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICtzaGEyNTYgIGY3Y2MyYmY0M2I5Nzc4ZTkwNzlj
ZDIyOWVhOGUzN2ZjMTg0M2ViMWMxMWE4ZTRlMDAzMDM0YWY3MTg1OGNlNmEgIGZyZWVyZHAtMi4x
MS43LTE4LWcwZWUxN2UyZjhlNDlkNTZhYjViOTBkNTE2MGZhOGY4N2ZmYzQ0NWUwLWdpdDQudGFy
Lmd6Cj4gICBzaGEyNTYgIGNmYzc3NDliOTZmNjNiZDMxYzNjNDJiNWM0NzFiZjc1NjgxNDA1M2U4
NDdjMTBmM2ViMDAzNDE3YmM1MjNkMzAgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9m
cmVlcmRwL2ZyZWVyZHAubWsgYi9wYWNrYWdlL2ZyZWVyZHAvZnJlZXJkcC5tawo+IGluZGV4IGU4
YzhmMzIwYTkuLjNhMWJhNjE2MjEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9mcmVlcmRwL2ZyZWVy
ZHAubWsKPiArKysgYi9wYWNrYWdlL2ZyZWVyZHAvZnJlZXJkcC5tawo+IEBAIC00LDggKzQsMTAg
QEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtRlJFRVJEUF9WRVJT
SU9OID0gMi4xMS43Cj4gLUZSRUVSRFBfU0lURSA9IGh0dHBzOi8vcHViLmZyZWVyZHAuY29tL3Jl
bGVhc2VzCj4gKyMgTGF0ZXN0LCBhbmQgcHJvYmFibHkgbGFzdCwgY29tbWl0IG9uIHRoZSBzdGFi
bGUtMi4wIGJyYW5jaAo+ICtGUkVFUkRQX1ZFUlNJT04gPSAyLjExLjctMTgtZzBlZTE3ZTJmOGU0
OWQ1NmFiNWI5MGQ1MTYwZmE4Zjg3ZmZjNDQ1ZTAKPiArRlJFRVJEUF9TSVRFID0gaHR0cHM6Ly9n
aXRodWIuY29tL0ZyZWVSRFAvRnJlZVJEUAo+ICtGUkVFUkRQX1NJVEVfTUVUSE9EID0gZ2l0Cj4g
ICBGUkVFUkRQX0RFUEVOREVOQ0lFUyA9IGxpYmdsaWIyIG9wZW5zc2wgemxpYgo+ICAgRlJFRVJE
UF9MSUNFTlNFID0gQXBhY2hlLTIuMAo+ICAgRlJFRVJEUF9MSUNFTlNFX0ZJTEVTID0gTElDRU5T
RQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
