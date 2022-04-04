Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8B7C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 15:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70ADF827FB;
	Mon,  4 Apr 2022 15:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WK8UXWnr6xb6; Mon,  4 Apr 2022 15:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F63282503;
	Mon,  4 Apr 2022 15:17:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AFDB1BF3D0
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 15:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7913C60FDA
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 15:17:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PyvSqEzKM79w for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 15:17:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED7BD60FB6
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 15:17:52 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id qh7so10628867ejb.11
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OvAimSmUApFhEw+Mq0maiCa8ZKsXBBMYtjCMdgZDy+o=;
 b=RjhaDxkmpJyM+/TNqpdQqCLJRyTYSMkudDLqwUqt9rvcyl1ptIMJ9mdIbZjdcz3VyA
 li/2XKE4ojZr+nioI6qjuVYw91kLKo9IS4aNDs9gJO4W6gNNoz9xJoO6GCZTdFqzPSBb
 jdmyenAsYCwQsN3z55HgAPokKEAoO03tTdPKq8fgQCbFtUMH+pRB5hzA25nQNssw5kir
 AHrmSakwXX4+l0vA/JVXnKGAb6CmIt4462/Wu8EKjYG/Mwk6k/Of0uqhKlF6yE18zz89
 /zb0i/r1DpEyF2pQEEfEF5kINk+tloChWDzk13eDAtzDuz7xzU0gvAXYJIdGvPC3uxVJ
 RxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OvAimSmUApFhEw+Mq0maiCa8ZKsXBBMYtjCMdgZDy+o=;
 b=6FOlgwgqjWbWtIrc07f/PC0w37QE0RvKpFogJS2Padr5n2zPH63VKE8LXL+N6agbX6
 CgE4dRRaImT8syl8aunk0rhEg1USY7XKM2kSvGv7o4o3QSaBSaBkQKMyrmr/PhKTWvxG
 nA9D5VknmIE89MLAFujp7k+G8Gd/4nX9IOc1VmJHQk5xtRtukR63JNKCjN2JAbe/9GaQ
 dfL8Y1L6Ofgwh8xg3S9XGzxppv1gqkeuUt8Uh73ciQVsQYvDqHbitpJgpK6ZuJdI4Lbn
 mY8/J3pLGpM6sABW0L53reP3NIWKnZGW64/MWP0x0aJZfVlPLOd0+Ro2103pDtAPLRUE
 4Hvw==
X-Gm-Message-State: AOAM531idJ5qAsNcvZNdYJVXa4ERfcR92bLv1EiMCCydkhyNuRgwaNuq
 UeJ15F/8c5OvXg80gMqukjYVbILS1RZYGQ==
X-Google-Smtp-Source: ABdhPJwWQiGzh1jI9ep8A75yj0eli+GvXdbpQQ4K4ss52AN1jg4+Kq98IHCtpZMxoPQFtAyNHrgNkg==
X-Received: by 2002:a17:907:1606:b0:6df:f528:4033 with SMTP id
 hb6-20020a170907160600b006dff5284033mr528422ejc.433.1649085470997; 
 Mon, 04 Apr 2022 08:17:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a17090674cc00b006df9afdda91sm4471799ejl.185.2022.04.04.08.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 08:17:50 -0700 (PDT)
Message-ID: <f0efd4b3-c752-58ff-c9ad-1756d314e7e2@mind.be>
Date: Mon, 4 Apr 2022 17:17:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Sourabh Hegde <hrsourabh011@gmail.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <CADYjeStce6+hEvk54=LGcgwTfPy7f2D_o=463haRjqOAOLj_1A@mail.gmail.com>
 <f10fe951-249a-25cb-b476-20cca3122e65@theobroma-systems.com>
 <CADYjeSt9V+WjTfms4pM7J_g5-jSVE9ngc5uRjXRtfcq0iOtJNg@mail.gmail.com>
 <a44d36f4-05cd-1198-5788-1a5e1ec84c6f@theobroma-systems.com>
 <CADYjeSunuDshm9E8t9y+39tT9a1tu6BT3m=eKEgVG15uWgaM0Q@mail.gmail.com>
 <9271680c-ab96-f8c0-ff76-fea5e8e5d2ba@theobroma-systems.com>
 <CADYjeSuEG=Qh3-=tQDUi9R_n5D8J1hV0PZGDQg7NvbCbEjy4gQ@mail.gmail.com>
 <CADYjeSsK7HYfB4_WzsPiez4s8Ffa2vQ-J7N+H1=qJTQYyR6MjQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADYjeSsK7HYfB4_WzsPiez4s8Ffa2vQ-J7N+H1=qJTQYyR6MjQ@mail.gmail.com>
