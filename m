Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A7DC02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 15:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4FB060EAD;
	Mon,  3 Feb 2025 15:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXInnRfwOZLW; Mon,  3 Feb 2025 15:19:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC8B260EA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC8B260EA2;
	Mon,  3 Feb 2025 15:19:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD71412A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCB854108E
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJa_m2zZKK8c for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 15:19:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A3DC641082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3DC641082
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3DC641082
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:19:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A89EE2003CC;
 Mon,  3 Feb 2025 16:18:54 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:57960])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Feb 2025 16:18:54 +0100
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 16:18:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org, "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
In-Reply-To: <20250131-add-wlr-randr-package-v2-1-7ea1a44b5b7e@armadeus.com>
References: <20250131-add-wlr-randr-package-v2-1-7ea1a44b5b7e@armadeus.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <2dfb2ff3959f3e8099908cb088745fb0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738595937;
 bh=ljIQyiaXACWyjIuaej/eGAcLzMTkPVPixGLzlMuQtH0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qq/rRAVtFgK7b21TYCigGbVRH3zch+T3yl8CYLrBCpGzteECFEUai7UzYERqnjird
 HGHkHEfKf606LiHAaAdnU2jy38L2X2952nWFAA3bHO1dkimVFJ+sSQVFNlCpaIttTF
 b2Fg2/zyJ5j4KY7UAYp094e+ES0v+CRszvE1eYaibQwj3zDy99XgYCYPS4mt5hdK3g
 rxWRYXyIOMK9uuuinZDFEWQjVMKM3rPvXp4/9QnXxbeSKt8WgJRujsMMDlMycsLQ/W
 XS00W+li3IPLCNSgH3esu5HfZQVK8WfbOaRmyflSPI1MKRx0oI9ZT3e8qKwb3XnP44
 LsQjVPCAca8pA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qq/rRAVt
Subject: Re: [Buildroot] [PATCH v2] package/wlr-randr: new package
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

SGkgU2ViYXN0aWVuLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2ghCgpPbiAzMS8wMS8yMDI1IDEz
OjMwLCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBVdGlsaXR5IHRvIG1hbmFnZSBvdXRw
dXRzIG9mIGEgV2F5bGFuZCBjb21wb3NpdG9yLgo+IAo+IFRlc3RlZC1ieTogRmlvbmEgS2x1dGUg
KFdJV0EpIDxmaW9uYS5rbHV0ZUBnbXguZGU+Cj4gU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBT
enltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgo+IC0tLQoKV2hpbGUg
dGVzdGluZyB3aXRoIHRlc3QtcGtnLCBJIG9ic2VydmVkIDQgYnVpbGQgZmFpbHVyZXMuCgogICAg
IGNhdCA+IHdsci1yYW5kci5jb25maWcgPDxFT0YKICAgICBCUjJfUEFDS0FHRV9XQVlMQU5EPXkK
ICAgICBCUjJfUEFDS0FHRV9XTFJfUkFORFI9eQogICAgIEVPRgogICAgIHV0aWxzL3Rlc3QtcGtn
IC1hIC1jIHdsci1yYW5kci5jb25maWcgLXAgd2xyLXJhbmRyCiAgICAgLi4uCiAgICAgICAgICAg
ICAgICAgICAgICAgICBici1hcm0tYmFzaWMgWzI4LzQwXTogRkFJTEVECiAgICAgICAgICAgICAg
ICBici1pMzg2LXBlbnRpdW00LWZ1bGwgWzMxLzQwXTogRkFJTEVECiAgICAgICAgICAgICAgICAg
ICBici1taXBzNjQtbjY0LWZ1bGwgWzMyLzQwXTogRkFJTEVECiAgICAgICAgICAgIGJyLXBvd2Vy
cGMtNjAzZS1iYXNpYy1jcHAgWzM0LzQwXTogRkFJTEVECgpZb3UgY2FuIHJlcHJvZHVjZSB0aG9z
ZSBpc3N1ZXMgY3JlYXRpbmcgYSB0b29sY2hhaW4gZmlsZQphbmQga2VlcCBvbmx5IHRob3NlIDQg
dG9vbGNoYWlucyBpbiBpdC4gRS5nLgoKICAgICBjcCBzdXBwb3J0L2NvbmZpZy1mcmFnbWVudHMv
YXV0b2J1aWxkL3Rvb2xjaGFpbi1jb25maWdzLmNzdiAKbXktdG9vbGNoYWlucy5jc3YKClRoZW4g
ZWRpdCB0aGUgIm15LXRvb2xjaGFpbnMuY3N2IiBmaWxlLiBUaGVuIHJ1bjoKCiAgICAgdXRpbHMv
dGVzdC1wa2cgLWEgLXQgbXktdG9vbGNoYWlucy5jc3YgLWMgd2xyLXJhbmRyLmNvbmZpZyAtcCAK
d2xyLXJhbmRyCgpBbGwgdGhlIGZhaWx1cmVzIGxvb2tzIHRoZSBzYW1lLiBFcnJvciBpczoKCiAg
ICAgLi4vbWFpbi5jOiBJbiBmdW5jdGlvbiDigJhoZWFkX2hhbmRsZV9uYW1l4oCZOgogICAgIC4u
L21haW4uYzo0MTk6MTU6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDi
gJhzdHJkdXDigJk7IApkaWQgeW91IG1lYW4g4oCYc3RybmR1cOKAmT8gWy1XZXJyb3I9aW1wbGlj
aXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgICAgICA0MTkgfCAgaGVhZC0+bmFtZSA9IHN0cmR1
cChuYW1lKTsKCkNhbiB5b3UgaGF2ZSBhIGxvb2sgYXQgdGhvc2UgYnVpbGQgaXNzdWVzLCBwbGVh
c2U/CgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
