Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA917C3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 16:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81A5A80D5E;
	Wed, 31 Jul 2024 16:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAlNpSlZyPFT; Wed, 31 Jul 2024 16:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61FD080DB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61FD080DB6;
	Wed, 31 Jul 2024 16:35:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 772351BF3D8
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64B7E405CA
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Av2MF9D2Torg for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 16:35:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 88C7F40259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88C7F40259
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88C7F40259
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 16:35:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C118C0004;
 Wed, 31 Jul 2024 16:35:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sZCIB-005In6-3C;
 Wed, 31 Jul 2024 18:35:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexis =?utf-8?Q?Lothor=C3=A9?= via buildroot <buildroot@buildroot.org>
References: <20240313224610.2743219-1-alexis.lothore@bootlin.com>
 <20240313224610.2743219-2-alexis.lothore@bootlin.com>
Date: Wed, 31 Jul 2024 18:35:11 +0200
In-Reply-To: <20240313224610.2743219-2-alexis.lothore@bootlin.com> ("Alexis
 =?utf-8?Q?Lothor=C3=A9?= via buildroot"'s message of "Wed, 13 Mar 2024
 23:46:09 +0100")
Message-ID: <87cymttt8g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/qt5/qt5webkit: fix
 JavaScriptCore parser error
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFsZXhpcyIgPT0gQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBGcm9tOiBBbGV4aXMgTG90aG9yw6kgPGFsZXhp
cy5sb3Rob3JlQGJvb3RsaW4uY29tPgogPiBxdDV3ZWJraXQgYnVpbGQgY3VycmVudGx5IGZhaWxz
IHdpdGggdGhlIGZvbGxvd2luZyBlcnJvcjoKCiA+IFsuLi5dIHBhcnNlci5yYjo1ODc6aW4gYGJs
b2NrIGluIHBhcnNlU2VxdWVuY2UnOiB1bmRlZmluZWQgbWV0aG9kIGA9ficgZm9yIGFuIGluc3Rh
bmNlIG9mIEFubm90YXRpb24gKE5vTWV0aG9kRXJyb3IpCiA+ICAgZnJvbSA8aW50ZXJuYWw6a2Vy
bmVsPjoxODc6aW4gYGxvb3AnCiA+ICAgZnJvbSAvaG9tZS9hbGV4aXMvc3JjL2J1aWxkcm9vdF9t
aW4vb3V0cHV0L2J1aWxkL3F0NXdlYmtpdC01LjIxMi4wLWFscGhhNC9Tb3VyY2UvSmF2YVNjcmlw
dENvcmUvb2ZmbGluZWFzbS9wYXJzZXIucmI6NTg2OmluIGBwYXJzZVNlcXVlbmNlJwogPiAgIGZy
b20gL2hvbWUvYWxleGlzL3NyYy9idWlsZHJvb3RfbWluL291dHB1dC9idWlsZC9xdDV3ZWJraXQt
NS4yMTIuMC1hbHBoYTQvU291cmNlL0phdmFTY3JpcHRDb3JlL29mZmxpbmVhc20vcGFyc2VyLnJi
OjY1NDppbiBgYmxvY2sgaW4gcGFyc2VTZXF1ZW5jZScKID4gICBmcm9tIDxpbnRlcm5hbDprZXJu
ZWw+OjE4NzppbiBgbG9vcCcKID4gICBmcm9tIC9ob21lL2FsZXhpcy9zcmMvYnVpbGRyb290X21p
bi9vdXRwdXQvYnVpbGQvcXQ1d2Via2l0LTUuMjEyLjAtYWxwaGE0L1NvdXJjZS9KYXZhU2NyaXB0
Q29yZS9vZmZsaW5lYXNtL3BhcnNlci5yYjo1ODY6aW4gYHBhcnNlU2VxdWVuY2UnCiA+ICAgZnJv
bSAvaG9tZS9hbGV4aXMvc3JjL2J1aWxkcm9vdF9taW4vb3V0cHV0L2J1aWxkL3F0NXdlYmtpdC01
LjIxMi4wLWFscGhhNC9Tb3VyY2UvSmF2YVNjcmlwdENvcmUvb2ZmbGluZWFzbS9wYXJzZXIucmI6
ODE0OmluIGBwYXJzZURhdGEnCiA+ICAgZnJvbSAvaG9tZS9hbGV4aXMvc3JjL2J1aWxkcm9vdF9t
aW4vb3V0cHV0L2J1aWxkL3F0NXdlYmtpdC01LjIxMi4wLWFscGhhNC9Tb3VyY2UvSmF2YVNjcmlw
dENvcmUvb2ZmbGluZWFzbS9wYXJzZXIucmI6ODE4OmluIGBwYXJzZScKID4gICBmcm9tIC9ob21l
L2FsZXhpcy9zcmMvYnVpbGRyb290X21pbi9vdXRwdXQvYnVpbGQvcXQ1d2Via2l0LTUuMjEyLjAt
YWxwaGE0L1NvdXJjZS9KYXZhU2NyaXB0Q29yZS9vZmZsaW5lYXNtL3BhcnNlci5yYjo3ODA6aW4g
YGJsb2NrIGluIHBhcnNlU2VxdWVuY2UnCiA+ICAgZnJvbSA8aW50ZXJuYWw6a2VybmVsPjoxODc6
aW4gYGxvb3AnCiA+ICAgZnJvbSAvaG9tZS9hbGV4aXMvc3JjL2J1aWxkcm9vdF9taW4vb3V0cHV0
L2J1aWxkL3F0NXdlYmtpdC01LjIxMi4wLWFscGhhNC9Tb3VyY2UvSmF2YVNjcmlwdENvcmUvb2Zm
bGluZWFzbS9wYXJzZXIucmI6NTg2OmluIGBwYXJzZVNlcXVlbmNlJwogPiAgIGZyb20gL2hvbWUv
YWxleGlzL3NyYy9idWlsZHJvb3RfbWluL291dHB1dC9idWlsZC9xdDV3ZWJraXQtNS4yMTIuMC1h
bHBoYTQvU291cmNlL0phdmFTY3JpcHRDb3JlL29mZmxpbmVhc20vcGFyc2VyLnJiOjYyNTppbiBg
YmxvY2sgaW4gcGFyc2VTZXF1ZW5jZScKID4gICBmcm9tIDxpbnRlcm5hbDprZXJuZWw+OjE4Nzpp
biBgbG9vcCcKID4gICBmcm9tIC9ob21lL2FsZXhpcy9zcmMvYnVpbGRyb290X21pbi9vdXRwdXQv
YnVpbGQvcXQ1d2Via2l0LTUuMjEyLjAtYWxwaGE0L1NvdXJjZS9KYXZhU2NyaXB0Q29yZS9vZmZs
aW5lYXNtL3BhcnNlci5yYjo1ODY6aW4gYHBhcnNlU2VxdWVuY2UnCiA+ICAgZnJvbSAvaG9tZS9h
bGV4aXMvc3JjL2J1aWxkcm9vdF9taW4vb3V0cHV0L2J1aWxkL3F0NXdlYmtpdC01LjIxMi4wLWFs
cGhhNC9Tb3VyY2UvSmF2YVNjcmlwdENvcmUvb2ZmbGluZWFzbS9wYXJzZXIucmI6ODE0OmluIGBw
YXJzZURhdGEnCiA+ICAgZnJvbSAvaG9tZS9hbGV4aXMvc3JjL2J1aWxkcm9vdF9taW4vb3V0cHV0
L2J1aWxkL3F0NXdlYmtpdC01LjIxMi4wLWFscGhhNC9Tb3VyY2UvSmF2YVNjcmlwdENvcmUvb2Zm
bGluZWFzbS9wYXJzZXIucmI6ODE4OmluIGBwYXJzZScKID4gICBmcm9tIC9ob21lL2FsZXhpcy9z
cmMvYnVpbGRyb290X21pbi9vdXRwdXQvYnVpbGQvcXQ1d2Via2l0LTUuMjEyLjAtYWxwaGE0L1Nv
dXJjZS9KYXZhU2NyaXB0Q29yZS9vZmZsaW5lYXNtL2dlbmVyYXRlX29mZnNldF9leHRyYWN0b3Iu
cmI6Njg6aW4gYDxtYWluPicKCiA+IFRoaXMgaXNzdWUgaXMgZHVlIHRvID1+IGJlaW5nIG1hcmtl
ZCBhcyBkZXByZWNhdGVkIHNpbmNlIGEgZmV3IFJ1YnkKID4gdmVyc2lvbnMsIGFuZCBmaW5hbGx5
IHJlbW92ZWQgaW4gMy4yLjAgWzFdLiBUaGlzIG5vdyBicmVha3MgdGhlIGJ1aWxkIHNpbmNlCiA+
IGJ1aWxkcm9vdCBoYXMgbW92ZWQgdG8gUnVieSB2My4zLjAuCiA+IFRoZSBjb3JyZXNwb25kaW5n
IGZpeCBoYXMgYWxyZWFkeSBiZWVuIGlzc3VlZCBpbiB1cHN0cmVhbSBXZWJraXQgcHJvamVjdAog
PiBbMl0sIGJ1dCBxdDV3ZWJraXQgdmVyc2lvbiB0cmFja2VkIGluIGJ1aWxkcm9vdCBkb2VzIG5v
dCBoYXZlIHRoZQogPiBjb3JyZXNwb25kaW5nIHdlYmtpdCB2ZXJzaW9uIHB1bGxlZC4gRml4IHRo
aXMgYnVpbGQgZXJyb3IgYnkgYnJpbmdpbmcgdGhlIHVwc3RyZWFtCiA+IHBhdGNoLiBUaGUgcGF0
Y2ggaXMgc2xpZ2h0bHkgbW9kaWZpZWQgKGV4Y2x1ZGUgcGFydCBhYm91dCBDaGFuZ2Vsb2cgZmls
ZSwKID4gd2hpY2ggaXMgYWJzZW50IGZyb20gcXQ1d2Via2l0KQoKID4gWzFdIGh0dHBzOi8vd3d3
LnJ1YnktbGFuZy5vcmcvZW4vbmV3cy8yMDIyLzEyLzI1L3J1YnktMy0yLTAtcmVsZWFzZWQvCiA+
IFsyXSBodHRwczovL2dpdGh1Yi5jb20vV2ViS2l0L1dlYktpdC9jb21taXQvYzdkMTlhNDkyZDk3
ZjkyODJhNTQ2ODMxYmViOTE4ZTAzMzE1ZjZlZgoKID4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExv
dGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCkNvbW1pdHRlZCB0byAyMDI0LjAy
LnggYW5kIDIwMjQuMDUueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
