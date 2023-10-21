Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC745C0032E
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 21:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A027E708D1;
	Sat, 21 Oct 2023 21:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A027E708D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IBpZu7TsnC3v; Sat, 21 Oct 2023 21:31:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC581708D4;
	Sat, 21 Oct 2023 21:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC581708D4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE341BF47F
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 21:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66257708D4
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 21:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66257708D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JDhMj2ZOSnqq for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 21:31:44 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5111C708D1
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 21:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5111C708D1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:fb1e:781c:6f9a:fbfd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 005905FFA3;
 Sat, 21 Oct 2023 23:31:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Oct 2023 23:31:38 +0200
Date: Sat, 21 Oct 2023 23:31:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20231021213138.GF2607@scaer>
References: <CACXRmJgncbjMF78nktj8C3=htitMjr=UweQcK3kwvF52PKBWmg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACXRmJgncbjMF78nktj8C3=htitMjr=UweQcK3kwvF52PKBWmg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697923901;
 bh=t0+bdr/6zchfIponI8Yl0ATGUXhl8rRjPQgwrqO3HNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X/5xesOU+SX/Vw09cJKX4izrVGihSuIfkF4jCp0M2XwHKnI7RPWh76i1QSPgP6jBr
 dAK8VTU0WrpOwd3GxtZOvGw+6HYkoe3HLw7sj0D5sNqUh/fFwH601QFrGCGGak3M4S
 +dZgKjlQupQaaFZp2hgVjFVZZ3FOkLOO74ZLfFhp6iW3KXuUOrbIBO7GRpN+bE7lKI
 OgKoMgwTcO3A1qa/g5L7DsWiXhdSQIdn9zT19/1tBTp0Tm6xGPkaIRijQ0tDjux84u
 ie8MOxudjACEZ24r0oFkEpgKCHlC6lTggTtJC5jo7pn1wQ/OCeZzKzmyI0p6i7AEq5
 mbFF5pmqzW/vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X/5xesOU
Subject: Re: [Buildroot] [buildroot] small typo in manual
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

VGhvbWFzLCBBbGwsCgpPbiAyMDIzLTEwLTE2IDIyOjExICswMjAwLCBUaG9tYXMgRGV2b29nZHQg
c3Bha2UgdGh1c2x5Ogo+IEhpLMKgCj4gSSBzYXcgYSBzbWFsbCB0eXBvIGluIGEgcmVjZW50IGNv
bW1pdDoKPiA2NDgwNzc0YzQzMDIyNzY4ODExOWNhYzM5MzVmMjNiNjI0NjA4ODI0Cj4gLSB0aGlz
IGlzIG5vIGxvbmdlciBzdXBwb3J0ZWQsIGFuZCBzdWNoIHBhdGNoZXMgYXJlIG5vdyBsb25nZXIg
YXBwbGllZMKgCj4gKyB0aGlzIGlzIG5vIGxvbmdlciBzdXBwb3J0ZWQsIGFuZCBzdWNoIHBhdGNo
ZXMgYXJlIG5vIGxvbmdlciBhcHBsaWVkwqAKCkZpeGVkIGluIG1hc3RlciwgdGhhbmtzIQoKUmVn
YXJkcywKWWFubiBFLiBNT1JJTi4KCj4gS3IKPiBUaG9tYXMgRGV2b29nZHTCoAoKLS0gCi4tLS0t
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
