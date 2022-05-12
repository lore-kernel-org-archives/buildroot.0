Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98923C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 21:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A42082EC7;
	Thu, 12 May 2022 21:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id blhvFvH6ZXrk; Thu, 12 May 2022 21:54:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C6E282D04;
	Thu, 12 May 2022 21:54:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 250F51BF3D4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 21:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 140EC82D04
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 21:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ro31TA89IHMM for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 21:54:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C754182CE5
 for <buildroot@buildroot.org>; Thu, 12 May 2022 21:54:12 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id i19so12732066eja.11
 for <buildroot@buildroot.org>; Thu, 12 May 2022 14:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mTSue4zNI+yjriB6Sm0h+T51/3vAMcVyULachJO4AgA=;
 b=gQdHgSPgGp8TFhMXUbvCXzhGnM8Kro3yH1aEWe53TEUSM/FYYXSfSSK9C2V5yCh/Iw
 QzuK6MusP/tXsFIHtTUDzdAA2YlSKoCxqP87NZ1r0XWH5IuaJojyThusgGpc2ZlYblzy
 a1XB3mP7o2HscFzspQUeoXdRZKtsTb7IXRFKNnSzBqs09XxglfjUrKJAaeheMRcju5Pv
 acU5drCW23JuisFsu0UnGNc7/J77QALXYB03vEl8CkvpQc8iDY9THTevKwOru4cfrdIU
 H313G5X1dmuC+2dQmLw1pyceUjbvcth7AmW1HihTxfeeS2x1/j9CmEMTb6npIx4l4r+V
 8NmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mTSue4zNI+yjriB6Sm0h+T51/3vAMcVyULachJO4AgA=;
 b=voCaMJgRKfLo7ft69HK2i+3BWVUV6u/lORtVfTzTZmru+qTn/YJHkKJON3Ek907KtD
 8ixwlH9UdLDiYZSKf9Nz5elq3xXgp7HYPJkTxHmf233Skj8mI8ujzKoUC6xewGIq9yEv
 JD8B1ybLs0YRU/zZnXhZPH9DzgLiGJW6QkBdYYfjf+jK1xvczKWnSj1KzxP5MvmjssAv
 b769pAkX6aB3LGnerMvVRGZCPkXKSdFn8OPpf7cOKh53I1IwKP/7u6Hb3LAG64rvPTz2
 XU6qq76sbN/92r8sB4eWLkZ2aTJNsWBKEWZuOp7IIhA2fCqqIxBqbsxYHrQUUlK1/Bvj
 wkog==
X-Gm-Message-State: AOAM532V2MOcqTgek4fzwrNO4GRJ9EcK5/mzaahKt4CprhBm7Hvhqu0G
 xylgSLBuN6au0WeTp3tmp7Afyw==
X-Google-Smtp-Source: ABdhPJwmLQqqIq5ZvJM64vA50ZeTr0/XYQejHDc86CMhukGm0H39xYKa7f7/8yIicHMqRXgDPPh1eg==
X-Received: by 2002:a17:907:7e88:b0:6fa:55f:881a with SMTP id
 qb8-20020a1709077e8800b006fa055f881amr1682460ejc.476.1652392450875; 
 Thu, 12 May 2022 14:54:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 zd21-20020a17090698d500b006f3ef214dd0sm158638ejb.54.2022.05.12.14.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 14:54:10 -0700 (PDT)
Message-ID: <74693905-9bb5-94c3-6931-c102723d3fe5@mind.be>
Date: Thu, 12 May 2022 23:54:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: yann.morin@orange.com
References: <17102_1652250198_627B5656_17102_437_1_abf36ee4172876cd86eaa1ce6691ddca377f8b0b.1652250196.git.yann.morin@orange.com>
 <1e866bf0-454c-81a8-7194-19a5b22a1605@mind.be>
 <4719_1652299450_627C16BA_4719_69_1_20220511200406.GA1110715@tl-lnx-nyma7486>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <4719_1652299450_627C16BA_4719_69_1_20220511200406.GA1110715@tl-lnx-nyma7486>
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: explicitly do not
 download package withtout source
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

