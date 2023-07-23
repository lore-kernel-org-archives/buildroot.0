Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C41FC001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 18:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8722081BB2;
	Sun, 23 Jul 2023 18:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8722081BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQ4qs7HV2xgY; Sun, 23 Jul 2023 18:33:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B096B81BBD;
	Sun, 23 Jul 2023 18:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B096B81BBD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 593281BF59E
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 18:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E53160A8A
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 18:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E53160A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iW-AcRPk6yaX for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 18:33:12 +0000 (UTC)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3A4560A63
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 18:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A4560A63
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-557790487feso2572553a12.0
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 11:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690137192; x=1690741992;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gDlhtWqRE5t1FuZvsqD9nTl3sT1vAMz+dTzUBBechCs=;
 b=ZDC21jYYYoodjAjmUQRmn3vtjKSnWyioLwPYTUP2TMO2uxexHnrReG01g2p2aFcmXJ
 2YZqO12tJCZ/i1DuiMz9903tq9cYk3kIjGeZFmw9JKkClA2QFOcOS47+dAxof1J0JGd3
 9D1SEPGOZDzyaxYPolsXzyPiWpHiwtoGc7gLApXZh8tXI6+zZEjndJoyizRaMHLvW8bS
 J5UZCCfykP/yPT/mebyMUmSb1YKNfdohJCAXNXrvcV75x8FH/j3Ne7pS7DovOAVV0ZRT
 txopwiEilfrBo6WOhYf6dkQ2RVElFjCDAB9auLkxc0isETTEBBtcW2ViyOco2q6RoQwE
 L2NQ==
X-Gm-Message-State: ABy/qLZR2OeXZ7OlDcLcv6iTdC27phfQhx3lZPTMvT9Cp/kI1KFrOgag
 r2MmbkK7KGTFiAz1iCsF4I2v3H5MBX4vsT49lsQ=
X-Google-Smtp-Source: APBJJlGzqkvD+Ed/oiFz1mPTVRyFjl/ANdrFasmQ88POpZZJDQriWZdQsDcH+8Wp6lvFWXNhARC4vAmK6PtqLxYgZoo=
X-Received: by 2002:a17:90b:30f:b0:268:1e51:3496 with SMTP id
 ay15-20020a17090b030f00b002681e513496mr210463pjb.21.1690137191874; Sun, 23
 Jul 2023 11:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230721063755.315887-1-eagle.alexander923@gmail.com>
 <20230721225516.06eb14e0@windsurf>
In-Reply-To: <20230721225516.06eb14e0@windsurf>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Sun, 23 Jul 2023 21:33:00 +0300
Message-ID: <CAP1tNvT=gQ6kDsV=63D7rdbAGXrfqzsmswQNafDJJAy8W6xa9w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690137192; x=1690741992;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gDlhtWqRE5t1FuZvsqD9nTl3sT1vAMz+dTzUBBechCs=;
 b=P4Qdikc7OfWO5zHDPtkjeGpuSgmYkElLGWxvi2hvdoIdP6rBX5M/siMJYEF6joIat1
 ik1CwWkfg+5PAp71sfBT/uR/Ae6EXpFXGpZZ+RyaJrpt2QHH5HNjzLl1VbVMNARkaT3Q
 VqpRgcgiy5FUPR6stPQFhvJ6MB+bDIa51SnwGqzgYVX1s1w0R/q+ZqOOP0z04h02udU8
 fHOoAcdjDwe2Q/QKRzZ0VwQCfwCzZt85T4klOYQCLUTMxRl3THBcFdMPNs24eG53/mXI
 dFmFNuIRLMYV7+OKRGfIWpylq3YsuI9UJlttX21QCuqK30gxYedJywMAWMmDupXBCkzL
 zOYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=P4Qdikc7
Subject: Re: [Buildroot] [PATCH] boot/barebox: Fix building of internal
 scripts
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

