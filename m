Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945F1C3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 15:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D607260FA7;
	Sun, 15 Jan 2023 15:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D607260FA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alEjjrbLMvRC; Sun, 15 Jan 2023 15:50:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FCA360FA4;
	Sun, 15 Jan 2023 15:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FCA360FA4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 891941BF393
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 15:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63A9E60FA4
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 15:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63A9E60FA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMYU_FSwhS-d for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 15:49:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B71C60DF0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B71C60DF0
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 15:49:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D3DA45FFAF;
 Sun, 15 Jan 2023 16:49:50 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 15 Jan 2023 16:49:50 +0100
Date: Sun, 15 Jan 2023 16:49:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <20230115154950.GN199036@scaer>
References: <CAOrEah7x19H6gK0OQh1hF6RLgfDB+ojpKDvcFsiFavqVTp4FAg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOrEah7x19H6gK0OQh1hF6RLgfDB+ojpKDvcFsiFavqVTp4FAg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673797794;
 bh=dVRYpRfylzAMTqPnub06m8npW7F03zKW2NUsN8zIo74=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vXiqTAkIq2wHuh+Z97+5fwCYrVlYvZ0T4WAbGsBmhPMqpRBmXYpyIrnMm3RkgP+5d
 FuJhBPu5lXbgM2EM85IJZVkg7UArmEqoIy6KvzDbTgcZ+23kOCgo1+sl9PifMGa8mr
 FHbF3iFQoBHuu5NHqfE/nc21BFkbKFw5GFkwkbd9kC4kh4r/P6xST2/WhOtrHZOBAy
 zZkBCH+HD+tHDMTrvzfWQ5hc3y4BlRv1xyZXK+0zkh5Gi7NWkiH/jWCZOuYENbNAoP
 2iIOEyFAAQmPnOzNeIHQ0ZEAYST+vlmFTgBNuv7CJNd6oCKaWB66pHTSkcjXXTYL7y
 clIqijFmKJUqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vXiqTAkI
