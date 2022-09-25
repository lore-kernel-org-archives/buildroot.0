Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C233C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 13:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB027404DD;
	Sun, 25 Sep 2022 13:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB027404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQE6CSyJzQtI; Sun, 25 Sep 2022 13:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8C7C404C1;
	Sun, 25 Sep 2022 13:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8C7C404C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EED891BF2AA
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 13:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C808581000
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 13:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C808581000
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hSbHymzMPTBv for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 13:38:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 971C380EE3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 971C380EE3
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 13:38:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:139f:51c2:7bd0:4f35])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3F4E413F87C;
 Sun, 25 Sep 2022 15:38:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Sep 2022 15:38:28 +0200
Date: Sun, 25 Sep 2022 15:38:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Message-ID: <20220925133828.GZ1419013@scaer>
References: <20220924214110.3490682-1-clg@kaod.org>
 <20220925124055.GY1419013@scaer>
 <eec913f5-2209-546e-5956-1cafd73bea7e@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eec913f5-2209-546e-5956-1cafd73bea7e@kaod.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664113112;
 bh=qSRL3f8dVcZbmmNJuy/xu2Izz9Xva+9KDmeubyHJGLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nlr8pOScyusTUg/72UJ7BSobGVqrL8eHfI5SNFJ9PS/DqAWfbFgdktDUP4NZBYMoq
 njIVQad6EnH5rhzRD6NPkdFrZW1K7dIscOBtGor75TWLLZ1izN63PFoebANMyueGTd
 iTpSzAgEJmytXSsj+o2sFw95kd/+PMylWdUiwk2ilgr+6ibfzPDov1wKhs5ZLRPFen
 AzJYOJvjC/pZZRHtLvxQk+1z1X0Hq87bAIisl1irXDsK29I+KWuVuWaKkKikDe/eVT
 N2T3COawsxb+E4Kj8lYrITmkaV2N6PClDSBhF1ejhEw7fIJmYBG4eHYgpMt9JjdqFM
 mY5Q2rmh3ok7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nlr8pOSc
