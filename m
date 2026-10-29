Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438BA606A323
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ikxTXMyG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0139360A95;
	Thu, 29 Oct 2026 21:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUaWAQrOYJ-T; Thu, 29 Oct 2026 21:36:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 04A4260A7D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793309778;
	b=qJBie09nNvPX8i+LGyYrLPyA7jPyeDGYsnOErhitqFRtCF+Th/J00Ldt83xTOHm85U+I
	 0AHEslaa5HXYwZUYr2LX2LA7bT0tWSJPuLaiCd/qy+KO1TQ1OVYT12ta/nwe5/mG4ykxB
	 3Pvyh5lpLWmoaqVmR5CjjNy5ksBTHK9sZdsPF2uVorr0dwmg9kiimD5LH9dLRmsjyP9tS
	 Qk402aJUWCt40lfAP/Ib24ZTCxFv6WxXL94b6XhXtF+pfwQQzkEgGcCejEyTo0s7HVvGG
	 vfZ1VDNQYI2fp8A9wR5W+EZH1BQc+2PNaOb9foFpKX8dZKTVbsRcFNzeIKyuqEY4Esw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793309778;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Jp1U2smakO1zgMw4bT5wRvEKOLCIx/tK9J2dApQXFD0=;
	b=OuYYMGOhwEFOrOr/l+XAzhCaxBrFLY37/6OtbNJbyvnyF8BL2KDA6bQ3HV4nGj3WWrbC
	 Kp0bfq2AU9l9LFu5qmvATlKxnStcBKhh8u/wHLrMjYkZ7d5LEUJtm/gr92F3l1VFh6eSQ
	 S0aRIzldniF4LK8k2ahx0l/GhnWuDxwzYxg9VnwDukTyi5qo30tlRHAu0nBD4ya4GDy5Y
	 pgcweNC8MH+cII1Ip2EjTCan6GANB2nTFeTTHgXFPMf1WnmUlRaMXSEZyJyr+/h1cUeNg
	 JowyOWhdvSsVmS5UlOaoCxeWOlAMvdoe+puxme0+X1IEeJNaMNmkz9TKQwfZB3k0OIQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793309778;
	bh=Jp1U2smakO1zgMw4bT5wRvEKOLCIx/tK9J2dApQXFD0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ikxTXMyGZlZ8G36owWCL3IAKr9wC42G6Tg4l084J9PKoDadV2LoztrOImCvH7MHWb
	 aj0GOCYjOc+Pm+ELHy5KT1Wp5utCHOiTN60Q1+pRwZoiOidPzMh59FZdqK2Yd2qb6E
	 EqvuqRmUyMe5Hxn4pAxpPqPU6uR648CiRqWSMEv68aOSIXpaEV/vC6/bYK27mfsEZq
	 ry4loIZuUjjTtedpAhLEEe9eR+4LHDQi73RWZwRZ/CLeRvIidHHgkoG6C3XGgHUuaC
	 3TsUImcohH8xJUpBHf/B2mL6MTjAHm7Wl+ZAgGljnoBBsFWZ0Y9gILpJyivR3ryu96
	 YxTGYI0zih3qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04A4260A7D;
	Thu, 29 Oct 2026 21:36:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6FD91DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD1BC60A7D
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DuN66znN55qO for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:36:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9798160A71
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793309774;
 b=ArJRM1pXV+ac+tyYZyxGb9jM1l/6nUXiBAobHSytdZo6BYTa6rYF4habcc01xfyDHpPj
 v6hyZiUCelaOhf+JeqzM8obsRgMgqrmvAqfUjdGcf35rwZxFXmtqoXfAthKc4bxMBtuiJ
 JicBGQ1Zjkj/4P6DNnavotjF/CLW8g+WCm2YrR7bkDg5k4raNDpZ6SJbLkR/ppHt50uLb
 Tx3tLSfWaWzinRxp2CoXI35Nl0cz2zuhYcl5x9srfW60C7CNkQ5EvCpZphgGxYs3SPZ4k
 0wLmJElPSFbykv16ps0pzUhedvLciyMQPuYMOZX4LKC5HDKh6adrUojX6Mpd3FJh7ug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793309774;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=hP9tutX9jAWaJSZMM6j725dkcxwfLKrYovyyzuQthcg=;
 b=PylnFlU20x8OB+qJ2+QCLPvOyA9eReCUVVsuH7EQY1j+WDy4ZQjqL9bTSpaKvUI5Wm22
 v2RXCaFxlut41V6yPd8VCnC3FMGfbO1z7dPwFhWBAfbVktUtdNafv2NRet3mwe/y/y9y9
 V80BgyzPpY4SLnOGMz8BoJ1gMBJ4r/ZVoar0g4FiPCs/3mRJHoL6chPsHP6BqwsGpNqHD
 T0X26qhEaC71XI0q9ct/yKmmFu2UTqalYfKN0iBw5v6z/2ZnAHRHa89FluM2b9NKcoH3R
 dDQwx2AcDU5tZBcfFSqPQnn6D8l4yf6KFEGlJKk7cIpCPREsKoz0tGjWIIAr0vqecrg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RC3gkhGz; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9798160A71
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:36:12 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso221155e9.3
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793309771; x=1793914571;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hP9tutX9jAWaJSZMM6j725dkcxwfLKrYovyyzuQthcg=;
 b=vDjVJVkMhOsd56UFLAhEZZwPxhKSInmkTbDR5TDIhEdIfVA61Z6cyD6PbmSVo9OYu/
 RyCc5bSBqiNar2RqpykyoYw8Hbq5+9VRRHNM/GCJop45bcuR0vPT0dUrhYZXGCGfI5ey
 KWR/XmxQYNrzaoACn6YCaa6TwKmknqU8wqtERgGSBTKlV2MH+/O3pTk2wjmkKGBZEANo
 vGHTFBkhVfU3KhAr1eKsbyhahK8IxqNFesPJG/8VmBN4lpPfCPGQ/U7cY9H2Ch49rWIn
 eR5xhmh5KZ045jnRDs9yYb4UW+g4YZYDC7M1pgQPQ0yDk7IAgEZZjOpPptzcFFhaEWKG
 7HFA==
