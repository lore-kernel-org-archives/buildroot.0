Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0223C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 08:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 479624022B;
	Fri, 19 Jul 2024 08:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IpiOR9MgmYvS; Fri, 19 Jul 2024 08:12:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00D9B40F53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00D9B40F53;
	Fri, 19 Jul 2024 08:12:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3F481BF362
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 08:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EFD240F53
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 08:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NwmufCd5f49 for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 08:12:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=gnijieb@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45C114022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45C114022B
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45C114022B
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 08:12:39 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-368584f9e36so441371f8f.2
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 01:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721376757; x=1721981557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Or0GRrY+8cK72ZUmsE2FTsvyvRq0y1qIFBkqrVk1v8=;
 b=gzdJ0XHXh10X17qtxcEiNnkEyjS7NqSYnvvkZPzL3+uFSZOe4/qMYQ2dby/3a4r9zF
 IFN/q4Am3D/wDFJXoMJkveCSGYQaJa2JxR++wKEjD2ELAlgYLqGJADkxcWEec8Ka94L0
 9YeHir6v9ooa63OgKQd93+ztk26hB8Wlflg+1n5dwEzHuaSC8G3iaFvmbB7gJqQb1jVM
 1/2kp1adwgcA0vrJr3vTWvu8v027ttahwBZlVD67hg6rm5d7dYuq8zZtRDgVbjYqA3UZ
 QeacN44NGWcQbj/IZirUkqDrEcZ8UhMQ5FkOzvJW6McAIH2UMT1NVYkO3u4o57GnUrSw
 EnTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSKG7Q3m11kxPI2XPL+L1VhEqmAsvQfUkDNo+PjTAKu1gTXGElDIiFs9wRjU36AGwtIybDwLZWUg0FWx+Q9cfxuJHNNJhzcA==
X-Gm-Message-State: AOJu0YwoSs+pFpE52cm5wGkYhLfkRJzLGsI0cXovvur63X4BwwlmgSgG
 Wc+57IaD2qRvRVsxmwjz55eqCdrh38ZH76qIp2/wvnUkdqU3JpVJH96hIB4qHrTVpUa4lgzhp9X
 xZTpCHgWbKKnplzKUbQ5qWPMQRoiaumzL6MA=
X-Google-Smtp-Source: AGHT+IHbA5CY/JiaDSR0sZ6hK8AXAMRKvhcdMCjzoYoRh4PH0QRrFR72o75swfl2akTD7KTSrtf/UH0mKLm9sPW4iHA=
X-Received: by 2002:a5d:4525:0:b0:367:8f29:f7b8 with SMTP id
 ffacd0b85a97d-3683170e337mr4946725f8f.51.1721376756830; Fri, 19 Jul 2024
 01:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <CA+h8R2rXC7pFxf4EtUM1ppGjLviduQki4UD1bzZb8_ZByj4JXA@mail.gmail.com>
 <8b4e27a50df0f4c4770eeb7f7edfed5f2c1f8483.camel@gmail.com>
 <87zfqxuxc7.fsf@dell.be.48ers.dk>
 <b335fcb8-5ea2-4ca9-9bf8-a5d62caab290@mind.be>
 <becc07c45d7f9b8fef18ef9c1a22a3f307524bae.camel@gmail.com>
 <87v81jvko4.fsf@dell.be.48ers.dk>
In-Reply-To: <87v81jvko4.fsf@dell.be.48ers.dk>
From: Andreas Hilse <andreas.hilse@googlemail.com>
Date: Fri, 19 Jul 2024 10:12:25 +0200
Message-ID: <CANabuZer5AXD=y-6Qc0y6h5DHB4yNoYdQF5P1w2uRBvtn51d8Q@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1721376757; x=1721981557; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Or0GRrY+8cK72ZUmsE2FTsvyvRq0y1qIFBkqrVk1v8=;
 b=bBcPjCyfImWz4OVNkp8yvoLsrCLg4HssnNmotD2bRgLvAGSxZvSbP2YR8i+jQTqgd+
 3/492RBphdGvDv3HibOUh6o6kY+WjXwKof5RZePDXSgtyehHyedJcjkpVgvN8fy3wsB7
 rAfUEDGMsd9cQQ04ONBl++5FQhUT90xa4Y0TMdEPhZsYyfViAjcRXfrvT76euQqnFQyR
 Mv6gd9ii6qNJ4sObAmyO4mu9GbIB72wBaXiXgV2k3DUNhN0zbi/y3wTef6mdHOZqWeCh
 Kvq4B/dZNZsrQ5Jqewi6rqWDZI5VyxLpDJSOb8iChZ2SXiUlASEUTvm/RQfu9wigvbsK
 HRgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bBcPjCyf
