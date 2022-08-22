Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C38CC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 21:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C16D88144E;
	Mon, 22 Aug 2022 21:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C16D88144E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FrZRO20PDWr; Mon, 22 Aug 2022 21:24:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E072A81439;
	Mon, 22 Aug 2022 21:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E072A81439
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C74CF1BF317
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 21:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A237081439
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 21:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A237081439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dthps2pNKBhR for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 21:24:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5240E813E5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5240E813E5
 for <buildroot@busybox.net>; Mon, 22 Aug 2022 21:24:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:961:575d:b2ff:71eb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BFFDB60132;
 Mon, 22 Aug 2022 23:24:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 22 Aug 2022 23:24:34 +0200
Date: Mon, 22 Aug 2022 23:24:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220822212434.GG2167049@scaer>
References: <20220221043034.2736010-1-francois.perrad@gadz.org>
 <20220821211709.GV2167049@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220821211709.GV2167049@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661203477;
 bh=bj9WHskpCHqzbhAFQdD73Sipg+SfGn7F4n10sH574Rg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U4h6GrgN5gGzdwsYN8IDUpgTMZfx6OTfARdNwELgk85NC4/KHy6D3jhKUol0Gcgbr
 mHMmDSn6e5gA3zqXOuVqxsW8yhVa1dswlFFGYIaHd+bCs0NhgoVRDw6qyOX3wIZ4ZF
 hUvAM6aPxxqthxWkxW1Jvtu6kvElx3x+sU3m4qP7hOGp3qI1bcDu+UWZ9Xvfo+leY9
 OWNmFpVQNDCTGkP+P4owm1QM3Froefgp2AJYq7Woj2wU8IOQynzpKGfnZJquFx0hUt
 23OQo8rL7A9X7i1eoK0x6Vx0wTYuUzKzDaJj+id3ZHhFY+n1/EN39iTupJ+B9KiuX3
 0oWxZbCf006yQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U4h6GrgN
