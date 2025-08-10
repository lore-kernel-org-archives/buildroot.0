Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AE9C87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 13:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 785E840DCE;
	Sun, 10 Aug 2025 13:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvUZ5LKIfWAz; Sun, 10 Aug 2025 13:27:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B17D40C84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B17D40C84;
	Sun, 10 Aug 2025 13:27:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6B8831
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 13:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C31E740C84
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 13:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-fqBYWqvZdL for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 13:27:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8FB440C0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8FB440C0A
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8FB440C0A
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 13:27:41 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-459ddada9b1so33474225e9.0
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 06:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754832459; x=1755437259;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FERBlFuqobROesPbObkcEbG5UuLxPULUpV+GPzslU4g=;
 b=XxvahanfVzPbbuCXF/cjM7G0CTiTWiVQZo1AHykbp3vpf2tT4jIHPUGSEUcxC4KlXz
 sQO6Y2+rd2VoEJ4viEs1jGYfQR1xnU1KuXNMfVJpAb31T5P1dS9u/PorzMeA0fbh2wVs
 wYne3ZXMh249tQIgftEwmknFRsrPT9SGo1o+arH3/zqAdY0qc8RVFvwbzc8dVWYFDi4c
 HYF50KF1zUmpVd2oGfhcbmCdRWph9bV24A6hb9rN5KTi6tnI0XfBc5q5fEgGbF8cPB/D
 R6Kxz1GdfpzjcSTuEP5G+zuQZ1h5dy4s1O71WEV0IUk8TPphIXx4cFTQ1VqTOOCjg4yH
 /GzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfGAvHdRaaQC56w/B1uniRjIHUhhPTjTuroKdz1DgUBCpt3W9rL3o4ZxzhYMjSCS0DHWTkuBxbegs=@buildroot.org
X-Gm-Message-State: AOJu0YwjMsIWHNhluvp6VC7BH+eStTM37r3EqhOnB9iY01MVTkPviMuJ
 WHYJbzuFCC/J/QOaJporHN9EikQckhU3hvLI9CF4BmHsTQ2TPb77ZkoXighgUvkJpA8=
X-Gm-Gg: ASbGncstgIz2a4sOMG29xoZcBduV6uEQIw44Pof2hduTrbckRVHeBXJPvnXf5trkvrT
 nDm+D6zD020KRAxqXu+cUBNHPOU4oec7WRdQ77M01nXgTtHUaoEe9lc+/1CRNrHlkeACyGUFSD/
 03nihnALwu7hgKUoI12PlgeLigBdAmv2xC6+IOxHyjyVNrMsK0KpO3xbofoySD5Sq9G6nZdKJk2
 WUPYstBtNP/DaWLTmnU7cD1dLHD3OSrGtXW/ytxachyE/jRajNOnNcYwleQ7eHoy0CozRwZ65CT
 LtwhGXKQiYlwhQt8G3uOlg7c/hMtaC6qYy0QT6+vMbdr4/GBXXDSQr7MTqfG4SFeDAK4F/cbY55
 R+wq3xxVwk1BhKHG2kk78j64fVbgz7gHzhwA2BYGPzvDrbQXZNLFEXm4C75FMCb5Nn2GXmCVucd
 FHPztV+1HSzLVYyLfiqTGi6BeJXx3aFjPO1kYqX58FuJgFOsROKSktIAXsW6Yy
X-Google-Smtp-Source: AGHT+IG7RE2kY1GQvZIw1ICXuU2CdEKRAtQ+isHm6jfAo76BBrtvAozZHSoR78T8B641fezy1MFwUQ==
X-Received: by 2002:a05:6000:4308:b0:3b7:9350:d372 with SMTP id
 ffacd0b85a97d-3b900b4e1c5mr9360292f8f.24.1754832459369; 
 Sun, 10 Aug 2025 06:27:39 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0846777sm27392615f8f.48.2025.08.10.06.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 06:27:39 -0700 (PDT)
Message-ID: <4c1ea62a-c93c-4ee6-9919-5da5f9a8d0b1@smile.fr>
Date: Sun, 10 Aug 2025 15:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 buildroot@buildroot.org, =?UTF-8?Q?Miqu=C3=A8l_Raynal?=
 <miquel.raynal@bootlin.com>, Wade Berrier <wberrier@gmail.com>,
 Florian Weimer <fweimer@redhat.com>
References: <20250802-fix_ngrep-v1-1-03dbe4c6b0ce@bootlin.com>
 <bb6b38a0-ef8b-4e52-8934-7813994da85e@smile.fr>
 <20250810124904.2d77ac82@windsurf>
