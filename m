Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D967C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 13:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D22D81EEF;
	Mon,  3 Feb 2025 13:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQAbRFGyt4ch; Mon,  3 Feb 2025 13:51:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 233B381F1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 233B381F1D;
	Mon,  3 Feb 2025 13:51:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3D8C1A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7E4D81F1A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMedBP2KuMzL for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 13:51:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 76C4D81EEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76C4D81EEF
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76C4D81EEF
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:51:33 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 96A7A2C80C85
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 14:51:30 +0100 (CET)
Message-ID: <5d9676bd-bf37-41cb-a90b-69ed176598d1@bubu1.eu>
Date: Mon, 3 Feb 2025 14:51:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <CALtfCQbttDOwqg-eVJdGpi1a8Gh7ukCVODTcxTphF4nSbwtdCg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CALtfCQbttDOwqg-eVJdGpi1a8Gh7ukCVODTcxTphF4nSbwtdCg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1738590690; bh=/0bx4Lkzn01wDlU1SdYLN0hmbjZ72ZrP6P7J3C7u7xI=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=qKpH8Jl1ku1Z7DxHzutOZgjBBYuKlI9WV7dxBZMCsRhjOSDnlmihdEbj1CfUFiMRU
 DIr6sg1cfI3VVO6CTxReigc718SpLtNesGjGLXvclry7dOeg4si/u9e4n3uJtsuKux
 hbEpAtovXlq1/uIObTLeoJGtH95ZYzLFd7o56y3ZroF0CAhFNTQPRXxKfn7M0HTIgS
 r8AnWxhgq9uEb4AenAn3A5W02oIpNmsKeT26/QFoCTiYPEgOgnaN0DRKyafivC0ySA
 tA9Nc88I0GgSer3tUzwPoE6YcGBrSkkCckPbwJDnocxhhQMeUOppQJtGTxLKtZoobv
 rQX1KgcbjU2wQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=qKpH8Jl1
Subject: Re: [Buildroot] Error compiling python-paho-mqtt v2.1.0 in
 buildroot version 2022.02.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgT3NjYXIsCgoKT24gMzEuMDEuMjUgMjI6MDIsIE9zY2FyIEdvbWV6IEZ1ZW50ZSB3cm90ZToK
PiBIaSBldmVyeW9uZSwKPiAKPiBJIG5lZWQgdG8gdXBkYXRlIHRoZSBweXRob24tcGFoby1tcXR0
IHBhY2thZ2UgdmVyc2lvbiBmcm9tIDEuNC4wIHRvCj4gMi4xLjAsIHNvIEkgaGF2ZSBjaGFuZ2Vk
IHRoZXNlIGZpbGVzOgo+IAo+IC4uL3BhY2thZ2UvcHl0aG9uLXBhaG8tbXF0dC9weXRob24tcGFo
by1tcXR0Lm1rCj4gLi4vcGFja2FnZS9weXRob24tcGFoby1tcXR0L3B5dGhvbi1wYWhvLW1xdHQu
aGFzaAo+IAo+IFNvIGZhciBzbyBnb29kLCBidXQgaXQgc2VlbXMgdG8gYmUgc29tZXRoaW5nIGhh
cyBjaGFuZ2VkIGJlY2F1c2UgSSd2ZQo+IGdvdCB0aGlzIGVycm9yOgo+IC4uL2J1aWxkcm9vdC0y
MDIyLjAyLjEvb3V0cHV0L2hvc3QvYmluL3B5dGhvbjogY2FuJ3Qgb3BlbiBmaWxlCj4gJy9ob21l
L1VTRVJOQU1FL0dJVC9yYXNwYmVycnlwaS9idWlsZHJvb3QtMjAyMi4wMi4xL291dHB1dC9idWls
ZC9weXRob24tcGFoby1tcXR0LTIuMS4wL3NldHVwLnB5JzoKPiBbRXJybm8gMl0gTm8gc3VjaCBm
aWxlIG9yIGRpcmVjdG9yeQo+IAo+IEkgd2FzIGFuYWx5emluZyBob3cgaXQgaXMgdGhlIC5tayBm
aWxlIGluIHRoZSBjdXJyZW50IHZlcnNpb24sIGFuZCBpdAo+IHNlZW1zIHRvIGJlIHRoYXQgdGhl
IFBZVEhPTl9QQUhPX01RVFRfU0VUVVBfVFlQRSBtZXRob2QgaGFzIGNoYW5nZWQKPiBmcm9tIHNl
dHVwdG9vbHMgdG8gaGF0Y2guCgpUaGlzIGlzIGJlY2F1c2UgdXBzdHJlYW0gcGFoby5tcXR0LnB5
dGhvbiBubyBsb25nZXIgdXNlcyBzZXR1cHRvb2xzIGJ1dCAKaW5kZWVkIGhhdGNoKGxpbmcpIGFz
IGEgYnVpbGQgYmFja2VuZDogCmh0dHBzOi8vZ2l0aHViLmNvbS9lY2xpcHNlLXBhaG8vcGFoby5t
cXR0LnB5dGhvbi9ibG9iL3YyLjEuMC9weXByb2plY3QudG9tbCNMMwoKPiAKPiBDYW4gY29tcGls
ZSB0aGlzIHBhY2thZ2UgdXNpbmcgdGhlIG9sZCBtZXRob2QKPiAoUFlUSE9OX1BBSE9fTVFUVF9T
RVRVUF9UWVBFID0gc2V0cHRvb2wpIHdpdGggYnVpbGRyb290LTIwMjIuMDIuMT8gVGhlCj4gYnVp
bGRyb290LTIwMjItMDIuMSB2ZXJzaW9uIGRvZXNuJ3Qgc3VwcG9ydCB0aGUgaGF0Y2ggbWV0aG9k
LiBBbnkKPiBzdWdnZXN0aW9uID8KCkJlc2lkZXMgdXBncmFkaW5nIHRvIGEgbmV3ZXIgYnVpbGRy
b290IHZlcnNpb24sIEkgZG9uJ3QgdGhpbmsgeW91IGhhdmUgCm1hbnkgb3B0aW9ucyB1bmZvcnR1
bmF0ZWx5LiBCdWlsZHJvb3QgMjAyMi4wMiBoYXMgbm8gaW5mcmFzdHJ1Y3R1cmUgZm9yIApweXRo
b24gcGFja2FnZXMgdGhhdCB1c2UgdGhlIHBlcDUxNyBidWlsZCBzeXN0ZW1zIAooaHR0cHM6Ly9w
ZXBzLnB5dGhvbi5vcmcvcGVwLTA1MTcvKQoKCj4gCj4gQmVzdCByZWdhcmRzLAo+IMOTc2NhciBH
w7NtZXogRnVlbnRlLgpCZXN0LApNYXJjdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
