Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51029CCFA04
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 20:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A575040A87;
	Tue,  4 Nov 2025 20:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbbFTd0w1AQG; Tue,  4 Nov 2025 20:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B47406C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9B47406C8;
	Tue,  4 Nov 2025 20:16:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6012462
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 20:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B81C540C84
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 20:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yj-52pV-A_bq for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 20:16:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF23140C5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF23140C5D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF23140C5D
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 20:16:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E5B6F13F880;
 Tue,  4 Nov 2025 21:16:10 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Nov 2025 21:16:10 +0100
MIME-Version: 1.0
Date: Tue, 04 Nov 2025 21:16:10 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Mario Lang <mlang@blind.guru>
In-Reply-To: <20251103114132.620197-1-dario.binacchi@amarulasolutions.com>
References: <20251103114132.620197-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <3faa35a46251efaee14105e59512cf12@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762287373;
 bh=nvqD3jcRNR5L54ZzG6R6QgtVD/cm6dAvyVzGlvKWWfc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LY4qK0QwT5xWNuMSOvdi49/O81R7N2WbD6bigR2DSlu7tAOC0xXOwTzyuHElmkYBZ
 RQURbqGRFZJIXo7HM9tQD92RHNAZU/LsBtmboZ6JoGC5F/ovJvinuDK79Tf5gmq3PH
 ykVwa8ypfUk++F6ibGxmN1sZ3ndP0bDAF3ngMQwDmQQL5Fajj9xzGE34VH8zJdHPCj
 W4uU7ooq5pWEPyCNWyhSfX/NdXeOzRGQGXCr8iSyf87G70zVaC0g+P7p/ypimg1zmu
 vkEZqptvOIcZn9xziQgXG3+z5krhbu0LxkYN/5O7Y3Y2BFN5aKzUoxvTA/Idksjcom
 eHm+l3bOCNEsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LY4qK0Qw
Subject: Re: [Buildroot] [PATCH v3 1/1] package/brltty: bump to version 6.8
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

SGkgRGFyaW8sCgpPbiAwMy8xMS8yMDI1IDEyOjQxLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiBD
b21taXQgWzFdIGhhcyBtYWRlIG5jdXJzZXMgYSByZXF1aXJlbWVudCBmb3IgYnVpbGRpbmcgdGhl
IHBhY2thZ2UuCj4gCj4gVGhlIGFkZGVkIHBhdGNoZXMgZml4IHRoZSBmb2xsb3dpbmcgYnVpbGQg
ZXJyb3JzOgoKVGhlIGFkZGVkIHBhdGNoIGlzIG5vdCBzdWZmaWNpZW50IHRvIGZpeCBhbGwgdGhl
IHVjbGliYyBidWlsZCBmYWlsdXJlcy4KU2VlOiBodHRwczovL2dpdGxhYi5jb20vam9saXZhaW4v
YnVpbGRyb290Ly0vcGlwZWxpbmVzLzIxMzU2MjYxODQKCllvdSBjYW4gYWxzbyByZXByb2R1Y2Ug
dGhlIGlzc3VlIHdpdGggdGhlIGNvbW1hbmQ6CgpjYXQgPi5jb25maWcgPDxFT0YKQlIyX2FhcmNo
NjQ9eQpCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09U
TElOPXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FBUkNINjRfVUNMSUJDX0JMRUVE
SU5HX0VER0U9eQpCUjJfUEFDS0FHRV9CUkxUVFk9eQpFT0YKbWFrZSBvbGRkZWZjb25maWcKbWFr
ZSBicmx0dHkKCkNvdWxkIHlvdSBoYXZlIGEgbG9vaywgcGxlYXNlPwoKPiAKPiAvdXNyL2Jpbi9p
bnN0YWxsIC1jIC1kIC4uLy4uLy4uL2xpYgo+IGJ1aWxkcm9vdC9vdXRwdXQvaG9zdC9iaW4vYXJt
LWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYtZ2NjIC1zaGFyZWQgICAKPiAtV2wsLWV4cG9ydC1k
eW5hbWljIC1vIC4uLy4uLy4uL2xpYi9saWJicmx0dHl4ZnYuc28gc2NyZWVuLm8gLWx0aW5mbwo+
IGJ1aWxkcm9vdC9vdXRwdXQvaG9zdC9saWIvZ2NjL2FybS1idWlsZHJvb3QtbGludXgtZ251ZWFi
aWhmLzE0LjMuMC8uLi8uLi8uLi8uLi9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi9iaW4v
bGQ6IAo+IGNhbm5vdCBmaW5kIC1sdGluZm86IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiBj
b2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMKPiAKPiAuL3VuaWNvZGUu
YzogSW4gZnVuY3Rpb24g4oCYZ2V0VHJhbnNsaXRlcmF0ZWRDaGFyYWN0ZXLigJk6Cj4gLi91bmlj
b2RlLmM6MzQ5OjI3OiBlcnJvcjogaW5pdGlhbGl6YXRpb24gb2Yg4oCYaWNvbnZfdOKAmSB7YWth
IOKAmGxvbmcgaW504oCZfSAKPiBmcm9tIOKAmHZvaWQgKuKAmSBtYWtlcyBpbnRlZ2VyIGZyb20g
cG9pbnRlciB3aXRob3V0IGEgY2FzdCAKPiBbLVdpbnQtY29udmVyc2lvbl0KPiAgIDM0OSB8ICAg
c3RhdGljIGljb252X3QgaGFuZGxlID0gTlVMTDsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXn5+fgo+IGdpdCBmb3JtYXQtcGF0Y2ggLU0gLW4gLXMgLW8gb3V0Z29pbmcgb3Jp
Z2luL21hc3Rlcgo+IFVwZGF0ZSBSRUFETUUgaGFzaDoKPiAtIHY2Ljg6Cj4gICAtIFVwZGF0ZSB0
aGUgY29weXJpZ2h0IGZyb20gMjAyNCB0byAyMDI1Lgo+IC0gdjYuNzoKPiAgIC0gVXBkYXRlIHRo
ZSBzdXBwb3J0ZWQgYnJhaWxsZSBkZXZpY2VzIGxpc3RzLgo+ICAgLSBBZGQgc3VwcG9ydCBmb3Ig
dGhlIEhJTVMgZU1vdGlvbi4KPiAgIC0gQWRkIHN1cHBvcnQgZm9yIEhUJ3MgQWN0aXZhdG9yIFBy
byBtb2RlbHMuCj4gICAtIEFkZCBzdXBwb3J0IGZvciB0aGUgS0dTIE5leHQgVG91Y2ggNDAuCj4g
ICAtIENoYW5nZSB0aGUgY29weXJpZ2h0IGZyb20gMjAyMyB0byAyMDI0Lgo+ICAgLSBEb2N1bWVu
dCB0aGF0IEhUJ3MgQmFzaWMgQnJhaWxsZSBQbHVzIG1vZGVscyBhcmUgc3VwcG9ydGVkLgo+IAo+
IFJlbGVhc2Ugbm90ZXM6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2JybHR0eS9icmx0dHkvYmxvYi9C
UkxUVFktNi44L0RvY3VtZW50cy9DaGFuZ2VMb2cKPiAKPiBbMV0gCj4gaHR0cHM6Ly9naXRodWIu
Y29tL2JybHR0eS9icmx0dHkvY29tbWl0LzhmN2Q2NTU2OWVmNzdlZWM4YjhlNGI5N2U2OGNiNTY4
OWNmNTdlZjkKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlA
YW1hcnVsYXNvbHV0aW9ucy5jb20+CgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