Subject: Re: [Buildroot] package/openssh: please backport bump to 9.8p1
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpBcyBJJ3ZlIGJlZW4gc2VlaW5nIHRoZSBwYXRjaCBmb3IgOS43IG9uIHRo
ZSAyMDI0LjAyLnggYnJhbmNoIEkgYW0KYXNzdW1pbmcgdGhlcmUgd2lsbCBiZSBubyBiYWNrcG9y
dCBmb3IgOS44cDE/ClRoaXMgd291bGQgbWVhbiB0aGF0IHRoZSBMVFMgcmVsZWFzZSAyMDI0LjAy
IHdpbGwgZ2V0IGZhbHNlIHBvc2l0aXZlcwpieSB2dWxuZXJhYmlsaXR5IHNjYW5uZXJzIHRoYXQg
b25seSBjaGVjayBmb3IgdGhlIHZlcnNpb24uCgpXZSB1c2UgdGhlIExUUyB2ZXJzaW9uIGFuZCB1
cGdyYWRlIGVhY2ggeWVhciwgYnV0IHdpdGggdGhpcyB3ZQpwcm9iYWJseSBoYXZlIHRvIHVwZ3Jh
ZGUgdG8gdGhlIGxhdGVzdCBzdGFibGUgcmVsZWFzZS4KCkkgZm9sbG93ZWQgdGhlIGRpc2N1c3Np
b24gaGVyZSBhbmQgdW5kZXJzdGFuZCB0aGF0IDkuOHAxIHJlcXVpcmVzIHNvbWUKYWRkaXRpb25h
bCBjaGFuZ2VzLgpBcmUgeW91IHN0aWxsIHBsYW5uaW5nIHRvIGJhY2twb3J0IDkuOHAxIHRvIDIw
MjQuMDIueD8KCkJlc3QgcmVnYXJkcwpBbmRyZWFzCgoKT24gRnJpLCBKdWwgNSwgMjAyNCBhdCA3
OjAw4oCvUE0gUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPgo+
ID4+Pj4+ICJKb2FjaGltIiA9PSBKb2FjaGltIFdpYmVyZyA8dHJvZ2xvYml0QGdtYWlsLmNvbT4g
d3JpdGVzOgo+Cj4gID4gT24gVGh1LCAyMDI0LTA3LTA0IGF0IDIyOjEwICswMjAwLCBBcm5vdXQg
VmFuZGVjYXBwZWxsZSB3cm90ZToKPiAgPj4gT24gMDQvMDcvMjAyNCAxNDo1OSwgUGV0ZXIgS29y
c2dhYXJkIHdyb3RlOgo+ICA+PiA+IFllcywgSSB3aWxsIGdldCB0byBpdCB0aGlzIHdlZWtlbmQu
IEknbGwgaGF2ZSBhIGxvb2sgaWYgY2hlcnJ5LQo+ICA+PiA+IHBpY2tpbmcgdGhlIGZpeCBvbiA5
LjcgaXMgYmV0dGVyIHRoYW4gYnVtcGluZyBnaXZlbiB0aGF0IERTQSBrZXlzCj4gID4+ID4gYXJl
IG5vIGxvbmdlciBzdXBwb3J0ZWQuCj4KPiAgPiBQZXRlciwgSSBoYWQgYSBsb29rIGF0IHRoZSBo
dHRwczovL3d3dy5vcGVuc3NoLmNvbS9yZWxlYXNlbm90ZXMuaHRtbAo+ICA+IGFuZCBhcHBhcmVu
dGx5Ogo+Cj4gID4gICAgIkRTQSBzdXBwb3J0IG1heSBiZSByZS1lbmFibGVkIGluIE9wZW5CU0Qg
Ynkgc2V0dGluZyAnRFNBS0VZPXllcycKPiAgPiAgICAgaW4gTWFrZWZpbGUuaW5jLiBUbyBlbmFi
bGUgRFNBIHN1cHBvcnQgaW4gcG9ydGFibGUgT3BlblNTSCwgcGFzcwo+ICA+ICAgICB0aGUgJy0t
ZW5hYmxlLWRzYS1rZXlzJyBvcHRpb24gdG8gY29uZmlndXJlLiIKPgo+ICA+IFNvIEkgZ3Vlc3Mg
d2l0aCB0aGF0IDkuOHAxIGNvdWxkIHN0aWxsIGJlIGEgY2FuZGlkYXRlIGZvciAyMDI0LjAyLng/
Cj4KPiBZZXMsIGlmIG9sZCBrZXlzIHdvcmsgd2l0aCA5LjhwMSwgdGhlbiB0aGF0IGlzIElNSE8g
cHJlZmVyYWJsZSB0byB1c2UKPiBmb3IgMjAyNC4wMi54IGFzIGl0IG1ha2VzIGl0IGVhc2llciB0
byB1cGRhdGUgaW4gdGhlIGZ1dHVyZSBpZiBvdGhlcgo+IGlzc3VlcyBhcmUgZm91bmQuIFdlIGNv
dWxkIGV2ZW4gYWRkIGEgZGVmYXVsdC1ubyBvcHRpb24gb24gbWFzdGVyIHRvCj4gc3VwcG9ydCB0
aG9zZSBsZWdhY3kga2V5cyB0aGVyZSBhcyB3ZWxsLgo+Cj4gLS0KPiBCeWUsIFBldGVyIEtvcnNn
YWFyZAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
