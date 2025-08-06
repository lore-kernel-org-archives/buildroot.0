Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57ADC87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 12:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FE0D845B1;
	Wed,  6 Aug 2025 12:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGhRLlfS_GNe; Wed,  6 Aug 2025 12:58:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80A1384585
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80A1384585;
	Wed,  6 Aug 2025 12:58:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B67C0233
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D57A40A0C
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxlfRc9uG8rX for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 12:58:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5CFEB402F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CFEB402F2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CFEB402F2
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:58:04 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1477060584; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Aug 2025 12:57:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ujdiM-00GdYl-2B;
 Wed, 06 Aug 2025 14:57:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250805200951.3439248-1-thomas.perale@mind.be>
Date: Wed, 06 Aug 2025 14:57:54 +0200
In-Reply-To: <20250805200951.3439248-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Tue, 5 Aug 2025 22:09:51 +0200")
Message-ID: <87a54ck3ot.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=MU5YWazcXcJYZcuCJtlM6j740Vx9jDRUgHptArIt0heoyQvhU9cBmCSh8b6nkEvBaNJ0i/xDoGfxMFkjt9G8GT8lTkfdN7JnJ+UItZd9Siy2mIN7aRCfQeflbTxoKL+olkqqDWiaYuiUiPf28dCS9hfZ7IDQwnPimsHjjBVY6CZhH64AUCQcr8gEHifLOD1TTpfWnJuxJxRZcEcD8KLXXKoq6r4DS35bF4l98+EbHM0oH58Vfp6djBvoHbGPgOkBAmUfpwZQZ7f2NAwoBYKoPVrP7qsOwFrs/pUhGdufdwSDeX6eAyY9YkyZs87LzBuBWGfR50vPfsgqHbCA04+xtQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=sRYFihJcc0jBfO41gIazsQGb/NVjCkb53slSeF7p5Ug=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=MU5YWazc
Subject: Re: [Buildroot] [PATCH] package/libssh: security bump to v0.11.2
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

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBlcmFsZSB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RA
YnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gRm9yIG1vcmUgaW5mb3JtYXRpb24gb24gdGhlIHJl
bGVhc2Ugc2VlOgogPiAgIC0gaHR0cHM6Ly9naXQubGlic3NoLm9yZy9wcm9qZWN0cy9saWJzc2gu
Z2l0L3RhZy8/aD1saWJzc2gtMC4xMS4yCgogPiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgdnVs
bmVyYWJpbGl0aWVzOgoKID4gLSBDVkUtMjAyNS00ODc4CgogPiAgICAgQSB2dWxuZXJhYmlsaXR5
IHdhcyBmb3VuZCBpbiBsaWJzc2gsIHdoZXJlIGFuIHVuaW5pdGlhbGl6ZWQgdmFyaWFibGUKID4g
ICAgIGV4aXN0cyB1bmRlciBjZXJ0YWluIGNvbmRpdGlvbnMgaW4gdGhlIHByaXZhdGVrZXlfZnJv
bV9maWxlKCkKID4gICAgIGZ1bmN0aW9uLiBUaGlzIGZsYXcgY2FuIGJlIHRyaWdnZXJlZCBpZiB0
aGUgZmlsZSBzcGVjaWZpZWQgYnkgdGhlCiA+ICAgICBmaWxlbmFtZSBkb2Vzbid0IGV4aXN0IGFu
ZCBtYXkgbGVhZCB0byBwb3NzaWJsZSBzaWduaW5nIGZhaWx1cmVzIG9yCiA+ICAgICBoZWFwIGNv
cnJ1cHRpb24uCgogPiBGb3IgbW9yZSBpbmZvcm1hdGlvbiwgc2VlOgogPiAgIC0gaHR0cHM6Ly93
d3cuY3ZlLm9yZy9DVkVSZWNvcmQ/aWQ9Q1ZFLTIwMjUtNDg3OAogPiAgIC0gaHR0cHM6Ly9naXQu
bGlic3NoLm9yZy9wcm9qZWN0cy9saWJzc2guZ2l0L2NvbW1pdC8/aWQ9Njk3NjUwY2FhOTdlYWY3
NjIzOTI0Yzc1ZjlmY2ZlYzZkZDQyM2NkMQogPiAgIC0gaHR0cHM6Ly9naXQubGlic3NoLm9yZy9w
cm9qZWN0cy9saWJzc2guZ2l0L2NvbW1pdC8/aWQ9YjM1ZWU4NzZhZGM5MmEyMDhkNDcxOTQ3NzJl
OTlmOWM3MWUwYmVkYgoKID4gLSBDVkUtMjAyNS01MzE4CgogPiAgICAgQSBmbGF3IHdhcyBmb3Vu
ZCBpbiB0aGUgbGlic3NoIGxpYnJhcnkuIEFuIG91dC1vZi1ib3VuZHMgcmVhZCBjYW4gYmUKID4g
ICAgIHRyaWdnZXJlZCBpbiB0aGUgc2Z0cF9oYW5kbGUgZnVuY3Rpb24gZHVlIHRvIGFuIGluY29y
cmVjdCBjb21wYXJpc29uCiA+ICAgICBjaGVjayB0aGF0IHBlcm1pdHMgdGhlIGZ1bmN0aW9uIHRv
IGFjY2VzcyBtZW1vcnkgYmV5b25kIHRoZSB2YWxpZAogPiAgICAgaGFuZGxlIGxpc3QgYW5kIHRv
IHJldHVybiBhbiBpbnZhbGlkIHBvaW50ZXIsIHdoaWNoIGlzIHVzZWQgaW4gZnVydGhlcgogPiAg
ICAgcHJvY2Vzc2luZy4gVGhpcyB2dWxuZXJhYmlsaXR5IGFsbG93cyBhbiBhdXRoZW50aWNhdGVk
IHJlbW90ZSBhdHRhY2tlcgogPiAgICAgdG8gcG90ZW50aWFsbHkgcmVhZCB1bmludGVuZGVkIG1l
bW9yeSByZWdpb25zLCBleHBvc2luZyBzZW5zaXRpdmUKID4gICAgIGluZm9ybWF0aW9uIG9yIGFm
ZmVjdCBzZXJ2aWNlIGJlaGF2aW9yLgoKID4gRm9yIG1vcmUgaW5mb3JtYXRpb24sIHNlZToKID4g
ICAtIGh0dHBzOi8vd3d3LmN2ZS5vcmcvQ1ZFUmVjb3JkP2lkPUNWRS0yMDI1LTUzMTgKID4gICAt
IGh0dHBzOi8vd3d3LmxpYnNzaC5vcmcvc2VjdXJpdHkvYWR2aXNvcmllcy9DVkUtMjAyNS01MzE4
LnR4dAoKID4gLSBDVkUtMjAyNS01MzUxCgogPiAgICAgQSBmbGF3IHdhcyBmb3VuZCBpbiB0aGUg
a2V5IGV4cG9ydCBmdW5jdGlvbmFsaXR5IG9mIGxpYnNzaC4gVGhlIGlzc3VlCiA+ICAgICBvY2N1
cnMgaW4gdGhlIGludGVybmFsIGZ1bmN0aW9uIHJlc3BvbnNpYmxlIGZvciBjb252ZXJ0aW5nCiA+
ICAgICBjcnlwdG9ncmFwaGljIGtleXMgaW50byBzZXJpYWxpemVkIGZvcm1hdHMuIER1cmluZyBl
cnJvciBoYW5kbGluZywgYQogPiAgICAgbWVtb3J5IHN0cnVjdHVyZSBpcyBmcmVlZCBidXQgbm90
IGNsZWFyZWQsIGxlYWRpbmcgdG8gYSBwb3RlbnRpYWwKID4gICAgIGRvdWJsZSBmcmVlIGlzc3Vl
IGlmIGFuIGFkZGl0aW9uYWwgZmFpbHVyZSBvY2N1cnMgbGF0ZXIgaW4gdGhlCiA+ICAgICBmdW5j
dGlvbi4gVGhpcyBjb25kaXRpb24gbWF5IHJlc3VsdCBpbiBoZWFwIGNvcnJ1cHRpb24gb3IgYXBw
bGljYXRpb24KID4gICAgIGluc3RhYmlsaXR5IGluIGxvdy1tZW1vcnkgc2NlbmFyaW9zLCBwb3Np
bmcgYSByaXNrIHRvIHN5c3RlbQogPiAgICAgcmVsaWFiaWxpdHkgd2hlcmUga2V5IGV4cG9ydCBv
cGVyYXRpb25zIGFyZSBwZXJmb3JtZWQuCgogPiBGb3IgbW9yZSBpbmZvcm1hdGlvbiwgc2VlOgog
PiAgIC0gaHR0cHM6Ly93d3cuY3ZlLm9yZy9DVkVSZWNvcmQ/aWQ9Q1ZFLTIwMjUtNTM1MQoKID4g
LSBDVkUtMjAyNS01MzcyCgogPiAgICAgQSBmbGF3IHdhcyBmb3VuZCBpbiBsaWJzc2ggdmVyc2lv
bnMgYnVpbHQgd2l0aCBPcGVuU1NMIHZlcnNpb25zIG9sZGVyCiA+ICAgICB0aGFuIDMuMCwgc3Bl
Y2lmaWNhbGx5IGluIHRoZSBzc2hfa2RmKCkgZnVuY3Rpb24gcmVzcG9uc2libGUgZm9yIGtleQog
PiAgICAgZGVyaXZhdGlvbi4gRHVlIHRvIGluY29uc2lzdGVudCBpbnRlcnByZXRhdGlvbiBvZiBy
ZXR1cm4gdmFsdWVzIHdoZXJlCiA+ICAgICBPcGVuU1NMIHVzZXMgMCB0byBpbmRpY2F0ZSBmYWls
dXJlIGFuZCBsaWJzc2ggdXNlcyAwIGZvciBzdWNjZXNz4oCUdGhlCiA+ICAgICBmdW5jdGlvbiBt
YXkgbWlzdGFrZW5seSByZXR1cm4gYSBzdWNjZXNzIHN0YXR1cyBldmVuIHdoZW4ga2V5CiA+ICAg
ICBkZXJpdmF0aW9uIGZhaWxzLiBUaGlzIHJlc3VsdHMgaW4gdW5pbml0aWFsaXplZCBjcnlwdG9n
cmFwaGljIGtleQogPiAgICAgYnVmZmVycyBiZWluZyB1c2VkIGluIHN1YnNlcXVlbnQgY29tbXVu
aWNhdGlvbiwgcG90ZW50aWFsbHkKID4gICAgIGNvbXByb21pc2luZyBTU0ggc2Vzc2lvbnMnIGNv
bmZpZGVudGlhbGl0eSwgaW50ZWdyaXR5LCBhbmQKID4gICAgIGF2YWlsYWJpbGl0eS4KCiA+IEZv
ciBtb3JlIGluZm9ybWF0aW9uLCBzZWU6CiA+ICAgLSBodHRwczovL3d3dy5jdmUub3JnL0NWRVJl
Y29yZD9pZD1DVkUtMjAyNS01MzcyCgogPiAtIENWRS0yMDI1LTU0NDkKCiA+ICAgICBBIGZsYXcg
d2FzIGZvdW5kIGluIHRoZSBTRlRQIHNlcnZlciBtZXNzYWdlIGRlY29kaW5nIGxvZ2ljIG9mIGxp
YnNzaC4KID4gICAgIFRoZSBpc3N1ZSBvY2N1cnMgZHVlIHRvIGFuIGluY29ycmVjdCBwYWNrZXQg
bGVuZ3RoIGNoZWNrIHRoYXQgYWxsb3dzCiA+ICAgICBhbiBpbnRlZ2VyIG92ZXJmbG93IHdoZW4g
aGFuZGxpbmcgbGFyZ2UgcGF5bG9hZCBzaXplcyBvbiAzMi1iaXQKID4gICAgIHN5c3RlbXMuIFRo
aXMgaXNzdWUgbGVhZHMgdG8gZmFpbGVkIG1lbW9yeSBhbGxvY2F0aW9uIGFuZCBjYXVzZXMgdGhl
CiA+ICAgICBzZXJ2ZXIgcHJvY2VzcyB0byBjcmFzaCwgcmVzdWx0aW5nIGluIGEgZGVuaWFsIG9m
IHNlcnZpY2UuCgogPiBGb3IgbW9yZSBpbmZvcm1hdGlvbiwgc2VlOgogPiAgIC0gaHR0cHM6Ly93
d3cuY3ZlLm9yZy9DVkVSZWNvcmQ/aWQ9Q1ZFLTIwMjUtNTQ0OQogPiAgIC0gaHR0cHM6Ly9naXQu
bGlic3NoLm9yZy9wcm9qZWN0cy9saWJzc2guZ2l0L2NvbW1pdC8/aD1zdGFibGUtMC4xMSZpZD0y
NjE2MTIxNzlmNzQwYmM2MmJhMzYzZDk4YjNiZDVlNTU3M2E4MTFmCiA+ICAgLSBodHRwczovL2dp
dC5saWJzc2gub3JnL3Byb2plY3RzL2xpYnNzaC5naXQvY29tbWl0Lz9oPXN0YWJsZS0wLjExJmlk
PTM0NDNhZWM5MDE4OGQ2YWFiOTI4MmFmYzgwYTgxZGY1YWI3MmM0ZGEKID4gICAtIGh0dHBzOi8v
Z2l0LmxpYnNzaC5vcmcvcHJvamVjdHMvbGlic3NoLmdpdC9jb21taXQvP2g9c3RhYmxlLTAuMTEm
aWQ9NTUwNGZmNDA1MTU0MzlhNWZlY2JiMTdkYTc0ODMwMDBjNGQxMmViNwogPiAgIC0gaHR0cHM6
Ly9naXQubGlic3NoLm9yZy9wcm9qZWN0cy9saWJzc2guZ2l0L2NvbW1pdC8/aD1zdGFibGUtMC4x
MSZpZD03ODQ4NWY0NDZhZjliMzBlMzdlYjhmMTc3YjgxOTQwNzEwZDU0NDk2CiA+ICAgLSBodHRw
czovL2dpdC5saWJzc2gub3JnL3Byb2plY3RzL2xpYnNzaC5naXQvY29tbWl0Lz9oPXN0YWJsZS0w
LjExJmlkPWY3OWVjNTFiN2ZkNTE5ZGJjNTczN2E3YmE4MjZlM2VkMDkzZjZjZWIKID4gICAtIGh0
dHBzOi8vd3d3LmxpYnNzaC5vcmcvc2VjdXJpdHkvYWR2aXNvcmllcy9DVkUtMjAyNS01NDQ5LnR4
dAoKID4gLSBDVkUtMjAyNS01OTg3CgogPiAgICAgQSBmbGF3IHdhcyBmb3VuZCBpbiBsaWJzc2gg
d2hlbiB1c2luZyB0aGUgQ2hhQ2hhMjAgY2lwaGVyIHdpdGggdGhlCiA+ICAgICBPcGVuU1NMIGxp
YnJhcnkuIElmIGFuIGF0dGFja2VyIG1hbmFnZXMgdG8gZXhoYXVzdCB0aGUgaGVhcCBzcGFjZSwK
ID4gICAgIHRoaXMgZXJyb3IgaXMgbm90IGRldGVjdGVkIGFuZCBtYXkgbGVhZCB0byBsaWJzc2gg
dXNpbmcgYSBwYXJ0aWFsbHkKID4gICAgIGluaXRpYWxpemVkIGNpcGhlciBjb250ZXh0LiBUaGlz
IG9jY3VycyBiZWNhdXNlIHRoZSBPcGVuU1NMIGVycm9yIGNvZGUKID4gICAgIHJldHVybmVkIGFs
aWFzZXMgd2l0aCB0aGUgU1NIX09LIGNvZGUsIHJlc3VsdGluZyBpbiBsaWJzc2ggbm90CiA+ICAg
ICBwcm9wZXJseSBkZXRlY3RpbmcgdGhlIGVycm9yIHJldHVybmVkIGJ5IHRoZSBPcGVuU1NMIGxp
YnJhcnkuIFRoaXMKID4gICAgIGlzc3VlIGNhbiBsZWFkIHRvIHVuZGVmaW5lZCBiZWhhdmlvciwg
aW5jbHVkaW5nIGNvbXByb21pc2VkIGRhdGEKID4gICAgIGNvbmZpZGVudGlhbGl0eSBhbmQgaW50
ZWdyaXR5IG9yIGNyYXNoZXMuCgogPiBGb3IgbW9yZSBpbmZvcm1hdGlvbiwgc2VlOgogPiAgIC0g
aHR0cHM6Ly93d3cuY3ZlLm9yZy9DVkVSZWNvcmQ/aWQ9Q1ZFLTIwMjUtNTk4NwoKID4gVGhlIHBh
dGNoIDAwMDEgaXMgcmVtb3ZlZCBhcyBpdCdzIG5vdyBpbmNsdWRlZCB1cHN0cmVhbSBzZWUgWzFd
LgoKID4gWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9saWJzc2gvbGlic3NoLW1pcnJvci8tL2NvbW1p
dC8wOTM0MzFmOTI5ZWM4YzM2ZDU5NDFiZmRjMGIyZDNiNjg0MDRhMmFhCiA+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4KCkNvbW1pdHRlZCwgdGhh
bmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
