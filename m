Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3DBCCF9E3
	for <buildroot@archiver.kernel.org>; Fri,  7 Nov 2025 20:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83EEE80535;
	Fri,  7 Nov 2025 20:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9E_5zqmmQhj; Fri,  7 Nov 2025 20:54:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FED580F78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FED580F78;
	Fri,  7 Nov 2025 20:54:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D4BE1BC
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 20:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E9A880F78
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 20:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yN1J4OJGr7SJ for <buildroot@buildroot.org>;
 Fri,  7 Nov 2025 20:54:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2607480F4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2607480F4E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2607480F4E
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 20:54:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B5AC5B0051B;
 Fri,  7 Nov 2025 21:54:15 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 07 Nov 2025 21:54:15 +0100
MIME-Version: 1.0
Date: Fri, 07 Nov 2025 21:54:15 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Marek Belisko <marek.belisko@open-nandra.com>
In-Reply-To: <85B04EF3-5C0C-4948-B183-50AE134CD191@benettiengineering.com>
References: <d77e0f618c15fb0b25ddc422e6bb4f7c@free.fr>
 <85B04EF3-5C0C-4948-B183-50AE134CD191@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4fb87703bb0b119a6557526825dd55a2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762548857;
 bh=xAe7ww+h4EKcAWu9++pRxtrxmnXeJHCxelvNDOGLMqk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I/CgtyZX11LYDCSQSw5qUSH0riK7qBtBpyZYHnUyaJwVleUJstPdHi30laDF/UisA
 jZIwwdgh7Z0Ae9muyhNumT/q2ZS40s/5M8eKpXd09Me/k6jIYTW3XR4sLZ+mBccsRt
 I66ZJRoQFa5pTJP9vlNSvcyfP1FIM+rvfjxzp1TWxkXH5xyS4rpPRTtmzhW4Rhh2Bt
 S2N5A7x56dv2NnWLHYt1Pi+aEO+DvJ6fvtx+2xZUCrvbxqi3vTy8r36lhx+6tCChSO
 4Y4x2bmuxO4DA51BDj6GB6quyhK3X680D+tjmCbBB+NwvXXC7T41XrhYs6NPYKsj62
 JigXQpIRVfbdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=I/CgtyZX
Subject: Re: [Buildroot] [PATCH] package/udisks: security bump to version
 2.11.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDcvMTEvMjAyNSAxODoyNiwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IElsIGdpb3JubyA3
IG5vdiAyMDI1LCBhbGxlIG9yZSAxODoxMSwgSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4g
aGEgCj4+IHNjcml0dG86Cj4+IAo+PiDvu79IaSBHaXVsaW8sCj4+IAo+Pj4gT24gMDYvMTEvMjAy
NSAyMzoxNiwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+PiBSZWxlYXNlIG5vdGVzOgo+Pj4gaHR0
cHM6Ly9naXRodWIuY29tL3N0b3JhZ2VkLXByb2plY3QvdWRpc2tzL3JlbGVhc2VzL3RhZy91ZGlz
a3MtMi4xMS4wCj4+IAo+PiBUaGlzIGNvbW1pdCB0aXRsZSBpcyBtYXJrZWQgYXMgInNlY3VyaXR5
IGJ1bXAiLiBJIGRvbid0IHNlZSBhbnkgCj4+IHJlZmVyZW5jZSBhYm91dAo+PiBzZWN1cml0eSBm
aXhlcyBpbiB0aGlzIHJlbGVhc2Ugbm90ZXMuIENvdWxkIHlvdSBwcm92aWRlIGEgcmVmZXJlbmNl
IAo+PiBwbGVhc2U/Cj4+IChvciBjb25maXJtIGl0IGlzIGEgY29weS1wYXN0ZSBlcnJvciBmcm9t
IHRoZSBsYXN0IGNvbW1pdCkuCj4gCj4gUGFyZG9uLCBpdOKAmXMgZXhhY3RseSBhIGNvcHktcGFz
dGUgZXJyb3IgZnJvbSB0aGUgbGFzdCBjb21taXQuIFRoaXMgaXMgCj4gbm90IGEgc2VjdXJpdHkg
YnVtcC4KPiBEbyB5b3UgbWluZCByZXdvcmRpbmcgd2hpbGUgYXBwbHlpbmc/Cj4gT3RoZXJ3aXNl
IEkgY2FuIHNlbmQgYSB2MiB3aXRoIG5vIHByb2JsZW1zLgoKSSBhcHBsaWVkIHRoaXMgcGF0Y2gg
dG8gbWFzdGVyIChhZnRlciByZW1vdmluZyAic2VjdXJpdHkiIGluIHRoZSB0aXRsZSkuClRoYW5r
cy4KCj4gQmVzdCByZWdhcmRzCj4gR2l1bGlvCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
