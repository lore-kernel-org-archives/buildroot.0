Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCE9C001E0
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 20:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FB0D8500C;
	Sat, 21 Oct 2023 20:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FB0D8500C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MdwXiZvmsMU0; Sat, 21 Oct 2023 20:25:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D851850A1;
	Sat, 21 Oct 2023 20:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D851850A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EE6F1BF47F
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 20:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 578BD6125F
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 20:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 578BD6125F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3AAP1z3YteD for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 20:25:32 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D7BE61219
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 20:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D7BE61219
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:fb1e:781c:6f9a:fbfd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0B0745FFB1;
 Sat, 21 Oct 2023 22:25:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Oct 2023 22:25:25 +0200
Date: Sat, 21 Oct 2023 22:25:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20231021202525.GD2607@scaer>
References: <20231018141155.533944-1-vfazio@gmail.com>
 <fc416325-98e6-04e2-6ea9-e48053c2c302@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc416325-98e6-04e2-6ea9-e48053c2c302@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697919929;
 bh=9E9THfaMLd3jtQj4qwnSOlIEjlFXeHCE59ms8Zy+OxU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YL67ZS0z9tF0iitFx7m9ed4csdbIDt251HumwTuImvC9M/ZbuGD8ckdOnVi4N8LEK
 Y7+ZcTXk9x2v8lntV33G4wPgcglQqHP+mGfrys+G+2MRedyZqKHb5LE3qhpcCvh+jB
 y4aBG94p3GabTjjHKrnN/jqZeGRZbJKPS+vhcRJF1vQeiOyhtjU77OmjFDJhMAjDxV
 tUYwqrpbpcKQlZJsSi+Ky1i8oFExWE03iwNiUo7uU1kNPo9Ybypbd9Oy1pshMr1/mX
 aJQ/GpbL2e4zJ3kt9f8y3qkfOgtATGEoZYo3idcaVDDni/+zG6SAfVR/jcN+ZbqYcW
 hc2fuqpqMjtnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YL67ZS0z
