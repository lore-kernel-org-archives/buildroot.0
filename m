Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9034C48BF8
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 20:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EF274060C;
	Mon, 19 Feb 2024 20:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F3lm-ZeyxUxA; Mon, 19 Feb 2024 20:41:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59A4E40B73
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59A4E40B73;
	Mon, 19 Feb 2024 20:41:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD16E1BF41C
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A90F74060C
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TfNiwqANWW4K for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 20:40:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34FF040B73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34FF040B73
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34FF040B73
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 20:40:59 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-595aa5b1fe0so3128639eaf.2
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 12:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708375258; x=1708980058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G34/Xp9E705sxCZScvU0uJYXwYcYhzw+8XK1L66+t5k=;
 b=d0KqIyLXkEZfUUrHuBp6RwpyUeqd+6PnmTFJKIzhQtM+4O4ucmZBrfa3MTjBqStDwi
 MJK5qZ4aDkcDocb56YX2w/ItyOf6baK3KldBdJEL9dd1UfiJoodXX2ifCa02jrRBfUO1
 vWR3kGig+ihPUhJJSLGddDgJtLsBo8Ciz6zdZTYZORK9mzuJhLvMrqvqzffd0BkIWQB3
 NS3AI29+H8XnenDpgpDRVjlzKflekUs1G4yTdQiSzS2NjYGCTUd+KxlCyBthg5V0ulde
 EUuv+IJoMFAdWyu8RWwGhJmDbCLs0NA0J5hv63fhOpgaciCKPJG0Z97ZOZsWegC+6dja
 OKtw==
X-Gm-Message-State: AOJu0YywI8VtbCFYVA0ml2FZ9LQsBAuHOYMUrbpZ7UQlvwMpsTvHEmf8
 ysnXrtTUaqOaj3WiBjqmr9RSPQF9wWZMrHEusosHlxGaQiCRuMsfZGAJ7oqBXek=
X-Google-Smtp-Source: AGHT+IH/46y83Wi6cknC2SBwrdo0qZXV+1638hPeyFrWjWUOItzkwhv8mj19YoUtj96pC6r5mkvv9g==
X-Received: by 2002:a05:6358:63a7:b0:17a:e013:9586 with SMTP id
 k39-20020a05635863a700b0017ae0139586mr15202914rwh.29.1708375257639; 
 Mon, 19 Feb 2024 12:40:57 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 v18-20020a63f852000000b005dc87643cc3sm5097337pgj.27.2024.02.19.12.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 12:40:57 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 12:40:54 -0800
Message-Id: <20240219204054.57774-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <--in-reply-to>
References: <--in-reply-to>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708375258; x=1708980058; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G34/Xp9E705sxCZScvU0uJYXwYcYhzw+8XK1L66+t5k=;
 b=FAq61YRKMMlwNSdorFMmy7IrUUQYKLwMAJ6KtjwPQXf9BzLXpUg7VJGRwlYDRDGzvP
 cRYTKJ+9Ym4ibowFNA3hDMszgzu56kliOCIn8Qa4zzGSCZIJgqXV5ckGlnCrNx12u/nL
 tapTUBvxuQTmlNb/7iRQTDMr5ueGnKCz+9CgLALqX7/DlWu17St02ZExsjT36Wd+JkHj
 5afcv53ksUqJv8ygynanyn9lUspO/t/HtC0gZaZgGKyn5N3V5B3of6nL7eF68rdJ7OSE
 IMjMFgKFH1h/QikmtgjURa1s4MwicI86zVkRr6qIjrpd2kV470OUnzfBtpMke2T+A+X0
 lzhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FAq61YRK
Subject: [Buildroot] [PATCH 1/1] package/google-breakpad: fix missing
 include error
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Pascal Huerst <pascal.huerst@gmail.com>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

