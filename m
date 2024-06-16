Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91262C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 20:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB1F940105;
	Sun, 16 Jun 2024 20:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RG3ANrKCg9WV; Sun, 16 Jun 2024 20:27:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8554540153
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8554540153;
	Sun, 16 Jun 2024 20:27:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9DB61BF2BB
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 20:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9628940153
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 20:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMWxhnJQXfle for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 20:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0DDF040105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DDF040105
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DDF040105
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 20:27:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1DE4213F8A7;
 Sun, 16 Jun 2024 22:27:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Jun 2024 22:27:21 +0200
Date: Sun, 16 Jun 2024 22:27:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zm9KqRyiYxLxVfwy@landeda>
References: <cover.1718382114.git.yann.morin.1998@free.fr>
 <185f954c798e7d8e7e1400a8b39abe1b273e849b.1718382114.git.yann.morin.1998@free.fr>
 <CADvTj4p=iYe8wK4UMnvCSmsV02JesvY9BWQDZOfcbV_PeSAkNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4p=iYe8wK4UMnvCSmsV02JesvY9BWQDZOfcbV_PeSAkNQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718569644;
 bh=Gs24rgLd0+dfHAGLiU8LC1XJeFIms5l1DwZEW4QkWVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OtDqcjAA00Tmtvu98ij8qS3723Tm5cZEskCvmorGX1mYDSjQ2OwweTGyX1TeRNZSG
 mUjj1DAXD2g40SBsRBEymZU+Wg7LPGo4HPlrb6ud86ifoZsFjT1XGkHjEch/GU8s9H
 FPtfOatxATmpGplwiTWPV1yVvVKNKGM6mlvNulBYvjhMR6PS988hJP1vKBlrZ0/wtf
 3kOCh/jU2HNCgbikRj7OZpJLfpdWPV4pyOALlDtFA38ngOAzW843WB8i5UZFuIIARi
 htdSSKiTpqGgti3yViURl2a8q0upSLlS8kQiter1vpQKx2FiOb14KcHGeRd+zhojZm
 VCdZ7UyXL7L5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OtDqcjAA
Subject: Re: [Buildroot] [PATCH 2/6] utils/update-rust: add script to
 automatically update the rust version
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

