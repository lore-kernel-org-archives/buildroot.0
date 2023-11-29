Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277A5C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 06:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1D41401A1;
	Wed, 29 Nov 2023 06:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1D41401A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0oAY9AwFpFea; Wed, 29 Nov 2023 06:42:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 820CC401F1;
	Wed, 29 Nov 2023 06:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 820CC401F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 84D261BF32D
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 06:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DA4A60BB2
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 06:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DA4A60BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id No8wpl_ugFyg for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 06:42:35 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BFE260BA5
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 06:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BFE260BA5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:c5a3:8084:a241:9d13])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B010113F89C;
 Wed, 29 Nov 2023 07:42:29 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 29 Nov 2023 07:42:29 +0100
Date: Wed, 29 Nov 2023 07:42:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ralf Dragon <hypnotoad@lindra.de>
Message-ID: <20231129064229.GI3177259@scaer>
References: <20231123174105.2435757-1-hypnotoad@lindra.de>
 <20231125220439.GQ3177259@scaer>
 <f0b3caa4-43ce-4f0e-a855-9726f1944644@lindra.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0b3caa4-43ce-4f0e-a855-9726f1944644@lindra.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701240151;
 bh=pU/7g0xtEF8vN/N/05Yn3c83CISYvoccQv49lhPfz18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DLYHPzgM6879LSZaSrYP/tUA8XxieCrUX7g5674BaG+Gu4crFkz3VhNnNcaW7+eIf
 +qVZYfrcZB59ZaLgGLUR+pJ3AwszVzUn2ziF0nwkcJd/XaInbRxYR+9lAhudfk6wNC
 djgGyJlL9o/jb+2VD7S3Z+EeEq1n6ZoovnRj6gt/Z0ccwIfqtXeMzFl7y1WCAIu77q
 jxDU2pmzL8yUEBXSt9A5/u/idnwIu8sBo1kGyi/ckAcv6FcNbhO75rVCweql6iIxs0
 cYs6mRZKV0wM2Li6l+l3eflrTBo3I8cOrYHr6HuQ2ZFrTRENyMwVGng0ecVQF5T+hy
 L/NZpNwL2sZ1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DLYHPzgM
