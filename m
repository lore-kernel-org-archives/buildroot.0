Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3917C5478C
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 21:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63F4D41C2B;
	Thu, 22 Feb 2024 21:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P4RJYYqZb2ta; Thu, 22 Feb 2024 21:36:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71E3041C54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71E3041C54;
	Thu, 22 Feb 2024 21:36:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B336A1BF3D6
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 21:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD34541D7C
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 21:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ed8ZUwQnMBAh for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 21:36:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8BE5041C54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BE5041C54
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BE5041C54
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 21:36:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4128cfb6c1aso1628475e9.0
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 13:36:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708637765; x=1709242565;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vL4hKNfTwlNHSsj3mQw/QZJuK56bxhhqvjyZGi4KaAM=;
 b=gkfSgGUcItvQXxUPG5RVEv+OwQoBYIj0UL5p4n4ViFRMPiro6M7Hg66ur0aIL6Zno2
 KnJ6fo+KMF8V3/6Ff6KJuBTq5QrcPkIOj9Ecmd+4XxUHl/zry56altmafIp2t8Yegr8A
 M9s+17bGiGJxuRau3xWp3MEHWpjZNr32U1rHxm/6et/c0pMSoEq0HkPs9KkZjb8RlmwJ
 LMjwRH2NqzItOH8vnn3UGInLsgns1hRCMxGfq3NkR+RODVRxXqOMWkBWgvIFMZ2ZpfG3
 /Q0R5uGQoTwkXs3JA11MpamRCECNlhs3oKbL8gq/OhTQu8phZV4o2r54ftkUQjviynqp
 VeGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ849vjOYI9ILoE6EQAVRS5sMYXGxw3gYvMW2vharggdDYHL23I8+1j7PX0PJQLC426CWp8vCip7MIGMpPjJN4FHDqY0QGbA==
X-Gm-Message-State: AOJu0YxM5JEy9asFdfM/aHBhkqHiqNpGbFIi8odmHeFHt8iPK6521mmJ
 scLoz7x+Qex3OZPD8p2QSLSL+IqEvC/Njqset30N6QVxrXUsXICVBKMhaRaaMKk=
X-Google-Smtp-Source: AGHT+IG1DEHB5BXnDwGK1Ifjp+L17VFnRVHIbLeZBNFogwtpxMSpe/jnPmCctaBhMuNBlLOe9U0pYw==
X-Received: by 2002:a05:600c:4fcb:b0:412:568b:50b5 with SMTP id
 o11-20020a05600c4fcb00b00412568b50b5mr165695wmq.14.1708637765282; 
 Thu, 22 Feb 2024 13:36:05 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a05600c4e4600b0041276d96349sm7415965wmq.8.2024.02.22.13.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 13:36:05 -0800 (PST)
Message-ID: <2a97a88a-a173-4fc0-a13a-97dfebcbe87f@smile.fr>
Date: Thu, 22 Feb 2024 22:36:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
 <20240222101617.18422-10-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240222101617.18422-10-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708637765; x=1709242565;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vL4hKNfTwlNHSsj3mQw/QZJuK56bxhhqvjyZGi4KaAM=;
 b=YuIWa0SuIvyCGTL6clFUrWdBzvxyknBcQjs/mfVLSb3oEYtq2EKwpy9OIJSU3HoNzq
 Mqtwi74btuex9mai9iGirjIaCQ8ECIl06O9DRipQ9yACt5bNtmIWCGZs6vnFKRSJDJ9z
 HkJE8XzlFrTt9Ux4uFRoZbteCM+TNSv0YDkWDXh9QMUCWXVtZgBufg7ZqUU+0/vDB6qR
 CP4sA7mXY7DT/xCYh+4LN0AX37QH2/GLBvUXexpd9gYg3ZEbXzfMKxYKSFtJg4bk7WAb
 i1Xftm9oR+unhCsYofslLFTtAyadSFPD1KSusFe5zYx1gR9YKZxem7hZsQpyFHyMhEEZ
 2OMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=YuIWa0Su
