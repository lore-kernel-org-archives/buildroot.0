Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DA3ECE571
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 20:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77918605E6;
	Sat,  7 Sep 2024 20:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RY68FyN400Rv; Sat,  7 Sep 2024 20:52:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7092860659
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7092860659;
	Sat,  7 Sep 2024 20:52:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F3CE91BF3DA
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0973402C2
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gXNTyxQOZBi for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 20:52:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2e; helo=mail-vs1-xe2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7FB9440250
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FB9440250
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FB9440250
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 20:52:30 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-49be2ef28aaso413546137.3
 for <buildroot@buildroot.org>; Sat, 07 Sep 2024 13:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725742349; x=1726347149;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZWZPNZdscUIo0Gikn4CfD5kBjwRCK1lfuMEUnliweQ=;
 b=MjVosW+Ou43FsR4xZ3Z0Bpdz3w6Ce640vtnusLIM86VJQlm/fn9Zim3ChIWwOaA/lI
 JDnqqIVHwVRu8TBmSFlsdd1XDrTNwd1CMRp2BLbuATXB19GlraCNqhrEDKuUTE00L8Es
 99THKFj+S3H25RZoLBX3bvPWTXC8seqX9keLXJcmPLxJoW+EpDuJLI87XS+QOs0TuFRF
 RiwSR3v8LHkNXNdgQOr00zGvG9Jblbvaffin1Rff/L8GUSE/AKIp2Wx0iPlHrgonmlqb
 7khoHuPzUFxw5tEBcCzfZJ02GuX040nr0BzQQhn3Fug3Xb/GBSA13YVytQimubEJ7Ow5
 iLJw==
X-Gm-Message-State: AOJu0YwzawBJR6xU2okQVFbzfbVE+sx1XhbOY6GSebGlPj3azyDf+M6X
 fu8LE+38ZFJmtnlQJGzp11qpMfn2jprNkwBJ9iGa15cSilg3NF0iRxYSr65BEwxSSKEFS3G6nWp
 CyL98zBlZ0TaGMdTxpSIIPBX5ZWo=
X-Google-Smtp-Source: AGHT+IFrnNnYH2q+u41Wu3l5IgJyaue6UtIrEjaV3z4O1PBJ1zP97Bspx7KycasF77zwl1LBBeK9iSdodg/wSLZmB6w=
X-Received: by 2002:a05:6102:390c:b0:498:9a94:d797 with SMTP id
 ada2fe7eead31-49bde22bb13mr5933772137.20.1725742349064; Sat, 07 Sep 2024
 13:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240906184756.1166732-1-james.hilliard1@gmail.com>
 <20240906184756.1166732-2-james.hilliard1@gmail.com>
 <ZtysrvrjZ6EEwuyc@landeda>
 <CADvTj4rnN9F6obtE7uaptYY6jdhOJJB8sOcstutOP1FTB6tb1Q@mail.gmail.com>
 <Zty8ngItqAFuU89g@landeda>
In-Reply-To: <Zty8ngItqAFuU89g@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 7 Sep 2024 14:52:18 -0600
Message-ID: <CADvTj4p714bYVRjE6yn04E7VzcBt=Z3pGJ0XwGTMksz=GU86oQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725742349; x=1726347149; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OZWZPNZdscUIo0Gikn4CfD5kBjwRCK1lfuMEUnliweQ=;
 b=nJT9ANeUk//RbGmFFdPpWSJbjYwQ5VlVgmxUbeWICt+Z9IZ0q0atE4c8FOGKSBuPPd
 x1+aDpdICQIpNQo2YEzfbzQd4tCGH95sbjM+xwQJbo20T8nVZqtB8MZZ3dDcAsXf9SBG
 Ovqp6hQowM6QauI8lO/egoUDcp1IPIpF5UnLb5htOgmdbzBzoLW4pEPa8BPeyzKnLsW3
 uIQuCl2nyh48JsA9mDQAP8eDEfuUTYauXQou8puPrM/Pb8417FmeP1i4im5owSgytf6a
 JZVCzKbf5RXnacjVb3MpQQNCUMr0XhnFM42ikzR8wZUFE8SulK8yO4kt3buLLadFslxK
 S9zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nJT9ANeU
Subject: Re: [Buildroot] [PATCH 2/2] package/python-pydantic: bump to
 version 2.9.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBTZXAgNywgMjAyNCBhdCAyOjUw4oCvUE0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gSmFtZXMsIEFsbCwKPgo+IE9uIDIwMjQtMDktMDcg
MTQ6NDEgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPiA+IE9uIFNhdCwgU2Vw
IDcsIDIwMjQgYXQgMTo0MuKAr1BNIFlhbm4gRS4gTU9SSU4gPFsxXXlhbm4ubW9yaW4uMTk5OEBm
cmVlLmZyPgo+ID4gd3JvdGU6Cj4gPiAgICAgVGhpcyBpcyB3ZWlyZCB0aGF0IGl0IGlzIG5lZWRl
ZCwgYmVjYXVzZSB0aGUgZGVwZW5kZW5jeSBpcyB3cml0dGVuIGFzCj4gPiAgICAgYW4gb3B0aW9u
YWwgZGVwZW5kZW5jeSwgc3BlY2lmaWMgdG8gd2luMzI7Cj4gWy0tU05JUC0tXQo+ID4gSXQncyBu
b3QgbGlzdGVkIHVuZGVyIG9wdGlvbmFsIGluIHZlcnNpb24gMi45LjA6Cj4gPiBbM11odHRwczov
L2dpdGh1Yi5jb20vcHlkYW50aWMvcHlkYW50aWMvYmxvYi92Mi45LjAvcHlwcm9qZWN0LnRvbWwj
TDU0LUw1NQo+ID4KPiA+IEJ1dCBpdCBkb2VzIGxvb2sgbGlrZSBpdCB3YXMgY2hhbmdlZCBpbiBt
YWluOgo+ID4gWzRdaHR0cHM6Ly9naXRodWIuY29tL3B5ZGFudGljL3B5ZGFudGljL3B1bGwvMTAz
MzEKPgo+IE9LLCByaWdodC4gVG9vIGJhZC4gQ2FuIHdlIGJhY2twb3J0IHRoaXMgY2hhbmdlIGlu
c3RlYWQsIHRoZW4/CgpObyBuZWVkLCB3ZSBkb24ndCBlbmZvcmNlIHJ1bnRpbWUgZGVwZW5kZW5j
aWVzIHNvIHdlIGNhbiBkcm9wCnRoZSBkZXBlbmRlbmN5IHdpdGhvdXQgYSBiYWNrcG9ydC4KCj4K
PiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkg
UklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3
YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+
IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAg
ICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcv
IHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
