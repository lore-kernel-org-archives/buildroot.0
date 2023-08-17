Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA19AC27C7A
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 13:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54CAD41877;
	Thu, 17 Aug 2023 13:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54CAD41877
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hboJVR1JDlmf; Thu, 17 Aug 2023 13:19:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BCAA4186D;
	Thu, 17 Aug 2023 13:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BCAA4186D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D68A31BF3CA
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 13:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B02A083EEB
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 13:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B02A083EEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X5NZ9BNSmO0D for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 13:19:41 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F57383ED3
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 13:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F57383ED3
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-317b31203c7so6946379f8f.2
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 06:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692278380; x=1692883180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FQhQ/ZiEyM+braTjQvQnktqFwD8Se4N9HyL5BU78KJ8=;
 b=G9Kxa1SVp+8n+u24Z/F5IHWrLQezhO3Fds5zvfHzPL0ElZCKev5+8GvyEjsFUnWhoY
 agtl4v8YEi4Xs2+yoL7WWC13MgJ/YSaR2gQMZoZg9dBLaEej/YDs3nl0ekszNveakaVt
 4gFxlcFnn2k9rFrPblCHaEzZgWX1ob9xQttYRPceLloUREr1TBzWjCdbSceNvxM/7uh/
 9AF9MjP7SqwRU12y8HDVN2ZyJXhaxcgVOQE5pneZGZyXzUJtxNvUwPaGEMXLVitkybW4
 Vz0mdxXvo5qQ1Hq9ODObx90T9qlOVlop0Wsb9Q51rpoh9gAWY5RPkvqkMTqnxplhN9l3
 E/AA==
X-Gm-Message-State: AOJu0YxmHFiCwd/1noAUojFXP2MY9NacioMO7FLemYoeeP4xJ3nwWJsN
 fl7DyGvYagmiskNDvAn8HY5jwWNbVmaLRiQbUhNhi92S9L4f5Q==
X-Google-Smtp-Source: AGHT+IEF6rslau4c7wQbF5d/Q18amrxxGmo+hph2Cw/W5Y4RkFarhHglRhnoqhM3PDhhlj3dmes1nTTcFQs2KyxFMvk=
X-Received: by 2002:adf:fcc8:0:b0:319:7c1f:8dae with SMTP id
 f8-20020adffcc8000000b003197c1f8daemr3903967wrs.3.1692278379506; Thu, 17 Aug
 2023 06:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230315091729.1771792-1-javad321javad@gmail.com>
 <20230809233822.334dbbb5@windsurf>
 <CAL245auhJf41LJk6b38DSqWVOSVM5qi+aLdOwNDmCuwab7fEXQ@mail.gmail.com>
 <20230817122527.135f953e@windsurf>
In-Reply-To: <20230817122527.135f953e@windsurf>
From: Javad Rahimipetroudi <javad321javad@gmail.com>
Date: Thu, 17 Aug 2023 16:49:27 +0330
Message-ID: <CAL245av8s-K0S9gvvActQxxyCesapX4EGKB0QFsUmAY5UFFptQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692278380; x=1692883180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FQhQ/ZiEyM+braTjQvQnktqFwD8Se4N9HyL5BU78KJ8=;
 b=gfrxkTCvzU13eNUQQTwhoLFJqYR/EEznuXTd9PylO/k6JzoM119DgxvKSQxyPWYi4d
 gR95AsrAuSeQPREfARpOkJeCf9PGz76EzpP0mn3ubhvBEZiDuC81ldGz4sd4aAiReify
 2CTgiyqZRb/BkF0hUxkB+cqqMrnuHRLBQ5LFH9YGr64hORpKJvxmQt2BmDPlsLaRE8FW
 HnEvHs7KMkXoGsbwZF7SrDzNBQ9MBq3ee93HGtmQHm90H0RexOgtYp+8z5LBsxBUlze2
 Y6pWr8fJgQPNwJyzAbN7pPSMT6Qp5MOmP6rj3tnSrKAwuwuwOXDy7v31ltN6b1nR29y2
 lrSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=gfrxkTCv
Subject: Re: [Buildroot] [PATCH 1/3] configs/orangepi_pc2: add board support
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

T24gVGh1LCBBdWcgMTcsIDIwMjMgYXQgMTo1NeKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAxNCBBdWcgMjAyMyAw
OTozMzo1OSArMDMzMAo+IEphdmFkIFJhaGltaXBldHJvdWRpIDxqYXZhZDMyMWphdmFkQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiA+IFN1cmUsIEkgaGF2ZSB1cGRhdGVkIHRoZSBrZXJuZWwsIFRGLUEg
YW5kIFVib290Lgo+ID4gSG93ZXZlciwgSSBoYXZlIGZhY2VkIGEgcHJvYmxlbSB3aXRoICIvZGV2
IiBtYW5hZ2VtZW50IGFmdGVyIHVwZ3JhZGluZwo+ID4gdGhlIHBhY2thZ2VzLiBXaGVuIGl0IGlz
IGluICJEeW5hbWljIHVzaW5nIGRldnRtcGZzIG9ubHkiIG1vZGUsIG5vCj4gPiBrZXJuZWwgbW9k
dWxlIGlzIGxvYWRlZCBhZnRlciBib290LiBCdXQgaW4gIkR5bmFtaWMgdXNpbmcgZGV2dG1wZnMg
Kwo+ID4gbWRldiIgZXZlcnl0aGluZyB3b3JrcyBmaW5lLiBDYW4gSSBwdXQgaXQgaW4gdGhpcyBt
b2RlPwo+Cj4gV2VsbCwgdGhpcyBpcyBub3JtYWwsIGRldnRtcGZzIGlzIG9ubHkgYSB2aXJ0dWFs
IGZpbGVzeXN0ZW0gdGhhdAo+IGNyZWF0ZXMgZW50cmllcyBpbiAvZGV2LiBJdCBpcyBub3QgaW52
b2x2ZWQgaW4gYXV0b21hdGljIG1vZHVsZQo+IGxvYWRpbmcuIElmIHlvdSB3YW50IGF1dG9tYXRp
YyBtb2R1bGUgbG9hZGluZywgeW91IG5lZWQgZWl0aGVyIG1kZXYgb3IKPiB1ZGV2L2V1ZGV2LiBB
bmQgaXQncyBpbmRlZWQgZmluZSB0byBlbmFibGUgbWRldiBpbiBkZWZjb25maWdzIHRoYXQgbmVl
ZAo+IGl0LgpUaGFua3MgYSBsb3QsCiBJIGhhdmUgYWRkZWQgaXQgdG8gdGhlIGRlZmNvbmZpZyBh
bmQgY29tbWl0dGVkIHRoZSBwYXRjaGVzLgoKQmVzdCByZWdhcmRzLApKYXZhZAo+Cj4gQmVzdCBy
ZWdhcmRzLAo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQg
Q0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQg
dHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
