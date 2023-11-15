Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3826CC47076
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 11:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4A0481EFD;
	Wed, 15 Nov 2023 11:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4A0481EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ptOIhtuwLSNQ; Wed, 15 Nov 2023 11:49:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23A8081E64;
	Wed, 15 Nov 2023 11:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23A8081E64
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48C4A1BF3E9
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 11:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 219DF42176
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 11:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 219DF42176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WAXdcAhC8mDG for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 11:49:24 +0000 (UTC)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D97D842174
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 11:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D97D842174
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2809414efa9so362745a91.1
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 03:49:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700048964; x=1700653764;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e+vB98EG/YxObfL6WsYnIvO4bwh5qvRxGVpibeWv1to=;
 b=RTqtBeLg1co54XaCmjEipu0IMeAmBHqDaWxItgKeK2qBet8VRXht8sYWMScdKR4Krq
 o6tBjcHA1RdO+RzI58RVITz5FZw+5LNbYYHzD9Q/dD2htj+mNgTnXtd7KAMkrX9KmNUL
 cnUQyTnIE3In7ek9XZRXs1HiB2ppOOsBhf8BJ+PHBlMy9esR7Kkt+WHlYbMtDsk93Pba
 RfY4vQK4G2nvIgP/6nYGjGGrgqgC8JVPQfP/WgLYL0GtaS6aDpxJoYX0wex6iW30JbZP
 E7eNyHhcP5vzmhrwexQL75kX0YSs0Gr7e4Rx38ZIzDLRrYdnAeqWDZDcp9fp+OMm53zF
 e1ew==
X-Gm-Message-State: AOJu0Yxo7ffEbiP2Vny0TJK2e7iVX360tx1rP3oTXoNi6OkbFQWJLEfM
 +DixwtuK0/Mbjl3UbBQ5QIMlLaU+GjYvJf82o8g=
X-Google-Smtp-Source: AGHT+IF1Hy/HM6DKu5mNxsFP+GtBHWQPmgXViq04BgOSdiIrodLRpswFRTqrD+AI3z+rCeSX5+UqJIfPr7XEtUjcSgU=
X-Received: by 2002:a17:90b:1bca:b0:281:416e:1c3f with SMTP id
 oa10-20020a17090b1bca00b00281416e1c3fmr11637382pjb.28.1700048964207; Wed, 15
 Nov 2023 03:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20231115100222.29685-1-bstruempfel@ultratronik.de>
 <8950d51a-3b99-4aea-bd2f-473fd32d8f78@grenoble.cnrs.fr>
In-Reply-To: <8950d51a-3b99-4aea-bd2f-473fd32d8f78@grenoble.cnrs.fr>
From: =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>
Date: Wed, 15 Nov 2023 12:49:12 +0100
Message-ID: <CAEktqcuLCaKbRZpPQDTRCK-3QYxA-s=mHcRyFW6Az7civD41Vw@mail.gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700048964; x=1700653764; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e+vB98EG/YxObfL6WsYnIvO4bwh5qvRxGVpibeWv1to=;
 b=GYm85loqWP60k4xMYkPSdzibObEm51a7HYkafF/9s2tTc0YMS/7mCURXw9MsWXZjNF
 +1jOdddEDeVw9p6snYfNjk40XXXmO1WRo7lDsdspdRK7NtCVmQmWgsagAqlAMB7amazI
 s1ycbWkk3T8O48HNA1hE4jLyNF6djbn/cpsAadI97F4DQ5i6x4n+qQyl0WUCaUHQ6MjJ
 ItcapP1RFzafZWTQv9OgZy5ip5txCUxtcmQFCB4l9Kk8vdsPESIsSlN93nabIbXDGy8k
 p3vstXsFst56IpVHMQsAcFt9yfZLzQmXYlOQ8WT8KujVYck2qdKQV3EyLQvMz/QTcvD7
 A12w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GYm85loq
