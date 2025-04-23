Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59580C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 05:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80E40610AE;
	Wed, 23 Apr 2025 05:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1xRdLG20Opz; Wed, 23 Apr 2025 05:15:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A0BD610A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A0BD610A4;
	Wed, 23 Apr 2025 05:15:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E276619F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 05:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE54A40DBD
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 05:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOOekw_u9pum for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 05:15:08 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B8BC40DBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B8BC40DBC
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B8BC40DBC
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 05:15:06 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 2AD56BDE210A;
 Wed, 23 Apr 2025 07:15:03 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 23 Apr 2025 05:15:03 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: ct clmsn <ct.clmsn@gmail.com>
Cc: buildroot <buildroot@buildroot.org>
In-Reply-To: <CAN4Cwatp=c58JzpGD3SZS8692m0TtYd879jON2B7D_vn=PqJcA@mail.gmail.com>
References: <mailman.3.1745064001.375107.buildroot@buildroot.org>
 <6c0f8202ef17cd38940edb4e518a218d@umbiko.net>
 <CAN4Cwatp=c58JzpGD3SZS8692m0TtYd879jON2B7D_vn=PqJcA@mail.gmail.com>
Message-ID: <cf10fd11d7fe76e4614eb2a6d401fd4c@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1745385303; bh=JURfqKRZGvFeUMaQ5ZWXDj7SgG06kCOmcV49rRQwPLE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=AYjkRAPkIAn1a0RQp4UQc6QXYhltkWe9KzfqT25AodX/zJfZzmLku1bew38VEv14B
 sMITVpElUPs5O2dU0PphXsQxtcs6dQeuDMOWCCUPfraF/fmBnUjZrALs46EPSLn943
 BOFiUKTV/pRgXvK6RZSC5oaCJ0VsnUspH4l4Qi8c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=AYjkRAPk
Subject: Re: [Buildroot] kernel install from buildroot
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

