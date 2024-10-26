Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BB1D10BE4
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 05:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AEB060659;
	Sat, 26 Oct 2024 05:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DljbAMTrZVay; Sat, 26 Oct 2024 05:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8455860AF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8455860AF6;
	Sat, 26 Oct 2024 05:46:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC3965C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 562B840877
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PToTNhJCiuee for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 05:46:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7011440800
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7011440800
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7011440800
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:46:17 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-718186b5c4eso1362323a34.2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 22:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729921576; x=1730526376;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mJxEAEcI6U8kKLYRED+0sdh1BTBd6uKaLezQaj3rl1E=;
 b=gHayIHccygws5aSQBnwd2Axy4GYfTSSzGYxk9zRdLnUESwGcCdjFL+re03PHz9Zcqv
 xjqhbA0YhyhEV73PCz+nkGxdjMAY/Xy274rzksuVWNKUXIQj38vLoQv8DG3W0kkJZCGA
 Fdipyl46z+idQo2e6JfJSaF3qRtImJg9e7+OlvN3JwUXstuLCqpRsRHlfr6TG7DzP07e
 1l/9kQ4f66MMWX9wtXKHEKuerPHJ7wX1gWUwSaGQVTFCGZpCYM86Lzo0HvkaDAbWL7nL
 B0zKj4XdNBpLP81T4BB/1wwA9RJAVyRyLhZiwnn1VSfwLTigPS3b0aHE16R9IHB2jDjz
 fu/g==
X-Gm-Message-State: AOJu0YxhmUGsD9U6Q2YN9BJ25fVD1S7t02HntRMW+wOO/bIm7QNlqFa7
 FEyngtd5TSdQBp9Jg2CHw4ep7F2ccbsxNErCfUDa3ckbLMt763UqdqeQt+mWC7WAz1Edi1EcDHP
 R
