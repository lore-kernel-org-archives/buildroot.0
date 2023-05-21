Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DB9C77B7C
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 15:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAFF182C04;
	Sun, 21 May 2023 15:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAFF182C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1nwz4DAg0tpp; Sun, 21 May 2023 15:29:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0A5F82BC0;
	Sun, 21 May 2023 15:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0A5F82BC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D41E31BF3CD
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACAA282BBA
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACAA282BBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-JtE7oJfnbM for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 15:29:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8E8182BA7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8E8182BA7
 for <buildroot@buildroot.org>; Sun, 21 May 2023 15:29:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:cc91:114a:eab6:96e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B489EB0051E;
 Sun, 21 May 2023 17:29:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 17:29:25 +0200
Date: Sun, 21 May 2023 17:29:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230521152925.GE171618@scaer>
References: <20221007133912.2869000-1-james.hilliard1@gmail.com>
 <20221007133912.2869000-2-james.hilliard1@gmail.com>
 <20230513115918.GP2582048@scaer>
 <CALAjcgX5HXHqpnHy__cGnxFG=Ff=OtdHP5rZ0EPFDGc8T--zzg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALAjcgX5HXHqpnHy__cGnxFG=Ff=OtdHP5rZ0EPFDGc8T--zzg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684682970;
 bh=FtKC/vKAwkat3gZRjS180tb4jTK3EsLPPx6kOp2Aznw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GI4KZSm1ehn+XDkBa5Vzu7KYv1g/LJv4T6UOsvcjN0D3ZbTAPEdq5SDezQghcD8Hr
 gd0CoJ99c3Af5PjzJl9jLOn3Js/g4RqlKiIEZTyfH5cH6SiN5zcIrpA7g8qWwk5bYh
 o2cdlYHxPS3vx2aYJEW1yZu7hKp7U/NsJkwyhQ+0EI+xEQGfTpojq98TGCExqGoY+n
 Mft32PBSDA4waJD4nxPPG71XHuTyGCeBs64VWVn/rxuoXVmZezZ4r+4pbZUDN+BwZh
 xB/qZ6kZCKqRjEMc8KNAFvz7rndzh4GTC66wpk1At4vxis0xIWeb2uFuo7G5BhqmNt
 tNgbcYcx35tzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GI4KZSm1
Subject: Re: [Buildroot] [PATCH 2/2] package/gobject-introspection: bump to
 version 1.74.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjMtMDUtMjAgMTU6NTYgLTA0MDAsIEphbWVzIEtuaWdodCBzcGFr
ZSB0aHVzbHk6Cj4gT24gU2F0LCBNYXkgMTMsIDIwMjMgYXQgNzo1OeKAr0FNIFlhbm4gRS4gTU9S
SU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiA+IERvIHdlIGhhdmUgdG8gbWFr
ZSBzdXJlIHRoYXQgdGhlICJtYWpvciIgdmVyc2lvbiBvZiB0aGUgR05PTUUgcGFja2FnZXMKPiA+
IGJlIGFsaWduZWQsIG9yIGlzIGl0IHBvc3NpYmxlIHRpeC1uLW1hdGNoIHZlcnNpb25zPwo+IEl0
IGlzIG15IHVuZGVyc3RhbmRpbmcgKG5vdykgdGhhdCBrZWVwaW5nIHRoZSBtaW5vciB2ZXJzaW9u
IGluCj4gbG9ja3N0ZXAgaXMgYWxtb3N0IGFsd2F5cyBwcmVmZXJyZWQgKGF0IGxlYXN0LCB3aGVu
IGNvbnNpZGVyaW5nIHRoZQo+IHBhY2thZ2VzIGdsaWIyLCBnbGliLW5ldHdvcmtpbmcsIGdvYmpl
Y3QtaW50cm9zcGVjdGlvbiBhbmQgZ2xpYm1tOyBJJ2QKPiBiZSBjdXJpb3VzIHRvIGtub3cgaWYg
SSBtaXNzZWQgYW55KS4gTWljcm8gdmVyc2lvbnMgZm9yIHN1cmUgZG8gbm90Cj4gcmVxdWlyZSBh
IG1hdGNoIGFuZCBtYXkgYmUgb2xkZXIgb3IgbmV3ZXIgdGhhbiBnbGliMidzIG1pY3JvIHZlcnNp
b24uCgpXaGF0IHdvdWxkIGJlIHRoZSBhY3R1YWwgZHJhd2JhY2tzIChidWlsZCBmYWlsdXJlcywg
cnVudGltZSBmYWlsdXJlcykgb2YKa2VlcGluZyBnb2JqZWN0LWludHJvc3BlY3Rpb24gdG8gMS43
NCwgd2hlbiB3ZSBoYXZlIDIuNzYueCBmb3IgbGliZ2xpYjIKKG5vdGU6ICoxKi43NCB2cyAqMiou
NzYpID8KCklPVywgc2hvdWxkIHdlIHRha2UgWzBdIGluIG1hc3Rlciwgd2hpY2ggaXMgZmVhdHVy
ZS1mcm96ZW4gZm9yIHRoZQp1cGNvbWluZyAyMDIzLjA1IHJlbGVhc2UsIG9yIGNhbiBpdCB3YWl0
IGZvciB0aGUgbmV4dCBjeWNsZT8KClswXSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMwNTE1MjAzMDAyLjM0NjUzNC0xLWFkdXNrZXR0QGdt
YWlsLmNvbS8KCj4gV2hlbiBJIHN1Ym1pdHRlZCB0aGUgcGF0Y2ggZm9yIGxpYmdsaWIyIHRvIDEu
NzYueCwgSSBzaG91bGQgaGF2ZSB0YWtlbgo+IHRoZSB0aW1lIHRvIGluY2x1ZGUgdXBkYXRlcyBm
b3IgZ29iamVjdC1pbnRyb3NwZWN0aW9uIGFuZCBnbGlibW0gYXMKPiB3ZWxsLiBNeSBmb2N1cyBh
dCB0aGUgdGltZSB3YXMgdG8ganVzdCB1c2UgdGhlIG1vcmUgcmVjZW50IHZlcnNpb24gb2YKPiBn
bGliLW5ldHdvcmtpbmcsIHdoaWNoIHdhcyB0aGUgc29sZSByZWFzb24gZm9yIGxpYmdsaWIyIGJl
aW5nIGJ1bXBlZC4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVND
SUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0
d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwK
fCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAg
IHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwg
Xy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