Subject: Re: [Buildroot] [PATCH] Revert "configs/qemu_ppc64*: downgrade
 binutils to 2.36.1"
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
Cc: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q8OpZHJpYywgQWxsLAoKT24gMjAyMi0wOS0yNSAxNToyMCArMDIwMCwgQ8OpZHJpYyBMZSBHb2F0
ZXIgc3Bha2UgdGh1c2x5Ogo+IE9uIDkvMjUvMjIgMTQ6NDAsIFlhbm4gRS4gTU9SSU4gd3JvdGU6
Cj4gPk9uIDIwMjItMDktMjQgMjM6NDEgKzAyMDAsIEPDqWRyaWMgTGUgR29hdGVyIHNwYWtlIHRo
dXNseToKPiA+PlRoaXMgcmV2ZXJ0cyBjb21taXQgMWUyZmU4NjBmM2EyNjFmYzg3NzU5MWMwNTY4
MDhkNmZiMzBlMjVkNC4KPiA+VGhpcyBpcyBub3QgcmVhbGx5IGEgcmV2ZXJ0LAo+IFRoaXMgaXMg
dGhlIHJlc3VsdCBvZiB0aGUgY29tbWFuZCA6Cj4gICBnaXQgcmV2ZXJ0IC1zIDFlMmZlODYwZjNh
Mgo+IFNvIGl0IGlzICJyZWFsbHkiIGEgcmV2ZXJ0IDopCgpZZXMsIGl0IGlzIGEgZ2l0LXJldmVy
dCwgaS5lLiBpdHkgaXMgYSB0Y2huaWNhbCByZXZlcnQuCgpIb3dldmVyLCBhIGdpdC1yZXZlcnQg
cmVhbGx5IG1lYW5zICJ0aGF0IGNvbW1pdCB3YXMgd3JvbmcgYmFjayBhdCB0aGUKdGltZSwgdW5k
byBpdCIuIEJ1dCBpbiB0aGlzIGNhc2UsIHRoZSBjb21taXQgd2FzIGNvcnJlY3QsIHNvIHdlIGRv
IG5vdAp3YW50IHRvIGdpdC1yZXZlcnQgaXQ7IGF0IGxlYXN0LCB3ZSBkbyBub3Qgd2FudCB0byBp
bnNjcmliZSBpbiBvdXIgZ2l0CmxvZyB0aGF0IHRoaXMgaXMgYSByZXZlcnQuCgpJbnN0ZWFkLCB0
aGUgY29uZGl0aW9ucyBhcm91bmQgaGF2ZSBjaGFuZ2VkLCB3aGljaCBhbGxvd3MgdXNpbmcgdGhl
IG9sZAoiY29kZSIgKGRlZmNvbmZpZyB2YWx1ZXMgaW4gdGhpcyBjYXNlKSBhZ2Fpbi4KCj4gPnNv
IEkgZGlkIHNvbWUgY2hhbmdlczoKPiA+ICAgLSBleHBsaWN0aWx5IGZvcmNlIGJpbnV0aWxzIDIu
MzgKPiBJIGd1ZXNzIHRoaXMgaXMgdG8gbWFrZSBzdXJlIHRoYXQgMi4zNyBpcyBub3Qgc2VsZWN0
ZWQgYnV0IHdoZW4KPiB0aGUgY3VycmVudCAyLjM4IGlzIGRlcHJlY2F0ZWQsIGFsbCBkZWZjb25m
aWdzIHdpbGwgcmVxdWlyZSBhbgo+IHVwZGF0ZS4gU2luY2UgdGhlIGRlZmF1bHQgd29ya3MgZmlu
ZSwgSSBkb24ndCB0aGluayBpdCBpcyB3b3J0aAo+IGFkZGluZyBhbiBleHRyYSBkZXBlbmRlbmN5
ICh1bnRpbCBuZXh0IGJyZWFrYWdlKSBvciB3ZSBjb3VsZCB1c2UKPiBhICEyLjM3IGRlcGVuZGVu
Y3kgaW5zdGVhZC4gSSBhbSBub3Qgc3VyZSBpZiB0aGlzIGlzIHBvc3NpYmxlCj4gdGhvdWdoLgoK
V2hlbiB3ZSBkcm9wIDIuMzgsIGhhdmluZyBpdCByZWZlcmVuY2VkIGluIHRoZSBkZWZjb25maWcg
d2lsbCBoZWxwIHVzCm5vdGljZSB0aGF0IHNvbWV0aGluZyBtdXN0IGJlIHRha2VuIGNhcmUgb2Ys
IGFuZCBsb29raW5nIGF0IHRoZSBnaXQgbG9nCndpbGwgaGVscCB1cyB0YWtlIGEgZGVjaXNpb24g
KGtlZXAgdGhlIHZlcnNpb24gYXJvdW5kLCBidW1wIHRoZQpkZWZjb25maWcsIGV0Yy4uKQoKSW4g
dGhlIGRlZmNvbmZpZ3MsIHdlIGRvIG5vdCB3YW50IHRvIHVzZSB0aGUgZGVmYXVsdHM7IHdlIHdh
bnQgdG8gdXNlCmV4cGxpY2l0IHZlcnNpb25zLgoKR3JhbnRlZCwgdGhpcyBpcyBub3QgYWx3YXlz
IGVuZm9yY2VkLCBhbmQgdGhlIGRlZmNvbmZpZ3Mgd2UgaGF2ZSBhcmUgb2YKdmFyaWFibGUgbGV2
ZWwgb2YgdXNpbmcgZXhwbGljaXQgdmVyc2lvbnMgZXZlbiBpZiB0aGUgZGVmYXVsdDsgdGhpcyBp
cwptb3N0bHkgdGhlIGNhc2UgZm9yIHRoZSBrZXJuZWwgaGVhZGVycywgdGhvdWdoLgoKUmVnYXJk
cywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUu
IE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycg
Y29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwg
LyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1B
SUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
