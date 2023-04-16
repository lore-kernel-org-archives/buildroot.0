Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F1CC77B79
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 11:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58204841E3;
	Sun, 16 Apr 2023 11:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58204841E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L31UdESQGPsG; Sun, 16 Apr 2023 11:17:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CAE8840D9;
	Sun, 16 Apr 2023 11:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CAE8840D9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D83A91C40FE
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 11:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF459613A2
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 11:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF459613A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0YEFM3zj8cmH for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 11:17:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B595D61399
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B595D61399
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 11:17:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AC26A5FFA0;
 Sun, 16 Apr 2023 13:16:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Apr 2023 13:16:59 +0200
Date: Sun, 16 Apr 2023 13:16:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230416111659.GY2819@scaer>
References: <20220812101718.47491-1-fontaine.fabrice@gmail.com>
 <20230415212933.GU2819@scaer>
 <CADvTj4o4dPhWnKiQ0dvm6cJSqwY+ZtbyE0Gwhh8A5Nc5dKPYOQ@mail.gmail.com>
 <20230416082556.GW2819@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230416082556.GW2819@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681643825;
 bh=QygcnVn3+fkF/6gJaPhbcTDqUnQw3xJ+Cu09UFaeTVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DRo/JOtT2EgJ9+Uq5gYi4pZpy2vWYZ01FQJKgoH5/C7cXm30yfc+tEDjQBW/gQ4E5
 9yWtsNMFQOwfHjpbtu1PylnNGwHBjDc0oIOPRDowS/ybJkya8+SOOpVKPuPm36BHk2
 h/AIbeQX/D8TkcyOkVB/XhyV/VHSQQDEHrZmtjrYXRzX/cOCuMCQpAM/ihcypVI/O6
 MNeQRLcKAUCSxCmlhZ7C4654M6sVh8bWcEqjPQaaimeh3moVRT3zeWdoOl/SzZ6FGN
 Pz+42lD3EpKONFwfOiMoUyRmuyrcsFHf4qqmPatrdq2cFIjgthHF+qRXlvBUWXGn7+
 rZg8ta439VWcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DRo/JOtT
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/poppler: fix introspection build
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjMtMDQtMTYgMTA6MjUgKzAyMDAsIFlhbm4gRS4gTU9SSU4gc3Bh
a2UgdGh1c2x5Ogo+IE9uIDIwMjMtMDQtMTUgMjA6NDQgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiA+IE9uIFNhdCwgQXByIDE1LCAyMDIzIGF0IDM6MzDigK9QTSBZYW5uIEUu
IE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4gWy0tU05JUC0tXQo+ID4g
PiBIb3dldmVyLCBJIHdvdWxkIHJlYWxseSBsaWtlIHRvIHVuZGVyc3RhbmQgd2h5IHdlIGRvbid0
IGhhdmUgbW9yZQo+ID4gPiBwYWNrYWdlcyB0aGF0IGFyZSBicm9rZW4uIElzIGl0IGJlY2F1c2Ug
cG9wcGxlciBpcyB0aGUgb25seSBvbmUgd2l0aAo+ID4gPiBpbmNsdWRlIGRpcmVjdGl2ZXMgaW4g
aGlzIGdpciBmaWxlLCB3aGljaCBtZWFucyBpdCBuZWVkcyBhY2Nlc3MgdG8gdGhlCj4gPiA+IGlu
c3RhbGxlZCBnaXIgZmlsZXMgZnJvbSBvdGhlciBwYWNrYWdlcyAodGhvc2UgZnJvbSBnb2kpPwo+
ID4gPgo+ID4gPiBPciBpcyBpdCBiZWNhdXNlIGl0IGlzIHRoZSBvbmx5IG9uZSB0aGF0IGFscmVh
ZHkgcGFzc2VzIGFuIGV4cGxpY2l0Cj4gPiA+IC0taW5jbHVkZWRpciBvcHRpb24gdG8gZy1pci1j
b21waWxlciwgYW5kIHRoYXQgZGlzYWJsZXMgc2VhcmNoaW5nIHRoZQo+ID4gPiBzdGFuZGFyZCBk
aXJlY3Rvcnk/Cj4gPiBGcm9tIHRoZSBsb29rcyBvZiBpdCBtb3N0IG9mIG91ciBwYWNrYWdlcyB3
aXRoIGEgZ29iamVjdC1pbnRyb3NwZWN0aW9uCj4gPiBkZXBlbmRlbmN5IGFyZSBtZXNvbiBiYXNl
ZCB3aGljaCB1c2UgdGhlIG5hdGl2ZSBtZXNvbiBpbnRlZ3JhdGlvbi4KPiBBaCwgZ29vZCBwb2lu
dCwgdGhhdCB3b3VsZCBleHBsYWluLgoKVW5mb3J0dWFudGVseSwgdGhhdCBhc3N1bXB0aW9uIGlz
IHdyb25nOiBncmFuaXRlIHVzZXMgbWVzb24sIGJ1dCBmYWlscwppbiB0aGUgc2FtZSB3YXk6Cgog
ICAgWzUxLzI3NV0gR2VuZXJhdGluZyBsaWIvR3Jhbml0ZS0xLjAudHlwZWxpYiB3aXRoIGEgY3Vz
dG9tIGNvbW1hbmQKICAgIEZBSUxFRDogbGliL0dyYW5pdGUtMS4wLnR5cGVsaWJpCiAgICAvaG9t
ZS95bW9yaW4vZGV2L2J1aWxkcm9vdC9PL21hc3Rlci9wZXItcGFja2FnZS9ncmFuaXRlL2hvc3Qv
cmlzY3YzMi1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvdXNyL2Jpbi9nLWlyLWNvbXBpbGVy
IC0tc2hhcmVkLWxpYnJhcnkgbGliZ3Jhbml0ZS5zby42LjAuMCAtLW91dHB1dCBsaWIvR3Jhbml0
ZS0xLjAudHlwZWxpYiAvaG9tZS95bW9yaW4vZGV2L2J1aWxkcm9vdC9PL21hc3Rlci9idWlsZC9n
cmFuaXRlLTYuMC4wL2J1aWxkL2xpYi9HcmFuaXRlLTEuMC5naXIKICAgIENvdWxkIG5vdCBmaW5k
IEdJUiBmaWxlICdHTGliLTIuMC5naXInOyBjaGVjayBYREdfREFUQV9ESVJTIG9yIHVzZSAtLWlu
Y2x1ZGVkaXIKICAgIGVycm9yIHBhcnNpbmcgZmlsZSAvaG9tZS95bW9yaW4vZGV2L2J1aWxkcm9v
dC9PL21hc3Rlci9idWlsZC9ncmFuaXRlLTYuMC4wL2J1aWxkL2xpYi9HcmFuaXRlLTEuMC5naXI6
CiAgICBGYWlsZWQgdG8gcGFyc2UgaW5jbHVkZWQgZ2lyIEdMaWItMi4wCiAgICBJZiB0aGUgYWJv
dmUgZXJyb3IgbWVzc2FnZSBpcyBhYm91dCBtaXNzaW5nIC5zbyBsaWJyYXJpZXMsIHRoZW4gc2V0
dGluZyB1cCBHSVJfRVhUUkFfTElCU19QQVRIIGluIHRoZSAubWsgZmlsZSBzaG91bGQgaGVscC4K
ICAgIFR5cGljYWxseSBsaWtlIHRoaXM6IFBLR19NQUtFX0VOViArPSBHSVJfRVhUUkFfTElCU19Q
QVRIPSIkKEBEKS8ubGlicyIKICAgIG5pbmphOiBidWlsZCBzdG9wcGVkOiBzdWJjb21tYW5kIGZh
aWxlZC4KICAgIG1ha2VbMV06ICoqKiBbcGFja2FnZS9wa2ctZ2VuZXJpYy5tazoyOTM6IC9ob21l
L3ltb3Jpbi9kZXYvYnVpbGRyb290L08vbWFzdGVyL2J1aWxkL2dyYW5pdGUtNi4wLjAvLnN0YW1w
X2J1aWx0XSBFcnJvciAxCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJc
IEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwg
U29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAg
ICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1Qg
ICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3Jn
LyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