SmFtZXMsIEFsbCwKClRoYW5rIHlvdSBmb3IgdGhlIGludGVyZXN0aW5nIHJldmlldyBhbmQgZm9y
IHRoZSB0ZXN0aW5nISA6LSkKCk9uIDIwMjQtMDYtMTYgMTI6MTQgLTA2MDAsIEphbWVzIEhpbGxp
YXJkIHNwYWtlIHRodXNseToKPiBPbiBGcmksIEp1biAxNCwgMjAyNCBhdCAxMDoyMuKAr0FNIFlh
bm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKWy0tU05JUC0tXQo+
ID4gQWRkIGEgaGVscGVyIHNjcmlwdCB0aGF0IGdlbmVyYXRlcyB0aGUgaGFzaCBmaWxlcyBhdXRv
bWF0aWNhbGx5LCBhbmQKPiA+IGFsc28gaXVwZGF0ZSB0aGUgX1ZFUlNJT04gaW4gdGhlIC5tay4K
Wy0tU05JUC0tXQo+ID4gZGlmZiAtLWdpdCBhL3V0aWxzL3VwZGF0ZS1ydXN0IGIvdXRpbHMvdXBk
YXRlLXJ1c3QKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNzU1Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi42
NmQ5M2I3MzAwCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi91dGlscy91cGRhdGUtcnVzdAo+
ID4gQEAgLTAsMCArMSwxNDcgQEAKPiA+ICsjIS91c3IvYmluL2VudiBweXRob24zCj4gPiArCj4g
PiAraW1wb3J0IGFyZ3BhcnNlCj4gPiAraW1wb3J0IG9zCj4gPiAraW1wb3J0IHJlcXVlc3RzCj4g
Cj4gVGhpcyBpc24ndCBwYXJ0IG9mIHB5dGhvbidzIHN0YW5kYXJkIGxpYnJhcnksIGlmIHdlIHdh
bnQgdGhpcyB0byB3b3JrIHdpdGhvdXQKPiBpbnN0YWxsaW5nIGV4dGVybmFsIHB5dGhvbiBwYWNr
YWdlcyB5b3Ugc2hvdWxkIHByb2JhYmx5IHVzZSB1cmxsaWIucmVxdWVzdAo+IGxpa2UgSSBkaWQg
aW4gbXkgb3JpZ2luYWwgdXRpbGl0eSBpbnN0ZWFkIG9mIHJlcXVlc3RzOgo+IGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjA5MjYyMDQ1MDUu
MTg3MDg2OS0xLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCgpyZXF1ZXN0cyBpcyB2ZXJ5IHdl
bGwta25vd24sIHdpZGVseSBhdmFpbGFibGUsIGFuZCB2ZXJ5IGVhc3kgdG8gdXNlLgpTbywgSSBi
ZWxpZXZlIGl0IGlzIGEgZ29vZCB0cmFkZS1vZmYgdG8gcmVxdWlyZSB0aGF0IHJlcXVlc3RzIGJl
Cmluc3RhbGxlZCBvbiB0aGUgaG9zdC4KClstLVNOSVAtLV0KPiA+ICsgICAgdmVyc2lvbl92YXIg
PSBvcy5wYXRoLmJhc2VuYW1lKG1rX2ZpbGUpWzotM10udXBwZXIoKS5yZXBsYWNlKCItIiwgIl8i
KSArICJfVkVSU0lPTiIKPiBNaWdodCBiZSBhIGxpdHRsZSBjbGVhbmVyIHRvIHVzZSBwYXRobGli
IHdoZXJlIHBvc3NpYmxlLgoKVGhpcyBpcyB0aGUgb25seSBwbGFjZSB3aGVyZSB3ZSBkZWFsIHdp
dGggcGF0aHMsIGFuZCB1c2luZyBwYXRobGliIHdvdWxkCm5vdCBtYWtlIHRoYXQgbGluZSBzbyBt
dWNoIGNsZWFuZXIgSSBiZWxpZXZlOgoKICAgIG9zLnBhdGguYmFzZW5hbWUobWtfZmlsZSlbOi0z
XS51cHBlcigpLnJlcGxhY2UoIi0iLCAiXyIpICsgIl9WRVJTSU9OIgogICAgcGF0aGxpYi5QYXRo
KG1rX2ZpbGUpLm5hbWVbOi0zXS51cHBlcigpLnJlcGxhY2UoIi0iLCAiXyIpICsgIl9WRVJTSU9O
IgoKT25lIGNoYXIgbG9uZ2VyLi4uIDstKQoKWy0tU05JUC0tXQo+ID4gKyAgICBhcmdzID0gcGFy
c2VyLnBhcnNlX2FyZ3MoKQo+ID4gKyAgICB1cGRhdGVfbWtfZmlsZSgicGFja2FnZS9ydXN0L3J1
c3QubWsiLCBhcmdzLnZlcnNpb24pCj4gPiArICAgIHVwZGF0ZV9ta19maWxlKCJwYWNrYWdlL3J1
c3QtYmluL3J1c3QtYmluLm1rIiwgYXJncy52ZXJzaW9uKQo+ID4gKyAgICBnZW5faGFzaF9maWxl
X3NyYygicGFja2FnZS9ydXN0L3J1c3QuaGFzaCIsIGFyZ3MudmVyc2lvbikKPiA+ICsgICAgZ2Vu
X2hhc2hfZmlsZV9iaW4oInBhY2thZ2UvcnVzdC1iaW4vcnVzdC1iaW4uaGFzaCIsIGFyZ3MudmVy
c2lvbikKPiAKPiBUaGUgZGVmYXVsdCBwYXRocyBzZXQgaGVyZSBicmVhayBpZiB5b3UgdHJ5IHRv
IHJ1biB0aGlzIHNjcmlwdCBmcm9tIHRoZQo+IHNjcmlwdHMgZGlyZWN0b3J5IGRpcmVjdGx5LiBJ
ZiB5b3UgY29tcHV0ZSBhbGwgdGhlIGRlZmF1bHRzIHJlbGF0aXZlIHRvCj4gUGF0aChfX2ZpbGVf
XykgdGhlbiB0aGlzIHNjcmlwdCBjYW4gYmUgcnVuIGZyb20gYW55IGRpcmVjdG9yeS4KCklzIHRo
YXQgcmVhbGx5IGltcG9ydGFudCB0aGF0IHRoZSBzY3JpcHQgY2FuIGJlIHJ1biBmcm9tIGFueXdo
ZXJlPyBJCmRvbid0IHRoaW5rIHNvLiBJIGNhbiBob3dldmVyIGFkZCBhIGNoZWNrIHRoYXQgdGhl
IGZpbGVzIHdlIHdhbnQgdG8KZ2VuZXJhdGUgYW5kIHR3ZWFrIGRvIGFscmVhZHkgZXhpc3QsIHRo
b3VnaDsgdGhhdCdzIGEgZ29vZCBwb2ludC4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
