Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48250606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bJzEzRBw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2526681CAD;
	Fri, 30 Oct 2026 15:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZQhW2X9lLmT; Fri, 30 Oct 2026 15:30:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 19B1E81BF4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374206;
	b=IzSvy4tkHj0RbzwWhq8xvCeUTvBiPPXnS8SbzJ18pAVA+pRTB9qQW3oJAe/73Fdujdlw
	 AFVEfpqfm/9UrRCTuXhcCVR+pLPnengsPLJMHXLuXljn7VfEYSVYIedrCAHGQ1Dy/Ycaa
	 +J/cPgfYxM+jy2OieqQoukXukFOllx9Mbe+Kd4yDZ+yFq6nJIqZqPMwYTTu8+DTqSRIe1
	 YReVkq7nYl+SzL2XB30+mV6BwYAG4f2XVjmxoXx8sNXJsgmY7+AQJqVPL1/fmv3uX1T5a
	 mSQdLBTPJohkF/AJPLOlLGlIuBthuEJku84vfF6kup9vtYRB2nJVYrF0kxxRxgoSklQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374206;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=by9A86H4CqrO37xheZca2Il9Jj/j6asOxwDUVp95xG0=;
	b=nDvnYCLeq0tZU+w+mY7klqAZi4plwk0akoYBT72kFDBNJClilSBm9dVRJAJ6Q1ldGKXm
	 2RdwGlqrXRqdo6GjK0Z8b8HlSIvcbbOqCDeLnOGda24JYNSeFYgEgAzkoNJAlv1xm9a+8
	 BoC+NRFlE/kzVizmnX4lNcQs/D0JHJYDpn8cBWldKOWEyba6/M5VnRaIGAHiUX/aEXkgf
	 C1/x/aieq+L9OepapLsEZK4d+tq6JKjC/uHTNcu9H8aKDyoCtadZnEgTLUHuk55dk9MPT
	 RX99HSTv0k8N9kaarGOukW9N7rnUUsJoTwlkw8J9IdfqpVPoP8limibjG564fOuK3LQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374206;
	bh=by9A86H4CqrO37xheZca2Il9Jj/j6asOxwDUVp95xG0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bJzEzRBwIRur0OJeecjeMasTTf2Nv195HAwd5IFwGujhaQoTuJJ/W9K7JGFx5375S
	 yizz5iELUols228icsjCmNZUMK4FtzgwZUthyAaSacpgTsp4mhZU5ofkaKWjxe7Dlk
	 yPotk9ZUIRm+PPdK2ZSp1on37OvSdmq/eBWl+xPTbbo9meSMgLrd9s8Tyl4A2CPk7k
	 6G5AuVFlB+QN4hHhBjG63Dszit47WD5O/QPewzteFGRXgl9A6IFE+sVGjQHMslv2ED
	 4UczmBIqE5BghTVDlw2GfE99fnfooUGc8WDhc8PXNQO25yKpdFlAAwZjydh0pveJAx
	 4SYf5Fht5bA2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19B1E81BF4;
	Fri, 30 Oct 2026 15:30:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ADAB5235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92C1360B55
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jw8zUEUiRsUw for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2D5C460B23
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374179;
 b=a+xqKdcXaxmgTYZfL/B8ZvxY08PCXgzRHvFy8Xiq9PX8h1KV7WefslktRIZjORPFNEvM
 GU/7GGC6YccpaxoSaqDyiFiyp409Ta8lmfAzbTlfuhttgPRK7/2J8KrfoHMyQ4FXu0+ae
 XrNUCqOHy4+lZ9xGSgcMBqEQiWvbrpmsdBxRmUWfW8ScyBYWTsgXn2c44gKW83y5oPOSr
 rPjIEc0M3wHgq2jJ401zoU1WDq9/JDv60/OkDSnxxc36vnGSxSrfqO6I/FrK0hVS1R+VI
 2oJJMbEHHJlBCEy+ESkud0K3I6vwnZse7NgtpeGb/tzPKmMgZpm2H4arsLWfFN4uUEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374179;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=7//46CaK6Va7+9KFYCDDgVwITynEs0u1HtJnnGJP6j8=;
 b=hnzAndgihdn0X9wGQgUixCCyCg/WpqbKqUWy4GiHHOyxhYW9mVdlgpc7UGeHYhcO3At+
 3cZ4P9kDxW8+M5Yh1+KbUHC/hTmpkbMsayzvYGcNnf/YoqNeH6VVulp0D+8mh83CMLZUj
 AZfvcxxpkkWec2D2shwmn4KRyEtzRslQUyHJhjmElvjER2xF5KJuKv1i0I5wVGE0rEDUp
 70oSJ4TBuJgjdLwnLY3evu7ncInYZzkjmapVUnt3nwLb92IN0sz2V5IDtc5nyf6QKxFBY
 uawjq84Ae+3LYmGDXmSRUmUb4vBsqCeRM/4ej0apns2iDT7py6ypSz8IGt2wMAwKlaA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZKkbR4BQ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D5C460B23
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso5447095e9.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374177; x=1793978977;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7//46CaK6Va7+9KFYCDDgVwITynEs0u1HtJnnGJP6j8=;
 b=vvbbzpfs+6hGA/LeUmg+tm598OZgyUa95RhBVHxL381rlYmPafnIfJSmn/oVzV77w2
 yOuMnyEp+aYiQQJjA9ucda2aMqCqAiarWyRsNf7FqNKZw6ZDF3KGycGVm5sU092cAbap
 Xe9Fsllsam2b69Cn8LRQ6tuJqCDUbvpmPlCcNtJ0d+XDP/WewdVv/TmMoWo5JXcNwv+b
 E8unocJCsMgesqr1mK7oTQNp2gNIS/u6SHYjVVBX8Mim0mYSE6WZ8ZdT9HB0oxrfJRWt
 Hi7tQNUDy3wOH9X6KHRKiDMRfKB+ei3Nf/UhFsZtmEWffjezOtGPUO0c7ytbvfELu/Ts
 19Aw==
