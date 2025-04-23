Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3176C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 15:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B30C3611D0;
	Wed, 23 Apr 2025 15:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGu_yGwX9wVl; Wed, 23 Apr 2025 15:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B92D260BBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B92D260BBC;
	Wed, 23 Apr 2025 15:37:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BFB82A6
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 15:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CF0460BBC
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 15:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dPpBmntnQai for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 15:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5294860C01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5294860C01
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5294860C01
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 15:37:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39c1ef4acf2so4380489f8f.0
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 08:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745422648; x=1746027448;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=72N9MX2zEtAXPYYA+/OHYZowFJYJGkGSAu3ajJs8CgI=;
 b=ZxwvdDGJK2e3XVvXEbbdJxMn2adf/zbWbtiNCtr3Kq3S/RYyzhzLCD42p/UuoTxnrK
 5hrQDUIyRseZiu0Qou3ZFEBwZMj1p1kiMc42P8tZLpjyRfwCNhaLsFqWe0TBrk1cZgV5
 ATTjm8kR+e1892+pmQbB6zSR9b3yewWSJ/xucfeXgw3ogkj2vWJTs7Z4qPXR9F14Aptn
 230a+HwEiQpRuMPnDhK1awV72FHXkS7yWzdQGhkxZIpFPJNnN1jp4/x86LTpCOGGnmIO
 kQbz03J9QgBHY6c9cO91f5YmkelXu6+5inN6p9NrFhU1d9ilDk73h85tOXaEyH25SxSR
 hXBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkrsmsr7gB+BqojCEahQUI2Yq+gRUbwmM7ejp4jdF1JKD3Zt+pPITzWrwR682jMSdSWJ/cLq/2GqM=@buildroot.org
X-Gm-Message-State: AOJu0YzWTY12U6sn5CjOY1ENjrLsQIZMNAn9hH7q01IfMIedbBlw28hz
 D00kCI/qb8CbYlX89BSuolCXkmvYXkPUx0kH0tB21HSbQK0FXyURGoGGhdjQtIA=
X-Gm-Gg: ASbGncuKTZ2dghqnBV8ct541z1j9zLvAzW305Xy6ygh4L98rFDV4c8mYDF0DGFOd6P6
 AvtQmhB8DGfrbS4PrrCcfparLtxh1wLhy/IQhqlDIkPMJstFaBJNeAliey1AVry3Eit+fMXQzTB
 xuvQcmiB7rSNWTA2Wz9LbLNO0PARvR5tXtNZAsTagrwkynj0AGwO741LpSGayEyWGUVwna36/o8
 2LSoaVL7gRHfFP3DAC27VD21uRChffEQ8CeX3fqKu9JUbXSMw4FTjsN5AQ3cyia2ICvstgZtkAE
 S4htHtf8c6VzeewzTvbXIIzmVe/IaqZok6D6zQSpn2Ksc0Zrc+uq6iyTVohvPacxLPcQLVEqQjK
 R3gI2ws3jmgk=
X-Google-Smtp-Source: AGHT+IEtpHFKf48is6whIFh8ku24DMnQMWu+erU7Djg6Ds6e8XsaskN/3cBlskhP2+FAir4PqEOxXQ==
X-Received: by 2002:a05:6000:178d:b0:39c:c64e:cf58 with SMTP id
 ffacd0b85a97d-39efbaf20ccmr15329424f8f.55.1745422648117; 
 Wed, 23 Apr 2025 08:37:28 -0700 (PDT)
