Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EB1EDEC5A
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 14:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 745E141D78;
	Wed, 13 Sep 2023 14:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 745E141D78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XQWQDf0OjpHS; Wed, 13 Sep 2023 14:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B3EE41D82;
	Wed, 13 Sep 2023 14:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B3EE41D82
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC9421BF616
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 14:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B02B14060C
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 14:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B02B14060C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3q0VZGkgf-Qk for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 14:28:57 +0000 (UTC)
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C966D40649
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 14:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C966D40649
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-7a85540d220so619107241.1
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 07:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694615335; x=1695220135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lHj+eor0uA15Dm0NuwNS8RdgNcIyFtRtaQTr+Q7yAAg=;
 b=dlP0rxK0Da8rPsMOrmLPPJJb9LSF8pOC3l7wLdIlAsdotU0XgGH+nqykDl9UzKPkwG
 NoHXTdb/10GrlI4QUlSn8F7x4DgA0OGP1lLt/7H7lnkDTzQgxPMWZmcMA65hHbFG3dLQ
 zy1UXVvWBGSGo+U5Toh6IhtFzcMwVP1qldlWWOmkAoX1qjyc7hd7CraZMJMwp+HfKZ+O
 u5Wa6KcwUvUk9NowGYjI3U4SIy5WVNZlLZiy1elW94WypOjPO8jA2cbMDXbvX8QEMOs9
 k6r1hwQyLB0Wiqe0M1BoAW98WnrOMZKIp3qRuSpOF8qujuBa6zozvubquO6F/ykDEg8F
 gf1g==
X-Gm-Message-State: AOJu0YyQrew1KFZzF8FoGF+VHLy+fTAfLNo9toVeiuI4TjjY0CV/XPcm
 fR5AGvEc/I7E/d214stQa6Af2qhO1w24hBYq9Y4=
X-Google-Smtp-Source: AGHT+IEJIy0HaCt7NcoO8nKcywh56XLF8rBfYe8yZJE9ix58yqyI2OV+9XPlo49zH4f9rPE8V05KC7zIDaFSaG+NHO0=
X-Received: by 2002:a67:ebcd:0:b0:44e:cf3d:4cbd with SMTP id
 y13-20020a67ebcd000000b0044ecf3d4cbdmr1932564vso.19.1694615335373; Wed, 13
 Sep 2023 07:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAEVrM6T=5vb98vVUr4AxNWf7xV6VSLyuNME1HpxW=KVJR1vvQw@mail.gmail.com>
 <CAEVrM6QhnK8kbQDtjzx8_rNLTq4s96EK=vUQz-vf1QVZUpt64g@mail.gmail.com>
 <20230913114508.70a1ea44@windsurf> <20230913133016.GD2693@scaer>
In-Reply-To: <20230913133016.GD2693@scaer>
From: Wit <linuxcdeveloper@gmail.com>
Date: Wed, 13 Sep 2023 16:27:11 +0200
Message-ID: <CAEVrM6RFzbogPVZEeYBPKX+rwDeKFH8xoCre-WSF8TpmLjXwvw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694615335; x=1695220135; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lHj+eor0uA15Dm0NuwNS8RdgNcIyFtRtaQTr+Q7yAAg=;
 b=IP3+zNAGlpRzaAFU6r/qW+LqlDE8E9NgTK8s6Zce/QGH+qm81WZ0R4xqG2KrmRfdpf
 1iCgg+pFHLDaKJQiXiSgoKB8zUzgFtWPPgp7LC0MjdXU4GdThzphi4dCcCs9t+u+4hL0
 BNd7ZcETiquzU09Y7W1fB533DONo6WkSUJHKXHMag1qmCJ+g3ae9L6Dv/ZgNXuXFCplu
 kxaQTJaqRPgcQWme5LvonmQrGCaM5OYecdppcB7ZTKQ78Y2HIdN+c/UzxmMkNzi/k5ID
 XrDAHWMyxzTaXJp+28CN0iZYTRpA99gZDp56pW6B+PhAnm1rXStA6OT+8XU84btMgLN5
 twmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=IP3+zNAG