X-Gm-Message-State: AFq9FYIWeRjAfSXGSeww5p0k+Pq1u75mXWprgEY/1KLKGExlCKqwc/Op
 w2cHH1aZUpUznraiqb1RX/IZho3DyU5CnZ+2j4vysEtTdj6SbVMD35CHeIhz0Rp9fFhrXZRlxnC
 ZvJzVzeMjgw==
X-Gm-Gg: AYBFou3DBJrKaZjgad+PUMpCNrIJJWgboqiL8fIfdF63cWiXmaWPQHqBChoDmvJGijG
 bjvwt10K4jC3slCvuCyhrK7XdsCW2ef++msStlbwpAtxjrccFmgmtOa6cHy4GTVS2KdAlkXVXhF
 GTuovFiDnlCR7XVyuI5An0JjeU+LQuQHdV8Dkp0LUwuPu3FqBGh/mwpyBzgDDJafFBdhuiqWUxO
 DLzjiBZrh2iycRNdSxYKhgAQjS2W6kWv93XKhv6TMl9iLDK327anPvZSqgTpkdluYkBqzZpN9y4
 FELN2vYKl8drBe5ut/LRudedS1kQwCsXsbmRUmV39sxV5owTq2OVhpLV2zU4PEx4OWHkYUAanAR
 3MKnEIP8TNRIOxoGqnOj5r0F3HIOc7wvQWTNQ7YfqXixTqL3hkyehbE0xTM4LWzEzZ6B44Tyidg
 qm8KsaH8vcVtaZJutP2IvkFB8SYAGTGWiY5eacQfM4uniP/+MD0W5qhJzQ/SKMk8IuYOSNmIIPm
 PCMVnhWWxSqYu/dHsganAC0j6Lw1MiaHr+z+UepyPuLnxCufK6GLqlHwqMroNeqtOqjBnMIsrSL
 L5Dnc364zmHTSG4B/m8wkcYKs/RfkFI1bLTCE4K7eMIz