Subject: Re: [Buildroot] [PATCH 1/1] support/dependencies: bump minimal tar
 version to 1.35
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
Cc: Vincent Fazio <vfazio@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VmluY2VudCwgQXJub3V0LCBBbGwsCgpPbiAyMDIzLTEwLTE4IDE5OjQzICswMjAwLCBBcm5vdXQg
VmFuZGVjYXBwZWxsZSB2aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPiBPbiAxOC8xMC8yMDIz
IDE2OjExLCBWaW5jZW50IEZhemlvIHdyb3RlOgo+ID5HTlUgdGFyIDEuMzUgaW5jbHVkZXMgYSBi
cmVha2luZyBjaGFuZ2UgWzBdIHRoYXQgY2hhbmdlcyB0aGUgdGFyIGhlYWRlcgo+ID5jcmVhdGVk
IGZvciBlYWNoIHJlZ3VsYXIgZmlsZSBldmVuIGZvciAic3RhYmxlIiBmb3JtYXRzIGxpa2UgcGF4
ICh3aGljaAo+ID53ZSB1c2UgaW4gc3VwcG9ydC9kb3dubG9hZC9oZWxwZXJzOjpta190YXJfZ3op
Lgo+ICBUaGUgZnVubnkgdGhpbmcgaXMgdGhhdCB0aGUgdGFyIGRvY3MgaGF2ZSBhIHNlY3Rpb24g
YWJvdXQgbWFraW5nIHRoZQo+IGFyY2hpdmUgcmVwcm9kdWNpYmxlIFsxXS4gVGhleSBjYWxsIGl0
ICJtb3JlIHJlcHJvZHVjaWJsZSIsIHRob3VnaCwgc28KPiBwZXJoYXBzIHRoZXkgcmVhbGl6ZSB0
aGF0IHRoZXkgZmFpbC4uLgoKWWVzLCBJIHRoaW5rIHRoaXMgaXMgd2hhdCBzZXJ2ZWQgYXMgYSBi
YXNlIGZvciBWaW5jZW50IHRvIGNvbWUgdXAgd2l0aAp0aGUgb3B0aW9ucyB3ZSBoYXZlIGluIHRo
ZSB0YXIgaGVscGVyLgoKWy0tU05JUC0tXQo+ID5kaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctZG93
bmxvYWQubWsgYi9wYWNrYWdlL3BrZy1kb3dubG9hZC5tawo+ID5pbmRleCBlNWNkODNkODU5Li5k
MzNlYjJkODExIDEwMDY0NAo+ID4tLS0gYS9wYWNrYWdlL3BrZy1kb3dubG9hZC5tawo+ID4rKysg
Yi9wYWNrYWdlL3BrZy1kb3dubG9hZC5tawo+ID5AQCAtMjAsOCArMjAsOCBAQCBleHBvcnQgTE9D
QUxGSUxFUyA6PSAkKGNhbGwgcXN0cmlwLCQoQlIyX0xPQ0FMRklMRVMpKQo+ID4gICMgVmVyc2lv
biBvZiB0aGUgZm9ybWF0IG9mIHRoZSBhcmNoaXZlcyB3ZSBnZW5lcmF0ZSBpbiB0aGUgY29ycmVz
cG9uZGluZwo+ID4gICMgZG93bmxvYWQgYmFja2VuZDoKPiA+LUJSX0ZNVF9WRVJTSU9OX2dpdCA9
IC1icjEKPiA+LUJSX0ZNVF9WRVJTSU9OX3N2biA9IC1icjMKPiA+K0JSX0ZNVF9WRVJTSU9OX2dp
dCA9IC1icjIKPiA+K0JSX0ZNVF9WRVJTSU9OX3N2biA9IC1icjQKPiAgVmVuZG9yZWQgY2FyZ28g
YW5kIGdvIHBhY2thZ2VzIHdpbGwgaGF2ZSB0aGUgc2FtZSBpc3N1ZSwgbm8/IFRob3NlIHdpbGwK
PiBuZWVkIHRvIGJlIHVwZGF0ZWQgYXMgd2VsbC4uLgoKR29vZCBjYXRjaCwgaW5kZWVkLiBJJ2xs
IHRyeSBhbmQgcmVzdXJlY3QgbXkgcGF0Y2ggdG8gYWRkIGEgLWJyIHN1ZmZpeAp0byB0aG9zZS4u
LgoKPiAgUGVyaGFwcyB3ZSBzaG91bGQgbG9vayBmb3IgYW4gYWx0ZXJuYXRpdmUgYXJjaGl2ZSBm
b3JtYXQgdGhhdCBpcyBhY3R1YWxseQo+IHJlcHJvZHVjaWJsZS4gSWYgd2UgYW55d2F5IGhhdmUg
dG8gZG8gYSBtYXNzIHVwZGF0ZSwgdGhlbiBpdCdzIGJldHRlciBpZiBub3cKPiBpcyB0aGUgbGFz
dCB0aW1lLi4uIFRob3VnaCBJIGRvbid0IGtub3cgaWYgYW4gYWN0dWFsbHkgcmVwcm9kdWNpYmxl
IGZvcm1hdAo+IGV4aXN0cy4KClRoZXJlIGlzIGEgbG9zdCB0aGVyZToKICAgIGh0dHBzOi8vZW4u
d2lraXBlZGlhLm9yZy93aWtpL0xpc3Rfb2ZfYXJjaGl2ZV9mb3JtYXRzCgpidXQgaXQgZG9lcyBu
b3QgcHJvdmlkZSBhbnkgaW5mb3JtYXRpb24gYWJvdXQgc3RhYmlsaXR5Li4uCgpXZSBjb3VsZCBv
ZiBjb3Vyc2UgY29tZSB1cCB3aXRoIG91ciBvd24sIGJ1dCBJIHdvdWxkIHZlcnkgbXVjaCBsaWtl
IHRoYXQKd2UgZG8gYXZvaWQgdGhhdCBhdCBhbGwgY29zdC4gVGhlIG9kZHMgb2YgdXMgZmFpbGlu
ZyBpZiB3ZSBnbyB0aGF0IHJvdXRlCmFyZSBoaWdoZXIgdGhhbiB0aG9zZSBvZiB1cyBzdWNjZWVk
aW5nLCBJJ2Qgc2F5Li4uCgo+IEdOVSBjcGlvIGhhcyB0aGUgLS1yZXByb2R1Y2libGUgb3B0aW9u
LCBidXQgSSBkb24ndCBrbm93IGlmIGl0Cj4gZ3VhcmFudGVlcyByZXByb2R1Y2liaWxpdHkgYWNy
b3NzIGNwaW8gdmVyc2lvbnMuCgpbMF0gc3RhdGVzIHRoYXQgLS1yZXByb2R1Y2libGUgImlzIGVx
dWl2YWxlbnQgdG8g4oCYLS1pZ25vcmUtZGV2bm8KLS1pZ25vcmUtZGlybmxpbmsgLS1yZW51bWJl
ci1pbm9kZXPigJkiLCB3aGljaCB0byBtZSBtZWFucyB0aGF0IHNvbWUKbWV0YWRhdGEgaXMgbm90
IHJlY29yZGVkIChvciBpcyBmYWtlZCksIG5vdCB0aGF0IHRoZXJlIGlzIGFueQpndWFyYW50ZWUg
b24gdGhlIHN0YWJpbGl0eSBvZiB0aGUgc3RyZWFtLgoKWzBdIGh0dHBzOi8vd3d3LmdudS5vcmcv
c29mdHdhcmUvY3Bpby9tYW51YWwvY3Bpby5odG1sI0NvcHlfMDAyZHBhc3MtbW9kZQoKPiBBbHNv
LCB3ZSBzdGlsbCBoYXZlIGd6aXAgdG8KPiBjb250ZW5kIHdpdGguCgpJIGRpZCB0ZXN0IHRoYXQg
YSB3aGlsZSBhZ28sIGFuZCBnemlwICpoYXMqIGJlZW4gdWx0cmEtc3VwZXIgc3RhYmxlIG92ZXIK
dGhlIHllYXJzLCB0byB0aGUgcG9pbnQgdGhhdCBhbGwgdGhlIHZlcnNpb25zIHRoYXQgSSBjb3Vs
ZCBidWlsZCAod2Ugd2FzCmFsbW9zdCBiYWNrIHRvIHRoZSBpbml0aWFsIHJlbGVhc2UgMzAgeWVy
cnMgYWdvKSBkaWQgcHJvZHVjZSB0aGUgc2FtZQpvdXRwdXQgYXMgdGhlIGxhdGVzdCB2ZXJzaW9u
LiBTbywgaWYgSSBoYWQgdG8gd29ycnkgYWJvdXQKcmVwcm9kdWNpYmlsaXR5LCBJIHdvdWxkIG5v
dCBsb29rIGF0IGd6aXAuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAgUmVnYXJkcywKPiAg
QXJub3V0Cj4gCj4gWzFdIGh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvdGFyL21hbnVhbC9o
dG1sX2NoYXB0ZXIvRm9ybWF0cy5odG1sI1JlcHJvZHVjaWJpbGl0eQo+IAo+IAo+ID4gIERMX1dS
QVBQRVIgPSBzdXBwb3J0L2Rvd25sb2FkL2RsLXdyYXBwZXIKPiA+ZGlmZiAtLWdpdCBhL3N1cHBv
cnQvZGVwZW5kZW5jaWVzL2NoZWNrLWhvc3QtdGFyLnNoIGIvc3VwcG9ydC9kZXBlbmRlbmNpZXMv
Y2hlY2staG9zdC10YXIuc2gKPiA+aW5kZXggYjdkNjA3YTQ3YS4uZDU2ZDAyNDJhOSAxMDA3NTUK
PiA+LS0tIGEvc3VwcG9ydC9kZXBlbmRlbmNpZXMvY2hlY2staG9zdC10YXIuc2gKPiA+KysrIGIv
c3VwcG9ydC9kZXBlbmRlbmNpZXMvY2hlY2staG9zdC10YXIuc2gKPiA+QEAgLTI3LDExICsyNywx
MyBAQCBpZiBbIC1uICIke3ZlcnNpb25fYnNkfSIgXSA7IHRoZW4KPiA+ICAgICAgZXhpdCAxCj4g
PiAgZmkKPiA+LSMgTWluaW1hbCB2ZXJzaW9uID0gMS4yNyAocHJldmlvdXMgdmVyc2lvbnMgZG8g
bm90IGNvcnJlY3RseSB1bnBhY2sgYXJjaGl2ZXMKPiA+LSMgY29udGFpbmluZyBoYXJkLWxpbmtz
IGlmIHRoZSAtLXN0cmlwLWNvbXBvbmVudHMgb3B0aW9uIGlzIHVzZWQgb3IgY3JlYXRlCj4gPi0j
IGRpZmZlcmVudCBnbnUgbG9uZyBsaW5rIGhlYWRlcnMgZm9yIHBhdGggZWxlbWVudHMgPiAxMDAg
Y2hhcmFjdGVycykuCj4gPisjIE1pbmltYWwgdmVyc2lvbiA9IDEuMzUKPiA+KyMgR05VIHRhciB1
cHN0cmVhbSBjb21taXQgNzM4ZGU5ZWNkIGludHJvZHVjZWQgYSAiYnJlYWtpbmciIGNoYW5nZSB0
aGF0Cj4gPisjIGFmZmVjdHMgdGFyYmFsbHMgcmVnYXJkbGVzcyBvZiBtb2RlIChwYXgvdXN0YXIv
djcpIHN1Y2ggdGhhdCB0YXJiYWxscwo+ID4rIyBnZW5lcmF0ZWQgd2l0aCAxLjM1IHdpbGwgbm90
IGhhc2ggdG8gdGhlIHNhbWUgdmFsdWUgYXMgdGhvc2UgZ2VuZXJhdGVkCj4gPisjIGJ5IHByZXZp
b3VzIHZlcnNpb25zIG9mIHRhci4KPiA+ICBtYWpvcl9taW49MQo+ID4tbWlub3JfbWluPTI3Cj4g
PittaW5vcl9taW49MzUKPiA+ICBpZiBbICRtYWpvciAtbHQgJG1ham9yX21pbiBdOyB0aGVuCj4g
PiAgCSMgZWNobyBub3RoaW5nOiBubyBzdWl0YWJsZSB0YXIgZm91bmQKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
CnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJP
TiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERl
c2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2
MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8g
IFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwg
LyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