Subject: Re: [Buildroot] Fwd: [PATCH] fs/user-initrd: add new method for
 building customizable INITRD
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

xZtyLiwgMTMgd3J6IDIwMjMgbyAxNTozMCBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThA
ZnJlZS5mcj4gbmFwaXNhxYIoYSk6Cj4KPiBXaXRvbGQsIEFsbCwKPgo+ICtBZGFtICtUaGllcnJ5
IGZvciBkcmFjdXQKPgo+IE9uIDIwMjMtMDktMTMgMTE6NDUgKzAyMDAsIFRob21hcyBQZXRhenpv
bmkgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gPiBPbiBXZWQsIDEzIFNlcCAyMDIzIDA2
OjQxOjQ4ICswMjAwCj4gPiBXaXQgPGxpbnV4Y2RldmVsb3BlckBnbWFpbC5jb20+IHdyb3RlOgo+
ID4gPiBBcyBmb3Igbm93IHVzZXIgaGFzIG5vdCBtdWNoIGluZmx1ZW5jZSBvbiBjcmVhdGlvbiBv
ZiBjb250ZW50cyBvZiBhbgo+ID4gPiBJTklUUkQgaW1hZ2UgSSd2ZSBtYWRlIHNvbWUgcHJvb2Yg
b2YgY29uY2VwdCBvZiBzb21lIHdpZGVyIGlkZWEgb2YKPiA+ID4gY3JlYXRpbmcgY3VzdG9taXph
YmxlIElOSVRSRCBpbWFnZS4KPiA+ID4gVGhpcyBwYXRjaCBhZGRzIHBvc3NpYmlsaXR5IG9mIGNy
ZWF0aW5nIGN1c3RvbWl6YWJsZSBJTklUUkQgaW1hZ2UgYnkKPiA+ID4gc2VsZWN0aW5nIHNvbWUg
b2YgcGFja2FnZXMgdG8gaW5zdGFsbC4gQXQgdGhlIG1vbWVudCBpdCBzdXBwb3J0cyBvbmx5Cj4g
PiA+IGdsaWJjIGJ1aWxkcyBidXQgSSBwbGFubmVkIHRvIGFkZCBzdXBwb3J0IGZvciBtdXNsIGFu
ZCB1Q2xpYmMgYXMgd2VsbC4KPiA+ID4gSSd2ZSBnb3QgYWxzbyBzb21lIG90aGVyIHBsYW5zIHJl
Z2FyZGluZyB0aGlzIHBhdGNoLgo+ID4gPiBUaGlzIHBhdGNoIGFkZHMgbmV3IHN1Ym1lbnUgaW4g
IkZpbGVzeXN0ZW0gaW1hZ2VzIiBtYWluIG1lbnUuCj4gPiA+Cj4gPiA+IEknbSBzZW5kaW5nIHRo
aXMgcGF0Y2ggZm9yIGV2YWx1YXRpb24uIElmIHRoZSBpZGVhIG9mIHRoaXMgcGF0Y2ggaXMgb2sK
PiA+ID4gZm9yIHlvdSBJIGNvdWxkIHRha2UgY2FyZSBvZiBkZXZlbG9waW5nIGl0Lgo+ID4gPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBXaXRvbGQgS293b2xpayA8bGludXhjZGV2ZWxvcGVyQGdtYWls
LmNvbT4KPiA+Cj4gPiBUaGFua3MgZm9yIHlvdXIgcHJvcG9zYWwuIEEgY291cGxlIG9mIGNvbW1l
bnRzOgo+ID4KPiA+ICgxKSBZb3VyIHBhdGNoIGlzIGxpbmUtd3JhcHBlZCwgc28gZGlmZmljdWx0
IHRvIHJldmlldy4gQ291bGQgeW91IHVzZQo+ID4gICAgIGdpdCBzZW5kLWVtYWlsIHRvIHNlbmQg
eW91ciBwYXRjaGVzPwoKSSB0cmllZCB5ZXN0ZXJkYXkgdG8gc2VuZCB0aGlzIHBhdGNoIHRoaXMg
d2F5IChnaXQgc2VuZC1lbWFpbCkgYnV0CnNlZW1zIGxpa2UgZmluYWxseSBpdCBkaWRuJ3QgYXJy
aXZlIHRvIG1haWxpbmcgbGlzdC4KTWF5YmUgYmVjYXVzZSBJIGRpZG4ndCBzdWJzY3JpYmUgdGhl
IG1haWxpbmcgbGlzdCB5ZXN0ZXJkYXkgeWV0PyBEb24ndCBrbm93LgpUb2RheSBhZnRlciBzdWJz
Y3JpYmluZyBJIHNlbnQgaXQgZnJvbSB3ZWIgbWFpbGVyIGFuZCBzZWVtcyBsaWtlIHdlYgptYWls
ZXIgd3JhcHBlZCB0aGUgbGluZXMgaW4gdGhlIHBhdGNoLgoKPiBXaGlsZSBhdCB0aGUgZm9ybWF0
dGluZzoKPiAgIC0gY29tbWl0IGF1dGhvciAoaS5lLiBlbWFpbCBzZW5kZXIpIG11c3QgbWF0Y2gg
dGhlIFNvQiBsaW5lCj4gICAtIGNvbW1pdCB0aXRsZSBzaG91bGQgYmU6ICBmcy91c2VyLWluaXRy
ZDogbmV3IGZpbGVzeXN0ZW0gICAoYnV0IHNlZQo+ICAgICBiZWxvdykKPiAgIC0gY29tbWl0IGxv
ZyBzaG91bGQgbW90aXZhdCB0aGUgcGF0Y2gsIGFuZCBwcm92aWRlIGV4cGxhbmF0aW9ucyBvbiBo
b3cKPiAgICAgdGhlIHBhdGNoIGlzICJkZXNpZ25lZCIgKGRvbid0IGRlc2NyaWJlLCBidXQgZXhw
YWxhaW4pOyBhbHNvLCBubwo+ICAgICBwZXJzb25hbCBtZXNzYWdlIChubyAiSSBhbSAuLi4iICJJ
IGRvLi4uIiBldGMuLi4pCgpUaGFua3MgZm9yIGV4cGxhbmF0aW9uLgoKPiA+ICgyKSBIYXZlIHlv
dSBsb29rZWQgYXQgRHJhY3V0IGFuZCBpdHMgaW50ZWdyYXRpb24gaW4gQnVpbGRyb290PyBCZWNh
dXNlCj4gPiAgICAgdG8gbWUgaXQgZG9lcyBwcmV0dHkgbXVjaCB0aGUgc2FtZSBhcyB3aGF0IHlv
dSdyZSBkb2luZy4gV2Uga25vdwo+ID4gICAgIERyYWN1dCdzIGludGVncmF0aW9uIGluIEJ1aWxk
cm9vdCBoYXMgc29tZSBzaG9ydGNvbWluZ3MsIGJ1dCBJJ2QKPiA+ICAgICByYXRoZXIgc2VlIHRo
ZW0gYmVpbmcgcmVzb2x2ZWQgcmF0aGVyIHRoYW4gaW50cm9kdWNlIGFub3RoZXIgbmV3Cj4gPiAg
ICAgbWVjaGFuaXNtLgoKWWVzLCBJJ3ZlIHNlZW4gZHJhY3V0IGJ1dCBJIHdhbnRlZCB0byBkbyBz
b21ldGhpbmcgb24gbXkgb3duIDopCgo+IEV4YWN0bHkuIFdlIGhhdmUgYW4gaW1wbGVtZW50YXRp
b24gb2YgZHJhY3V0LCBldmVuIGlmIHJpY2tldHksIHNvIEkgdG9vCj4gYmVsaWV2ZSB0aGF0LCBp
ZiBhbnl0aGluZywgdGhhdCBzaG91bGQgYmUgZml4ZWQgd2hlcmUgaXQgaXMgYnJva2VuLAo+IHJh
dGhlciB0aGFuIGFkZCBhIG5ldyB0b29sIHdpdGggb25seSBhICh2ZXJ5IGxpbWl0ZWQpIHN1YnNl
dCBvZiB0aGUKPiBmZWF0dXJlcyB0aGF0IGRyYWN1dCBhbHJlYWR5IHByb3ZpZGVzLgoKT2ssIEkg
c2VlLCBucC4KCj4gPiAoMykgSSBzZWUgeW91J3JlIHVzaW5nIGEgUGVybCBzY3JpcHQuIFdlIGdl
bmVyYWxseSB0cnkgdG8gaGF2ZSBtb3N0IG9mCj4gPiAgICAgdGhlIEJ1aWxkcm9vdCBwbHVtYmlu
ZyBpbXBsZW1lbnRlZCBlaXRoZXIgaW4gc2hlbGwgb3IgaW4gUHl0aG9uLgo+ID4gICAgIEhvd2V2
ZXIsIGl0J3MgdHJ1ZSB0aGF0IGhhdmluZyBhIFB5dGhvbiBpbnRlcnByZXRlciBvbiB0aGUgaG9z
dCBpcwo+ID4gICAgIG5vIGxvbmdlciByZXF1aXJlZCwgd2hpbGUgaGF2aW5nIGEgUGVybCBpbnRl
cnByZXRlciBpcyAod2hpY2ggd291bGQKPiA+ICAgICBnbyBpbiBmYXZvciBvZiBrZWVwaW5nIGEg
UGVybCBzY3JpcHQpLgo+Cj4gV2UgZG8gcmVxdWlyZSBwZXJsIGJlY2F1c2Ugc29tZSBwYWNrYWdl
cyBuZWVkIHBlcmwgYXMgcGFydCBvZiB0aGVpcgo+IGJ1aWxkc3lzdGVtOgo+ICAgLSBsaWJ4bWwt
cGFyc2VyLXBlcmwsIGludGx0b29sICg0OTYwNzhhMGEwNTMgZGVwZW5kZW5jaWVzOiBhZGQgcGVy
bCBhcwo+ICAgICBhIG1hbmRhdG9yeSBkZXBlbmRlbmN5KQo+ICAgLSB0aGUgbGludXgga2VybmVs
Cj4KPiBJbiBCdWlsZHJvb3QsIG5vdGhpbmcgcmVxdWlyZXMgcGVybDogd2UgaGF2ZSBubyB0b29s
aW5nIHdyaXR0ZW4gaW4gcGVybCwKPiBhbmQgSSB3b3VsZCBwcmVmZXIgdGhhdCBzdGF5cyB0aGF0
IHdheS4gV2UgaG93ZXZlciBoYXZlIGEgbG90IG9mIHB5dGhvbgo+IHRvb2xpbmcsIHNvIGlmIGF0
IGFsbCwgSSdkIHJhdGhlciB3ZSBhZGQgcHl0aG9uIGFzIGEgcmVxdWlyZW1lbnQgKG9yIGF0Cj4g
bGVhc3QgdGh0IHdlIGNoZWNrIGZvciBpdCBhbmQgZGlzYWJsZSB3aGF0ZXZlciBuZWVkcyBpdCwg
b3IgdGhhdCBpdAo+IGRlcGVuZHMgb24gaG9zdC1weXRob24zKS4KPgo+IFNvLCBsZXQncyB0cnkg
YW5kIGtlZXAgcGVybCBvdXQgb2YgQnVpbGRyb290LCBhbmQga2VlcCB3cml0aW5nIHB5dGhvbgo+
IHNjcmlwdHMuIEF0IHRoZSB3b3JzdCwgc2hlbGwgc2NyaXB0cywgYnV0IG5vdCBwZXJsLgoKT2ss
IHNvIHRoZSBmaW5hbCBjb25jbHVzaW9uIGZvciBtZSBpcyB0aGF0IGl0IGlzIG5vdCB3b3J0aCB0
byBzcGVuZAptb3JlIHRpbWUgb24gZGV2ZWxvcGluZyB0aGlzIHBhdGNoIGZvciBidWlsZHJvb3Qu
ClRoYW5rcyBmb3IgZXhwbGFuYXRpb25zIFRob21hcyBhbmQgWWFubi4KCktpbmQgUmVnYXJkcywK
V0sKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