Subject: Re: [Buildroot] Buildroot | ninja build error | /usr/bin/ld:error
 adding symbols: file in wrong format
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBTb3VyYWJoLAoKICBQbGVhc2UgZG9uJ3QgdG9wLXBvc3QsIGJ1dCByZXBseSBpbmxpbmUg
bGlrZSBJIGRvIGJlbG93LiBOb3RlIHRoYXQgdGhpcyAKcmVxdWlyZXMgY29uZmlndXJpbmcgeW91
ciBtYWlsZXIgdG8gcXVvdGUgcmVwbGllcyBwcm9wZXJseS4KCgpPbiAwNC8wNC8yMDIyIDEwOjM2
LCBTb3VyYWJoIEhlZ2RlIHdyb3RlOgo+IEhlbGxvwqBRdWVudGluLAo+IAo+IEkgbWFkZSBzb21l
IHByb2dyZXNzIHRvIGJ1aWxkIGNhc3luYyBhcyBob3N0LWNhc3luYy4gSSBtb2RpZmllZCBjYXN5
bmMubWsgCj4gPGh0dHA6Ly9jYXN5bmMubWs+IGZpbGUgdG8gaW5jbHVkZSAiSE9TVF9DQVNZTkNf
REVQRU5ERU5DSUVTID0gaG9zdC1hY2wgCj4gaG9zdC1saWJjdXJsIGhvc3Qtb3BlbnNzbCIgYmVs
b3cgIkNBU1lOQ19ERVBFTkRFTkNJRVMgPSBhY2wgbGliY3VybCBvcGVuc3NsIi4gCj4gQW5kIGFs
c28gYWRkZWQgQlIyX1BBQ0tBR0VfSE9TVF9DQVNZTkM9WUVTIHRvIGNvbmZpZy4gCgogIFlvdSBk
b24ndCBuZWNlc3NhcmlseSBuZWVkIGEgQ29uZmlnLmluIG9wdGlvbiBmb3IgYSBob3N0IHBhY2th
Z2UuIE5vcm1hbGx5LCBpdCAKY2FuIHNpbXBseSBiZSBhZGRlZCB0byB0aGUgZGVwZW5kZW5jaWVz
IG9mIGFub3RoZXIgcGFja2FnZSBhbmQgbm8gbW9yZS4KCj4gVGhlbiBpZiBJIHJ1biBtYWtlIAo+
IGhvc3QtY2FzeW5jIGl0IHJlc3VsdHMgaW4KPiAKPiBtYWtlWzFdOsKgKsKgTm8gcnVsZSB0byBt
YWtlIHRhcmdldCAnaG9zdC1saWJmdXNlJwoKICBZb3Ugc2FpZCB0aGF0IHlvdSBhZGRlZCBvbmx5
IGhvc3QtYWNsLCBob3N0LWxpYmN1cmwgYW5kIGhvc3Qtb3BlbnNzbCBzbyAKSE9TVF9DQVNZTkNf
REVQRU5ERU5DSUVTLCBzbyB0aGVyZSBzaG91bGQgYmUgbm8gcmVhc29uIGZvciBob3N0LWxpYmZ1
c2UgdG8gYmUgCmJ1aWx0LiBBcmUgeW91IHN1cmUgeW91IGFsc28gZGlkbid0IGFjY2lkZW50YWxs
eSBhZGQKSE9TVF9DQVNZTkNfREVQRU5ERU5DSUVTICs9IGhvc3QtbGliZnVzZSA/Cgo+IAo+IEkg
dGhpbmsgdGhpcyBpcyByZWxhdGVkIHRvIGJlbG93IERFUEVOREVOQ1kgaW4gY2FzeW5jLm1rIDxo
dHRwOi8vY2FzeW5jLm1rPiBmaWxlOgo+IGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCRlVTRSkseSkK
PiBDQVNZTkNfREVQRU5ERU5DSUVTICs9IGxpYmZ1c2UKCiAgVGhpcyBvbmx5IGFkZHMgdGhlIGRl
cGVuZGVuY3kgZm9yIHRoZSB0YXJnZXQgcGFja2FnZSwgbm90IGZvciB0aGUgaG9zdCBwYWNrYWdl
LgoKCiAgVGhlcmUgc2hvdWxkIGJlIG5vIHJlYXNvbiBhdCBhbGwgdG8gZW5hYmxlIGZ1c2UgZm9y
IGhvc3QtY2FzeW5jLiBTbyBpdCdzIGJlc3QgCnRvIGFsc28gc2V0ICh1bmNvbmRpdGlvbmFsbHkp
CgpIT1NUX0NBU1lOQ19DT05GX09QVFMgKz0gLURmdXNlPWZhbHNlCgoKICBSZWdhcmRzLAogIEFy
bm91dAoKPiBDQVNZTkNfQ09ORl9PUFRTICs9IC1EZnVzZT10cnVlCj4gZWxzZQo+IENBU1lOQ19D
T05GX09QVFMgKz0gLURmdXNlPWZhbHNlCj4gZW5kaWYKPiAKPiBCdXQgSSBoYXZlIHNlbGVjdGVk
wqBCUjJfUEFDS0FHRV9MSUJGVVNFPXkgaW4gbWVudWNvbmZpZy4gV2hhdCBlbHNlIHNob3VsZCBi
ZSAKPiBzZWxlY3RlZMKgZm9yICJmdXNlIj8KPiAKPiBDYW4geW91IHBsZWFzZSBsZXQgbWUga25v
d8KgaG93IHRvIHNldCB1cCBidWlsZHJvb3QgdG8gdXNlIGJ1aWxkIG1hY2hpbmUgbGlicz8KPiAK
PiBUaGFua3MgaW4gYWR2YW5jZS4KPiAKPiBPbiBGcmksIDEgQXByIDIwMjIgYXQgMTQ6MjksIFNv
dXJhYmggSGVnZGUgPGhyc291cmFiaDAxMUBnbWFpbC5jb20gCj4gPG1haWx0bzpocnNvdXJhYmgw
MTFAZ21haWwuY29tPj4gd3JvdGU6Cj4gCj4gICAgIEhlbGxvwqBRdWVudGluLAo+IAo+ICAgICAg
ICAgSSBhc3N1bWUgeW91IG5lZWQgdGhpcyBhdCBidWlsZCB0aW1lIHRoZW4gc2luY2UgeW91IGFy
ZSB0YWxraW5nIGFib3V0Cj4gICAgICAgICBiaW5hcnkgZm9yIHRoZSBob3N0IHN5c3RlbS4gSW4g
dGhhdCBjYXNlLCB5b3UgbmVlZCB0byBhZGQgaG9zdC1jYXN5bmMgdG8KPiAgICAgICAgIHlvdXIg
Y29uZmlnLgo+IAo+ICAgICAgICAgSG93ZXZlciwgY2FzeW5jIGlzIGN1cnJlbnRseSBhIHRhcmdl
dC1vbmx5IHBhY2thZ2UuCj4gCj4gCj4gICAgIElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHRo
ZW4gYXMgb2Ygbm93IEJ1aWxkcm9vdCBjYW4ndCBiZSB1c2VkIHRvIGNyZWF0ZQo+ICAgICBjYXN5
bmMgaG9zdCBwYWNrYWdlLgo+IAo+ICAgICAgICAgJChldmFsICQoaG9zdC1tZXNvbi1wYWNrYWdl
KSkKPiAKPiAgICAgICAgIGF0IHRoZSBlbmQgb2YgdGhlIHBhY2thZ2UvY2FzeW5jL2Nhc3luYy5t
ayA8aHR0cDovL2Nhc3luYy5tay8+wqBmaWxlLgo+IAo+IAo+ICAgICBJIHdpbGwgdHJ5IHRoaXMg
c29sdXRpb24uCj4gCj4gICAgIEJ1dCB3aGF0IGNvdWxkIGJlIHRoZSBvdGhlcsKgYWx0ZXJuYXRp
dmUgdG8gd29yayB3aXRoIGNhc3luYz8KPiAKPiAgICAgVGhhbmtzIGluIGFkdmFuY2UKPiAKPiAg
ICAgT24gRnJpLCAxIEFwciAyMDIyIGF0IDEzOjU0LCBRdWVudGluIFNjaHVsego+ICAgICA8cXVl
bnRpbi5zY2h1bHpAdGhlb2Jyb21hLXN5c3RlbXMuY29tCj4gICAgIDxtYWlsdG86cXVlbnRpbi5z
Y2h1bHpAdGhlb2Jyb21hLXN5c3RlbXMuY29tPj4gd3JvdGU6Cj4gCj4gICAgICAgICBIaSBTb3Vy
YWJoLAo+IAo+ICAgICAgICAgT24gNC8xLzIyIDEzOjQxLCBTb3VyYWJoIEhlZ2RlIHdyb3RlOgo+
ICAgICAgICAgID4gSGVsbG8gUXVlbnRpbiwKPiAgICAgICAgICA+Cj4gICAgICAgICAgPiBtYWtl
IGNhc3luYwo+ICAgICAgICAgID4+Cj4gICAgICAgICAgPj4gaWYgeW91IHdhbnQgaXQgaW4gYW4g
aW1hZ2UgY3JlYXRlZCBieSBCdWlsZHJvb3QsIG1vZGlmeSB5b3VyIGNvbmZpZyB3aXRoCj4gICAg
ICAgICAgPj4gbWFrZSBtZW51Y29uZmlnIGFuZCBzYXZlIHlvdXIgY2hhbmdlcywgdGhlbiBydW4g
bWFrZS4KPiAgICAgICAgICA+Pgo+ICAgICAgICAgID4KPiAgICAgICAgICA+IEJ1dCB3aWxsIHRo
aXMgY3JlYXRlIGJpbmFyeSBmb3IgaG9zdCBzeXN0ZW0gYWxzbz8gU29ycnksIGl0cyBiaXQKPiAg
ICAgICAgIGNvbmZ1c2luZwo+ICAgICAgICAgID4gaGVyZS4KPiAgICAgICAgICA+Cj4gCj4gICAg
ICAgICBObywgaG9zdCBwYWNrYWdlcyBhbmQgdGFyZ2V0IHBhY2thZ2VzIGFyZSBjb21waWxlZCB3
aXRoIGEgZGlmZmVyZW50IGtleXdvcmQuCj4gCj4gICAgICAgICBtYWtlIGNhc3luYyBpcyBmb3Ig
dGFyZ2V0IHBhY2thZ2UKPiAgICAgICAgIG1ha2UgaG9zdC1jYXN5bmMgaXMgZm9yIGhvc3QgcGFj
a2FnZQo+IAo+ICAgICAgICAgID4gSSBuZWVkIGNhc3luYyB0b29sIHVzZSB3aXRoICJyYXVjIiBh
cyBnaXZlbiBpbgo+ICAgICAgICAgID4KPiAgICAgICAgIGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9v
ZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fcmF1Yy5yZWFkdGhlZG9jcy5pb19lbl9sYXRl
c3RfYWR2YW5jZWQuaHRtbC0yM2NyZWF0aW5nLTJEY2FzeW5jLTJEYnVuZGxlcyZkPUR3SUZhUSZj
PV9zRXI1eDlrVVdodWs0X25Gd2pKdEEmcj1MWWpMZXhEbjdyWEl6Vm1rTlB2dzV5bUExWFRTcUhH
cTh5QlA2bTZxWlo0bmpaZ3VRaFpoa0lfLTE3MklJeTF0Jm09QWlOMmJOYTVFRmo3OXkyMks1NTRk
anVGQkJYZV9NTUVJUlMxLWd3RXNidzNjaDY5akJxNHE5ajB0bV93ejFWOCZzPTZtU3MxUGtFWEtr
MDFBTW51UUt5Q0FQVjBBOWV1VGlQcmpfYlA0bUdISjAmZT0KPiAgICAgICAgIDxodHRwczovL3Vy
bGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX3JhdWMucmVhZHRoZWRv
Y3MuaW9fZW5fbGF0ZXN0X2FkdmFuY2VkLmh0bWwtMjNjcmVhdGluZy0yRGNhc3luYy0yRGJ1bmRs
ZXMmZD1Ed0lGYVEmYz1fc0VyNXg5a1VXaHVrNF9uRndqSnRBJnI9TFlqTGV4RG43clhJelZta05Q
dnc1eW1BMVhUU3FIR3E4eUJQNm02cVpaNG5qWmd1UWhaaGtJXy0xNzJJSXkxdCZtPUFpTjJiTmE1
RUZqNzl5MjJLNTU0ZGp1RkJCWGVfTU1FSVJTMS1nd0VzYnczY2g2OWpCcTRxOWowdG1fd3oxVjgm
cz02bVNzMVBrRVhLazAxQU1udVFLeUNBUFYwQTlldVRpUHJqX2JQNG1HSEowJmU9Pgo+ICAgICAg
ICAgID4KPiAgICAgICAgICA+IFdoZW4gSSBkbyAicmF1YyBjb252ZXJ0IC0tY2VydD08Y2VydGZp
bGU+IC0ta2V5PTxrZXlmaWxlPgo+ICAgICAgICAgID4gLS1rZXlyaW5nPTxrZXlyaW5nPiBjb252
ZW50aW9uYWwtYnVuZGxlLnJhdWNiIGNhc3luYy1idW5kbGUucmF1Y2IiCj4gICAgICAgICAgPgo+
IAo+ICAgICAgICAgSSBhc3N1bWUgeW91IG5lZWQgdGhpcyBhdCBidWlsZCB0aW1lIHRoZW4gc2lu
Y2UgeW91IGFyZSB0YWxraW5nIGFib3V0Cj4gICAgICAgICBiaW5hcnkgZm9yIHRoZSBob3N0IHN5
c3RlbS4gSW4gdGhhdCBjYXNlLCB5b3UgbmVlZCB0byBhZGQgaG9zdC1jYXN5bmMgdG8KPiAgICAg
ICAgIHlvdXIgY29uZmlnLgo+IAo+ICAgICAgICAgSG93ZXZlciwgY2FzeW5jIGlzIGN1cnJlbnRs
eSBhIHRhcmdldC1vbmx5IHBhY2thZ2UuCj4gCj4gICAgICAgICBUbyBjcmVhdGUgYSBob3N0IHBh
Y2thZ2UsIHlvdSBuZWVkIGF0IHRoZSB2ZXJ5IGxlYXN0IHRvIGFkZDoKPiAKPiAgICAgICAgICQo
ZXZhbCAkKGhvc3QtbWVzb24tcGFja2FnZSkpCj4gCj4gICAgICAgICBhdCB0aGUgZW5kIG9mIHRo
ZSBwYWNrYWdlL2Nhc3luYy9jYXN5bmMubWsgPGh0dHA6Ly9jYXN5bmMubWs+IGZpbGUuCj4gCj4g
ICAgICAgICBUaGlzIG1pZ2h0IG5vdCBiZSBlbm91Z2ggYW5kIG1pZ2h0IHJlcXVpcmUgc29tZSBh
ZGRpdGlvbmFsIHR3ZWFrcyB0byB0aGUKPiAgICAgICAgIHBhY2thZ2UgbWFrZWZpbGUuCj4gCj4g
ICAgICAgICBDaGVlcnMsCj4gICAgICAgICBRdWVudGluCj4gCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