X-Gm-Message-State: AFq9FYLFz2KBk0M5wJbPGzPx20mGQ7pT0+aE7q4oOJ6tBFcWQSQJpFef
 x0hQDjXxEqMyRK8QCbCYBcsLdSI9Y4gYtsDbopkhoGDU7DalpJWB+pN/n9i0NhY/DUyVzJjYxpf
 d+rz0ZKs=
X-Gm-Gg: AYBFou3BA/hp1fy1f+QQmzHLauBkwm3jAv7avWmdON94P7U9G3xnbQNAyoN8ujluQgL
 VZV3tbKxuAcvzUB3N5YNOa/4qVR3teC6z0yqXq/4OEF/wxBHRj9p4NgEpbsX0mx6FcG8PPKHUSa
 PrPNRPwgivbBPSIW0C68ZnmasOJgMo/R08zR9Yq5ZBjBmiCdfgxqzi9JxfHG1TqZendpJxScxgw
 Je+E1pV8K28Ow/rBCYrNL3OCEfG/s1dCpeVrk05MD3tFcvXkyCokdYIoCb4LF0/hIV4RC/Tzy4g
 bAROTpgNyznpJqaBb87C7zh3TTCNaXqiXo7hjh6R7b2ii53lkAurWX1Mm/xv6aKT3lQS+fxkCGH
 4J3YSxL7gsIwiceiPHT5BmBZFBQ4zSSfw3sENpQBQuhbk3BlxG+R0G09vsh4r9SXhEcliJ4W2gg
 QsA++Mb4zhbT54bKzEQY5T5oDeK6rnOcvqxVkyM5JfUvEPjSuGySxaOfiol30Jd1cvt1D+SAtMr
 kogzUltDYRw4uFIs2SFM+f9Ss7naI1aGqtBIDEj0tMPEbbbndmXDsexCJNmDHlFPcGAdvsITAag
 z9DBGVuqftFapi9BfIfVYhrgTl7h6c5iscWlTMYct3cWXaNhgUvyr3lkftdRnVOaf7BPWolu