Subject: Re: [Buildroot] [Sideband] Re: [PATCH 1/2] package/ipmitool:
 backport fixes for registry issues
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VmluY2VudCwgVGhvbWFzLAoKT24gMjAyMy0wMS0xNSAwNzoyMSAtMDYwMCwgVmluY2VudCBGYXpp
byBzcGFrZSB0aHVzbHk6Cj4gSnVzdCB0byB5b3UgdHdvLiBNeSByZXBseSBkaWRuJ3QgaGl0IHRo
ZSBtYWlsaW5nIGxpc3QgYmVjYXVzZSBhcHBhcmVudGx5IEkgZm9yZ290IHRvIHNpZ24gdXAgdW5k
ZXIgbXkgcGVyc29uYWwgZW1haWwgYWNjb3VudC4gU28gSQo+IGdvdCBhIG5hc3R5Z3JhbSBhYm91
dCBpdC4KWy0tU05JUC0tXQoKSGVoZS4uLiA6LSkKCkkgcmUtYWRkZWQgdGhlIGxpc3QsIGJlY2F1
c2Ugb2YgdGhlIHBvc3QtcmV2aWV3LWNvbW1lbnQgb2YgbWluZSwKYmVsb3cuLi4KCj4gSSdsbCB0
cnkgdG8gZml4IHRoZSBwYXRjaGVzIGVpdGhlciB0b2RheSBvciB0b21vcnJvdy4gSSBjYW4gc3Bs
aXQgdGhlbSBpZiB0aGUgdGhvdWdodCBpcyB0aGF0IGZpeGluZyB0aGUgVVJMIHNob3VsZCBiZSBj
aGVycnkgcGlja2VkCj4gaW50byB0aGUgMjAyMi4xMSBicmFuY2ggd2hpY2ggYWxzbyBoYXMgdGhp
cyBidWcuIEkgY2FuIGFsc28gY2hhbmdlIHRoZSBkZWZhdWx0IHRvIGVuYWJsZWQgaWYgeW91IHBy
ZWZlciB0aG91Z2gsIGFzIEkgbWVudGlvbmVkLCBpdCdzCj4gbGFyZ2VseSBjb3NtZXRpYyBhbmQg
dGFrZXMgNE1CIG9mIHNwYWNlIGFuZCBpdCBsb29rZWQgbGlrZSB3ZSBkaXNhYmxlIHRoZXNlIGtp
bmQgb2YgbmljZXRpZXMgYnkgZGVmYXVsdCBlbHNld2hlcmUgaW4gdGhlIHRyZWU/wqAKPiBJJ2xs
IGFkanVzdCB0aGUgU29CIGZvciB0aGUgcGF0Y2hlcyBlaXRoZXIgd2F5LCB0aG91Z2ggYXBwYXJl
bnRseSBJIGZvcmdvdCB0byBzaWduIG9mZiBvbiBvbmUgdXBzdHJlYW0gc28gaXQgaGFzIG5vIFNv
QiBhdAo+IGFsbC7CoAo+IExtayB0aG91Z2hzIGFib3V0IHRoZSBzcGxpdCBwYXRjaGVzIGFuZCB0
aGUgZGVmYXVsdAoKQXMgSSBzYWlkOiBJIGFtIGZpbmUgd2l0aCBhcHBseWluZyBhIHNpbmdsZSBj
b21taXQgaW4gQnVpbGRyb290LCB0bwpiYWNrcG9ydCBhbGwgdGhlIHRocmVlIG9yIGZvdXIgYmFj
a3BvcnRlZCBwYXRjaGVzLCBhcyBpdCBpcyBteSBvcGluaW9uCnRoYXQgdGhleSBhbGwgYXJlIG5l
ZWRlZCB0byAiZml4IGluc3RhbGxpbmcgYW5kIHVzaW5nIHRoZSBQRU4gcmVnaXN0cnkiLgpNYXli
ZSBiZSBtb3JlIGV4cGxpY2l0IGluIHRoZSBjb21taXQgbG9nLCBhbmQgZXhwbGljaXRseSBzdGF0
ZSB0aGF0LApldmVuIHRob3VnaCB0aGV5IGNvdWxkIHRlY2huaWNhbGx5IGJlIHNwbGl0IGluIHR3
byBjb21taXRzLCBpdCByZWFsbHkKbWFrZXMgc2Vuc2UgdG8gaGF2ZSB0aGVtIHRvZ2V0aGVyLCBi
ZWNhdXNlIHNlbWFudGljYWxseSB0aGV5IGZpeCB1c2luZwp0aGUgcmVnaXN0cnkuCgpPaCwgd2Fp
dC4uLiBNYXliZSB3ZSBzaG91bGQgaW5kZWVkIHNlcGFyYXRlIHRoZW0sIHdpdGggYSBtdWNoIGJl
dHRlcgpyYXRpb25hbGUuIEZpcnN0LCBmaXggdGhlIGFjdHVhbCBkb3dubG9hZCBpc3N1ZToganVz
dCBiYWNrcG9ydCB0aGUgLnR4dApyZWdpc3RyeSBkb3dubG9hZCBmaXgsIGFzIFRob21hcyBzdWdn
ZXN0ZWQuIFRoZW4gaW4gYSBzZWNvbmQgY29tbWl0LCBhZGQKYW4gb3B0aW9uIHRvIHNwZWNpZnkg
dGhlIFVSSSB0byBhIHJlZ2lzdHJ5IGZpbGUsIHdoaWNoIGRlZmF1bHRzIHRvIHRoZQpvZmZpY2lh
bCByZWdpc3RyeSwgYnV0IGNvdWxkIGJlIGEgZmlsZSB0aGF0IGEgdXNlciBoYXMgbG9jYWxseSBm
b3IKcmVwcm9kdWNpYmlsaXR5LCBhbmQgY2FycnkgdGhlIGFkZGl0aW9uYWwgcGF0Y2hlczsgc29t
ZXRoaW5nIGFsb25nIHRoZQpsaW5lcyBvZiAodG90YWxseSB1bnRlc3RlZCk6CgogICogaXBtaXRv
b2wvQ29uZmlnLmluOgoKICAgIGNvbmZpZyBCUjJfUEFDS0FHRV9JUE1JVE9PTF9QRU5fUkVHX1VS
SQogICAgICAgIHN0cmluZyAiUEVOIHJlZ2lzdHJ5IFVSTCBvciBwYXRoIgogICAgICAgIGRlZmF1
bHQgImh0dHBzOi8vYmxhYmxhYmxhL3JlZ2lzdHJ5LnR4dCIKICAgICAgICBoZWxwCiAgICAgICAg
ICBFbnRlciBhbiBVUkwgb3IgYSBmaWxlIHBhdGggdG8gdGhlIFBFTiByZWdpc3RyeSB0byB1c2Uu
CiAgICAgICAgICBOb3RlIHRoYXQgdGhlIG9mZmljaWFsIHJlZ2lzdHJ5IG1heSBjaGFuZ2UgYW55
IHRpbWUsIGFuZCBpcwogICAgICAgICAgdGh1cyBub3QgcmVwcm9kdWNpYmxlLCBhbmQgdGFrZXMg
NCtNaUIuCgogICAgICAgICAgTGVhdmUgZW1wdHkgdG8gbm90IHVzZSBhIHJlZ2lzdHJ5OyB2ZW5k
b3IgYW5kIHByb2R1Y3QgSURzCiAgICAgICAgICB3aWxsIGJlIGJlIGRpc3BsYXllZCBpbnN0ZWFk
IG9mIHRoZSBjb3JyZXNwb25kaW5nIG5hbWVzLgoKICAqIGlwbWl0b29sL2lwbWl0b29sLm1rOgoK
ICAgICMgV2UgaGFuZGxlIGl0IG91cnNlbHZlcywgYmVsb3csIHNvIG5ldmVyIGxldCB0aGUgY29u
ZmlndXJlCiAgICAjIHNjcmlwdCBkb3dubG9hZCB0aGUgcmVnaXN0cnkuCiAgICBJUE1JVE9PTF9D
T05GSU9HVVJFX09QVFMgKz0gLS1kaXNhYmxlLWRvd25sb2FkLXJlZ2lzdHJ5CgogICAgSVBNSVRP
T0xfUEVOX1JFR19VUkkgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1BBQ0tBR0VfSVBNSVRPT0xfUEVO
X1JFR19VUkkpKQogICAgaWZuZXEgKCQoSVBNSVRPT0xfUEVOX1JFR19VUkkpLCkKICAgIGlmbmVx
ICgkKGNhbGwgZ2V0dXJpc2NoZW1lLCQoSVBNSVRPT0xfUEVOX1JFR19VUkkpKSwpCiAgICBJUE1J
VE9PTF9FWFRSQV9ET1dOTE9BRFMgKz0gJChJUE1JVE9PTF9QRU5fUkVHX1VSSSkKICAgIElQTUlU
T09MX1BFTl9SRUcgPSAkKElQTUlUT09MX0RMX0RJUikvJChub3RkaXIgJChJUE1JVE9PTF9QRU5f
UkVHX1VSSSkpCiAgICBlbHNlCiAgICBJUE1JVE9PTF9QRU5fUkVHID0gJChJUE1JVE9PTF9QRU5f
UkVHX1VSSSkKICAgIGVuZGlmCiAgICBkZWZpbmUgSVBNSVRPT0xfSU5TVEFMTF9QRU5fUkVHCiAg
ICAgICAgJChJTlNUQUxMKSAtZCAtbSAwNjQ0ICQoSVBNSVRPT0xfUEVOX1JFRykgXAogICAgICAg
ICAgICAkKFRBUkdFVF9ESVIpL3Vzci9zaGFyZS9pcG1pdG9vbC9wZW4tcmVnLWRiLnR4dC1ibGFi
bGEKICAgIGVuZGVmCiAgICBJUE1JVE9PTF9QT1NUX0lOU1RBTExfVEFSR0VUX0hPT0tTICs9IElQ
TUlUT09MX0lOU1RBTExfUEVOX1JFRwogICAgZW5kaWYKClNvLCB5ZXMsIHR3byBwYXRjaGVzOgoK
IDEuIHBhY2thZ2UvaXBtaXRvb2w6IGZpeCBkb3dubG9hZGluZyB0aGUgb2ZmaWNpYWwgUEVOIHJl
Z2lzdHJ5CiAyLiBwYWNrYWdlL2lwbWl0b29sOiBhbGxvdyB1c2luZyBhIGN1c3RvbSwgcmVwcm9k
dWNpYmxlIFBFTiByZWdpc3RyeQoKQWxzbywgVGhvbWFzIGhhZCBzb21tZSBjb21tZW50cyBhYm91
dCBtaXNzaW5nIHByb3Blcmx5IGlkZW50aWZ5aW5nIHRoYXQKcGF0Y2hlcyBhcmUgYmFja3BvcnRz
LCBhbmQgbWlzc2luZyB5b3VyIFNvQiAoZXZlbiBpZiB0aGV5IHdlcmUgbm90IFNvQgp1cHN0cmVh
bSwgYWRkIHlvdXIgU29CIGJlY2F1c2UgeW91IGFyZSBwYXJ0IG9mIHRoZSBjaGFpbiBicmluZ2lu
ZyB0aGVtCnRvIEJ1aWxkcm9vdCkuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0t
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