c3JjL2NvbW1vbi9tb2R1bGUuY2M6IEluIG1lbWJlciBmdW5jdGlvbiDigJhib29sIGdvb2dsZV9i
cmVha3BhZDo6TW9kdWxlOjpBZGRGdW5jdGlvbihGdW5jdGlvbiop4oCZOgpzcmMvY29tbW9uL21v
ZHVsZS5jYzoxOTQ6NTI6IGVycm9yOiDigJhmaW5kX2lm4oCZIGlzIG5vdCBhIG1lbWJlciBvZiDi
gJhzdGTigJk7IGRpZCB5b3UgbWVhbiDigJhmaW5k4oCZPwogIDE5NCB8ICAgICBGdW5jdGlvblNl
dDo6aXRlcmF0b3IgZXhpc3RpbmdfZnVuY3Rpb24gPSBzdGQ6OmZpbmRfaWYoCiAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fgog
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZpbmQKTWFrZWZpbGU6ODMwOTogcmVjaXBlIGZvciB0YXJnZXQgJ3NyYy9jb21tb24vdG9vbHNf
bWFjX2R1bXBfc3ltc19kdW1wX3N5bXNfbWFjLW1vZHVsZS5vJyBmYWlsZWQKClRoaXMgZXJyb3Ig
aXMgc2VlbiBvbiBnY2MtMTQuCgpodHRwczovL2Nocm9taXVtLXJldmlldy5nb29nbGVzb3VyY2Uu
Y29tL2MvYnJlYWtwYWQvYnJlYWtwYWQvKy81MTM3NjU4Cmh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRl
ZC5vcmcvbWV0YS1vcGVuZW1iZWRkZWQvdHJlZS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvYnJl
YWtwYWQvYnJlYWtwYWQvMDAwMS1GaXhlZC1taXNzaW5nLWluY2x1ZGUtZm9yLXN0ZC1maW5kX2lm
LnBhdGNoCgpTaWduZWQtb2ZmLWJ5OiBLYWRhbWJpbmkgTmVtYSA8a2FkYW1iaW5pLm5lbWFAZ21h
aWwuY29tPgotLS0KIC4uLml4ZWQtbWlzc2luZy1pbmNsdWRlLWZvci1zdGQtZmluZF9pZi5wYXRj
aCB8IDI2ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25z
KCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvMDAwMS1GaXhl
ZC1taXNzaW5nLWluY2x1ZGUtZm9yLXN0ZC1maW5kX2lmLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9nb29nbGUtYnJlYWtwYWQvMDAwMS1GaXhlZC1taXNzaW5nLWluY2x1ZGUtZm9yLXN0ZC1m
aW5kX2lmLnBhdGNoIGIvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvMDAwMS1GaXhlZC1taXNzaW5n
LWluY2x1ZGUtZm9yLXN0ZC1maW5kX2lmLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLjE0MWUxMmI2MTMKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2dvb2ds
ZS1icmVha3BhZC8wMDAxLUZpeGVkLW1pc3NpbmctaW5jbHVkZS1mb3Itc3RkLWZpbmRfaWYucGF0
Y2gKQEAgLTAsMCArMSwyNiBAQAorRnJvbSA4OThhOTk3ODU1MTY4YzBlNmE2ODkwNzJmZWZiYTg5
MjQ2MjcxYTVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogTmF0aGFuIE1vaW52YXpp
cmkgPG5hdGhhbkBuYXRoYW5tLmNvbT4KK0RhdGU6IFR1ZSwgMTkgRGVjIDIwMjMgMTQ6MzU6MDUg
LTA4MDAKK1N1YmplY3Q6IFtQQVRDSF0gRml4ZWQgbWlzc2luZyBpbmNsdWRlIGZvciBzdGQ6OmZp
bmRfaWYuCisKK1Rocm93cyBhbiBlcnJvciB3aGVuIGNvbXBpbGluZyBvbiBXaW5kb3dzLgorCitD
aGFuZ2UtSWQ6IEllYjM0YzAwY2YxOTlhYWExYjQ1YTQ0MDA4NmM0OGI4ZWQzNjNiM2M3CitSZXZp
ZXdlZC1vbjogaHR0cHM6Ly9jaHJvbWl1bS1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2JyZWFr
cGFkL2JyZWFrcGFkLysvNTEzNzY1OAorUmV2aWV3ZWQtYnk6IEl2YW4gUGVua292IDxpdmFucGVA
Y2hyb21pdW0ub3JnPgorVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUvYnJlYWtw
YWQvY29tbWl0Lzg5OGE5OTc4NTUxNjhjMGU2YTY4OTA3MmZlZmJhODkyNDYyNzFhNWQKK1NpZ25l
ZC1vZmYtYnk6IEthZGFtYmluaSBOZW1hIDxrYWRhbWJpbmkubmVtYUBnbWFpbC5jb20+CistLS0K
KworZGlmZiAtLWdpdCBhL3NyYy9jb21tb24vbW9kdWxlLmNjIGIvc3JjL2NvbW1vbi9tb2R1bGUu
Y2MKK2luZGV4IDBlYjVhYWQuLmI2ZjVkYTcgMTAwNjQ0CistLS0gYS9zcmMvY29tbW9uL21vZHVs
ZS5jYworKysrIGIvc3JjL2NvbW1vbi9tb2R1bGUuY2MKK0BAIC00Miw2ICs0Miw3IEBACisgI2lu
Y2x1ZGUgPHN0ZGlvLmg+CisgI2luY2x1ZGUgPHN0cmluZy5oPgorIAorKyNpbmNsdWRlIDxhbGdv
cml0aG0+CisgI2luY2x1ZGUgPGZ1bmN0aW9uYWw+CisgI2luY2x1ZGUgPGlvc3RyZWFtPgorICNp
bmNsdWRlIDxtZW1vcnk+Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
