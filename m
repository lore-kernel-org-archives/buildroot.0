Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BBBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 01:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B670341671;
	Wed, 16 Feb 2022 01:52:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tbB9ArGCt_in; Wed, 16 Feb 2022 01:52:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDE73415A2;
	Wed, 16 Feb 2022 01:52:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB4211BF5DC
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 01:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0B8D831E7
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 01:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwQu3of5Ys-g for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 01:52:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D10E831E3
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 01:52:41 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id K9UknbS8lQUuPK9UkneWSx; Wed, 16 Feb 2022 02:52:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644976359; bh=vg4mDVyl6/pwgNSOQY9/0vGdae/OLGeA45urFndBBJ4=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=kIg9VH8AiKXSotHvZp3FbLN6XrSjygX+GIXVDvF2BZFWH/6kBd18vvuNvqV8NMeBa
 O4S1FAAGdBNqPlEVML0tGm7XjSjjOqI8zPb8CYfUyZVdZ8hhsoN0y37QZ9NHFw7H1a
 xqZmhzR2n9R0r5+6XAhWqNywKnemjIRT7Zz1CWpxWLb38N0yV+LO/WgqU/Lq4nhivP
 tFDx7/R1jYAlyWu/+Jp2watNxhABtzctOUveP0kvyTj8x/c3msag1OjsQBpHoAxF5D
 odPmaSxOCBCtrNXsZ86t5ftVm03IHX2X64nss/5V6axMYbxQkOIFeDj4Gk11bBdz04
 sjKro1CUlTA+w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 16 Feb 2022 02:52:37 +0100
Message-Id: <40D75C1A-19A7-4E03-8B69-976F680BE842@benettiengineering.com>
References: <YgxKvW3ab+JbmYA/@APC323>
In-Reply-To: <YgxKvW3ab+JbmYA/@APC323>
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfBiyQ3Ut1oML1oFPFR1uBOSzX4+6srgTBtH+tEuWrtrERtLxf+nVGRovWYnbnrFkcD1cKoGp8tVh5vuqQ+vawuk/Xa+MrlgWKGJxggyA4inoybxvbN93
 ywHJokYuZf/ns06jIWpLPOdlacBhpguqh/uplOG9xtqUUrBwao/F9gkg+wDLWG1VZlXlBAHlX2JfL8n+QhQHh1lzQRThnEe7S437zk+Sp2Q20+SChhzw1vfB
 uq4RbG6qKmQ4RCjMoJ//3Q==
Subject: Re: [Buildroot] [PATCH 2/3] board/andes/ae350: add support for
 Andes AE350
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