X-Google-Smtp-Source: AGHT+IEqHbhFu+bOzdajUXUxEZ+1ucNZTCHyq11/Jdn8zN4QkNC6qL+s8fG0leENG0/rwemMIeOheg==
X-Received: by 2002:a05:6830:380c:b0:718:4073:428f with SMTP id
 46e09a7af769-7186822cb99mr1708215a34.16.1729921576218; 
 Fri, 25 Oct 2024 22:46:16 -0700 (PDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com.
 [209.85.167.175]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71861637954sm590983a34.42.2024.10.25.22.46.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 22:46:15 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3e602a73ba1so1576016b6e.2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 22:46:15 -0700 (PDT)
X-Received: by 2002:a05:6870:1645:b0:278:2272:fc73 with SMTP id
 586e51a60fabf-29051b1a3f1mr1621912fac.8.1729921575269; Fri, 25 Oct 2024
 22:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <CA+h8R2pDpNLjCiJMuc+d7ioFDrOGiTu3YpQBRmrt7acGbeeQaw@mail.gmail.com>
In-Reply-To: <CA+h8R2pDpNLjCiJMuc+d7ioFDrOGiTu3YpQBRmrt7acGbeeQaw@mail.gmail.com>
Date: Fri, 25 Oct 2024 22:46:04 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qrcjF9HVb4wCYMrFUF5sWqDx0kh5FQL+Pj1jMhJKKUxg@mail.gmail.com>
Message-ID: <CA+h8R2qrcjF9HVb4wCYMrFUF5sWqDx0kh5FQL+Pj1jMhJKKUxg@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729921576; x=1730526376; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJxEAEcI6U8kKLYRED+0sdh1BTBd6uKaLezQaj3rl1E=;
 b=JZwzxP+qg6qw7CPPCLlCUMV9asTUC5lMzBF/2P0/cg0I8Q4JpFfzsJGqemAkIfCioh
 VVLXUh+EFpxkoHWEa/DTXKvM95ETfqxwBdiwcczYJNNA5TXQQX54H5Yyjzhq1SNzFNZo
 EWyca+Cf9VokX7XVrZ2jDRoN5MZzsn49Zkp7UNS9Dotsu8o/Ie3wPfl1uxPRMgz6Jug0
 dBzsF4/ULJYdHGVagUlOJ/jKX20kevpHk6Gm2MBtIiF102I2aM1HDOL6P3XfaCwk7SiG
 dfeDsOC3NmB0ognecLAYt2Vhg+fUasbndggdAh+SD+/62i2mZBA+zC4KfUt9jL1fuBs+
 0Y1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=JZwzxP+q
Subject: Re: [Buildroot] package/linux-firmware: build failure
 rtl8723bs_config-OBDA8723.bin
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKCk9uIEZyaSwgT2N0IDI1LCAyMDI0IGF0IDEwOjQy4oCvUE0gQ2hyaXN0aWFuIFN0
ZXdhcnQKPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4KPiBIaSBhbGwsCj4KPiBJdCBz
ZWVtcyBsaWtlIHRoZSBsYXRlc3QgbGludXgtZmlybXdhcmUgZHJvcHBlZCBzb21lIGZpbGVzOgo+
Cj4gcnRsX2J0L3J0bDg3MjNic19jb25maWctT0JEQTg3MjMuYmluCgpJIGZvdW5kIHRoZSByZWxl
dmFudCBjb21taXQ6Cgpjb21taXQgMmJiOGZiMjY1OTkzMDJjOWNiYzY5YTVhZmYzMjlhODU1OWM5
MWU0OApBdXRob3I6IFBldGVyIFJvYmluc29uIDxwYnJvYmluc29uQGdtYWlsLmNvbT4KRGF0ZTog
ICBUaHUgQXVnIDggMTU6MTc6MjQgMjAyNCArMDEwMAoKICAgIHJlbmFtZSBydGw4NzIzYnNfY29u
ZmlnLU9CREE4NzIzLmJpbiAtPiBydGxfYnQvcnRsODcyM2JzX2NvbmZpZy5iaW4KCiAgICBUaGUg
c2V0dGluZyB3b3JrcyBmb3IgbnVtZXJvdXMgcnRsODcyMyBzZXJpZXMgb2YgZGV2aWNlcyBzbyBs
ZXQncyB1c2UKICAgIHRoZSBkZWZhdWx0IG5hbWluZyBzbyBpdCB3b3JrcyBieSBkZWZhdWx0IGV2
ZXJ5d2hlcmUgYW5kIGxpbmsgdGhlCiAgICBkZXZpY2Ugc3BlY2lmaWMgbmFtZXMgdG8gdGhlIGdl
bmVyaWMgY29uZmlnLgoKICAgIFNpZ25lZC1vZmYtYnk6IFBldGVyIFJvYmluc29uIDxwYnJvYmlu
c29uQGdtYWlsLmNvbT4KClNvIHdlIG5lZWQgdG8gcmVuYW1lIHRvIHJ0bDg3MjNic19jb25maWcu
YmluCgo+IHJ0bF9idC9ydGw4NzIzZF9jb25maWcuYmluCgpjb21taXQgNWEwMTc5OTZjNmRlNjRl
YmQ3ZjdjNjBlMTIzM2E0NWJhMDQwODZjYQpBdXRob3I6IFBldGVyIFJvYmluc29uIDxwYnJvYmlu
c29uQGdtYWlsLmNvbT4KRGF0ZTogICBUaHUgQXVnIDggMTY6MDM6MTYgMjAyNCArMDEwMAoKICAg
IHJ0bF9idDogZGUtZHVwZSBpZGVudGljYWwgY29uZmlnLmJpbiBmaWxlcwoKICAgIEEgbnVtYmVy
IG9mIHRoZSBydGxfYnQgZmlsZXMgYXJlIGlkZW50aWNhbCBhY2NvcmRpbmcgdG8gc2hhMjU2c3Vt
CiAgICBzbyBsZXQncyBkZS1kdXBlIHRoZW0sIGFuZCBhbHNvIHJlbW92ZSBhIGNvdXBsZSBvZiBl
bnRyaWVzIGluCiAgICB0aGUgV0hFTkNFIGZpbGUgdGhhdCBhcmUgZHVwbGljYXRlcyB3aGlsZSB3
ZSdyZSBhdCBpdC4KCiAgICBTaWduZWQtb2ZmLWJ5OiBQZXRlciBSb2JpbnNvbiA8cGJyb2JpbnNv
bkBnbWFpbC5jb20+CgogcnRsX2J0L3J0bDg3MjNkX2NvbmZpZy5iaW4gfCBCaW4gMTAgLT4gMCBi
eXRlcwogMSBmaWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKClRo
aXMgb25lIHdhcyBkZWxldGVkLgoKQmVzdCByZWdhcmRzLApDaHJpc3RpYW4gU3Rld2FydApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
