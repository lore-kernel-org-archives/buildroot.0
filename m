Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DB4606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SGjTzg+h;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=yEntRTO1
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16FF840D7D;
	Fri, 20 Nov 2026 07:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e2w4l-KT5uIY; Fri, 20 Nov 2026 07:55:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E86E940D68
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795161302;
	b=sJaU4KRvb4zRSaQo4R8b3ueYfX0y9Iwumy/Ir+E6yDQIaXoxLDS0c6SNSVum8hu9mGTh
	 LC1ixJ4gi/6amp6qMG7KUR57eOOXUlxvW+Qqv6pSDaDe8RSJOR7Yl26trhc626V4eGlrT
	 hTJMuSODvTSyXFrMA7uZsWkaLVmARdyo8Gbc7xwCZAwICl8PgjOu3NHKltqPfQuJFbSNc
	 nvx7tzsIVeQrSLOqPbSn+ThFOeSvNnDJWrPnkuhN6gRscdhsHpK7rRId7RpiZqMGkD+WN
	 qiEl9Dmxt6mHFJbi6LU7oPxxchoJZZYcENV3XA9Cu+Y/zpRF1KhJsijjR+EzWUNa7WQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795161302;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=5dEKu7FTgqBu6IrdK9oyVKFJcIdccL2HKLijIaIp5wA=;
	b=cluYVDTYNIF0v2DysWkLhDG/pJr4hnPbuYRSsYj8q2sAFbTJCMD1Gxnq2or8r3xf+nzr
	 cr7PY49XOptaktxq0l1eca1v0hX3/7kEMpjucmTE7vQmuPDT3aIiBi6vm6WSsn7QAhsJZ
	 5YsEeZUKCe5FtHdOZzfPsTVMtQBeJbaQSQ52QTPny/SotCkOgckvzSKVgBkh2ZqIQDiBc
	 Fq8KSSdDEk+RxAhMHNqd+MHXWbnboYROcVeP5XoDIDgMQg1OjDm2pFNAQjx/8+4C1kZi1
	 9hUjZu57WuORvunhC8Kf9c3pAuLNSB2tXcgTRT7Bi77z5ll3g2gIcyrsT5xxJ5X30tQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795161302;
	bh=5dEKu7FTgqBu6IrdK9oyVKFJcIdccL2HKLijIaIp5wA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SGjTzg+hu5t/wQsdSGkm5WDBk+sunHHdZsu+Zk8dosRZX164Bu6dLpOrnpOWVIato
	 OwgsjsN04xCcy/SyaClx+eSnkmmTq4bvWqJvJ1ZISBQqQwvpP5RliuUnuhe6iQ6BCZ
	 oIAL0bFBMbxMxPUYHAJQ2qKICCwuCaNU4LHXrSr5teXYTz05d1qXIPKmHPZQab30qI
	 /V2PYfvBRUjobYihSIayKVOQweIyIkqxFVMx+xfEhR2iDQzpT/Tn1ZUQX9RXWnljH4
	 Cuskq+qk6W7V/67OrneEJSWTjYI3FkhtBZ3TLG4sq9joI59R+RWe77mObzUXiBOMsJ
	 E7vT+h5dsCHOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E86E940D68;
	Fri, 20 Nov 2026 07:55:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A79C22B
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5075D8153C
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0EPpAdS7ftiH for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 07:55:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1AD3F8150D
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:20::533"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=yEntRTO1
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AD3F8150D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:54:58 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6b87408c797so755587a12.1
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 23:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1795161297; x=1795766097; darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NT0gKmJ4IAOWqOg7Vtf88IG9yyuWUKTmRlVvFIkJ11s=;
 b=yEntRTO1xIoX2FlLmGAgH2U1aEZ6/xRqf+N0b06redj0MlVGFvB7r/Ap9lQ6hg/eIj
 SLX+7rWRX5sm690Nvr5hFJwfBKaGohwMcmo//eFSx1PETgj2yPIgdz9uXD+EWEfVIiri
 XNs+GHQATf1AAPrC+rzjSHAaJttik+rbzFoUF0oDhgQyzu0NSETXrinvCQtcMCOxmb04
 A6nB8S27hYN8CaAioshfaYbMXMnFC6aVKYMeioL7awfxYtKY3mMQgEjKiyd3RHeMLdgV
 pMYdeWKfqdq3Pte1UyjIyCdluf2bwymTqOOgbvwqM2AWdpSz8tlry3rUhwF/LH7i7DYn
 2Ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795161297; x=1795766097;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NT0gKmJ4IAOWqOg7Vtf88IG9yyuWUKTmRlVvFIkJ11s=;
 b=fDnXFHX435NQvEsfIPy6NYyWGdaPkiNLYmSMeZBfnZcFycA3tlO95lJnzeFVWj4JCa
 vDy9SGYc1Zu/e4E8yAyAK4Pd6jLjS3ISdk0klwiSVW29tqh/7QMLl7DBZvKNRGNyzdsC
 gkUUbmYME7lznpRUN5N9SIEWIAqZhOSXNbXNBAOIzmK4GLdUsMVX9L/q/iK3vckD4e49
 WrDzEkj036UysPC+1JYupLfnc+yWAjXTVreVhHvTcEuypibK8fxaU4uS9/OD8j3/hg5z
 wVdTUIV1UST9tE9mWY/FqH3QIecTwkUFYzSFsFBKCb1ij8Girz/311MxJPkS1j1jI0Yc
 FNAQ==
