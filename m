Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ACFC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 09:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 451934337C;
	Thu,  2 Nov 2023 09:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 451934337C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w0t4q4FopEv6; Thu,  2 Nov 2023 09:51:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94FB440B47;
	Thu,  2 Nov 2023 09:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94FB440B47
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 490371BF591
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 09:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2036140B47
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 09:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2036140B47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5OaqGOgpUXKa for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 09:51:45 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7029240158
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 09:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7029240158
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53de0d1dc46so1211082a12.3
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 02:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698918703; x=1699523503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GQgNvR3CcEWN9kYMGpGpeCEo+VF6ncMu3ndCbe8loJQ=;
 b=xQaZaIbpH7NKZHgpunsSi8QeuSblarXP4K7m29QI9XzjQwAtrD1rTTFoEn6wJxGmhi
 oymYf7ZmxKSLi0NsjmfoEKIs9ZW1mIeOk2eFLtZhOcwA71uWoJHeE0k9/bXPN10kZ1EH
 BTL8Fbm/Q76aYOkB/97scBNvaNHjOAP6pYglES4P4nW9mNteOPcpwCtYQqtsNAI7/yLK
 Vyx0tEvEPxxfeMKV5lOL53wtWKd0MBUU1J9j9oJfc6cfsojxflFfYexjv13R+fBrVrK+
 OoMa6/JLy+uj/B+Xag0eycj5HKD6fe8ymM8ySYSYbS+SODgqy4BS28jboY4KCpI4nT/b
 /SIg==
X-Gm-Message-State: AOJu0Yx9aYwtadygVGdrxE/qRxURw7UXQur9AesKcCR4DMUpbRoeefkC
 dxnHYzV9fvc2pBK0FdzTz7fZjzd+sqjUJp4CO7wJE3Wc/EbmwuVS
X-Google-Smtp-Source: AGHT+IFjBGwvDWNHnetXYxpbroKHHlCAcLHqNKDNX4lTygrWKkAydizuzVkkp2ahm/vWcQgzBmfujtGflsnNE+EKJjQ=
X-Received: by 2002:a17:907:971d:b0:9be:ab38:a361 with SMTP id
 jg29-20020a170907971d00b009beab38a361mr4263010ejc.8.1698918703186; Thu, 02
 Nov 2023 02:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231010070558.9791-1-ramirez.clement3@gmail.com>
 <874jiydiiq.fsf@tarshish>
 <CADRKr2ov7vayiQPreXt1Z5mhy848UJxztJ+seMmGk1t36ikRiw@mail.gmail.com>
 <87v8bec0pm.fsf@tarshish>
 <CADRKr2oNM2btAby66VOSNCs2bJkheButc7R+5N7kB-Kc7YuWtg@mail.gmail.com>
 <20231101172935.4daa4d99@windsurf>
 <CADRKr2pREAb+Yjb3kZPv4zj+mr0_pg9ZdB47eR0N+o2zZOsYtA@mail.gmail.com>
 <20231102104722.090eab1a@windsurf>
In-Reply-To: <20231102104722.090eab1a@windsurf>
From: =?UTF-8?Q?Cl=C3=A9ment_Ramirez?= <ramirez.clement3@gmail.com>
Date: Thu, 2 Nov 2023 10:51:07 +0100
Message-ID: <CADRKr2oDrv=uckKtOw60gULd=A6ris+8KqUe983qwKhG_yoZ5Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698918703; x=1699523503; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GQgNvR3CcEWN9kYMGpGpeCEo+VF6ncMu3ndCbe8loJQ=;
 b=ZKTyjV4utlcEs++9Rt7q4DKzpTHtJjb/dckz2YYw+V/Ioe3FFqQ6ZSlhoc1L4LFdmt
 APQpg7/+tvPgEoW2PCHq3mp9mAS1OxoR7fVwTE8OXTyk36qgAnE3hCiEWR3pYHJfLJoR
 zjJJFtzET0ojnaeblXbfqGbZGGh4wPplMjcz6UkP+jT8QQH5NjFzYrDkG+9dVGvHgDA0
 Zo7xqIlMdeOloO+jrAQ4NlOMqdX2VAZw4aH6Vu4zPJLQaADYtm365D+DO1yHv0vBibAa
 w1y52XFl+E0qsEpe6REUhxkrlLFSflAGMJz5CKaEwe+mm0FkXwgTFhFQtEZ4dSbysuGt
 xTAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZKTyjV4u
