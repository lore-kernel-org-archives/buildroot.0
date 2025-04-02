Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D110C36018
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 20:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EF4D4122A;
	Wed,  2 Apr 2025 20:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nT2saZCWjqoF; Wed,  2 Apr 2025 20:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 831C640D92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 831C640D92;
	Wed,  2 Apr 2025 20:23:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C68011F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 20:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DB2783896
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 20:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86Zrn1YSqTPK for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 20:23:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 348AF838D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 348AF838D3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 348AF838D3
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 20:23:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id DA9CD5FFB7;
 Wed,  2 Apr 2025 22:23:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Apr 2025 22:23:06 +0200
MIME-Version: 1.0
Date: Wed, 02 Apr 2025 22:23:06 +0200
From: Julien Olivain <ju.o@free.fr>
To: gilles.bardoux@sagemcom.com
Cc: buildroot@buildroot.org
In-Reply-To: <a7492951-7d08-4509-8243-c2b9e9b1dfef@sagemcom.com>
References: <a7492951-7d08-4509-8243-c2b9e9b1dfef@sagemcom.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <b8b6d59e67cff845ea3f687609a5d85d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743625388;
 bh=FY82aPprwQBl1G7wNKrrGsXe09xvWtTF5JhWxMBK25A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HbY1AptNFVmuX79z3Fd4J1T0ywXGLrGHERl/fzMiuCIVYVJmsflEWpL+QycvP0s1f
 bJmfe4IFn06pLQcQgFsXXTSQyUdGYgyde0Uyy5Wx2L4ZUqYH3pYNIo54uEYrYstW4j
 ftSAYnZkbab6Z1I2p8vUvtLbqxvKtSnUYSwde1r2lwh6iP2AuATSpUGgdcPXLM0ZUQ
 2WCcXk0NmOINsa0LuncoudhIlQVG8oJMF6pMI/vVAuRz0Ko/hbaz+gAO3WodIaGl1w
 fSNtw3dXgP/ADNECE1s+lMGSkH508rIUe+NE46m95OAO7ENdg8WZ32iNxT2mmv0Z7X
 yUdeSVbENAIyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HbY1AptN
Subject: Re: [Buildroot] [PATCH] package/python-twisted: fix cpe id vendor
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

SGkgR2lsbGVzLAoKVGhhbmtzIGZvciB0aGUgcGF0Y2guCgpPbiAyNC8wMy8yMDI1IDE3OjI2LCBH
aWxsZXMgQmFyZG91eCB2aWEgYnVpbGRyb290IHdyb3RlOgo+IHBhY2thZ2UvcHl0aG9uLXR3aXN0
ZWQ6IGZpeCBjcGUgaWQgdmVuZG9yCj4gCj4gdHdpc3RlZG1hdHJpeCBpcyBkZXByZWNhdGVkLCB0
d2lzdGVkIGlzIHRoZSBjdXJyZW50IGNwZSBpZCB2ZW5kb3IgZm9yIAo+IHB5dGhvbi10d2lzdGVk
Cj4gCj4gU2lnbmVkLW9mZi1ieTogR2lsbGVzIEJhcmRvdXggPGdpbGxlcy5iYXJkb3V4QHNhZ2Vt
Y29tLmNvbT4KClRoaXMgcGF0Y2ggd2FzIGluY29ycmVjdGx5IGZvcm1hdHRlZCBhZ2FpbiBhbmQg
Y291bGQgbm90IGJlIGFwcGxpZWQKYXMgaXMuIEl0IHdhcyBzaW1wbGUgZW5vdWdoIGZvciBtZSB0
byBmaXggYW5kIGFwcGx5IGl0IG9uIG1hc3Rlci4KCklmIHlvdSBjb25zaWRlciB0byBzZW5kIG5l
dyBwYXRjaGVzIGluIHRoZSBmdXR1cmUsIGNvdWxkIHlvdSBwbGVhc2UKdXNlICJnaXQgc2VuZC1l
bWFpbCI/IFNlZToKaHR0cHM6Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFs
Lmh0bWwjc3VibWl0dGluZy1wYXRjaGVzCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCgo+IC0tLQo+
IMKgcGFja2FnZS9weXRob24tdHdpc3RlZC9weXRob24tdHdpc3RlZC5tayB8IDIgKy0KPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3B5dGhvbi10d2lzdGVkL3B5dGhvbi10d2lzdGVkLm1rIAo+IGIvcGFja2Fn
ZS9weXRob24tdHdpc3RlZC9weXRob24tdHdpc3RlZC5tawo+IGluZGV4IDBmOTFmYTI0NWMuLmI3
MjE3ZGE2ZTQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tdHdpc3RlZC9weXRob24tdHdp
c3RlZC5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXR3aXN0ZWQvcHl0aG9uLXR3aXN0ZWQubWsK
PiBAQCAtMTAsNyArMTAsNyBAQCBQWVRIT05fVFdJU1RFRF9TSVRFID0gCj4gaHR0cHM6Ly9maWxl
cy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzc3LzFjL2UwN2FmMGRmMzEyMgo+IMKgUFlUSE9O
X1RXSVNURURfU0VUVVBfVFlQRSA9IGhhdGNoCj4gwqBQWVRIT05fVFdJU1RFRF9MSUNFTlNFID0g
TUlUCj4gwqBQWVRIT05fVFdJU1RFRF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+IC1QWVRIT05f
VFdJU1RFRF9DUEVfSURfVkVORE9SID0gdHdpc3RlZG1hdHJpeAo+ICtQWVRIT05fVFdJU1RFRF9D
UEVfSURfVkVORE9SID0gdHdpc3RlZAo+IMKgUFlUSE9OX1RXSVNURURfQ1BFX0lEX1BST0RVQ1Qg
PSB0d2lzdGVkCj4gwqBQWVRIT05fVFdJU1RFRF9ERVBFTkRFTkNJRVMgPSBcCj4gwqDCoMKgwqAg
aG9zdC1weXRob24taGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWUgXAo+IC0tCj4gMi4zOS41CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