CgpPbiAxMS8wNS8yMDIyIDIyOjA0LCB5YW5uLm1vcmluQG9yYW5nZS5jb20gd3JvdGU6Cj4gQXJu
b3V0LCBBbGwsCj4gCj4gT24gMjAyMi0wNS0xMSAxOToxNSArMDIwMCwgQXJub3V0IFZhbmRlY2Fw
cGVsbGUgc3Bha2UgdGh1c2x5Ogo+PiBPbiAxMS8wNS8yMDIyIDA4OjIzLCB5YW5uLm1vcmluQG9y
YW5nZS5jb20gd3JvdGU6Cj4+PiBGcm9tOiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW5Ab3Jh
bmdlLmNvbT4KPiBbLS1TTklQLS1dCj4+PiBTbywgcmV2ZXJ0IHRvIHRoZSBiZWhhdmlvdXIgZnJv
bSBiZWZvcmUgZjBjN2NiMDFhOTYwLCB3aGVyZSBubyBkb3dubG9hZAo+Pj4gaXMgYXR0ZW1wdGVk
IGZvciBhIHBhY2thZ2Ugd2l0aG91dCBhIHNvdXJjZSAocmVhbGx5LCB3aXRob3V0IGEgbWFpbgo+
Pj4gZG93bmxvYWQsIG5vdykuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8
eWFubi5tb3JpbkBvcmFuZ2UuY29tPgo+Pj4gQ2M6IEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3Nl
bnNpdW0vTWluZCkgPGFybm91dEBtaW5kLmJlPgo+Pj4gLS0tCj4+PiAgIHBhY2thZ2UvcGtnLWdl
bmVyaWMubWsgfCAyICstCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1nZW5lcmljLm1rIGIv
cGFja2FnZS9wa2ctZ2VuZXJpYy5tawo+Pj4gaW5kZXggMzgyMTljZTA4OC4uYjIzM2IwNzU0OCAx
MDA2NDQKPj4+IC0tLSBhL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsKPj4+ICsrKyBiL3BhY2thZ2Uv
cGtnLWdlbmVyaWMubWsKPj4+IEBAIC0xOTIsNyArMTkyLDcgQEAgJChCVUlMRF9ESVIpLyUvLnN0
YW1wX2Rvd25sb2FkZWQ6Cj4+PiAgIAkJCWJyZWFrIDsgXAo+Pj4gICAJCWZpIDsgXAo+Pj4gICAJ
ZG9uZQo+Pj4gLQkkKGNhbGwgRE9XTkxPQUQsJCgkKFBLRylfTUFJTl9ET1dOTE9BRCksJChQS0cp
LCQocGF0c3Vic3QgJSwtcCAnJScsJCgkKFBLRylfRE9XTkxPQURfUE9TVF9QUk9DRVNTKSkpCj4+
PiArCSQoaWYgJCgkKFBLRylfTUFJTl9ET1dOTE9BRCksJChjYWxsIERPV05MT0FELCQoJChQS0cp
X01BSU5fRE9XTkxPQUQpLCQoUEtHKSwkKHBhdHN1YnN0ICUsLXAgJyUnLCQoJChQS0cpX0RPV05M
T0FEX1BPU1RfUFJPQ0VTUykpKSkKPj4KPj4gICBQZXJmZWN0aW9uIGlzIHRoZSBlbmVteSBvZiB0
aGUgZ29vZCBhbmQgYWxsIHRoYXQsIGJ1dCBhIGZldyBsaW5lcyBiZWxvdywgd2UKPj4gYWN0dWFs
bHkgaGF2ZSB0aGUgc2FtZSBpc3N1ZSBmb3IgQUNUVUFMX1NPVVJDRS4KPiAKPiBOb3BlLCBiZWNh
dXNlIHRoaXMgaXMgb25seSBldmVyIGF0dGVtcHRlZCBpZiB0aGUgYWN0dWFsIHNvdXJjZSBpcyBu
b3QKPiB0aGUgc2FtZSBhcyB0aGUgbWFpbiBzb3VyY2UgYW5kIGlmIEFDVFVBTF9TT1VSQ0UgaXMg
bm90IGVtcHR5Ogo+IAo+ICAgICA4NTIgJCgyKV9UQVJHRVRfQUNUVUFMX1NPVVJDRSA9wrskJCgk
KDIpX0RJUikvLnN0YW1wX2FjdHVhbF9kb3dubG9hZGVkCj4gICAgIC4uLgo+ICAgICA5NzQgIyBP
bmx5IGRvd25sb2FkIHRoZSBhY3R1YWwgc291cmNlIGlmIGl0IGRpZmZlcnMgZnJvbSB0aGUgJ21h
aW4nIGFyY2hpdmUKPiAgICAgOTc1IGlmbmVxICgkJCgkKDIpX0FDVFVBTF9TT1VSQ0VfVEFSQkFM
TCksKQo+ICAgICA5NzYgaWZuZXEgKCQkKCQoMilfQUNUVUFMX1NPVVJDRV9UQVJCQUxMKSwkJCgk
KDIpX1NPVVJDRSkpCj4gICAgIDk3NyAkKDEpLWxlZ2FsLXNvdXJjZTrCuyAkJCgkKDIpX1RBUkdF
VF9BQ1RVQUxfU09VUkNFKQo+ICAgICA5NzggZW5kaWYgIyBhY3R1YWwgc291cmNlcyAhPSBzb3Vy
Y2VzCj4gICAgIDk3OSBlbmRpZiAjIGFjdHVhbCBzb3VyY2VzICE9ICIiCj4gCj4gU28gSSBiZWxp
ZXZlIHRoYXQgd2UgZG8gbm90IGhhdmUgdGhlIGlzc3VlIHdpdGggQUNUVUFMX1NPVVJDRS4KCiAg
VHJ1ZSwgYnV0IGZlZWxzIGJyaXR0bGUuCgo+PiAgIFNvIG1heWJlIGluc3RlYWQgdGhlIGNvbmRp
dGlvbiBzaG91bGQgYmUgbW92ZWQgaW5zaWRlIHRoZSBET1dOTE9BRCBtYWNybywKPj4gYW5kIGl0
IHNob3VsZCBjaGVjayAkKG5vdGRpciAkKDEpKS4KPiAKPiBJIGRvbid0IHRoaW5rIHRoaXMgaXMg
Y29ycmVjdC4gSWYgdGhlIGRsLXdyYXBwZXIgd2VyZSB0byBiZSBjaGFuZ2VkLAo+IHRoZW4gaXQg
c2hvdWxkIGJlIGNoYW5nZWQgdG8gbm90IGFjY2VwdCB0byBiZSBjYWxsZWQgd2l0aG91dCBhbnkg
VVJJLgoKICBJIHdhcyB0YWxraW5nIGFib3V0IHRoZSBET1dOTE9BRCBtYWNybywgbm90IHRoZSBk
bC13cmFwcGVyLiBJIGFncmVlIHRoYXQgCmRsLXdyYXBwZXIgc2hvdWxkIGVycm9yIG91dCBpZiB0
aGUgLWYgcGFyYW1ldGVyIGlzIGVtcHR5IChvciBjb250YWlucyBzbGFzaGVzKS4KCgo+IEFmdGVy
YWwsIGlmIHdlIGNhbGwgdGhlIGRsLXdyYXBwZXIsIHRoYXQncyBleGFjdGx5IGJlY2F1c2Ugd2Ug
d2FudCB0bwo+IGRvd25sb2FkIHNvbWV0aGluZywgc28gaXQgZG9lcyBub3QgbWFrZSBzZW5zZSB0
byBjYWxsIGl0IGluIGEgd2F5IHRoYXQKPiB3aWxsIG5vdCB0cmlnZ2VyIGFueSBkb3dubG9hZC4K
CiAgSSBkbyBhZG1pdCB0aGF0IHlvdSBjb3VsZCBjbGFpbSB0aGUgc2FtZSBvZiB0aGUgRE9XTkxP
QUQgbWFjcm8uCgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4g
TU9SSU4uCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