X-Gm-Message-State: APuU4Z9SnhPtVIvtqydOqxSYsIiemXex/ZcCU8O7IQgepcE/O2W6a/YY
 yz2Wa59+w0bwsELxTUuDvzGxz9GtI15j/QYVKMww/PqGbK5Thz2TbJ4G7EHyNLV60EbA4efQk4g
 4QMc6qoqHF6C5tLJ1oyg6As15XqepAwa03ZqP
X-Gm-Gg: AZFdTZeFfq7EV5IspvH//zvT83qj+MVhbmSz5TKSu4FFSou9Zg1TzRvhe3ImAJjQtmX
 v6ofgWkk/0MLSqgU9Wnst7Zeeeels66PwdIRmMBO+VSPDCPItRuSbQuTejc1GEZ+iRjTTFvbcBZ
 vCcjb+ROZy0pg8lpt/bQndwc41wioVwhgILnnjepE2N6pQ+aTAZW6j1MOnaKs7lW+zGnCPpR3P7
 smt/Lcxkp3WdUoI3hbVqi5zzzheLWFzuEcukCZnIPiQKOjjsc1NyIHHQQV52zyJSxR8HyzCLW1Q
 yuMASrnozX0hMrfJD9azIgm7lnX0iAYZHD64RVxfc5G4JcP/fhbhxHojG12SCcD4v5W64HpWozE
 TUM42TT/IroBm+khIvNUW47Kri0rLMRYf53NJ17CcwvGz8v83Ert0sxSzBrg=
X-Received: by 2002:a05:6402:a505:20b0:6b8:981e:9896 with SMTP id
 4fb4d7f45d1cf-6ba37d642f7mr939836a12.15.1795161296876; Thu, 19 Nov 2026
 23:54:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <av_7RuEyLtyqiVcr@waldemar-brodkorb.de>
