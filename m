Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41EFCD8C89
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 19:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97BAE84B37;
	Sun,  7 Jun 2026 19:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Opc5GzskYy4; Sun,  7 Jun 2026 19:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C78D684B33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780861644;
	bh=U62/6LQFZsrkjt7P3OsgMlPca+v5XBG9pBMLJT95fwY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ncg6Bdh02o+ZdrJOgzjBEAsEmv827pFG8T3KK2lozye747DEMzE+fdzLE7zF7/Sjf
	 aBs4V93jsYtX/NvC6OKOxLeEW3+SRlAwrxM59eZtDjjJYT1wPxdkNqMrZR95MPcgBU
	 uYfO+9LSsM8LNCiPLK45W11l4Ioqrdq5OzWuVgO3OCnYIajHDjPN/w5x7ymDXgjMXZ
	 06Ja2QTbwYt42jiEKBwJ4Mz6zBIhBMIMKjUi2nmtetYb9Qg3feDaNLmGT0LjBHbEUI
	 ebM17NFSpOivU8yABeD0SQSQAdIC8yfmEkr/qliads69vJcnGiyDNMs9UZso3wEFLK
	 pd5Cb47tz0Jmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C78D684B33;
	Sun,  7 Jun 2026 19:47:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91F392C1
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 19:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 774FF84B33
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 19:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kugEhyu_Pvc5 for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 19:47:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F323184B32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F323184B32
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F323184B32
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 19:47:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A725F19F5C3;
 Sun,  7 Jun 2026 21:47:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Jun 2026 21:47:18 +0200
MIME-Version: 1.0
Date: Sun, 07 Jun 2026 21:47:18 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260607190044.850030-1-romain.naour@smile.fr>
References: <20260607190044.850030-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.16
Message-ID: <8b6434ce5fd19348ab0f5759566f7e07@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780861639;
 bh=x4BdNFOKEfQHceREp69y5PF9y8uazvRS3frQpPexsKc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JGXXemZfyAWoh3rxPv/eiv6ZdhuF73akoAmu3b8QNcWvD851Jfo7GVjqOPoTqKqD+
 Txlhd4XQVuipSyapXaoe03pAMJh90ID76VZETOXwNDHIU3aQebuPkmirl4B1TyzzU2
 z5EXUMaM3zjtPm6EF2GzXJweoyetD28VLNk6AS/3tlIVBGZfHZaG86xdcNsJSPWVLo
 j7TY3K/9jDZMo5KdIi+rjc4DT1ogy1kYMc6JVC51Xw0NYRdUPlwylD8Xx2N/BqYxmj
 MKuNsCm7UH6q5s5ShZaxhsFw3DR6sevDQjkOk2Goz9XlCzPzi39CoQFCFKP6c363yf
 VeIV3WSqoZnCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JGXXemZf
Subject: Re: [Buildroot] [PATCH] configs/at91sam9x5ek*: remove
 at91bootstrap3 license
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

T24gMDcvMDYvMjAyNiAyMTowMCwgUm9tYWluIE5hb3VyIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4g
V2hlbiB1c2luZyBhIHNwZWNpZmljIGdpdCByZXBvIGFuZCB2ZXJzaW9uIGZvciBhdDkxYm9vdHN0
cmFwMywKPiBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0xJQ0VOU0VfRklMRVMgZGVmYXVsdHMg
dG8gIkxJQ0VOU0VTL01JVC50eHQiLgo+IEhvd2V2ZXIgdGhlIGdpdCB2ZXJzaW9uIHdlIHVzZSAo
bmFtZWx5IHYzLjEwLjMpIGRvZXMgbm90IHByb3ZpZGUgdGhpcwo+IGZpbGUuIEFjdHVhbGx5LCBp
dCBkb2VzIG5vdCBwcm92aWRlIGEgbGljZW5zZSBmaWxlIGF0IGFsbC4gVGhpcyBjYXVzZXMKPiDi
gJhtYWtlIGxlZ2FsLWluZm/igJkgdG8gZmFpbCB3aXRoOgo+IAo+ICAgICA+Pj4gYXQ5MWJvb3Rz
dHJhcDMgdjMuMTAuMyBDb2xsZWN0aW5nIGxlZ2FsIGluZm8KPiAgICAgc2hhMjU2c3VtOiAKPiAv
YnVpbGRzL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290L291dHB1dC9idWlsZC9hdDkxYm9vdHN0cmFw
My12My4xMC4zL0xJQ0VOU0VTL01JVC50eHQ6IAo+IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkK
PiAgICAgRVJST1I6IHdoaWxlIGNoZWNraW5nIGhhc2hlcyBmcm9tIAo+IGJvb3QvYXQ5MWJvb3Rz
dHJhcDMvYXQ5MWJvb3RzdHJhcDMuaGFzaAo+ICAgICBFUlJPUjogTElDRU5TRVMvTUlULnR4dCBo
YXMgd3Jvbmcgc2hhMjU2IGhhc2g6Cj4gICAgIEVSUk9SOiBleHBlY3RlZDogCj4gNWEzODA5YjFj
MmJhMTNiNzI0MjU3MjMyMjk1MTMxMWM1ODQ0MTlmMWY4NTE2ZjY2NWQ2YzA2ZjA2NjhkNzhkZQo+
ICAgICBFUlJPUjogZ290ICAgICA6Cj4gICAgIEVSUk9SOiBJbmNvbXBsZXRlIGRvd25sb2FkLCBv
ciBtYW4taW4tdGhlLW1pZGRsZSAoTUlUTSkgYXR0YWNrCj4gICAgIG1ha2VbMV06ICoqKiBbYm9v
dC9hdDkxYm9vdHN0cmFwMy9hdDkxYm9vdHN0cmFwMy5tazoxMTI6IAo+IGF0OTFib290c3RyYXAz
LWxlZ2FsLWluZm9dIEVycm9yIDEKPiAKPiBMZXQncyBiZSBleHBsaWNpdCB0aGF0IHRoZXJlIGlz
IG5vIGxpY2Vuc2UgZmlsZSB0byBjaGVjay4KPiAKPiBGaXhlczoKPiBodHRwczovL2dpdGxhYi5j
b20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE0NzI4OTEzODIxIAo+IChhdDkxc2Ft
OXg1ZWtfbW1jX2Rldl9kZWZjb25maWcpCj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy8xNDcyODkxMzgyMCAKPiAoYXQ5MXNhbTl4NWVrX21tY19kZWZj
b25maWcpCj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9i
cy8xNDcyODkxMzgxOSAKPiAoYXQ5MXNhbTl4NWVrX2Rldl9kZWZjb25maWcpCj4gaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xNDcyODkxMzgxOCAKPiAo
YXQ5MXNhbTl4NWVrX2RlZmNvbmZpZykKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIg
PHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