Cj4gSWwgZ2lvcm5vIDE2IGZlYiAyMDIyLCBhbGxlIG9yZSAwMTo1MywgWXUgQ2hpZW4gUGV0ZXIg
TGluIDxwZXRlcmxpbkBhbmRlc3RlY2guY29tPiBoYSBzY3JpdHRvOgo+IAo+IO+7v0hpIEdpdWxp
bywKPiAKPj4+IE9uIFR1ZSwgRmViIDE1LCAyMDIyIGF0IDAyOjAwOjM2UE0gKzAxMDAsIEdpdWxp
byBCZW5ldHRpIHdyb3RlOgo+Pj4gSGkgUGV0ZXIsCj4+PiAKPj4+PiBJbCBnaW9ybm8gMTUgZmVi
IDIwMjIsIGFsbGUgb3JlIDA2OjE2LCBZdSBDaGllbiBQZXRlciBMaW4gPHBldGVybGluQGFuZGVz
dGVjaC5jb20+IGhhIHNjcml0dG86Cj4+Pj4gCj4+Pj4g77u/Cj4+Pj4+IAo+Pj4+Pj4gT24gVHVl
LCBGZWIgMTUsIDIwMjIgYXQgMTA6MzI6MDFBTSArMDgwMCwgWXUgQ2hpZW4gUGV0ZXIgTGluIHdy
b3RlOgo+Pj4+Pj4gVGhpcyBwYXRjaCBwcm92aWRlcyBkZWZjb25maWcgYW5kIGJhc2ljIHN1cHBv
cnQgZm9yIHRoZSBBbmRlcwo+Pj4+Pj4gNDUgc2VyaWVzIFJJU0MtViBhcmNoaXRlY3R1cmUuCj4+
Pj4+PiAKPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFl1IENoaWVuIFBldGVyIExpbiA8cGV0ZXJsaW5A
YW5kZXN0ZWNoLmNvbT4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFsYW4gS2FvIDxhbGFua2FvQGFu
ZGVzdGVjaC5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+IENoYW5nZXMKPj4+Pj4+IFYxLT5WMjoKPj4+
Pj4+ICogbW92ZSBsaW51eCBzb3VyY2UgY29kZSBhbmQgaXRzIHBhdGNoZXMgdG8gQW5kZXNUZWNo
IEdpdGh1YiByZXBvCj4+Pj4+PiAqIHJlbmFtZSBhZTM1MF9hbmRlc3RhcjQ1X2RlZmNvbmZpZyB0
byBhbmRlc19hZTM1MF80NV9kZWZjb25maWcKPj4+Pj4+ICogY2hhbmdlIEMgbGlicmFyeSB0byB1
Q2xpYmMKPj4+Pj4+ICogcmVtb3ZlIE9wZW5TU0wgcGFja2FnZQo+Pj4+Pj4gKiByZW1vdmUgcm9v
dGZzLmNwaW8gYW5kIHJvb3Rmcy50YXIKPj4+Pj4+ICogdXBkYXRlIERFVkVMT1BFUlMKPj4+Pj4+
IFYyLT5WMzoKPj4+Pj4+ICogc3BlY2lmaXkgYnJhbmNoIHRvIGRvd25sb2FkIGZyb20gQW5kZXNU
ZWNoIGxpbnV4IHJlcG8KPj4+Pj4+ICogY2hhbmdlIGJvb3QuY21kIHRvIGV4dGxpbnV4LmNvbmYK
Pj4+Pj4+ICogYWRkIHBvc3QtYnVpbGQuc2ggZm9yIGV4dGxpbnV4LmNvbmYgdG8gcmV0cmlldmUg
SW1hZ2UgYW5kIERUQgo+Pj4+Pj4gKiBmaXggZm9ybWF0IGFuZCB1cGRhdGUgZ2VuaW1hZ2Vfc2Rj
YXJkLmNmZwo+Pj4+Pj4gKiB1cGRhdGUgcmVhZG1lLnR4dAo+Pj4+Pj4gKiBhZGQgcGFja2FnZXMg
KHB5dGhvbjMsIHB5bGliZmR0IGFuZCBvcGVuc3NsKSBmb3IgdS1ib290IGJpbm1hbgo+Pj4+Pj4g
KiByZW9yZGVyIGl0ZW0gaW4gREVWRUxPUEVSUwo+Pj4+Pj4gCj4+Pj4gCj4+Pj4gU29ycnksIEkg
bWlzc2VkIHZlcnNpb25pbmcgZm9yIHRoaXMgcmV2aXNpb24uCj4+Pj4gSSdsbCByZXNlbmQgaXQg
YW5kIGZpeCBjaGFuZ2Vsb2cgZm9ybWF0Lgo+Pj4gCj4+PiBDYW4geW91IHBsZWFzZSBzdWJzY3Jp
YmUgdG8gcGF0Y2h3b3JrWzFdIGFuZCB0YWcgeW91ciBwYXRjaGVzIHdpdGhvdXQgVjMgcHJlZml4
IGFzIHJlamVjdGVkPwo+Pj4gCj4+PiBbMV06IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9idWlsZHJvb3QvbGlzdC8KPj4+IAo+Pj4gVGhhbmsgeW91IQo+Pj4gR2l1bGlvCj4g
Cj4gU3VyZSwgSSd2ZSB1cGRhdGVkLiBTb3JyeSBhYm91dCB0aGF0LgoKTm8gcHJvYmxlbSwgcGxl
YXNlIGFsc28gdGhlIHYyIHZlcnNpb24uCllvdSBjYW4gZmlsdGVyIGJ5IHlvdXIgbmFtZSBhbmQg
Y2hlY2sgeW91ciBwYXRjaGVzLgoKVGhhbmsgeW91IQoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAK
PiBZdS1DaGllbiBQZXRlciBMaW4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
