Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C65C606A334
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 23:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hatEO2To
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6150440520;
	Wed,  4 Nov 2026 23:08:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xye42YtwUnRo; Wed,  4 Nov 2026 23:08:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2A230403F5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793833703;
	b=daqboy/VyQLCWMbVO3nz0D9csiVHuMD3iMhl0NpWtWgEUMn5a3cm1GqWlWfD0ttZP8/L
	 66qWCmsLvuHre/04FzeTZZyC0zQBL4EgafT6lUOZEXvwgdWCDVQjvP+jmXe9gVMQ3AEel
	 5YI4HjUgB/l9FG4E4JlGdxnKTybT5T7OBHAFeKqPwcrxtv6CP3VS70xkT2eAunxGICR2c
	 nuKxxHwJfmkmrHg01xb5JwGRzbgdAuIDeykNSyudUqwQV6Br+3BRdkCIEx0ry4Ryny1mg
	 iLt/uIVt7Ppz/lYcf/XelotBigcWS0/OM2F7j4iMf3sVip05vdAe0leaSBBs/cZbLEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793833703;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4OlUaH/QIzYgoDbwDuWQJyJJgBlqzInZj7QmISZ/fUQ=;
	b=nq/fyMbbRGJtIqbENLtHWJ0jlg4LSgh7sULDyM4yK07GJjb/wB9KU1tO7QyUXYQUMhNZ
	 RZX6T3ZKMrcCcHLNQ+o8RNz23yGFsry/mQMxgsHv+HiTb5l5KRoqvcK7Xgav7nM0CA6bH
	 VXlPLwTFjmh5AUJWuKoBM8IyBUsHpl+2IJVTJUHf7yulOcOLNoikHtmK6atiztq5w2uj3
	 RAMyMvoYSQY3JIgSaJqimC1TyRGqO6T7Bxi/r6JiP6vetXDE1n/G/8ogiQW8X0XdJ8GGU
	 uKhwCKT6Gcp1a9RogtIhP+Nkgzg+S1ssPZpt6in6odJu6VFoFRskD1/VSYk2R+rqMSA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793833703;
	bh=4OlUaH/QIzYgoDbwDuWQJyJJgBlqzInZj7QmISZ/fUQ=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hatEO2TohXM6KO1oXv7Fm6ZUB76CRqwL4b3wl5NvemZM0eLMvtl6puzfeG/os8Axl
	 csdTQ7crVn/+kDeMYNPdSgV3rBY9pPIKlqJ05zPgV6qjTZgcPFx44s/GzfdWFXpT7H
	 I6JPhBHNwL4vJ620a2md8vdmN2HrfzKR8haOiBxOUV5o0wDmzcACWkmoWqOWZ3Fc7z
	 lPjnKFsI8wLxKbtTOhg5lXA5WtUt20XnFAyhL47rtltsTBVowV98Vn/jR+efdMmbBP
	 X7UT793p9zNANdn4X6KFTW67Z8Rz3XaJup4HbQXZU8ZH8O05OjgWa1Z1WMeKsHg1bM
	 kEkEAhuqKsw/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A230403F5;
	Wed,  4 Nov 2026 23:08:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD2161779
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 23:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C350080E3E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 23:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2GBfpvdCnsG for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 23:08:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7574880E42
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7574880E42
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 23:08:19 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6ae305e3bd9so2230568a12.0
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 15:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793833698; x=1794438498;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=I/FDWbEhtUgBck5CMMFEqMt/TfWxLW/OwySc5QmEs3k=;
 b=MuS+Uwv47CZjvfXfQOui3diN3xALUKdY6Gc+kgVnZ+N3RF3zPZpe65tycQbXKknhpv
 B5Ysoa5vgHV2T1OPaYn5txGCW/qI+FrnuacCzgZ6CcgGLluq3m/KobMHj2SmRIDSusG1
 QtYGG6hiPJ3iRXJm79LswXfWh7ooYCsn+M60+LBbsXQPgCGbPz+/MRnDf94jezMk6gfo
 k4ulxT0gUPnU56w/TK1cdCDHX6ERGungyMfam3u2pzqCYdOzCzdCBhCbQSAJ77kFRAOU
 Xy42Y/z/n4D9mQNxgJdSIeA44aWhoZfwWIQ+iKp8luwemtGG73fCRc09T4hdX4w0DvvT
 AiSg==