Subject: Re: [Buildroot] [PATCH 1/1] python-sip: fix compile error
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmFsZiwgQWxsLAoKT24gMjAyMy0xMS0yNyAyMjoxNCArMDEwMCwgUmFsZiBEcmFnb24gc3Bha2Ug
dGh1c2x5Ogo+IHRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjay4gQXMgeW91IG1pZ2h0IGhhdmUg
bm90aWNlZCwgdGhpcyBpcyBteQo+IGZpcnN0IHN1Ym1pc3Npb24gdG8gYnVpbGRyb290IGFuZCBJ
IGhhZCBubyBjb250YWN0IHNvIGZhciB0byBzdWNoCj4gYSBjb250cmlidXRpb24gcHJvY2Vzcy4g
U28gZmVlZGJhY2sgaXMgYXBwcmVjaWF0ZWQuCgpObyB3b3JyaWVzLCB5b3UgZGlkIHF1aXRlIGdv
b2QhCgo+ICAgSGVyZSwgeW91J2Qgd2FudCB0byBleHBsYWluIHdoeSBpdCBub3cgZmFpbHMsIHNv
IHRoYXQgd2UgY2FuIGFzc2Vzcwo+ICAgd2hldGhlciB3ZSBuZWVkIHRvIGJhY2twb3J0IHRoZSBm
aXggdG8gbWFpbnRhaW5hbmNlIGJyYW5jaGVzLgo+IAo+ICAgU28sIHNvbWV0aGluZyBhbG9uZyB0
aGUgbGluZXMgb2Y6Cj4gCj4gICDCoMKgwqDCoCBzaXBsaWI6IGZpeCBidWlsZCB3aXRoIHB5dGhv
biA+PSAzLjExCj4gCj4gICDCoMKgwqDCoCBXaXRoIHB5dGhvbiAzLjExLCB0aGUgUHlGcmFtZU9i
amVjdCBzdHJ1Y3R1cmUgbWVtYmVycyBoYXZlIGJlZW4KPiAgIMKgwqDCoMKgIHJlbW92ZWQgZnJv
bSB0aGUgcHVibGljIEMgQVBJOgo+IAo+ICAgwqDCoMKgwqDCoMKgwqDCoCBbMV1odHRwczovL2Rv
Y3MucHl0aG9uLm9yZy8zLjExL3doYXRzbmV3LzMuMTEuaHRtbCN3aGF0c25ldzMxMS1jLWFwaS1w
b3J0aW5nCj4gICDCoMKgwqDCoMKgwqDCoMKgIFsyXWh0dHBzOi8vZG9jcy5weXRob24ub3JnLzMu
MTEvd2hhdHNuZXcvMy4xMS5odG1sI3B5ZnJhbWVvYmplY3QtMy0xMS1oaWRpbmcKPiAKPiAgIMKg
wqDCoMKgIFNvLCB1c2UgdGhlIHByb3BlciBvYmplY3QgdHlwZSB0aGF0IGNhbiBzdG9yZSBhbiBh
Y3R1YWwKPiAgIMKgwqDCoMKgIFB5RnJhbWVPYmplY3QuCj4gCj4gWW91ciBkZXNjcmlwdGlvbiBp
dCBpcyBhbHJlYWR5IHF1aXRlIGdvb2Qg8J+Zgi4gSSB3aWxsIGNoZWNrIGFnYWluLgoKVGhhbmtz
LCBpdCB3b3VsZCBiZSBnb29kIHRvIGJlIHN1cmUgd2h5IHRoZSBjaGFuZ2UgaXMgbmVlZGVkLgoK
PiBJIGhhdmUgdG8gc2F5LCB0aGUgcGF0Y2ggY2hlY2tlciBjb21tYW5kIHBhc3NlZCBmb3IgbWUs
IGJ1dCBJIHdhcwo+IHByb2JhYmx5IGluIHRoZSBsb25nLXRlcm0gYnJhbmNoIGF0IHRoYXQgdGlt
ZS4KClVzdWFsbHksIHdlIHJ1biB0aGUgdG9vbGluZyBpbiBvdXIgcmVmZXJlbmNlIGVudmlyb25t
ZW50LCB3aGljaAp1dGlscy9kb2NrZXItcnVuIHVzZXMsIHNvIHRoYXQgeW91IGFyZSBzdXJlIHRv
IHVzZSB0aGUgcHJvcGVyIHZlcnNpb25zCm9mIHRoZSBjaGVja2Vycy4KCj4gICBXZSBhbHNvIHRy
eSBoYXJkIHRvIHB1c2ggcGF0Y2hlcyB1cHN0cmVhbSBzbyB0aGF0IHdlIGRvIG5vdCBoYXZlIHRv
Cj4gICBjYXJyeSB0aGVtIGluZGVmaW5pdGVseS4gUGxlYXNlIHRyeSBhbmQgc3VibWl0IHRoYXQg
cGF0Y2ggdG8gdGhlIFNJUAo+ICAgcHJvamVjdDoKPiAgIMKgwqDCoMKgIFszXWh0dHBzOi8vcml2
ZXJiYW5rY29tcHV0aW5nLmNvbS9zdXBwb3J0L2xpc3RzCj4gCj4gVGhleSB3cml0ZSB0aGF0IHNp
cGxpYiBpcyBubyBsb25nZXIgc3VwcG9ydGVkIGFuZCB0aGF0IDQuMTkuMjUgaXMgdGhlIGxhc3Qg
dmVyc2lvbjoKPiBbNF1odHRwczovL3JpdmVyYmFua2NvbXB1dGluZy5jb20vc29mdHdhcmUvc2lw
L2Rvd25sb2FkIC4gVGhhdCdzIHdoeSBJIGRpZCBub3QgY29uc2lkZXIgYXNraW5nIHRoZXJlLgoK
V2hhdCBJIHJlYWQgaXMgdGhhdCB2ZXJzaW9uIDQgaXMgbm8gbG9uZ2VyIG1haW50YWluZWQ6Cgog
ICAgU0lQIHY0IGlzIG5vIGxvbmdlciBzdXBwb3J0ZWQuIFRoaXMgaXMgdGhlIGxhc3QgcmVsZWFz
ZS4KClRoZSByZXBvc2l0b3J5IGlzIHN0aWxsIGdldHRpbmcgYSBsb3Qgb2YgYXR0ZW50aW9uLCBh
bmQgdGhleSB0YWdnZWQKNi43LjEyIGxhc3Qgb2N0b2Jlciwgd2hpY2ggaXMgcHJlc3R0eSByZWNl
bnQuIEFsc28sIGl0IGxvb2tzIGxpa2UgaXQgaXMKbm93IGEgcHJvcGVyIHB5dGhvbiBwYWNrYWdl
LCBzbyB3ZSBzaG91bGQgYmUgYWJsZSB0byBtaWdyYXRlIHB5dGhvbi1zaXAKdG8gdGhlIHB5dGhv
bi1wYWNrYWdlIGluZnJhIG5vdywgYW5kIGRyb3Agb3VyIGN1c3RvbSBfQ09ORklHVVJFX0NNRFMs
Cl9CVUlMRF9DTURTLCBhbmQgX0lOU1RMQUxfQ01EUyBhbHRvZ2V0aGVyLgoKT2YgY291cnNlLCBw
eXF0NSwgdGhlIHNvbGUgdXNlciBvZiBweXRob24tc2lwLCBtYXkgc3RpbGwgcmVxdWlyZSBzaXAg
djQsCndoaWNoIHdvdWxkIHByZWNsdWRlIHVwZGF0aW5nLi4uIDotKAoKQ291bGQgeW91IGxvb2sg
aW50byB0aGF0PwoKPiAgICAgK0luZGV4OiBob3N0LXB5dGhvbi1zaXAtNC4xOS4yNS9zaXBsaWIv
c2lwLmgKPiAgICAgKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KPiAKPiAgIFdoYXQgZGlmZiBmb3JuYXQgaXMgdGhhdD8g
V2UgdXN1YWxseSBoYXZlIHBsYWluIGRpZmYsIG9yIGdpdC1mb3JtYXR0ZWQKPiAgIHBhdGNoZXMu
Cj4gCj4gSSB0aGluayBpdCBpcyB0aGUgb3V0cHV0IGZyb20gImdpdCBkaWZmIiBwaXBlZCBpbnRv
IHRoZSBmaWxlLgoKVGhlIG9mZmljaWFsIHJlcG9zaXRvcnkgaXMgdXNpbmcgbWVyY3VyaWFsLCBu
b3QgZ2l0LCBhbmQgdGhhdCBkb2VzIG5vdApsb29rIGxpa2UgYW4gaGcgZGlmZiBlaXRoZXIuLi4K
ClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ICAgQ2FuIHlvdSBsb29rIGludG8gcmV3b3JraW5n
IHRoaXMgcGF0Y2ggb2YgeW91cnMsIHBsZWFzZT8KPiAKPiBXaWxsIGRvLgo+IAo+IEJlc3QsCj4g
Cj4gUmFsZgo+IAo+IExpbmtzOgo+IDEuIGh0dHBzOi8vZG9jcy5weXRob24ub3JnLzMuMTEvd2hh
dHNuZXcvMy4xMS5odG1sI3doYXRzbmV3MzExLWMtYXBpLXBvcnRpbmcKPiAyLiBodHRwczovL2Rv
Y3MucHl0aG9uLm9yZy8zLjExL3doYXRzbmV3LzMuMTEuaHRtbCNweWZyYW1lb2JqZWN0LTMtMTEt
aGlkaW5nCj4gMy4gaHR0cHM6Ly9yaXZlcmJhbmtjb21wdXRpbmcuY29tL3N1cHBvcnQvbGlzdHMK
PiA0LiBodHRwczovL3JpdmVyYmFua2NvbXB1dGluZy5jb20vc29mdHdhcmUvc2lwL2Rvd25sb2Fk
Cgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgoKLS0gCi4tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVk
IHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYg
MDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAg
ICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFH
QUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdl
ZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8
CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