Subject: Re: [Buildroot] [PATCH v5 09/16]
 package/python-jsonschema-specifications: add host variant
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAyMi8wMi8yMDI0IMOgIDExOjE2LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFJlY2VudCB2ZXJzaW9uIG9mIFUtQm9vdCB1c2UgYmlubWFuIHRvIHByb3ZpZGUg
YSBtZWNoYW5pc20gZm9yIGJ1aWxkaW5nCj4gaW1hZ2VzLCBmcm9tIHNpbXBsZSBTUEwgKyBVLUJv
b3QgY29tYmluYXRpb25zLCB0byBtb3JlIGNvbXBsZXgKPiBhcnJhbmdlbWVudHMgd2l0aCBtYW55
IHBhcnRzLiBUaGlzIHBhY2thZ2UgaXMgcmVxdWlyZWQgYnkgYmlubWFuLgo+IAo+IENvLWRldmVs
b3BlZC1ieTogTWljaGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0
aW9ucy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hp
QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IAo+IC0tLQo+IAo+IG5vIGNoYW5nZXMgc2luY2UgdjMK
PiAKPiBDaGFuZ2VzIGluIHYzOgo+IC0gRHJvcCBDb25maWcuaW4uaG9zdAo+IAo+ICBwYWNrYWdl
L3B5dGhvbi1qc29uc2NoZW1hLXNwZWNpZmljYXRpb25zLm1rICAgICAgICAgICAgICAgICAgICAg
IHwgNSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLWpzb25zY2hlbWEtc3BlY2lmaWNhdGlvbnMvcHl0aG9uLWpz
b25zY2hlbWEtc3BlY2lmaWNhdGlvbnMubWsgYi9wYWNrYWdlL3B5dGhvbi1qc29uc2NoZW1hLXNw
ZWNpZmljYXRpb25zL3B5dGhvbi1qc29uc2NoZW1hLXNwZWNpZmljYXRpb25zLm1rCj4gaW5kZXgg
NDA4Nzk4OThjOWQ0Li5iNmUzMDlhYjJiYzkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24t
anNvbnNjaGVtYS1zcGVjaWZpY2F0aW9ucy9weXRob24tanNvbnNjaGVtYS1zcGVjaWZpY2F0aW9u
cy5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWpzb25zY2hlbWEtc3BlY2lmaWNhdGlvbnMvcHl0
aG9uLWpzb25zY2hlbWEtc3BlY2lmaWNhdGlvbnMubWsKPiBAQCAtMTQsNCArMTQsOSBAQCBQWVRI
T05fSlNPTlNDSEVNQV9TUEVDSUZJQ0FUSU9OU19ERVBFTkRFTkNJRVMgPSBcCj4gIAlob3N0LXB5
dGhvbi1oYXRjaGxpbmcgXAo+ICAJaG9zdC1weXRob24taGF0Y2gtdmNzCj4gIAo+ICtIT1NUX1BZ
VEhPTl9KU09OU0NIRU1BX1NQRUNJRklDQVRJT05TX0RFUEVOREVOQ0lFUyA9IFwKPiArCWhvc3Qt
cHl0aG9uLWhhdGNobGluZyBcCj4gKwlob3N0LXB5dGhvbi1oYXRjaC12Y3MKPiArCgpweXRob24t
anNvbnNjaGVtYS1zcGVjaWZpY2F0aW9ucyBkZXBlbmRzIG9uIGhvc3QtcHl0aG9uLXJlZmVyZW5j
aW5nIGR1ZSB0byBhCnJ1bnRpbWUgZGVwZW5kZW5jeS4gTm90aWNlIHRoZSAic2VsZWN0IEJSMl9Q
QUNLQUdFX1BZVEhPTl9SRUZFUkVOQ0lORyAjIHJ1bnRpbWUiCmluIENvbmZpZy5pbiBmb3IgdGhl
IHRhcmdldCB2YXJpYW50LgoKaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVp
bGRyb290L3BhdGNoLzIwMjQwMjEzMTcyODE3LjI4NzI4NDktOC1yb21haW4ubmFvdXJAc21pbGUu
ZnIvCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gICQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkK
PiArJChldmFsICQoaG9zdC1weXRob24tcGFja2FnZSkpCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
