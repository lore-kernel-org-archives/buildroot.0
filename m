Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B97BC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F360606BA;
	Mon, 25 Mar 2024 22:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EsHvSLzcIdcI; Mon, 25 Mar 2024 22:55:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 455296082F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 455296082F;
	Mon, 25 Mar 2024 22:55:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC59C1BF425
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D569340130
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDB1GHzTFnLG for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:55:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2A79400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2A79400CE
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2A79400CE
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:54:59 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a468004667aso664578166b.2
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711407297; x=1712012097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y4xgkhu0FvXvg99awdL3exf+k/mdX4NdRAwclBmuOA4=;
 b=Y2S3fGs/any+ZgK8u+b3M1stcNzi36CdOWPhF3hZTOAISrh9ESf8meC6k0madJopPa
 4jJ4MpTNcsi3D5zKysu7y7zfiWUqCx84ow+ERv44RH5qb0MS6xiFDOY3LfMlEFCR+gEq
 nJS8GZysYzWkUT35l+WFlD4x879AJJfnNS2rFBFjsF9pzin1iW2riQlKAaDLh27r3MM0
 ScPv/abAIaS06hYkJrgtTQFVdA6F0rAkglCGWt/SYq+p5uVL6LyNYsEqEl2iw0LNRGYW
 plhD6nwerEWLbqxE2gBKUFB6wKgFiUA8mFZOAmrmOQbs5UxRIEgXpiiEDneMmPVJraGj
 MpqQ==
X-Gm-Message-State: AOJu0YyZjzqmuWh3cDbkZLpYjRTgS1O7u0bZagEe8n9zQnaP2qxPhNUE
 UIgH39Zar23MtWZyxIZHafxiG9JkVTDC4buWG9PHAT/BWliZ1wp9Ou9suHx3i89qpRJdl31QC58
 veyqm/w==
X-Google-Smtp-Source: AGHT+IGOdjzxi7cXPeE3a5Ok69FguIL0c18jNRGui+XWgO9EWjHxgp/8zHW8iNW9xtw/gMFRF73ZHQ==
X-Received: by 2002:a17:907:7214:b0:a47:50c5:15b2 with SMTP id
 dr20-20020a170907721400b00a4750c515b2mr4423818ejc.6.1711407296983; 
 Mon, 25 Mar 2024 15:54:56 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 m12-20020a1709061ecc00b00a46d04b6117sm3515465ejj.64.2024.03.25.15.54.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 15:54:56 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-56bb22ff7baso5684296a12.3
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:54:56 -0700 (PDT)
X-Received: by 2002:a50:bb6d:0:b0:566:4aa9:7143 with SMTP id
 y100-20020a50bb6d000000b005664aa97143mr5968990ede.14.1711407295959; Mon, 25
 Mar 2024 15:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240307015107.2908128-1-christian@aperture.us>
 <20240307015107.2908128-2-christian@aperture.us>
 <edeee9c6-f3ff-40cf-8f78-cb4855dd937a@mind.be>
In-Reply-To: <edeee9c6-f3ff-40cf-8f78-cb4855dd937a@mind.be>
Date: Mon, 25 Mar 2024 15:54:44 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pcQ8=JAc5-iHt0BsYhn89z1O+JdAGy3DVgvJSiMivpXw@mail.gmail.com>
Message-ID: <CA+h8R2pcQ8=JAc5-iHt0BsYhn89z1O+JdAGy3DVgvJSiMivpXw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1711407297; x=1712012097; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y4xgkhu0FvXvg99awdL3exf+k/mdX4NdRAwclBmuOA4=;
 b=B1paNSrY9hu4FDeq9Pw/8mKmhC600kyQtf1bFEZJVPVNRgQ67cLWxpPMFoVmjijMAF
 YyWO0zTERmK1RFozMSlTFEVfwKpfsLUuEWFcpYEwWn1QZwRkfhjsYPYKyHTN1TUc29uD
 TI9sfP8muFMAKFWLvAAulxd5USFEhnkxanwmbOkLxar4fzJhhLC2icHd6DxK9loZPcmF
 5cQxNEFpNN+F1pVWfIiiPs7E4nQEN+n+YtsFUy6BDUxNE1aHQjQStN4lENlGXDbRmL7x
 kVfYkWpPgZdBknfJjq4zB8MxFzYeRK/kcRPG/KRWcPJeSr1NPhB9l4rNQVEBHCMHqMGt
 KA4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=B1paNSrY