SGkgQ2hyaXMsCgpbcmUtYWRkZWQgdGhlIG1haWxpbmcgbGlzdF0KCk9uIDIwMjUtMDQtMjIgMTQ6
MDcsIGN0IGNsbXNuIHdyb3RlOgo+IEFuZHJlYXMsCj4gCj4gVGhhbmtzIGZvciB0aGUgcHJvbXB0
IHJlc3BvbnNlOyBsb29rcyBsaWtlIEkgbWlzY29tbXVuaWNhdGVkIHRoZSAKPiBzaXR1YXRpb24u
Cj4gSSd2ZSBidWlsZCB0aGUga2VybmVsIG9uIHRoZSBudm1lLXNzZCB0aGF0IGlzIHJ1bm5pbmcg
dGhlIGtlcm5lbCBJJ20gCj4gaG9waW5nCj4gdG8gcmVwbGFjZSB3aXRoIHRoZSBidWlsZHJvb3Qg
Y29tcGlsZWQga2VybmVsLiBJJ20gZXhwZWN0aW5nIHRvIGp1c3QgCj4gY29weQo+IHRoZSBwb3J0
aW9ucyBmcm9tIC9ib290LCAvbGliL21vZHVsZXMsIGFuZCAvbGliL2Zpcm13YXJlIGZyb20gdGhl
Cj4gYGJ1aWxkcm9vdC9vdXRwdXQvdGFyZ2V0YCBkaXJlY3RvcnkgaW50byB0aGUgYXBwcm9wcmlh
dGUgcGxhY2VzIGluIHRoZQo+IG52bWUtc2RkJ3MgJy8nIChyb290KSBkaXJlY3RvcnkuIEhvcGUg
dGhpcyBjbGFyaWZpZXMgdGhlIHNpdHVhdGlvbi4KCmxpYi9maXJtd2FyZSBpcyBuaWNlLXRvLWhh
dmUsIGJ1dCBub3QgbWFuZGF0b3J5OyB5b3UgY2FuIHVwZGF0ZSAKbGludXgtZmlybXdhcmUgaW5k
ZXBlbmRlbnRseSBvZiB0aGUga2VybmVsLgoKRm9yIGEgbmV3IGtlcm5lbCwgeW91IG5lZWQgYnpJ
bWFnZSBhbmQgbGliL21vZHVsZXMvJCh1bmFtZSAtcikuIFRoZSAKbG9jYXRpb24gb2YgbGliL21v
ZHVsZXMgaXMgb24gdGhlIHJvb3QgcGFydGl0aW9uLiBEZXBlbmRpbmcgb24gdGhlIGJvb3QgCmNv
bmZpZ3VyYXRpb24sIGJ6SW1hZ2UgbWF5IHJlc2lkZSBpbiAvYm9vdCBvciBvbiBhIHNlcGFyYXRl
IGJvb3QgCnBhcnRpdGlvbi4gQ2hlY2sgeW91ciBncnViLmNmZy4KCklmIHlvdSBrZWVwIHRoZSBv
bGQga2VybmVsIGFuZCBjcmVhdGUgYW4gYWRkaXRpb25hbCBib290IGVudHJ5IGZvciB0aGUgCm5l
dyBvbmUsIHlvdSBoYXZlIGEgZmFsbGJhY2sgc29sdXRpb24uCgpLaW5kIHJlZ2FyZHMsCkFuZHJl
YXMKCj4gdi9yLAo+IENocmlzCj4gCj4gT24gU2F0LCBBcHIgMTksIDIwMjUgYXQgMTE6MjbigK9B
TSBBbmRyZWFzIFppZWdsZXIgPGJyMDE1QHVtYmlrby5uZXQ+IAo+IHdyb3RlOgo+IAo+PiBIaSBj
dCwKPj4gCj4+IE9uIDIwMjUtMDQtMTggMTY6MDMsIGN0IGNsbXNuIHdyb3RlOgo+PiA+Cj4+ID4g
SGVsbG8sCj4+ID4KPj4gPiBUaGlzIHNob3VsZCBiZSBhIHByZXR0eSB0cml2aWFsIHF1ZXN0aW9u
IG1vc3RseSBhc2tpbmcgdG8gbWFrZSBzdXJlIG15Cj4+ID4gYXNzdW1wdGlvbnMgYXJlIGNvcnJl
Y3QuCj4+ID4KPj4gPiBJJ20gZG9pbmcgaGFyZHdhcmUgdGVzdGluZyB3aXRoIGFuIFNCQy4gSSBo
YXZlIGFuIFNCQyB0aGF0IGlzCj4+ID4gY29uZmlndXJlZCB0bwo+PiA+IGJvb3QgZnJvbSBhbiBO
Vk1FLVNTRC4gQSB2ZW5kb3IgZW5jb3VyYWdlZCBtZSB0byB1c2UgYnVpbGRyb290IHRvCj4+ID4g
Y29tcGlsZSBhCj4+ID4gbmV3IGtlcm5lbC4gTXkgcHJlZmVyZW5jZSB3b3VsZCBiZSB0byBqdXN0
IHVwZGF0ZSB0aGUgZXhpc3RpbmcKPj4gPiBlbnZpcm9ubWVudAo+PiA+IG9uIG15IFNCQydzIE5W
TUUtU1NELgo+PiA+Cj4+ID4gR2l2ZW4gYGJ1aWxkcm9vdC9vdXRwdXQvdGFyZ2V0YCBjb250YWlu
cyB0aGUgY29tcGlsZWQgbGludXgga2VybmVsIHdpdGgKPj4gPiBmaXJtd2FyZSwgd2hpY2ggZGly
ZWN0b3JpZXMgb3IgZmlsZXMgc2hvdWxkIEkgYmUgY29uY2VybmVkIHdpdGggY29weWluZwo+PiA+
IG92ZXIgb24gdGhlIE5WTUUtU1NEPwo+PiAKPj4gQnVpbGRyb290IGNvcGllcyB0aGUgZmluYWwg
a2VybmVsIGltYWdlIHRvIG91dHB1dC9pbWFnZXMuIEluIGFkZGl0aW9uCj4+IHlvdSBuZWVkIHRo
ZSBjb250ZW50IG9mIG91dHB1dC90YXJnZXQvbGliL21vZHVsZXMuCj4+IAo+PiBLaW5kIHJlZ2Fy
ZHMsCj4+IEFuZHJlYXMKPj4gCj4+ID4gVGhhbmtzIGluIGFkdmFuY2UgZm9yIHRoZSBhc3Npc3Rh
bmNlIGFuZCBjb25maXJtaW5nIG15Cj4+ID4gYmFjay1vZi10aGUtZW52ZWxvcGUKPj4gPiB2ZXJp
ZmljYXRpb24uCj4+ID4KPj4gPiB2L3IsCj4+ID4gY3QKPj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
