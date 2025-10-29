Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94793CCF9EB
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 13:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F330140A95;
	Wed, 29 Oct 2025 13:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7QLlkzXm3i3; Wed, 29 Oct 2025 13:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DA5440A37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DA5440A37;
	Wed, 29 Oct 2025 13:44:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C7FE707
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 13:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFE2A40A37
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 13:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJ0VMyW9kFzK for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 13:44:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A387440A30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A387440A30
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A387440A30
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 13:44:12 +0000 (UTC)
Received: from L25025.local (unknown [213.36.7.12])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2A8306012F;
 Wed, 29 Oct 2025 14:44:07 +0100 (CET)
Date: Wed, 29 Oct 2025 14:44:07 +0100
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org
Message-ID: <g4chtkupwb5wnx2444zcvtbhnox4ncwnomef5rnc7sghy5a4cj@23fqjv7ks4ed>
References: <20251021120342.483933-1-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251021120342.483933-1-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761745449;
 bh=A6Z6P7iKgFgDSXCP400hnCe0C+nebLc3w4MFpHbv2+s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AUyIVOcjFtXB/sTR8KrZ5m5QPvLliwhXW0JCjTDuM379E1H3jOb+2kcaMYamzIZU8
 6vy5ZWHvnjS1BIct5mX7hEfFP2J6KBDuTWIM5qKivr+H9+pnYCOPZIsIRSDPG6LWtp
 0vliNxYB9f/Fs5HCVy/SB+8yrZnT4kKNWYwSe5nfbXnPqCm2RW34sXPocI0VZpfJpd
 I64ECnzxJbiH9xmXf7fSOaeD/7NjQb5hxnuQwxVhEURxxrI0cV2v1e13Ba4dHOz8lE
 O0piw6ABEM3xCWvtZvHZqmliXmrChL9cE9rQSlRQHwD3wTqRgAXIokAhklyb0Adc1/
 pc6YKL0NAwLcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AUyIVOcj
Subject: Re: [Buildroot] [PATCH 0/5] package/dpdk: version bump and
 selectable build components
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWF4aW1lLAoKT24gVHVlLCBPY3QgMjEsIDIwMjUgYXQgMDI6MDM6MzdQTSArMDEwMCwgTWF4
aW1lIExlcm95IHdyb3RlOgo+IFRoaXMgc2VyaWVzIGJ1bXBzIERQREsgdG8gMjQuMTEuMyBhbmQg
YWRkcyBvcHRpb25zIHRvIGVuYWJsZS9kaXNhYmxlIGtlcm5lbCBtb2R1bGVzLAo+IGRyaXZlcnMs
IGxpYnJhcmllcywgYW5kIGFwcHMsIG1hdGNoaW5nIE1lc29u4oCZcyBzZWxlY3Rpb24gbW9kZWwK
PiBhbmQgYWxsb3dpbmcgc21hbGxlciBidWlsZHMuCj4gCj4gVGVzdGVkIG1hbnVhbGx5IG9uIHg4
Nl82NCBhbmQgTlhQIERQQUEyLgo+IENJIHBhc3NlZCBmb3IgYnVpbGQgYW5kIHJ1bnRpbWU6Cj4g
Cj4gICAgIGJ1aWxkOiBodHRwczovL2dpdGxhYi5jb20vbWF4aW1lLWxlcm95L2J1aWxkcm9vdC8t
L3BpcGVsaW5lcy8yMTExMTIyOTI1Cj4gICAgIHRlc3Q6IGh0dHBzOi8vZ2l0bGFiLmNvbS9tYXhp
bWUtbGVyb3kvYnVpbGRyb290Ly0vcGlwZWxpbmVzLzIxMTExMzcxNzUKClRoYW5rcyBmb3Igc2hh
cmluZyB3aXRoIHRlc3RzLgoKPiAKPiBNYXhpbWUgTGVyb3kgKDUpOgo+ICAgcGFja2FnZS9kcGRr
OiBidW1wIHRvIDI0LjExLjMgdmVyc2lvbgo+ICAgcGFja2FnZS9kcGRrOiBhZGQgdG9nZ2xlIGZv
ciBkZXByZWNhdGVkIGtlcm5lbCBtb2R1bGVzCj4gICBwYWNrYWdlL2RwZGs6IG1ha2UgZHJpdmVy
cyBzZWxlY3RhYmxlCj4gICBwYWNrYWdlL2RwZGs6IG1ha2UgbGlicmFyaWVzIHNlbGVjdGFibGUK
PiAgIHBhY2thZ2UvZHBkazogbWFrZSBhcHBzIHNlbGVjdGFibGUKCkl0IGlzIGEgZ29vZCBpZGVh
LiBJdCBoZWxwcyB0byBzYXZlIENPMiBhbmQgdG8gaGF2ZSBxdWlja2VyIGNvbXBpbGF0aW9uCm9u
IHRoZSB0YXJnZXRzLgoKV2hhdCdzIGFib3V0IGEgZnJlZSBkZWZpbml0aW9uIG9mIERQREtfQ09O
Rl9PUFRTPSB0b28gPwpGb3IgaW5zdGFuY2U6CiAgRFBES19DT05GX09QVFMgKz0gLURjX2FyZ3M9
Jy1EUlRFX0xPR19EUF9MRVZFTD1SVEVfTE9HX0RFQlVHJwpJdCB3b3VsZCBiZSB1c2VmdWwgdHVu
ZSB0aG9zZSBmb3IgdGhlIERQREsgdG9vLgoKSXQgaXMgYSBtaW5vciBpbXByb3ZlbWVudCwgaXQg
ZG9lcyBub3QgcHJldmVudCBmcm9tIG1lcmdpbmcgaW50bwpCdWlsZHJvb3QuCgpMR1RNLgoKUmV2
aWV3ZWQtYnk6IFZpbmNlbnQgSmFyZGluIDx2amFyZGluQGZyZWUuZnI+Cgp0aGFuayB5b3UsCiAg
VmluY2VudAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
