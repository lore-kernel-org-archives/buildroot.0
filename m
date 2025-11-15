Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EDFCEB2DD
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 16:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F81440FB7;
	Sat, 15 Nov 2025 16:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnUrjlFkIWm1; Sat, 15 Nov 2025 16:49:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 314FB40FE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 314FB40FE1;
	Sat, 15 Nov 2025 16:49:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CCDB6158
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 16:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3A0B4048A
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 16:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZcjfL802tcY for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 16:48:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A4F47403DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4F47403DF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4F47403DF
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 16:48:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6D513A4C6C79;
 Sat, 15 Nov 2025 17:48:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34800)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKJRu-000000002XJ-0Hgp;
 Sat, 15 Nov 2025 16:48:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Devin Steffler <devin.buildroot@gmail.com>
Date: Sat, 15 Nov 2025 17:48:26 +0100
Message-ID: <20251115164828.1519438-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251115164828.1519438-1-bernd@kuhls.net>
References: <20251115164828.1519438-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763225310;
 bh=4S/eO4HB3VJMoPaecabfFYApABX9LNF0mIGZvAeYjYY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=UaeNrPK510vsylLaUsOvQM9Nh1/8dgmmVE732yMrS340MEM2fEB/h8jNfo4DCsXEt
 IikQ5R8GRzne6+a+vv+vy4jCl/BpNpoVgrucWhfP8/IeFFXv15NZ+qZhfKN5tUaCEL
 A7WanfM3LwBWSjOk1o6/1j4SCVFpHm3K31435o3O7K+lGmENtIyL1qVCgcNqNMPMEU
 6JG3vOWOKELUCmAe0f6Bw4StLDDt7rHdcWtO1fu0nuO3tpli195CC/tHMGEIj7ixEF
 Tj693cmtRb8HF7B9j7l3QPJMPf1U8Obh9TjsYX4v0zFrH6lE8VQxQvQiLe59fUeePh
 D3jsz4d949CHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=UaeNrPK5
