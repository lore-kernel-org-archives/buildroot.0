Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35795C0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 21:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA20F41805;
	Fri, 11 Aug 2023 21:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA20F41805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FGcEEicRb3dA; Fri, 11 Aug 2023 21:31:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8BD741EAC;
	Fri, 11 Aug 2023 21:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8BD741EAC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C170A1BF5D7
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 21:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A81E740142
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 21:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A81E740142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WnYS_3AxtdG2 for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 21:31:08 +0000 (UTC)
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BF11400DA
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 21:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BF11400DA
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-640c5df2e6eso11373826d6.1
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 14:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691789467; x=1692394267;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LW4JdL7QmQ0vBmsLZhp5y8OEV5Pap3u7ztm6GDBah4M=;
 b=INfe1t3Yr2FSSh3XeoAJySvw3/9TQ8c4yzAevfjtc2ax9ugKf+sQPGXWWv/XRwj0/S
 w7fe+T6b3h2qyzJLTzzQ4TprWiFKbnPdpsiEwTW4q50dUF9e6fEbryuOfddRXA3kpS+z
 pLqYrwjM/XOW/dhGX8WriJaT2sLWtZbKcYFqWu/4lvlPvqgctQckracIbbV5+rEwqnlb
 AsyRx3GUcMg+S/RdJKCnkSioBQmFGtf3DML1WHUB6d3U1dhMIFlXYJVFGmq5rlSzdaPq
 Om7DlaHTDIbxBYja6sgjoR78bzPYuJgQiOAjtTNvzQKnbfMcvPGfVKusXKVlc1KEqEfE
 3t8A==
X-Gm-Message-State: AOJu0YyVJuGp8FZeO9TCoasT8Nb7PRW8iyugQbsNgAaTFcZy7SZGG8tF
 8bj8FOvulFII6Cso1SMjYJELzar9t4GSHeHYZOs=
X-Google-Smtp-Source: AGHT+IGjrdG5keMmVLNWq6h269eE1Z8BuhdtxdAknRFWHba52DT+XryhP3pWfjj/O/tS2+qxttVRDTV/Nc7DBgilQKg=
X-Received: by 2002:a05:6214:418c:b0:630:1faa:a404 with SMTP id
 ld12-20020a056214418c00b006301faaa404mr3010048qvb.39.1691789466981; Fri, 11
 Aug 2023 14:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <20230809193855.60c6b89c@windsurf>
 <13322713.uLZWGnKmhe@kilian-aisec> <1766550.VLH7GnMWUR@kilian-aisec>
 <20230811164145.2b978818@windsurf>
In-Reply-To: <20230811164145.2b978818@windsurf>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 11 Aug 2023 16:30:41 -0500
Message-ID: <CAOCHtYjoouGOSwOy1Fh4muYnU3E-yY6jp8GOcy1f=MhCaaAx8w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691789467; x=1692394267;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LW4JdL7QmQ0vBmsLZhp5y8OEV5Pap3u7ztm6GDBah4M=;
 b=E2kgvDaHDFtFo+hbzWqPu4hGsxs1t/2QMsyQ4snv0ppKCFnmNkreyLjWeu9RQoptLk
 Cfrc5nVdq6Xgb1/XdG0deIFH+N6ELWkmmaP8xlFdpzxoG0TanoBXwgjCakTwt0uHQFfE
 RdkJGTDEG8CM3ThYy5uFYEOo6p8ptz/puI/dOsh3XKOMmGrat1nvcu2UTfYyNFbtij90
 2r4c2j4IK60Uqx2sTUSjXqicAaDN/7bFfvDbkTyjXVzvukawGGCWu+em3Vq0hdyqzlci
 w5CCJZa6e6pN5y9WnNHDIzrx1eAesXnm1fjqqiB0zak4nsF7r3B2rJexOL3MGaq/QcAY
 4VzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=E2kgvDaH
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBBdWcgMTEsIDIwMjMgYXQgOTo0MuKAr0FNIFRob21hcyBQZXRhenpvbmkgdmlhIGJ1
aWxkcm9vdAo8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCAxMCBB
dWcgMjAyMyAxMzowMjozMiArMDIwMAo+IEtpbGlhbiBaaW5uZWNrZXIgPGtpbGlhbi56aW5uZWNr
ZXJAbWFpbC5kZT4gd3JvdGU6Cj4KPiA+IEkgYWxzbyB0aGluayB0aGF0IHRoZXJlIGlzIGFyZSBz
aW1pbGFyIGlzc3VlcyByZWdhcmRpbmcgdGhlIGJlYWdsZXZfZGVmY29uZmlnCj4gPiBhbmQgdGhl
IHVzZWQsIHZlcnkgb2xkIG9wZW5zYmkgdmVyc2lvbiBhbmQgbWF5YmUgYWxzbyB0aGUgdXNlZCBz
dGFyZml2ZSBjdXN0b20KPiA+IGtlcm5lbCB2ZXJzaW9uLgo+ID4KPiA+IEkgY291bGQgdHJ5IHRv
IGJ1bXAgdGhlIHZlcnNpb25zIG9yIGFkZCBwYXRjaGVzIHVudGlsIGl0IGNvbXBpbGVzIGFnYWlu
Lgo+ID4gSG93ZXZlciwgSSBkb24ndCBoYXZlIGEgQmVhZ2xlViBjdXJyZW50bHkgYXQgaGFuZCwg
c28gSSB3b3VsZCBub3QgYmUgYWJsZSB0bwo+ID4gcmVhbGx5IHRlc3Qgd2hhdCBJIHByb2R1Y2Vk
IGFmdGVyd2FyZHMuIFNvIGl0IG1pZ2h0IGJlIGJldHRlciBzb21lb25lIGVsc2UsCj4gPiB3aGlj
aCBoYXMgYWNjZXNzIHRvIGEgQmVhZ2xlViwgaGFzIGEgbG9vay4KPgo+IEkgZG8gaGF2ZSBhIEJl
YWdsZVYgKG5vdCBoZXJlIHdpdGggbWUgdGhvdWdoKSwgYnV0IGFzIEkgcmVwbGllZCB0bwo+IGFu
b3RoZXIgZS1tYWlsLCBJIHRoaW5rIHdlIGNvdWxkIHNpbXBseSBkcm9wIGJlYWdsZXZfZGVmY29u
ZmlnIGFzIG5vdAo+IG1hbnkgc2FtcGxlcyBvZiB0aGlzIHBsYXRmb3JtIHdlcmUgc2hpcHBlZCwg
YW5kIGl0J3Mgbm8gbG9uZ2VyIHByb2R1Y2VkLgoKU28gdGhlIHBsYW4gZnJvbSBCZWFnbGVCb2Fy
ZC5vcmcgaXM6CgpiZWFnbGV2LTxkZXZpY2U+CgpTbyB0aGUgVEgxNTIwIGJhc2VkIEJlYWdsZVYg
aXM6IGJlYWdsZXYtYWhlYWQKCkxvb2tpbmcgYXQgYWxsIG91ciBnaXRsYWIgcmVwb3MsIHllYWgg
aSBjYWxsZWQgZXZlcnkgY29uZmlnIGBiZWFnbGV2X2AuLi4KCmFkZCB0aGF0IHRvIG15IGNsZWFu
dXAgbGlzdC4uCgpSZWdhcmRzLAoKLS0gClJvYmVydCBOZWxzb24KaHR0cHM6Ly9yY24tZWUuY29t
LwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