X-Received: by 2002:a05:600c:1387:b0:4aa:2339:a375 with SMTP id
 5b1f17b1804b1-4ac1793fa6bmr5497485e9.13.1793309771061; 
 Thu, 29 Oct 2026 14:36:11 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e6eb25dbbsm858997f8f.2.2026.10.29.14.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 14:36:10 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu, 29 Oct 2026 22:35:41 +0100
Message-ID: <20261029213546.1783883-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029213546.1783883-1-raphael.melotte@mind.be>
References: <20261029213546.1783883-1-raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for, 2025.02.x,
 2026.08.x 2/3] package/mupdf: add upstream security fix for
 CVE-2025-71382
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIC4uLi1mb3ItdmFsdWUtZnJvbS1pbmhlcml0YWJsZS1wcm9wZXJ0eS5wYXRjaCB8IDQy
ICsrKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvbXVwZGYvbXVwZGYubWsgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAzICsrCiAyIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL211cGRmLzAwMDMtYnVnLTcwODg0MC11c2UtaXRlcmF0
aW9uLWZvci12YWx1ZS1mcm9tLWluaGVyaXRhYmxlLXByb3BlcnR5LnBhdGNoCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9tdXBkZi8wMDAzLWJ1Zy03MDg4NDAtdXNlLWl0ZXJhdGlvbi1mb3ItdmFsdWUt
ZnJvbS1pbmhlcml0YWJsZS1wcm9wZXJ0eS5wYXRjaCBiL3BhY2thZ2UvbXVwZGYvMDAwMy1idWct
NzA4ODQwLXVzZS1pdGVyYXRpb24tZm9yLXZhbHVlLWZyb20taW5oZXJpdGFibGUtcHJvcGVydHku
cGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZDYzZmRiODIwOQot
LS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbXVwZGYvMDAwMy1idWctNzA4ODQwLXVzZS1pdGVy
YXRpb24tZm9yLXZhbHVlLWZyb20taW5oZXJpdGFibGUtcHJvcGVydHkucGF0Y2gKQEAgLTAsMCAr
MSw0MiBAQAorRnJvbSBiMmYyOTM5ZDQwM2ViYTZkNWRkYmE0MGUzOTgxZjNiYWEwNmYwNzk2IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogVG9yIEFuZGVyc3NvbiA8dG9yLmFuZGVyc3Nv
bkBhcnRpZmV4LmNvbT4KK0RhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTY6MzI6MDUgKzAyMDAKK1N1
YmplY3Q6IFtQQVRDSF0gQnVnIDcwODg0MDogVXNlIGl0ZXJhdGlvbiBmb3IKKyB2YWx1ZV9mcm9t
X2luaGVyaXRhYmxlX3Byb3BlcnR5LgorCitBdm9pZCBuZWVkbGVzcyByZWN1cnNpb24uCisKKyhj
aGVycnkgcGlja2VkIGZyb20gY29tbWl0IDcwYjcxYWIyMmU2ZGU0ZDRjNDRjZDMwMWM4ODIzMWY2
MjNhNGU5NGUpCitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL0FydGlmZXhTb2Z0d2FyZS9t
dXBkZi9jb21taXQvNzBiNzFhYjIyZTZkZTRkNGM0NGNkMzAxYzg4MjMxZjYyM2E0ZTk0ZQorQ1ZF
OiBDVkUtMjAyNS03MTM4MgorU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhh
ZWwubWVsb3R0ZUBtaW5kLmJlPgorLS0tCisgc291cmNlL2h0bWwvY3NzLWFwcGx5LmMgfCAxMyAr
KysrKystLS0tLS0tCisgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKKworZGlmZiAtLWdpdCBhL3NvdXJjZS9odG1sL2Nzcy1hcHBseS5jIGIvc291cmNlL2h0
bWwvY3NzLWFwcGx5LmMKK2luZGV4IDA3MDM4M2IwZi4uNjVmODZiNDcwIDEwMDY0NAorLS0tIGEv
c291cmNlL2h0bWwvY3NzLWFwcGx5LmMKKysrKyBiL3NvdXJjZS9odG1sL2Nzcy1hcHBseS5jCitA
QCAtNzkyLDE1ICs3OTIsMTQgQEAgaXNfaW5oZXJpdGFibGVfcHJvcGVydHkoaW50IG5hbWUpCisg
c3RhdGljIGZ6X2Nzc192YWx1ZSAqCisgdmFsdWVfZnJvbV9pbmhlcml0YWJsZV9wcm9wZXJ0eShm
el9jc3NfbWF0Y2ggKm1hdGNoLCBpbnQgbmFtZSkKKyB7CistCWZ6X2Nzc192YWx1ZSAqdmFsdWUg
PSBtYXRjaC0+dmFsdWVbbmFtZV07CistCWlmIChtYXRjaC0+dXApCisrCXdoaWxlIChtYXRjaCkK
KyAJeworLQkJaWYgKHZhbHVlICYmICFzdHJjbXAodmFsdWUtPmRhdGEsICJpbmhlcml0IikpCist
CQkJcmV0dXJuIHZhbHVlX2Zyb21faW5oZXJpdGFibGVfcHJvcGVydHkobWF0Y2gtPnVwLCBuYW1l
KTsKKy0JCWlmICghdmFsdWUpCistCQkJcmV0dXJuIHZhbHVlX2Zyb21faW5oZXJpdGFibGVfcHJv
cGVydHkobWF0Y2gtPnVwLCBuYW1lKTsKKysJCWZ6X2Nzc192YWx1ZSAqdmFsdWUgPSBtYXRjaC0+
dmFsdWVbbmFtZV07CisrCQlpZiAodmFsdWUgJiYgc3RyY21wKHZhbHVlLT5kYXRhLCAiaW5oZXJp
dCIpICE9IDApCisrCQkJcmV0dXJuIHZhbHVlOworKwkJbWF0Y2ggPSBtYXRjaC0+dXA7CisgCX0K
Ky0JcmV0dXJuIHZhbHVlOworKwlyZXR1cm4gTlVMTDsKKyB9CisgCisgc3RhdGljIGZ6X2Nzc192
YWx1ZSAqCmRpZmYgLS1naXQgYS9wYWNrYWdlL211cGRmL211cGRmLm1rIGIvcGFja2FnZS9tdXBk
Zi9tdXBkZi5tawppbmRleCBmNzgwZGEyZWI1Li43NmU1ZGI5ZjZkIDEwMDY0NAotLS0gYS9wYWNr
YWdlL211cGRmL211cGRmLm1rCisrKyBiL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKQEAgLTMzLDYg
KzMzLDkgQEAgTVVQREZfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjYtMjU1NTYKICMgMDAwMi1idWct
NzA4NTIxLWF2b2lkLXJlY3Vyc2l2ZS1jeWNsZS13aGlsZS1zdHJpcHBpbmctb3V0bGluZXMucGF0
Y2gKIE1VUERGX0lHTk9SRV9DVkVTICs9IENWRS0yMDI1LTQ2MjA2CiAKKyMgMDAwMy1idWctNzA4
ODQwLXVzZS1pdGVyYXRpb24tZm9yLXZhbHVlLWZyb20taW5oZXJpdGFibGUtcHJvcGVydHkucGF0
Y2gKK01VUERGX0lHTk9SRV9DVkVTICs9IENWRS0yMDI1LTcxMzgyCisKICMgbXVwZGYgZG9lc24n
dCB1c2UgQ0ZMQUdTIGFuZCBMSUJTIGJ1dCBYQ0ZMQUdTIGFuZCBYTElCUyBpbnN0ZWFkLgogIyB3
aXRoIFVTRV9TWVNURU1fTElCUyBpdCB3aWxsIHRyeSB0byB1c2Ugc3lzdGVtIGxpYnJhcmllcyBp
bnN0ZWFkIG9mIHRoZSBidW5kbGVkIG9uZXMuCiBNVVBERl9NQUtFX0VOViA9ICQoVEFSR0VUX01B
S0VfRU5WKSAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgXAotLSAKMi41NC4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