In-Reply-To: <av_7RuEyLtyqiVcr@waldemar-brodkorb.de>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 20 Nov 2026 08:55:25 +0100
X-Gm-Features: AclHuK_X1_p5ken1080TvyN6eY8oAffxKZDWlxS-ZaSVaiXUSwVPAR7TsWUisAo
Message-ID: <CAGm1_kv2YBScZFHJmeyyjEk+yAscu4GreiDvVF5c=m7w+gDMzQ@mail.gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH next] package/uclibc: add renameat2 syscall
 wrapper
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgV2FsZGVtYXIsCgpPbiBGcmksIE5vdiAyMCwgMjAyNiBhdCA4OjQ44oCvQU0gV2FsZGVtYXIg
QnJvZGtvcmIgPHdieEBvcGVuYWRrLm9yZz4gd3JvdGU6Cj4KPiBvcHRlZS1jbGllbnQgbmVlZHMg
cmVuYW1lYXQyKCkgc2luY2UgNC44LjAuCj4KPiBGaXhlczoKPiAgLSBodHRwczovL2F1dG9idWls
ZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvYTE3NzZiOWZiMDY0YWVhNzJlMzc5NjVlOWMwNGQ0NGFi
MTc0M2IyYwo+Cj4gU2lnbmVkLW9mZi1ieTogV2FsZGVtYXIgQnJvZGtvcmIgPHdieEBvcGVuYWRr
Lm9yZz4KClRlc3RlZC1ieTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwu
Y29tPgoKPiAtLS0KPiAgLi4uMDItcmVuYW1lYXQyLWFkZC1uZXctc3lzY2FsbC13cmFwcGVyLnBh
dGNoIHwgNzAgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNzAgaW5zZXJ0
aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS91Y2xpYmMvMDAwMi1yZW5hbWVh
dDItYWRkLW5ldy1zeXNjYWxsLXdyYXBwZXIucGF0Y2gKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3VjbGliYy8wMDAyLXJlbmFtZWF0Mi1hZGQtbmV3LXN5c2NhbGwtd3JhcHBlci5wYXRjaCBiL3Bh
Y2thZ2UvdWNsaWJjLzAwMDItcmVuYW1lYXQyLWFkZC1uZXctc3lzY2FsbC13cmFwcGVyLnBhdGNo
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi44NjgxODQ1MmNlCj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvdWNsaWJjLzAwMDItcmVuYW1lYXQyLWFkZC1u
ZXctc3lzY2FsbC13cmFwcGVyLnBhdGNoCj4gQEAgLTAsMCArMSw3MCBAQAo+ICtGcm9tIDgyMDE3
MDgyMzRlZmUzY2UxODJiZWFhYzQyY2VlODQxNjZiZWE3OGIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCj4gK0Zyb206IFdhbGRlbWFyIEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5vcmc+Cj4gK0RhdGU6
IEZyaSwgMjAgTm92IDIwMjYgMDU6Mzc6NTIgKzAxMDAKPiArU3ViamVjdDogW1BBVENIXSByZW5h
bWVhdDI6IGFkZCBuZXcgc3lzY2FsbCB3cmFwcGVyCj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9n
aXRodWIuY29tL3dieC1naXRodWIvdWNsaWJjLW5nL2NvbW1pdC84MjAxNzA4MjM0ZWZlM2NlMTgy
YmVhYWM0MmNlZTg0MTY2YmVhNzhiCj4gK1NpZ25lZC1vZmYtYnk6IFdhbGRlbWFyIEJyb2Rrb3Ji
IDx3YnhAb3BlbmFkay5vcmc+Cj4gKy0tLQo+ICsgaW5jbHVkZS9zdGRpby5oICAgICAgICAgICAg
ICAgICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKysKPiArIGxpYmMvc3lzZGVwcy9saW51eC9j
b21tb24vcmVuYW1lYXQyLmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPiArIDIgZmlsZXMg
Y2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQo+ICsgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYmMvc3lz
ZGVwcy9saW51eC9jb21tb24vcmVuYW1lYXQyLmMKPiArCj4gK2RpZmYgLS1naXQgYS9pbmNsdWRl
L3N0ZGlvLmggYi9pbmNsdWRlL3N0ZGlvLmgKPiAraW5kZXggYTQ4ZmE5Yjc4Li41MDY5YmM2NWUg
MTAwNjQ0Cj4gKy0tLSBhL2luY2x1ZGUvc3RkaW8uaAo+ICsrKysgYi9pbmNsdWRlL3N0ZGlvLmgK
PiArQEAgLTE1Nyw2ICsxNTcsMjIgQEAgZXh0ZXJuIGludCByZW5hbWVhdCAoaW50IF9fb2xkZmQs
IGNvbnN0IGNoYXIgKl9fb2xkLCBpbnQgX19uZXdmZCwKPiArIGxpYmNfaGlkZGVuX3Byb3RvKHJl
bmFtZWF0KQo+ICsgI2VuZGlmCj4gKwo+ICsrI2lmZGVmIF9fVVNFX0dOVQo+ICsrLyogRmxhZ3Mg
Zm9yIHJlbmFtZWF0Mi4gICovCj4gKysjIGRlZmluZSBSRU5BTUVfTk9SRVBMQUNFICgxIDw8IDAp
Cj4gKysjIGRlZmluZSBBVF9SRU5BTUVfTk9SRVBMQUNFIDB4MDAwMQo+ICsrIyBkZWZpbmUgUkVO
QU1FX0VYQ0hBTkdFICgxIDw8IDEpCj4gKysjIGRlZmluZSBBVF9SRU5BTUVfRVhDSEFOR0UgMHgw
MDAyCj4gKysjIGRlZmluZSBSRU5BTUVfV0hJVEVPVVQgKDEgPDwgMikKPiArKyMgZGVmaW5lIEFU
X1JFTkFNRV9XSElURU9VVCAweDAwMDQKPiArKwo+ICsrLyogUmVuYW1lIGZpbGUgT0xEIHJlbGF0
aXZlIHRvIE9MREZEIHRvIE5FVyByZWxhdGl2ZSB0byBORVdGRCwgd2l0aAo+ICsrICAgYWRkaXRp
b25hbCBmbGFncy4gICovCj4gKytleHRlcm4gaW50IHJlbmFtZWF0MiAoaW50IF9fb2xkZmQsIGNv
bnN0IGNoYXIgKl9fb2xkLCBpbnQgX19uZXdmZCwKPiArKyAgICAgICAgICAgICAgICAgICAgY29u
c3QgY2hhciAqX19uZXcsIHVuc2lnbmVkIGludCBfX2ZsYWdzKSBfX1RIUk9XOwo+ICsrbGliY19o
aWRkZW5fcHJvdG8ocmVuYW1lYXQyKQo+ICsrI2VuZGlmCj4gKysKPiArIF9fQkVHSU5fTkFNRVNQ
QUNFX1NURAo+ICsgLyogQ3JlYXRlIGEgdGVtcG9yYXJ5IGZpbGUgYW5kIG9wZW4gaXQgcmVhZC93
cml0ZS4KPiArCj4gK2RpZmYgLS1naXQgYS9saWJjL3N5c2RlcHMvbGludXgvY29tbW9uL3JlbmFt
ZWF0Mi5jIGIvbGliYy9zeXNkZXBzL2xpbnV4L2NvbW1vbi9yZW5hbWVhdDIuYwo+ICtuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+ICtpbmRleCAwMDAwMDAwMDAuLmVmYWI0ZTAxOQo+ICstLS0gL2Rldi9u
dWxsCj4gKysrKyBiL2xpYmMvc3lzZGVwcy9saW51eC9jb21tb24vcmVuYW1lYXQyLmMKPiArQEAg
LTAsMCArMSwyMSBAQAo+ICsrLyoKPiArKyAqIHJlbmFtZWF0MigpIGZvciB1Q2xpYmMtbmcKPiAr
KyAqIExpY2Vuc2VkIHVuZGVyIHRoZSBMR1BMIHYyLjEsIHNlZSB0aGUgZmlsZSBDT1BZSU5HLkxJ
QiBpbiB0aGlzIHRhcmJhbGwuCj4gKysgKi8KPiArKwo+ICsrI2luY2x1ZGUgPHN0ZGlvLmg+Cj4g
KysjaW5jbHVkZSA8ZmNudGwuaD4KPiArKyNpbmNsdWRlIDxzeXNkZXAuaD4KPiArKyNpbmNsdWRl
IDxlcnJuby5oPgo+ICsrCj4gKytpbnQKPiArK3JlbmFtZWF0MiAoaW50IG9sZGZkLCBjb25zdCBj
aGFyICpvbGQsIGludCBuZXdmZCwgY29uc3QgY2hhciAqbmV3LCB1bnNpZ25lZCBpbnQgZmxhZ3Mp
Cj4gKyt7Cj4gKysjaWZkZWYgX19OUl9yZW5hbWVhdDIKPiArKyAgcmV0dXJuIElOTElORV9TWVND
QUxMIChyZW5hbWVhdDIsIDUsIG9sZGZkLCBvbGQsIG5ld2ZkLCBuZXcsIGZsYWdzKTsKPiArKyNl
bHNlCj4gKysgIF9fc2V0X2Vycm5vKEVOT1NZUyk7Cj4gKysgIHJldHVybiAtMTsKPiArKyNlbmRp
Zgo+ICsrfQo+ICsrbGliY19oaWRkZW5fZGVmIChyZW5hbWVhdDIpCj4gKy0tCj4gKzIuNDcuMwo+
ICsKPiAtLQo+IDIuNDcuMwo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