Subject: Re: [Buildroot] [PATCH 0/3] portable services: another use case of
 BR
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBhbGwsCgpPbiAyMDIyLTA4LTIxIDIzOjE3ICswMjAwLCBZYW5uIEUuIE1PUklO
IHNwYWtlIHRodXNseToKPiBPbiAyMDIyLTAyLTIxIDA1OjMwICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+ID4gVGhpcyBzZXJpZXMgYWxsb3dzIHRvIGJ1aWxkIGEgcm9vdGZz
IHN1aXRhYmxlIGZvciBwb3J0YWJsZSBzZXJ2aWNlcyB3aXRoIHN5c3RlbWQuCj4gPiAKPiA+IEEg
bmV3IHZhbHVlIG9mICJJbml0IHN5c3RlbSIgaXMgaW50cm9kdWNlZCA6IEJSMl9JTklUX1BPUlRB
QkxFLgo+ID4gQlIyX0lOSVRfUE9SVEFCTEUgaXMgbGlrZSBCUjJfSU5JVF9OT05FLCBidXQgd2l0
aCBhbGwgRk9PX0lOU1RBTExfSU5JVF9TWVNURU1EIGV4ZWN1dGVkLgo+ID4gCj4gPiBBIG5ldyB0
eXBlIG9mIHNrZWxldG9uIGlzIHJlcXVpcmVkIDogQlIyX1BBQ0tBR0VfU0tFTEVUT05fSU5JVF9Q
T1JUQUJMRS4KPiA+IAo+ID4gc2VlIGh0dHBzOi8vc3lzdGVtZC5pby9QT1JUQUJMRV9TRVJWSUNF
Uy8KPiAKPiBJIGRvbid0IHNlZSBhbnl0aGluZyB0aGF0IGNhbid0IGJlIGFscmVhZHkgbWFuYWdl
ZCB3aXRoIGV4aXN0aW5nCj4gY29uZmlndXJhdGlvbiBvcHRpb25zLgoKQWgsIEkgbWlzc2VkIG9u
ZSB0aGluZzogdGhpcyBhbGxvd3MgaW5zdGFsbGluZyBzeXN0ZW1kIHVuaXRzIGJ1bmRsZWQgaW4K
QnVpbGRyb290LCB3aXRob3V0IHVzaW5nIHN5c3RlbWQgYXMgYSBpbml0IHN5c3RlbS4KClRoaXMg
aXMgZmxhd2VkLCBJTU8sIGJlY2F1c2UgYSBsb3Qgb2YgcGFja2FnZXMgbm93IGluc3RhbGwgdGhl
aXIgb3duCnVuaXRzIGFzIHBhcnQgb2YgdGhlaXIgaW5zdGFsbCBwcm9jZWR1cmUsIHNvIHdpdGhv
dXQgc3lzdGVtZCBlbmFibGVkLAp0aG9zZSBwYWNrYWdlcyB3b2xkIG5vdCBpbnN0YWxsIHRoZWly
IHVuaXRzLgoKU28sIGluIHByYWN0aWNlLCB0byBiZSByZWFsbHkgdXNlZnVsbCwgdGhpcyB3b3Vs
ZCBzdGlsbCBuZWVkIHN5c3RlbWQgdG8KYmUgZW5hYmxlZCwgYW5kIHdlJ3JlIGJhY2sgdG8gdGhl
IHNpdHVhdGlvbiB3aGVyZSB0aGlzIHNlcmllcyBvbmx5CmJyaW5ncyBhIGZldyBkZWZhdWx0cyBh
cyBwb2xpY3kuCgpTbywgSSdtIHN0aWxsIG5vdCBjb252aW5jZWQgYWJvdXQgaXQuCgpSZWdhcmRz
LApZYW5uIEUuIE1PUklOLgoKPiBBbGwgdGhhdCB0aGlzIG5ldyBzby1jYWxsZWQgaW5pdCBzeXN0
ZW0gZG9lcywgaXMgY2hhbmdlIHNvbWUgZGVmYXVsdHMgdG8KPiBtYXRjaCBhIHNwZWNpZmljIHVz
ZS1jYXNlLiBXZSBoYWQgc2ltaWxhciBzdHVmZiBiYWNrIGluIHRoZSBkYXkgKGUuZy4gYW4KPiBv
cHRpb24gdG8gZGVmaW5lIGEgcm91dGVyLCBvbmUgdG8gZGVmaW5lIHNvbWV0aGluZyBlbHNlLCBh
bmQgc28gb24pLCBhbmQKPiB3ZSByZW1vdmVkIGFsbCBvZiB0aGVtLgo+IAo+IEdyYW50ZWQsIHBv
cnRhYmxlIHNlcnZpY2VzIGFyZSBzbGlnaHRseSBkaWZmZXJlbnQsIGJ1dCBzdGlsbCBhbGwgdGhh
dAo+IHRoaXMgc2VyaWVzIGV2ZW50dWFsbHkgZG9lcyBpcyBjaGFuZ2Ugc29tZSBkZWZhdWx0czsg
aXQgZG9lcyBub3QgZXZlbgo+IGVuZm9yY2UgdGhlIHNldHRpbmdzIHNvIHRoZXkgYXJlIG5vdCBl
dmVuIHJlcXVpcmVkLgo+IAo+IEV2ZW4gdGhlIG5ldyBza2VsZXRvbiBjYXNlIGNhbiBhbHJlYWR5
IGJlIGhhbmRsZWQgYnkgcHJvdmlkaW5nIGEgY3VzdG9tCj4gc2tlbGV0b24sIGFuZCBpdCBpcyBh
IHRyaXZpYWwgb25lLCBzbyBldmVuIHRoYXQgaXMgbm90IG5lZWRlZC4KPiAKPiBJZiB5b3Ugd2Fu
dCB0byBidWlsZCBhIHBvcnRhYmxlIHNlcnZpY2UsIGp1c3QgYnVpbGQgYSBzeXN0ZW0gd2l0aAo+
IHN5c3RlbWQgYW5kIHRoZSByZXN0IG9mIHRoZSBzZXR0aW5ncyBzZXQgYXMgcmVxdWlyZWQgZm9y
IHRoYXQgdXNlLWNhc2UuCj4gCj4gU28sIG15IHBvc2l0aW9uIGlzIHRvIHJlamVjdCB0aGlzIG5l
dyBwc2V1ZG8taW5pdCBzeXN0ZW0uCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAo+
ID4gRnJhbmNvaXMgUGVycmFkICgzKToKPiA+ICAgcGFja2FnZS9za2VsZXRvbi1pbml0LXBvcnRh
YmxlOiBuZXcgc2tlbGV0b24KPiA+ICAgcG9ydGFibGU6IG5ldyBpbml0IHN5c3RlbQo+ID4gICBw
b3J0YWJsZTogdHdlYWsgc29tZSBkZWZhdWx0IHZhbHVlcwo+ID4gCj4gPiAgREVWRUxPUEVSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ID4gIGZzL3NxdWFzaGZz
L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiA+ICBwYWNrYWdlL0Nv
bmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gPiAgcGFja2FnZS9p
ZnVwZG93bi1zY3JpcHRzL0NvbmZpZy5pbiAgICAgICAgICAgIHwgIDIgKy0KPiA+ICBwYWNrYWdl
L3BrZy1nZW5lcmljLm1rICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwo+ID4gIHBhY2th
Z2Uvc2tlbGV0b24taW5pdC1wb3J0YWJsZS9Db25maWcuaW4gICAgICB8ICA3ICsrKysrKwo+ID4g
IC4uLi9za2VsZXRvbi1pbml0LXBvcnRhYmxlLm1rICAgICAgICAgICAgICAgICB8IDIzICsrKysr
KysrKysrKysrKysrKysKPiA+ICBzeXN0ZW0vQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxOCArKysrKysrKysrKy0tLS0KPiA+ICA4IGZpbGVzIGNoYW5nZWQsIDUwIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2Uvc2tlbGV0b24taW5pdC1wb3J0YWJsZS9Db25maWcuaW4KPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9za2VsZXRvbi1pbml0LXBvcnRhYmxlL3NrZWxldG9uLWluaXQtcG9ydGFibGUu
bWsKPiA+IAo+ID4gLS0gCj4gPiAyLjMyLjAKPiA+IAo+ID4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKPiAtLSAKPiAuLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJ
IFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0
d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwK
PiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAg
ICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3Jn
LyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS0tLScKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwg
UmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5
OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdO
ICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0t
LS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0
cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAg
diAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