X-Gm-Message-State: APuU4Z9Iwh5Erx29K3Z7PupXLt4vZx5aXt3oYen1q6j3nCm90dFAhOJx
 p7VRHzM9tEBl8Usy+ApxnPXreMBGgu17o3GqDlhmgEgwqxGqSKYNcgs6yxAQTcvgYaBHC0ThtoH
 T14JE2d5iyk2dFxvuU1AY+XxdqaVxgDqZyxPH
X-Gm-Gg: AYBFou3HJSgyt2Cis2ixx+fnaw+8fEkyxRO2MLmQrxBxGy2mdP7jvt/Wx7fqgzexjVi
 aZdFD/1uq8NN3DLzr+H3EaRrEnlKft4KJlmH/v2ToSxya58ODzZtGOT/MIz7f/OJbqPW16qEacF
 MwB8VCI/D6sA6ONATq4tIGnhhA1s4izEopfUzsSgcLbETWvGcXouviVDkzVkOuplj5DI3GG2yMw
 WdISFn0IN+nQio9uUIxoaHTVA2wKaBGFyJGfpqeLWSSzOJX0CxM31h2n2SfDZHryavURtA6dhrd
 tFAeke6QQMumrbrZJNgBb/TrEqmp5YsW2LVx3y5CtOUpwZchIpiggUfVpmWgTBaXxVinTVIeO+k
 haDmTaYXDzjvPHcxpC3T8BrJ5KDeh8S9VNgNp9Q==
X-Received: by 2002:a05:6402:27d3:b0:6aa:9284:9a99 with SMTP id
 4fb4d7f45d1cf-6b4d33772b7mr13906930a12.6.1793833697670; Wed, 04 Nov 2026
 15:08:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103064034.3913314-1-yegorslists@googlemail.com>
 <auuiaUH0JJ20VZWV@windsurf>
 <CAGm1_kt3BhEuM3H2rRUQYiFmU2+HrsCQdajzCe6whEXwrBkmAw@mail.gmail.com>
 <auu1HsM7xp331Hbk@windsurf>
In-Reply-To: <auu1HsM7xp331Hbk@windsurf>
Date: Thu, 5 Nov 2026 00:08:44 +0100
X-Gm-Features: AclHuK9_L0G5p-WQ0I4sW6tzMo6vylux7sLJizg_g3rXUoJFQMtGKVgBZBEdmBY
Message-ID: <CAGm1_kuobk61y+gvqkLYx2HMh6WiFaGwWj31JZ+=sTKdCqLN9g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/file: bump to version 5.48
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgNCwgMjAyNiBhdCAxMTo0NOKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMDQsIDIwMjYg
YXQgMTE6MTk6NDlQTSArMDEwMCwgWWVnb3IgWWVmcmVtb3Ygd3JvdGU6Cj4KPiA+ID4gSSBjb250
aW51ZSB0byBiZSBhbWF6ZWQgdGhhdCBrZXkgb3Blbi1zb2Z0d2FyZSBsaWtlIGZpbGUgaGFzIGEg
d2Vic2l0ZQo+ID4gPiBsaWtlIHRoaXM6IGh0dHBzOi8vYXN0cm9uLmNvbS8sIG5vIEdpdCByZXBv
c2l0b3J5LCBubyBtYWlsaW5nIGxpc3QsIG5vCj4gPiA+IG5vdGhpbmcuLi4KPiA+Cj4gPiBZb3Un
cmUgcmlnaHQuIFRoYXQncyB2ZXJ5IG9kZC4gVGhleSBzZWVtIHRvIHVzZSBDVlM6Cj4gPiBodHRw
czovL2dpdGh1Yi5jb20vZmlsZS9maWxlCj4KPiBDVlMsIGludGVyZXN0aW5nIDotKQo+Cj4gTm90
ZSB0aGF0IGh0dHBzOi8vZ2l0aHViLmNvbS9maWxlL2ZpbGUgc2F5cyAiTk9URTogZG8gbm90IG1h
a2UgcHVsbAo+IHJlcXVlc3RzIGhlcmUsIG5vciBjb21tZW50IGFueSBjb21taXRzLCBzdWJtaXQg
dGhlbSB1c3VhbCB3YXkgdG8gYnVnCj4gdHJhY2tlciBvciB0byB0aGUgbWFpbGluZyBsaXN0LiIu
IFNvIGlzIHRoZXJlIGEgbWFpbGluZyBsaXN0Cj4gc29tZXdoZXJlPwoKaHR0cHM6Ly9tYWlsbWFu
LmFzdHJvbi5jb20vcGlwZXJtYWlsL2ZpbGUvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