X-Received: by 2002:a05:600c:19c9:b0:4a1:f377:5c68 with SMTP id
 5b1f17b1804b1-4ac18a8911amr59276755e9.34.1793374176972; 
 Fri, 30 Oct 2026 08:29:36 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ab61d8b9f4sm104385655e9.12.2026.10.30.08.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:36 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:33 +0100
Message-ID: <20261030152935.1908008-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024090225.3987962-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: fix build errors with
 uClibc-ng
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gdUNsaWJjLW5nIDEuMC41OCBpbmNsdWRlcyBjb21taXQKPiBodHRwczov
L2dpdGh1Yi5jb20vd2J4LWdpdGh1Yi91Y2xpYmMtbmcvY29tbWl0LzQ4N2FmMTQ5ODhjM2M5MjNh
YTY2MWYyMDQ2NDI1OTdjZmYzNTZhODMKPiB3aGljaCByZW1vdmVzICIjZGVmaW5lIFBBR0VfU0la
RSIgY2F1c2luZyBidWlsZCBlcnJvcnMgZGV0ZWN0ZWQgYnkgdGhlCj4gR2l0bGFiIHBpcGVsaW5l
cyBmb3IgYWxsIHVDbGliYy1uZyB0b29sY2hhaW5zOgo+IAo+IC9idWlsZHMvYmt1aGxzL2J1aWxk
cm9vdC9ici10ZXN0LXBrZy9ib290bGluLXBvd2VycGMtZTUwMG1jLXVjbGliYy9idWlsZC9rb2Rp
LTIxLjMtT21lZ2EveGJtYy91dGlscy9VRE1BQnVmZmVyT2JqZWN0LmNwcDoyNjoxMjoKPiAgZXJy
b3I6IGV4cGVjdGVkIHVucXVhbGlmaWVkLWlkIGJlZm9yZSBudW1lcmljIGNvbnN0YW50Cj4gCj4g
UGF0Y2ggMDAxNSBmaXhlcyB0aGUgcHJvYmxlbS4KPiAKPiBCdWlsZHJvb3QgY29tbWl0IGY4MmY1
ZmUxNzdiN2Y4ODRkNDI0YzdjZTIyYWZmNjcwZWQxM2YzNTkgYnVtcGVkIHVDbGliYwo+IHRvIHZl
cnNpb24gMS4wLjU2IHdoaWNoIGluY2x1ZGVzIGdldHRpZCgpIGNhdXNpbmcgYSBidWlsZCBlcnJv
ci4gUGF0Y2gKPiAwMDE2IGZpeGVzIHRoZSBwcm9ibGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJl
cm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgpBcHBsaWVkIHRvIDIwMjUuMDIueCwgMjAyNi4w
OC54LiBUaGFua3MKCj4gLS0tCj4gR2l0bGFiIHBpcGVsaW5lcyBwYXNzZWQ6Cj4gaHR0cHM6Ly9n
aXRsYWIuY29tL2JrdWhscy9idWlsZHJvb3QvLS9jb21taXRzLzM2OTk1OTAzZDI3ODlkZTBmNTQx
YjU0M2M0YzdmOTg5MGIyOGY1ZDYKPiAKPiAgLi4uLVVzZS1zeXNjb25mLV9TQ19QQUdFU0laRS10
by1yZXRyaWV2LnBhdGNoIHwgNDIgKysrKysrKysrKysrKysrKysKPiAgLi4uZEltcGxMaW51eC11
Q2xpYmMtbmctcHJvdmlkZXMtZ2V0dGlkLnBhdGNoIHwgNDcgKysrKysrKysrKysrKysrKysrKwo+
ICAyIGZpbGVzIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2Uva29kaS8wMDE1LVVETUFCdWZmZXJPYmplY3QtVXNlLXN5c2NvbmYtX1NDX1BBR0VT
SVpFLXRvLXJldHJpZXYucGF0Y2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uva29kaS8w
MDE2LUNUaHJlYWRJbXBsTGludXgtdUNsaWJjLW5nLXByb3ZpZGVzLWdldHRpZC5wYXRjaAo+IAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2tvZGkvMDAxNS1VRE1BQnVmZmVyT2JqZWN0LVVzZS1zeXNj
b25mLV9TQ19QQUdFU0laRS10by1yZXRyaWV2LnBhdGNoIGIvcGFja2FnZS9rb2RpLzAwMTUtVURN
QUJ1ZmZlck9iamVjdC1Vc2Utc3lzY29uZi1fU0NfUEFHRVNJWkUtdG8tcmV0cmlldi5wYXRjaAo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uM2I3ZTM1OTg0NAo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2tvZGkvMDAxNS1VRE1BQnVmZmVyT2JqZWN0LVVz
ZS1zeXNjb25mLV9TQ19QQUdFU0laRS10by1yZXRyaWV2LnBhdGNoCj4gQEAgLTAsMCArMSw0MiBA
QAo+ICtGcm9tIGRhODlkZmNlMmRhNGM2OGVmM2E3Zjg5YTRmYmExY2Q2Zjg2MWUzNjMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IGZvc3NkZCA8Zm9zc2RkQHB3bmVkLmxpZmU+Cj4g
K0RhdGU6IFNhdCwgMjIgRmViIDIwMjUgMjI6NTI6MTEgKzAxMDAKPiArU3ViamVjdDogW1BBVENI
XSBbVURNQUJ1ZmZlck9iamVjdF0gVXNlIHN5c2NvbmYoX1NDX1BBR0VTSVpFKSB0byByZXRyaWV2
ZSBwYWdlCj4gKyBzaXplCj4gKwo+ICtnZXRwYWdlc2l6ZSgpIGlzIGRlcHJlY2F0ZWQgYW5kIGxl
Z2FjeSBzaW5jZSBQT1NJWC4xLTIwMDEgYW5kIGlzIG5vdCBhdmFpbGFibGUKPiArb24gYXJjaGl0
ZWN0dXJlcyB3aGVyZSBQQUdFU0laRSBpcyBub3QgZGVmaW5lZC4gSW5zdGVhZCBxdWVyeSB0aGUK
PiArY3VycmVudCBwYWdlIHNpemUgYXQgcnVudGltZS4KPiArCj4gK1Vwc3RyZWFtOiBodHRwczov
L2dpdGh1Yi5jb20veGJtYy94Ym1jL2NvbW1pdC9kYTg5ZGZjZTJkYTRjNjhlZjNhN2Y4OWE0ZmJh
MWNkNmY4NjFlMzYzCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3Vo
bHMubmV0Pgo+ICstLS0KPiArIHhibWMvdXRpbHMvVURNQUJ1ZmZlck9iamVjdC5jcHAgfCA0ICst
LS0KPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPiAr
Cj4gK2RpZmYgLS1naXQgYS94Ym1jL3V0aWxzL1VETUFCdWZmZXJPYmplY3QuY3BwIGIveGJtYy91
dGlscy9VRE1BQnVmZmVyT2JqZWN0LmNwcAo+ICtpbmRleCAyYjgzMzZiY2VhLi5mNmJhODFjMThm
IDEwMDY0NAo+ICstLS0gYS94Ym1jL3V0aWxzL1VETUFCdWZmZXJPYmplY3QuY3BwCj4gKysrKyBi
L3hibWMvdXRpbHMvVURNQUJ1ZmZlck9iamVjdC5jcHAKPiArQEAgLTIzLDggKzIzLDYgQEAKPiAr
IG5hbWVzcGFjZQo+ICsgewo+ICsgCj4gKy1jb25zdCBhdXRvIFBBR0VTSVpFID0gZ2V0cGFnZXNp
emUoKTsKPiArLQo+ICsgaW50IFJvdW5kVXAoaW50IG51bSwgaW50IGZhY3RvcikKPiArIHsKPiAr
ICAgcmV0dXJuIG51bSArIGZhY3RvciAtIDEgLSAobnVtIC0gMSkgJSBmYWN0b3I7Cj4gK0BAIC05
Myw3ICs5MSw3IEBAIGJvb2wgQ1VETUFCdWZmZXJPYmplY3Q6OkNyZWF0ZUJ1ZmZlck9iamVjdCh1
aW50MzJfdCBmb3JtYXQsIHVpbnQzMl90IHdpZHRoLCB1aW50Cj4gKyBib29sIENVRE1BQnVmZmVy
T2JqZWN0OjpDcmVhdGVCdWZmZXJPYmplY3QodWludDY0X3Qgc2l6ZSkKPiArIHsKPiArICAgLy8g
TXVzdCBiZSByb3VuZGVkIHRvIHRoZSBzeXN0ZW0gcGFnZSBzaXplCj4gKy0gIG1fc2l6ZSA9IFJv
dW5kVXAoc2l6ZSwgUEFHRVNJWkUpOwo+ICsrICBtX3NpemUgPSBSb3VuZFVwKHNpemUsIHN5c2Nv
bmYoX1NDX1BBR0VTSVpFKSk7Cj4gKyAKPiArICAgbV9tZW1mZCA9IG1lbWZkX2NyZWF0ZSgia29k
aSIsIE1GRF9DTE9FWEVDIHwgTUZEX0FMTE9XX1NFQUxJTkcpOwo+ICsgICBpZiAobV9tZW1mZCA8
IDApCj4gKy0tIAo+ICsyLjQ3LjMKPiArCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uva29kaS8wMDE2
LUNUaHJlYWRJbXBsTGludXgtdUNsaWJjLW5nLXByb3ZpZGVzLWdldHRpZC5wYXRjaCBiL3BhY2th
Z2Uva29kaS8wMDE2LUNUaHJlYWRJbXBsTGludXgtdUNsaWJjLW5nLXByb3ZpZGVzLWdldHRpZC5w
YXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uODdjNzFhNTI1
ZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2tvZGkvMDAxNi1DVGhyZWFkSW1wbExp
bnV4LXVDbGliYy1uZy1wcm92aWRlcy1nZXR0aWQucGF0Y2gKPiBAQCAtMCwwICsxLDQ3IEBACj4g
K0Zyb20gNmIyZmQ4YzA2OTE0MjZiZTllOGQzNjI3NmU1ZjNhODE1M2ZhMzI2MiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiAr
RGF0ZTogRnJpLCAyMyBPY3QgMjAyNiAwODowMzoxOCArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hd
IENUaHJlYWRJbXBsTGludXg6IHVDbGliYy1uZyBwcm92aWRlcyBnZXR0aWQoKQo+ICtNSU1FLVZl
cnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiAr
Q29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ICsKPiAraHR0cHM6Ly9naXRodWIuY29t
L3hibWMveGJtYy9jb21taXQvYjViMmJlNzEyMWY3NTBiNWYyN2QyMDVlMmIxMWNlMDE3OWIzODhj
Zgo+ICthZGRlZCBnZXR0aWQoKSBiYWNrIGluIDIwMjIgZm9yIG9sZGVyIGdsaWJjIGFuZCBhbGwg
dUNsaWJjIHZlcnNpb25zLgo+ICsKPiArdUNsaWJjLW5nIGFkZGVkIGdldHRpZCgpIGluIHZlcnNp
b24gMS4wLjU2Ogo+ICtodHRwczovL2dpdGh1Yi5jb20vd2J4LWdpdGh1Yi91Y2xpYmMtbmcvY29t
bWl0LzQ3YzE1ZGJiNTBmMDdiZTFlZjVhMWZmYzk1NTkyMDU1ODQwNzhmYmMKPiArCj4gK2NhdXNp
bmcgYSBidWlsZCBlcnJvciBub3c6Cj4gKwo+ICsvYnVpbGRzL2JrdWhscy9idWlsZHJvb3QvYnIt
dGVzdC1wa2cvYm9vdGxpbi14ODYtNjQtdWNsaWJjL2J1aWxkL2tvZGktMjIuMHJjMS1QaWVycy94
Ym1jL3BsYXRmb3JtL2xpbnV4L3RocmVhZHMvVGhyZWFkSW1wbExpbnV4LmNwcDoKPiArIEluIGNv
bnN0cnVjdG9yIOKAmENUaHJlYWRJbXBsTGludXg6OkNUaHJlYWRJbXBsTGludXgoc3RkOjp0aHJl
YWQ6Om5hdGl2ZV9oYW5kbGVfdHlwZSnigJk6Cj4gKy9idWlsZHMvYmt1aGxzL2J1aWxkcm9vdC9i
ci10ZXN0LXBrZy9ib290bGluLXg4Ni02NC11Y2xpYmMvYnVpbGQva29kaS0yMi4wcmMxLVBpZXJz
L3hibWMvcGxhdGZvcm0vbGludXgvdGhyZWFkcy9UaHJlYWRJbXBsTGludXguY3BwOjc2OjQzOgo+
ICsgZXJyb3I6IGNhbGwgb2Ygb3ZlcmxvYWRlZCDigJhnZXR0aWQoKeKAmSBpcyBhbWJpZ3VvdXMK
PiArCj4gK1RvIGZpeCB0aGUgcHJvYmxlbSB0aGUga29kaSBpbXBsZW1lbnRhdGlvbiBvZiBnZXR0
aWQoKSBzaG91bGQgb25seSBiZQo+ICt1c2VkIGZvciBvbGRlciBnbGliYyB2ZXJzaW9ucy4KPiAr
Cj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20veGJtYy94Ym1jL3B1bGwvMzAwNTUKPiAr
Cj4gK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gKy0tLQo+
ICsgeGJtYy9wbGF0Zm9ybS9saW51eC90aHJlYWRzL1RocmVhZEltcGxMaW51eC5jcHAgfCAyICst
Cj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiArCj4g
K2RpZmYgLS1naXQgYS94Ym1jL3BsYXRmb3JtL2xpbnV4L3RocmVhZHMvVGhyZWFkSW1wbExpbnV4
LmNwcCBiL3hibWMvcGxhdGZvcm0vbGludXgvdGhyZWFkcy9UaHJlYWRJbXBsTGludXguY3BwCj4g
K2luZGV4IDhjN2VkYmI1OTEuLmViZjRlYmU4MmIgMTAwNjQ0Cj4gKy0tLSBhL3hibWMvcGxhdGZv
cm0vbGludXgvdGhyZWFkcy9UaHJlYWRJbXBsTGludXguY3BwCj4gKysrKyBiL3hibWMvcGxhdGZv
cm0vbGludXgvdGhyZWFkcy9UaHJlYWRJbXBsTGludXguY3BwCj4gK0BAIC01Miw3ICs1Miw3IEBA
IGNvbnN0ZXhwciBpbnQgVGhyZWFkUHJpb3JpdHlUb05hdGl2ZVByaW9yaXR5KGNvbnN0IFRocmVh
ZFByaW9yaXR5JiBwcmlvcml0eSkKPiArICAgfQo+ICsgfQo+ICsgCj4gKy0jaWYgIWRlZmluZWQo
VEFSR0VUX0FORFJPSUQpICYmIChkZWZpbmVkKF9fR0xJQkNfXykgfHwgZGVmaW5lZChfX1VDTElC
Q19fKSkKPiArKyNpZiAhZGVmaW5lZChUQVJHRVRfQU5EUk9JRCkgJiYgZGVmaW5lZChfX0dMSUJD
X18pICYmICFkZWZpbmVkKF9fVUNMSUJDX18pCj4gKyAjaWYgZGVmaW5lZChfX1VDTElCQ19fKSB8
fCAhX19HTElCQ19QUkVSRVEoMiwgMzApCj4gKyBzdGF0aWMgcGlkX3QgZ2V0dGlkKCkKPiArIHsK
PiArLS0gCj4gKzIuNDcuMwo+ICsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