Subject: Re: [Buildroot] [PATCH v1 2/3] package/go-bootstrap-stage3: add
 stage3 for go1.22 support
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gTW9uLCBNYXIgMjUsIDIwMjQgYXQgMzozNuKAr1BNIEFybm91dCBWYW5k
ZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4gICBXaGVuIHRyeWluZyB0byBidWls
ZCBpbiB0aGUgY29udGV4dCBvZiB0aGUgcnVudGltZSB0ZXN0cywgSSBnZXQgdGhpcyBlcnJvcjoK
Pgo+IGNkIC9ob21lL3RtcC9icnRlc3QvVGVzdE1lbmRlci9idWlsZC9ob3N0LWdvLWJvb3RzdHJh
cC1zdGFnZTMtMS4yMS44L3NyYyAmJgo+IEdPMTExTU9EVUxFPW9mZiBHT1JPT1RfQk9PVFNUUkFQ
PS9ob21lL3RtcC9icnRlc3QvVGVzdE1lbmRlci9ob3N0L2xpYi9nby0xLjE5LjEzCj4gR09ST09U
X0ZJTkFMPS9ob21lL3RtcC9icnRlc3QvVGVzdE1lbmRlci9ob3N0L2xpYi9nby0xLjIxLjgKPiBH
T1JPT1Q9Ii9ob21lL3RtcC9icnRlc3QvVGVzdE1lbmRlci9idWlsZC9ob3N0LWdvLWJvb3RzdHJh
cC1zdGFnZTMtMS4yMS44Igo+IEdPQklOPSIvaG9tZS90bXAvYnJ0ZXN0L1Rlc3RNZW5kZXIvYnVp
bGQvaG9zdC1nby1ib290c3RyYXAtc3RhZ2UzLTEuMjEuOC9iaW4iCj4gR09PUz1saW51eCBDQz0v
dXNyL2Jpbi9nY2MgQ1hYPS91c3IvYmluL2crKyBDR09fRU5BQkxFRD0wIC4vbWFrZS5iYXNoCj4g
QnVpbGRpbmcgR28gY21kL2Rpc3QgdXNpbmcgL2hvbWUvdG1wL2JydGVzdC9UZXN0TWVuZGVyL2hv
c3QvbGliL2dvLTEuMTkuMTMuCj4gKGdvMS4xOS4xMyBsaW51eC9hbWQ2NCkKPiBidWlsZCBjYWNo
ZSBpcyByZXF1aXJlZCwgYnV0IGNvdWxkIG5vdCBiZSBsb2NhdGVkOiBHT0NBQ0hFIGlzIG5vdCBk
ZWZpbmVkIGFuZAo+IG5laXRoZXIgJFhER19DQUNIRV9IT01FIG5vciAkSE9NRSBhcmUgZGVmaW5l
ZAo+Cj4gICBJIHN1c3BlY3QgdGhhdCB3ZSBuZWVkIGVpdGhlciBHT0NBQ0hFPSQoSE9TVF9HT19I
T1NUX0NBQ0hFKSBvciBHT0NBQ0hFPShzb21lCj4gb3RoZXIgcGF0aCkuIEkgdGVzdGVkIHdpdGgg
dGhlIGZpcnN0IG9wdGlvbiBhbmQgdGhhdCBzZWVtcyB0byB3b3JrLiBTbyBJIG1hZGUKPiB0aGF0
IGNoYW5nZSBhbmQgY29tbWl0dGVkLiBMZXQncyBzZWUgaWYgdGhlIGF1dG9idWlsZGVycyBjb21w
bGFpbi4uLgoKU291bmRzIGxpa2UgdGhlIHJpZ2h0IGZpeCB0byBtZSwgdGhhbmtzIQoKQ2hyaXN0
aWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