Subject: Re: [Buildroot] [PATCH] package/qemu: security bump version to 8.1.1
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhhdCB3aWxsIGhlbHAgbWUgYSBsb3QsCgpUaGFua3MgIQoKTGUgamV1LiAyIG5vdi4gMjAyMyDD
oCAxMDo0NywgVGhvbWFzIFBldGF6em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4g
YSDDqWNyaXQgOgo+Cj4gSGVsbG8gQ2zDqW1lbnQsCj4KPiBPbiBUaHUsIDIgTm92IDIwMjMgMTA6
Mzc6MzYgKzAxMDAKPiBDbMOpbWVudCBSYW1pcmV6IDxyYW1pcmV6LmNsZW1lbnQzQGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiA+IFRoYXQgd2lsbCBiZSB2ZXJ5IG5pY2UsIGFuZCBzaW1wbGVyIHRoYW4g
Z2VuZXJhdGluZyBhbiBYTUwgZW50cnkgYXMgZGVzY3JpYmVkCj4gPiBvbiB0aGUgQ1BFIHN1Ym1p
c3Npb24gd2ViIHBhZ2UgKFswXSkuCj4gPiBJIHdpbGwgdHJ5IHRvIGVtYWlsIHRoZW0gdG9kYXkg
YW5kIEkga2VlcCB5b3UgdXBkYXRlZCBpZiBJIGVuY291bnRlcmVkCj4gPiBzb21lIHByb2JsZW1z
IHRvIGRvIGl0Lgo+Cj4gRm9yIHJlZmVyZW5jZSwgaGVyZSBpcyBhbiBlLW1haWwgSSBzZW50IHRv
IHRoZW0sIGFuZCBmb2xsb3dpbmcgd2hpY2gKPiB0aGV5IGRpZCBmaXggdGhlIENWRSBkYXRhYmFz
ZS4KPgo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQo+IEZyb206IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRh
enpvbmlAYm9vdGxpbi5jb20+Cj4gVG86IG52ZEBuaXN0Lmdvdgo+IENjOiAiYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmciIDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4KPiBTdWJqZWN0OiBDVkUtMjAy
MS00MDM0IHZlcnNpb24gcmFuZ2UgZml4Cj4gRGF0ZTogU2F0LCAyIFNlcCAyMDIzIDE5OjM0OjM0
ICswMjAwCj4gT3JnYW5pemF0aW9uOiBCb290bGluCj4gTWVzc2FnZS1JRDogPDIwMjMwOTAyMTkz
NDM0LjQ4NjVkYmQ0QHdpbmRzdXJmPgo+Cj4gRGVhciBOVkQgbWFpbnRhaW5lcnMsCj4KPiBDVkUt
MjAyMS00MDM0IGlzIG1hcmtlZCBpbiB0aGUgTlZEIGRhdGFiYXNlIGFzIGFmZmVjdGluZyBhbGwg
dmVyc2lvbnMKPiBvZiB0aGUgcG9sa2l0IHByb2plY3QgZHVlIHRvIHRoZSBmb2xsb3dpbmcgIkNv
bmZpZ3VyYXRpb24gMSI6Cj4KPiAgIGNwZToyLjM6YTpwb2xraXRfcHJvamVjdDpwb2xraXQ6Kjoq
Oio6KjoqOio6KjoqCj4KPiBIb3dldmVyLCBhcyBpbmRpY2F0ZWQgaW4KPiBodHRwczovL252ZC5u
aXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyMS00MDM0LCB0aGlzIGlzc3VlIGhhcyBiZWVuCj4g
Zml4ZWQgaW4gdGhlIHVwc3RyZWFtIHBvbGtpdCBwcm9qZWN0IGFzIG9mIGNvbW1pdAo+IGh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9wb2xraXQvcG9sa2l0Ly0vY29tbWl0L2EyYmY1Yzlj
ODNiNmFlNDZjYmQ1Yzc3OWQzMDU1YmZmODFkZWQ2ODMuCj4KPiBJbiB0dXJuLCB0aGlzIGNvbW1p
dCBpcyBpbnRlZ3JhdGVkIGluIHBvbGtpdCBzaW5jZSB2ZXJzaW9uIDEyMToKPgo+IHBvbGtpdCQg
Z2l0IHRhZyAtLWNvbnRhaW5zIGEyYmY1YzljODNiNmFlNDZjYmQ1Yzc3OWQzMDU1YmZmODFkZWQ2
ODMKPiAxMjEKPiAxMjIKPiAxMjMKPgo+IFNvLCB0aGUgIkNvbmZpZ3VyYXRpb24gMSIgc2hvdWxk
IGJlIGZpeGVkIHRvIGluZGljYXRlIHRoYXQgb25seQo+IHZlcnNpb25zIDwgMTIxIGFyZSBhZmZl
Y3RlZC4gQ291bGQgdGhpcyBiZSBhZGRyZXNzZWQgaW4geW91ciBOVkQKPiBkYXRhYmFzZT8KPgo+
IEJlc3QgcmVnYXJkcywKPgo+IFRob21hcyBQZXRhenpvbmkKPiA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPgo+IEJl
c3QgcmVnYXJkcywKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIg
YW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcg
YW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