Content-Language: fr, en-US
In-Reply-To: <20250810124904.2d77ac82@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754832459; x=1755437259; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FERBlFuqobROesPbObkcEbG5UuLxPULUpV+GPzslU4g=;
 b=lcx+YQ9tw+I+i/KdrXlH0KmKlMMrbAOEuYboKqxpZI6/QX/iMnKrZnIe/oR7gB9WCH
 KIJmXr52onf/IqjMM4ZkZah6Ty/iYyJzfJXkvw2sRtJdIQWt6ca0Eb/J0MjIsUGK7OIh
 rjBKxyU049B6egOQ0A668xKh/ZWjX7vTLBTfk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=lcx+YQ9t
Subject: Re: [Buildroot] [PATCH] package/ngrep: fix implicit function
 declaration
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMTAvMDgvMjAyNSDDoCAxMjo0OSwgVGhvbWFzIFBldGF6em9uaSBh
IMOpY3JpdMKgOgo+IEhlbGxvIFJvbWFpbiwKPiAKPiBUaGFua3MgZm9yIHRoZSByZXZpZXcsIGJ1
dCBzb21ldGhpbmcgaXMgbm90IGNsZWFyLiBTZWUgYmVsb3cuCj4gCj4gT24gU2F0LCA5IEF1ZyAy
MDI1IDIzOjUyOjU1ICswMjAwCj4gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+
IHdyb3RlOgo+IAo+PiBIZWxsbyBUaG9tYXMsIEFsbCwKPj4KPj4gTGUgMDIvMDgvMjAyNSDDoCAx
MzozNywgVGhvbWFzIEJvbm5lZmlsbGUgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+Pj4gRml4
ZXM6IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8yMGIvMjBiOTI0YzVj
OTZiM2Y0M2UzODFkODdlNTlmYjE2MGJhOGQzZGNkMC8vICAKPj4KPj4gUGxlYXNlLCBjYW4geW91
IHByb3ZpZGUgeW91ciBhbmFseXNpcyBvbiB0aGlzIGlzc3VlPwo+Pgo+PiBGcm9tIHRoZSBwYXRj
aCwgSSB1bmRlcnN0YW5kIHRoYXQgaXQncyBhbiBlcnJvciBnZW5lcmF0ZWQgYnkgZ2NjLTE0IChh
biBuZXdlcikuCj4+IEJ1dCBuZ3JlcCBwYWNrYWdlIGZhaWwgdG8gYnVpbGQgb25seSB3aGVuIEJS
Ml9QQUNLQUdFX0xJQk5FVCBpcyBzZWxlY3RlZC4KPiAKPiBTbyB5b3UgYXNrIGZvciBtb3JlIGRl
dGFpbHMgKHdoaWNoIHdvdWxkIGVuY291cmFnZSB0aGUgc3VibWl0dGVyIHRvCj4gc2VuZCBhIG5l
dyB2ZXJzaW9uIG9mIHRoZSBwYXRjaCkuLi4KPiAKPj4gSSB1cGRhdGVkIHRoZSBjb21taXQgbG9n
IHdpdGggYSBkZWZjb25maWcgYW5kIHRoZSBtaW5pbWFsIGdjYyB2ZXJzaW9uIHRvCj4+IHJlcHJv
ZHVjZSB0aGUgaXNzdWUuCj4gCj4gLi4uIGJ1dCB5b3Ugc2F5IHlvdSBoYXZlIGFscmVhZHkgdXBk
YXRlZCB0aGUgY29tbWl0IGxvZyB3aXRoIG1vcmUKPiBkZXRhaWxzLiBTbz8gRGlkIHlvdSBhbHJl
YWR5IGFwcGx5IHRoZSBwYXRjaCBhbmQgc2VuZGluZyBhIG5ldwo+IGl0ZXJhdGlvbiBpcyBub3Qg
bmVlZGVkLCBvcj8KClllcywgSSBtZXJnZWQgdGhlIHBhdGNoIHdpdGggYWRkaXRpb25hbCBpbmZv
cm1hdGlvbiBpbiB0aGUgY29tbWl0IGxvZzoKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2NvbW1pdC81M2QyZWY3ZWM2ZmM0MDZhMjNhNWM1YTEzYTRhM2FlZmM4
ZGUzNTYzCgpNeSBpbml0aWFsIGludGVuZCB3YXMgaW5kZWVkIHRvIGFzayBmb3IgbW9yZSBkZXRh
aWxzIGJ1dCBmaW5hbGx5IGZpZ3VyZWQgb3V0CndoYXQgd2FzIHRoZSBpc3N1ZS4gSSBzaG91bGQg
aGF2ZSB1cGRhdGVkIG15IGVtYWlsIGJlZm9yZSBzZW5kaW5nIGl0LgoKQmVzdCByZWdhcmRzLApS
b21haW4KCgo+IAo+IFRoYW5rcyEKPiAKPiBUaG9tYXMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