Subject: Re: [Buildroot] [PATCH 0/2] Adding support for gpiod v2.0 and higher
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
Cc: buildroot@buildroot.org, vfazio@xes-inc.com, bstruempfel@ultratronik.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRWRnYXIsCgpUaGFuayB5b3UgZm9yIHRoZSBmZWVkYmFjay4KCk9uIFdlZCwgTm92IDE1LCAy
MDIzIGF0IDExOjUy4oCvQU0gRWRnYXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+IHdy
b3RlOgo+Cj4gSGVsbG8hCj4KPiBCb2VyZ2UgU3RydWVtcGZlbCB3cm90ZToKPiA+IHdlIGludHJv
ZHVjZSBsaWJncGlvZCB2Mi4wIGFzIGEgbmV3IHBhY2thZ2UgbGliZ3Bpb2QyLgo+Cj4gSSBhbSB3
b3JyaWVkIHRoZSBuYW1lICJsaWJncGlvZDIiIG1heSBjYXVzZSBzb21lIGNvbmZ1c2lvbi4gVGhl
IGZpcnN0Cj4gR29vZ2xlIGhpdCBmb3IgdGhpcyBuYW1lIHBvaW50cyB0byB0aGUgRGViaWFuIHBh
Y2thZ2UgbGliZ3Bpb2QyLFsxXQo+IHdoaWNoIGNhcnJpZXMgdmVyc2lvbiAxLjYuMyBvZiB0aGUg
bGliZ3Bpb2QgbGlicmFyeS4gVGhlIHZlcnNpb24gbnVtYmVyCj4gbWlzbWF0Y2ggaXMgZGlzY3Vz
c2VkIGluIGEgdGhyZWFkIG9mIHRoZSBsaW51eC1ncGlvIG1haWxpbmcgbGlzdDpbMl0KPgoKSSBj
YW4gc2VlIGhvdyB0aGF0IGNvdWxkIGJlY29tZSBjb25mdXNpbmcuCkRvIHlvdSBoYXZlIGFuIGlk
ZWEgZm9yIGEgYmV0dGVyIG5hbWU/IE1heWJlIGxpYmdwaW9kdjIgaW4gb3JkZXIgdG8KbWFrZSBh
IGRpc3RpbmN0aW9uIHRvIHRoZSBkZWJpYW4gcGFja2FnZT8KCj4gVGhvbWFzIFdpbGxpYW1zIGFz
a2VkOgo+ID4gQXJlIGxpYmdwaW9kMiBhbmQgbGliZ3Bpb2QgdjIgcmVmZXJyaW5nIHRvIGRpZmZl
cmVudCBtZWFuaW5ncyBvZiAiMiIgPwo+Cj4gQmFydG9zeiBHb2xhc3pld3NraSBhbnN3ZXJlZDoK
PiA+IEhhISBZZXMgdGhleSBkbywgaXQncyBkaXN0cm8ncyBwYWNrYWdpbmcgc2hlbmFuaWdhbnMh
IEJhc2ljYWxseSB0aGUKPiA+IEFQSSB2ZXJzaW9uIGFuZCB0aGUgQUJJIHZlcnNpb24gb2YgbGli
Z3Bpb2QgYXJlIGRpZmZlcmVudCBhcyB3ZSBoYWQgYQo+ID4gbm9uLWNvbXBhdGlibGUgQUJJIGNo
YW5nZSBiYWNrIGR1cmluZyB2MC54LnkgZGV2ZWxvcG1lbnQuIEN1cnJlbnQgQVBJCj4gPiB2ZXJz
aW9uIGZvciB2MS42LnggaXMgMi5zb21ldGhpbmcuc29tZXRoaW5nLiBZb3UnbGwgc2VlIHRoYXQg
d2hpbGUgdGhlCj4gPiBkZXZlbG9wbWVudCBmaWxlcyBhbmQgb3RoZXIgcGFja2FnZXMgYXJlIGp1
c3QgY2FsbGVkIGxpYmdwaW9kIG9uCj4gPiB1YnVudHUgYW5kIGRlYmlhbiwgdGhlIHBhY2thZ2Ug
Y29udGFpbmluZyB0aGUgc2hhcmVkIGxpYnJhcnkgaXMgY2FsbGVkCj4gPiBsaWJncGlvZDIuCj4K
PiBCdWlsZHJvb3QgZG9lc24ndCBuZWVkIHRvIGZvbGxvdyB0aGUgRGViaWFuIG51bWJlcmluZyBz
Y2hlbWUsIGJ1dCB3ZQo+IHNob3VsZCB0aGVuIGV4cGVjdCBxdWVzdGlvbnMgY29taW5nIGZyb20g
Y29uZnVzZWQgdXNlcnMuLi4KPgo+IFJlZ2FyZHMsCj4KPiBFZGdhci4KPgo+IFsxXSBodHRwczov
L3BhY2thZ2VzLmRlYmlhbi5vcmcvdW5zdGFibGUvbGliZ3Bpb2QyCj4gWzJdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC9DQUVkd2MtUW04aHF2SmhWTFdlcUxEWUdMMm10SDdTPVRIPXB3aHpi
NVQtbk1HRF91Z3dAbWFpbC5nbWFpbC5jb20vdC8KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