VGhhbmtzIGZvciB0aGUgY29tbWVudHMsIEkgd2lsbCBkbyB2Mi4KCtC/0YIsIDIxINC40Y7Quy4g
MjAyM+KAr9CzLiDQsiAyMzo1NSwgVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBi
b290bGluLmNvbT46Cj4KPiBIZWxsbyBBbGV4YW5kZXIsCj4KPiBPbiBGcmksIDIxIEp1bCAyMDIz
IDA5OjM3OjU1ICswMzAwCj4gQWxleGFuZGVyIFNoaXlhbiA8ZWFnbGUuYWxleGFuZGVyOTIzQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiA+IGRpZmYgLS1naXQgYS9ib290L2JhcmVib3gvQ29uZmlnLmlu
IGIvYm9vdC9iYXJlYm94L0NvbmZpZy5pbgo+ID4gaW5kZXggMzk2MWM2OWM1Ni4uOWE4MjkxYzk0
NCAxMDA2NDQKPiA+IC0tLSBhL2Jvb3QvYmFyZWJveC9Db25maWcuaW4KPiA+ICsrKyBiL2Jvb3Qv
YmFyZWJveC9Db25maWcuaW4KPiA+IEBAIC0xLDUgKzEsNiBAQAo+ID4gIGNvbmZpZyBCUjJfVEFS
R0VUX0JBUkVCT1gKPiA+ICAgICAgIGJvb2wgIkJhcmVib3giCj4gPiArICAgICBzZWxlY3QgQlIy
X1BBQ0tBR0VfSE9TVF9QS0dDT05GCj4KPiBTdHJpY3RseSBzcGVha2luZywgdGhpcyBpcyBub3Qg
bmVlZGVkLgo+Cj4gSG93ZXZlciwgb25lIGlzc3VlIHdpdGggeW91ciBwYXRjaCBpcyB0aGF0IHlv
dSBkb24ndCBhZGQgaG9zdC1wa2djb25mCj4gaW4gQkFSRUJPWF9ERVBFTkRFTkNJRVMsIHNvIHRo
ZXJlIGlzIG5vdGhpbmcgdGhhdCBlbnN1cmVzIGhvc3QtcGtnY29uZgo+IHdpbGwgYmUgYnVpbHQg
YmVmb3JlIGJhcmVib3guCj4KPiBBbm90aGVyIGlzc3VlIGlzIHRoYXQgQmFyZWJveCBpcyBsb29r
aW5nIGZvciBob3N0IE9wZW5TU0wsIGFuZCB5b3UgaGF2ZQo+IG5vIGd1YXJhbnRlZSB0aGF0IE9w
ZW5TU0wgaXMgaW5zdGFsbGVkIHN5c3RlbS13aWRlIG9uIHRoZSBidWlsZAo+IG1hY2hpbmUuIFRo
ZXJlZm9yZSwgYSBkZXBlbmRlbmN5IG9uIGhvc3Qtb3BlbnNzbCBpcyBhbHNvIG5lZWRlZC4gSQo+
IHRoaW5rIHRoaXMgY2FsbHMgZm9yIGFuIG9wdGlvbiBsaWtlIEJSMl9UQVJHRVRfVUJPT1RfTkVF
RFNfT1BFTlNTTCwgYnV0Cj4gZm9yIEJhcmVib3guCj4KPiA+ICsjIEluIG9yZGVyIHRvIGNvbXBp
bGUgc29tZSBiYXJlYm94IHRhcmdldCB0b29scyB3ZSBuZWVkIHRvIHVzZSBwa2ctY29uZmlnLAo+
ID4gKyMgc28gbGV0cyBhbHdheXMgdXNlIENPTkZJR1VSQVRPUl9NQUtFX0VOViB3cmFwcGVyLgo+
ID4gKyAgICAgJCQoJCgxKV9DT05GSUdVUkFUT1JfTUFLRV9FTlYpICQkKE1BS0UpICQkKCQoMSlf
TUFLRV9GTEFHUykgLUMgJCQoQEQpCj4gPiAgICAgICAkJCgkKDEpX0JVSUxEX0NVU1RPTV9FTlYp
Cj4gPiAgZW5kZWYKPgo+IEkgZG9uJ3QgdGhpbmsgPHBrZz5fQ09ORklHVVJBVE9SX01BS0VfRU5W
IGlzIGludGVuZGVkIHRvIGJlIHVzZWQgaGVyZS4KPiBJdCBpcyBpbmRlZWQgdG8gYmUgdXNlZCBm
b3IgdGhlIHN0ZXBzIHJlbGF0ZWQgdG8gdGhlIGNvbmZpZ3VyYXRpb24gb2YKPiBrY29uZmlnLXBh
Y2thZ2UsIHRvIHJ1biBtYWtlIG1lbnVjb25maWcsIG1ha2UgeGNvbmZpZywgZXRjLgo+Cj4gSW4g
VS1Cb290LCB3ZSdyZSBkb2luZyB0aGlzOgo+Cj4gICAgICAgICAkKFRBUkdFVF9DT05GSUdVUkVf
T1BUUykgXAo+ICAgICAgICAgICAgICAgICBQS0dfQ09ORklHPSIkKFBLR19DT05GSUdfSE9TVF9C
SU5BUlkpIiBcCj4gICAgICAgICAgICAgICAgIFBLR19DT05GSUdfU1lTUk9PVF9ESVI9Ii8iIFwK
PiAgICAgICAgICAgICAgICAgUEtHX0NPTkZJR19BTExPV19TWVNURU1fQ0ZMQUdTPTEgXAo+ICAg
ICAgICAgICAgICAgICBQS0dfQ09ORklHX0FMTE9XX1NZU1RFTV9MSUJTPTEgXAo+ICAgICAgICAg
ICAgICAgICBQS0dfQ09ORklHX0xJQkRJUj0iJChIT1NUX0RJUikvbGliL3BrZ2NvbmZpZzokKEhP
U1RfRElSKS9zaGFyZS9wa2djb25maWciIFwKPiAgICAgICAgICAgICAgICAgJChVQk9PVF9NQUtF
KSAtQyAkKEBEKSAkKFVCT09UX01BS0VfT1BUUykgXAo+ICAgICAgICAgICAgICAgICAkKFVCT09U
X01BS0VfVEFSR0VUKQo+Cj4gU28gcHJvYmFibHkgd2UgbmVlZCBzb21ldGhpbmcgc2ltaWxhciBo
ZXJlLgo+Cj4gQmVzdCByZWdhcmRzLAo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25p
LCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