Received: from [10.5.0.102] (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43d22esm19365135f8f.52.2025.04.23.08.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 08:37:27 -0700 (PDT)
Message-ID: <8d86cb1c-a387-45c6-957e-9628294c8ac3@mind.be>
Date: Wed, 23 Apr 2025 17:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?= <buildroot@buildroot.org>
References: <20250414104614.973244-1-raphael.melotte@mind.be>
 <20250419160709.57df2ad9@windsurf>
Content-Language: en-US
Autocrypt: addr=raphael.melotte@mind.be; keydata=
 xsBNBF9jhjsBCACmkrLRBR22D1FiSlmQGKiSPPLY0lAYe6/DnBT7OsgiGIOWqmQL1ryGJmxI
 9PDMDGEBngJ6RyrsVlREt7ugoBEg75CrtYwXdTCB40fEPweceHtWwAQoOS3MDgFhdvd6uZvl
 YWenR6RcbCo/LZaV/novslE1eCnADNChMOkp8jTAA0K2jIlEYexrzO+G3CcrKmo6naVxn56r
 dn0kLnff4f/wvj+1l+J7m6GVL/8ckQ8fVQagLxQ5LHoxhIcOxKH1IEzf+gri/e+16gka7bWE
 4QUCEeGo/pBYysLinUP/6ArAmWoZXfGH3S0HiLBc/Yf4klnJ1nd6vZmxYKppOmy814+tABEB
 AAHNK1JhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT7CwJQEEwEI
 AD4CGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSjAZBvHnwkHJEj52rDTCsxdUfmrAUC
 Z4ZBYQUJCgPupgAKCRDDTCsxdUfmrC80B/0Y4VeyvIBoHgN2l5Jv9SvAAvPdtDNQBe66aG3X
 5J8wGOao7jGQQQwd52A/eRRHKf7DaVK8m1aMb82KSwaGp5YAM2TgUg72DvqPb2Nv/NKTjQ41
 mTBKOr0A1JJlhF0fOhOCvi4A4eQFnNt/Awn1id1ZKv7CVErH/AiXfdqF0nwXJ+SgTb7FtQ/R
 sCekSRrrnMiGqFA3W0zeYyZ6liehOCqqmYDwdqbnjjdaYfwEwPMRJCobdt9gpQsFxOWGNPTc
 EtPX6LyDEtF0gbQEdRDiYZ24YBeAydRwycmOiyKiVNnQFkKBw6jas5+7WeoKwnhZ7EEHhIEL
 6xRlP+ACT4YWIdkCzsBNBF9jhjsBCACcBqvoGcSgHH5io/UF+ouPP3tkr68kp6Ww2Gtnf7gu
 cL9vr9ixKbuobOCs2/1JhQD1fjmrs/Nb7wYUoA+QECkoZbdRLoqaldX0Uf+7no3EtwwSMROV
 EJKBOoRyuW7nH7PzoRmMYDGHqCYTuTfBH8byoh29tjPezyli5n4Zr3JIjmgjgG6jT31uqeDn
 eirLtWta2c2n4o5cPKoVNsZJmbVtuzAz5XHUPHDaLaFnQlaPlGQ1RDvuKVzkZ1maXloa9lND
 TL7dkWoQvq7LtYxRALEhSUU8My2Bxb3B+rRMGS8W+IGAdSvtxiGqDP6W7Ac2mrg13wXf8+fq
 XiYblnHp02PtABEBAAHCwHwEGAEIACYCGwwWIQSjAZBvHnwkHJEj52rDTCsxdUfmrAUCZ4ZB
 9QUJCgPvOgAKCRDDTCsxdUfmrDrzB/9w+0pSSeHdd+mgOgtjoab23OfHbwkQa86WgdSpx5hR
 U+QdtB9zJErJBA8q5Kq4vBSu+h9V9HaETg1nnpaREbiEo4mX5kiTHCwr51JArBLFMQXGMTqE
 pENpJdaHBZDJqktvcLFBfIzIo2avLMOjAznZBeFimEcKgwouAo9DK5qb61th9hjUBvNvzFjh
 h+mjryTGqe4l0eIRxwPi7uh1d3PCql/InUhXDii3oisu75ss+2aKyRtx1RMLxcj+pD1oheZs
 ib86j6501oe6jZ+FsoUBf6EXcSij4nZlVYtEWsr7vKpPEUdNYCeeAAOuabDWsYRU/Rfl8Myc
 7ZS5078ic8ic
In-Reply-To: <20250419160709.57df2ad9@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1745422648; x=1746027448; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=72N9MX2zEtAXPYYA+/OHYZowFJYJGkGSAu3ajJs8CgI=;
 b=JKZPOakXg3cCkgohlcuzQBaqXDNU0WjzMhy12NiB/ct2b79RqMb0xgTSrZCtzB9JNB
 Omz8Too7AchtGyPPEOITmsTwMXPuB/ecG91RVn+D7eyrvMTgVIrQ71BRTpT8Lnb7imSE
 Y/lsfAuqgBs/wkbyZB2JUxOn/5kUjY47+Fp3lJs2EAtU8YXIqPqDx5/73luFN2pb95I+
 kIVkp42rgOvx8zFpl2eXfkKktn2JoennnaHUzLliRU/2HuPxJ+dIZPNMrpzogVfx9H9G
 JGoHE9aVCay2Wyuarof6q6389KgoV3Uw1Rcui7fgsw0s3yP9Lyx2RMfvgj6YVQCoyhs0
 wbOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JKZPOakX
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: ignore
 CVE-2002-0318 and CVE-2011-4966
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: David GOUARIN <dgouarin@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gNC8xOS8yNSAxNjowNywgVGhvbWFzIFBldGF6em9uaSB3cm90ZToKPiBb
Li4uXQo+IERpZCB5b3UgcmVwb3J0IHRoZXNlIHRvIHVwc3RyZWFtIE5WRCwgdG8gZ2V0IHRoZSBk
YXRhYmFzZSB1cGRhdGVkL2ZpeGVkPwoKWWVzIEkgZGlkLCBidXQgSSBoYXZlbid0IHJlY2VpdmVk
IGFueSBmZWVkYmFjayB5ZXQuCgoKS2luZCByZWdhcmRzLAoKUmFwaGHDq2wKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