Subject: [Buildroot] [PATCH 3/4] package/lttng-tools: bump to version 2.14.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogRGV2aW4gU3RlZmZsZXIgPGRldmluLmJ1aWxkcm9vdEBnbWFpbC5jb20+CgpUaGlzIGlz
IHRoZSBzZWNvbmQgb2YgdGhyZWUgcGF0Y2hlcyByZWxhdGluZyB0byBsdHRuZy1tb2R1bGVzIDIu
MTMuMTAgbm90IGNvbXBpbGluZyB3aXRoIGJ1aWxkcm9vdC4KClNpbmNlIEkgYW0gc3VibWl0dGlu
ZyBhIHBhdGNoIHRvIGJ1bXAgbHR0bmctbW9kdWxlcyB0byAyLjEzLjE3IGFuZCBsdHRuZy10b29s
cyBpcyBhIHRpZ2h0bHkgcmVsYXRlZCBwYWNrYWdlLApJIGFtIGFsc28gc3VibWl0dGluZyB0aGlz
IHBhdGNoIHRvIGJ1bXAgbHR0bmctdG9vbHMgdG8gMi4xMy4xNCAodGhlIGxhdGVzdCB2ZXJzaW9u
IGF0IHRoaXMgdGltZSkuCgpUaGUgY2hhbmdlbG9nIGZvciBsdHRuZy10b29scyAyLjE0LjAgY2Fu
IGJlIGZvdW5kIGhlcmU6Cmh0dHBzOi8vZ2l0Lmx0dG5nLm9yZy8/cD1sdHRuZy10b29scy5naXQ7
YT1ibG9iO2Y9Q2hhbmdlTG9nO2g9ZmM4ODU5MTQyM2NjODU2MzYwMTcyMTY1NDE4ZThlZjcxNTlh
YjI0ZTtoYj1yZWZzL2hlYWRzL3N0YWJsZS0yLjE0CgpTaWduZWQtb2ZmLWJ5OiBEZXZpbiBTdGVm
ZmxlciA8ZGV2aW4uYnVpbGRyb290QGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogQmVybmQgS3Vo
bHMgPGJlcm5kQGt1aGxzLm5ldD4KW0Jlcm5kOiBidW1wZWQgdG8gMi4xNC4wLCBhZGRlZCBwYXRj
aCAwMDAyIHRvIGZpeCBtdXNsIGJ1aWxkLCB1cGRhdGVkCiBsaW5rIHRvIGNoYW5nZWxvZ10KLS0t
CiAuLi5SZW1vdmUtdGhlLXNjb3BlLXJlc29sdXRpb24tb3BlcmF0b3IucGF0Y2ggfCA0OCArKysr
KysrKysrKysrKysrKysrCiBwYWNrYWdlL2x0dG5nLXRvb2xzL2x0dG5nLXRvb2xzLmhhc2ggICAg
ICAgICAgfCAgNCArLQogcGFja2FnZS9sdHRuZy10b29scy9sdHRuZy10b29scy5tayAgICAgICAg
ICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2x0dG5nLXRvb2xzLzAwMDItRml4LWV2
ZW50ZmQuY3BwLVJlbW92ZS10aGUtc2NvcGUtcmVzb2x1dGlvbi1vcGVyYXRvci5wYXRjaAoKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbHR0bmctdG9vbHMvMDAwMi1GaXgtZXZlbnRmZC5jcHAtUmVtb3Zl
LXRoZS1zY29wZS1yZXNvbHV0aW9uLW9wZXJhdG9yLnBhdGNoIGIvcGFja2FnZS9sdHRuZy10b29s
cy8wMDAyLUZpeC1ldmVudGZkLmNwcC1SZW1vdmUtdGhlLXNjb3BlLXJlc29sdXRpb24tb3BlcmF0
b3IucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZDRiNDZkM2E1
YQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbHR0bmctdG9vbHMvMDAwMi1GaXgtZXZlbnRm
ZC5jcHAtUmVtb3ZlLXRoZS1zY29wZS1yZXNvbHV0aW9uLW9wZXJhdG9yLnBhdGNoCkBAIC0wLDAg
KzEsNDggQEAKK0Zyb20gZDk0ZDJiOTBjNTE0OGM0ZDgzZjE0MjRiNmU5ODQwNDRmMmQ4MTkxZiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRy
aXZlci5jb20+CitEYXRlOiBUaHUsIDI0IEp1bCAyMDI1IDE0OjM1OjUxICswODAwCitTdWJqZWN0
OiBbUEFUQ0hdIEZpeDogZXZlbnRmZC5jcHA6IFJlbW92ZSB0aGUgc2NvcGUgcmVzb2x1dGlvbiBv
cGVyYXRvcgorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hh
cnNldD11dGY4CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK1JlbW92ZSB0aGUg
c2NvcGUgcmVzb2x1dGlvbiBvcGVyYXRvciA6OiB0byBmaXggdGhlIGJlbG93IGJ1aWxkIGZhaWx1
cmUKK3dpdGggbXVzbC4KKyB8IC4uLy4uLy4uL3NvdXJjZXMvbHR0bmctdG9vbHMtMi4xNC4wL3Ny
Yy9jb21tb24vZXZlbnRmZC5jcHA6MTg6MzE6IGVycm9yOiBleHBlY3RlZCBpZC1leHByZXNzaW9u
IGJlZm9yZSBudW1lcmljIGNvbnN0YW50CisgfCAgICAxOCB8ICAgICAgICAgICAgICAgICBpbnQg
ZmxhZ3MgPSA6OkVGRF9DTE9FWEVDOworIHwgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBefn5+fn5+fn5+fgorIHwgLi4vLi4vLi4vc291cmNlcy9sdHRuZy10b29scy0yLjE0
LjAvc3JjL2NvbW1vbi9ldmVudGZkLmNwcDoyMTozNjogZXJyb3I6IGV4cGVjdGVkIGlkLWV4cHJl
c3Npb24gYmVmb3JlIG51bWVyaWMgY29uc3RhbnQKKyB8ICAgIDIxIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgZmxhZ3MgfD0gOjpFRkRfU0VNQVBIT1JFOworIHwgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn4KKworU2lnbmVkLW9mZi1ieTog
TWluZ2xpIFl1IDxtaW5nbGkueXVAd2luZHJpdmVyLmNvbT4KK1NpZ25lZC1vZmYtYnk6IErDg8Kp
csODwqltaWUgR2FsYXJuZWF1IDxqZXJlbWllLmdhbGFybmVhdUBlZmZpY2lvcy5jb20+CitDaGFu
Z2UtSWQ6IEk0MDVmNmYxNWEyNWY3ZTZiN2YwNjc2MDkzMDkxYTllOGEzODQ3MzlkCisKK1Vwc3Ry
ZWFtOiBodHRwczovL2dpdC5sdHRuZy5vcmcvP3A9bHR0bmctdG9vbHMuZ2l0O2E9Y29tbWl0ZGlm
ZjtoPWQ5NGQyYjkwYzUxNDhjNGQ4M2YxNDI0YjZlOTg0MDQ0ZjJkODE5MWYKKworU2lnbmVkLW9m
Zi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KKy0tLQorIHNyYy9jb21tb24vZXZl
bnRmZC5jcHAgfCA0ICsrLS0KKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvc3JjL2NvbW1vbi9ldmVudGZkLmNwcCBiL3NyYy9j
b21tb24vZXZlbnRmZC5jcHAKK2luZGV4IGQzMzFiYmU0MC4uNDQ3NTIwZjI1IDEwMDY0NAorLS0t
IGEvc3JjL2NvbW1vbi9ldmVudGZkLmNwcAorKysrIGIvc3JjL2NvbW1vbi9ldmVudGZkLmNwcAor
QEAgLTE1LDEwICsxNSwxMCBAQAorIAorIGx0dG5nOjpldmVudGZkOjpldmVudGZkKGJvb2wgdXNl
X3NlbWFwaG9yZV9zZW1hbnRpY3MsIHN0ZDo6dWludDY0X3QgaW5pdGlhbF92YWx1ZSkgOgorIAlm
aWxlX2Rlc2NyaXB0b3IoW3VzZV9zZW1hcGhvcmVfc2VtYW50aWNzLCBpbml0aWFsX3ZhbHVlXSgp
IHsKKy0JCWludCBmbGFncyA9IDo6RUZEX0NMT0VYRUM7CisrCQlpbnQgZmxhZ3MgPSBFRkRfQ0xP
RVhFQzsKKyAKKyAJCWlmICh1c2Vfc2VtYXBob3JlX3NlbWFudGljcykgeworLQkJCWZsYWdzIHw9
IDo6RUZEX1NFTUFQSE9SRTsKKysJCQlmbGFncyB8PSBFRkRfU0VNQVBIT1JFOworIAkJfQorIAor
IAkJY29uc3QgYXV0byByYXdfZmQgPSA6OmV2ZW50ZmQoaW5pdGlhbF92YWx1ZSwgZmxhZ3MpOwor
LS0gCisyLjQ3LjMKKwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdHRuZy10b29scy9sdHRuZy10b29s
cy5oYXNoIGIvcGFja2FnZS9sdHRuZy10b29scy9sdHRuZy10b29scy5oYXNoCmluZGV4IGI0ODkw
NGQwYjkuLmExODFjZDZkYzAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbHR0bmctdG9vbHMvbHR0bmct
dG9vbHMuaGFzaAorKysgYi9wYWNrYWdlL2x0dG5nLXRvb2xzL2x0dG5nLXRvb2xzLmhhc2gKQEAg
LTEsNSArMSw1IEBACi0jIEZyb20gaHR0cHM6Ly9sdHRuZy5vcmcvZmlsZXMvbHR0bmctdG9vbHMv
bHR0bmctdG9vbHMtMi4xMy44LnRhci5iejIuc2hhMjU2Ci1zaGEyNTYgIGIxZTk1OTU3OWIyNjA3
OTA5MzBiMjBmM2M3YWE3Y2VmYjhhNDBlMGRlODBkNGE3NzdjMmJmNzhjNmIzNTNkYzEgIGx0dG5n
LXRvb2xzLTIuMTMuOC50YXIuYnoyCisjIEZyb20gaHR0cHM6Ly9sdHRuZy5vcmcvZmlsZXMvbHR0
bmctdG9vbHMvbHR0bmctdG9vbHMtMi4xNC4wLnRhci5iejIuc2hhMjU2CitzaGEyNTYgIGQ4YzM5
YzI2Y2VjMTNiN2JkODI1NTFjZDUyYTIyZWZjMzU4Yjg4OGUzNmViY2Y5YzFiNjBlZjFjM2EzYzJm
ZDMgIGx0dG5nLXRvb2xzLTIuMTQuMC50YXIuYnoyCiAKICMgTG9jYWxseSBjb21wdXRlZAogc2hh
MjU2ICAwNjhlNTVjN2RiZTU5NzQwMDE5OWFlZTc1YWM1ZTcxYmRiMmNhODhjNGM5YTRjZmE4ZTFm
YmM2MWY5MzNlZGE1ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL2x0dG5nLXRvb2xzL2x0
dG5nLXRvb2xzLm1rIGIvcGFja2FnZS9sdHRuZy10b29scy9sdHRuZy10b29scy5tawppbmRleCBh
ZGQxZjEyYThjLi45YTY2ZWRlNjY5IDEwMDY0NAotLS0gYS9wYWNrYWdlL2x0dG5nLXRvb2xzL2x0
dG5nLXRvb2xzLm1rCisrKyBiL3BhY2thZ2UvbHR0bmctdG9vbHMvbHR0bmctdG9vbHMubWsKQEAg
LTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1MVFROR19UT09MU19W
RVJTSU9OID0gMi4xMy44CitMVFROR19UT09MU19WRVJTSU9OID0gMi4xNC4wCiBMVFROR19UT09M
U19TSVRFID0gaHR0cHM6Ly9sdHRuZy5vcmcvZmlsZXMvbHR0bmctdG9vbHMKIExUVE5HX1RPT0xT
X1NPVVJDRSA9IGx0dG5nLXRvb2xzLSQoTFRUTkdfVE9PTFNfVkVSU0lPTikudGFyLmJ6MgogTFRU
TkdfVE9PTFNfSU5TVEFMTF9TVEFHSU5HID0gWUVTCi0tIAoyLjQ3LjMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
