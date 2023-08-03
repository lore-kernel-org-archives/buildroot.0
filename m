Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77202C001DB
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 21:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2D5C418AF;
	Thu,  3 Aug 2023 21:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2D5C418AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SaqGG0qhhkIj; Thu,  3 Aug 2023 21:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 127D840253;
	Thu,  3 Aug 2023 21:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 127D840253
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA9A1BF341
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 21:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CA1160A94
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 21:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CA1160A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ntM6rpJBmQXP for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 21:22:17 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DEEB60C19
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 21:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DEEB60C19
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fe1fc8768aso14593965e9.1
 for <buildroot@buildroot.org>; Thu, 03 Aug 2023 14:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691097735; x=1691702535;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4dKwQWSIhWsGgAIcLGz2gV3Pkn1Hv2fumSUm5Fnc2Hw=;
 b=LC3U9ILRTgEyYPn1s6xt1TRtKs7ItDszre/BIQRQ8FK6rGQ3LlZPBki/7h99wuEGOf
 Gdc4DRbzyxxHOLrSAbUHif7fWHPdDm1ZRSygGjvaH5CxoplqUFDIuSQBXB2Aci2l5B+I
 nvwi3zkjrbpFBfIYEv0MydDImGImCO1hII2BqnLSwE/U9viLoDHmjNStUmFyLaEqx7P/
 kFo2ENqEMVl7l3wql+ThLnW4cKj0pK6O7+zEG0Fhf661D7SCF0EpDDgPZFMif1SAYjBj
 Mxz9O1cCq9xLwnBUE2NM+jorDLaZCpEjGNfI9ivyHtZ08gspxD3FrwMiXrtwfkOYfPoj
 E5Bg==
X-Gm-Message-State: AOJu0YxVwhGTfc3ZbJqykAfy8hlqe38nvyGEsf8YQhNkrpjAZFDvSFJT
 bmc2s991uQaYLm1r5aVUlLo=
X-Google-Smtp-Source: AGHT+IEsU1LyTqFUEf/WGQWdW9V0SRexoj4iDgosagHaR1kVvq0b0/Nrwco5krNJ7PCGXgcnbnE8rw==
X-Received: by 2002:a7b:c5cc:0:b0:3fb:b280:f548 with SMTP id
 n12-20020a7bc5cc000000b003fbb280f548mr31278wmk.0.1691097735050; 
 Thu, 03 Aug 2023 14:22:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:20e:c6ff:fec6:8e56?
 (2a01cb05945b7e00020ec6fffec68e56.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:20e:c6ff:fec6:8e56])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c00d400b003fbb346279dsm719098wmm.38.2023.08.03.14.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 14:22:14 -0700 (PDT)
Message-ID: <6f65d64b-61e4-c574-1c6d-075beec80025@gmail.com>
Date: Thu, 3 Aug 2023 23:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
References: <20230722073533.3072853-1-bernd@kuhls.net>
 <20230722232314.683b6431@windsurf>
Content-Language: en-US
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20230722232314.683b6431@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691097735; x=1691702535;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4dKwQWSIhWsGgAIcLGz2gV3Pkn1Hv2fumSUm5Fnc2Hw=;
 b=bGCEj0yZbtIDcXg/spHD+IqIQLHLjwVAKcSJm71rVg73wQwKmqw7fHTgLakdsRCZ04
 vJpMCP3bAlZMRn9WWcGkdkJCr5R91hjpSE6ea6WBpe4efof4KeC2z68P4Kb98VFqE0AS
 t3Rw7EHMvKTEFA3h6x4uXdw9HUeKMQrgiqoC2+ogsMN6qa72vZYcQuRKSeDUThZSlIbD
 nM1b/kovA3ZsMXPkUP2vTPokfiDu2g0J+vzd9cJh5s5AUC99jAp/W7d2gLqMXnLxN1mJ
 q0GeQqA74nDSwSbp4A9fNw6LUcwngaIcz4mbi3JAavKtCjrhimbGFbWgfxC5kZtL0yZ7
 M4JQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bGCEj0yZ
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 1.2.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQmVybmQsCgpMZSAyMi8wNy8yMDIzIMOgIDIzOjIzLCBUaG9tYXMgUGV0YXp6b25pIHZp
YSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBPbiBTYXQsIDIyIEp1bCAyMDIzIDA5OjM1OjMzICsw
MjAwCj4gQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4gd3JvdGU6Cj4gCj4+IFJlbGVhc2Ug
bm90ZXM6IGh0dHBzOi8vbWVzb25idWlsZC5jb20vUmVsZWFzZS1ub3Rlcy1mb3ItMS0yLTAuaHRt
bAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+PiAt
LS0KPj4gIHBhY2thZ2UvbWVzb24vbWVzb24uaGFzaCB8IDQgKystLQo+PiAgcGFja2FnZS9tZXNv
bi9tZXNvbi5tayAgIHwgMiArLQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gCj4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRoaXMgbWVz
b24gdmVyc2lvbiBidW1wIGludHJvZHVjZSBhIHJlZ3Jlc3Npb24gd2hpbGUgYnVpbGRpbmcgaG9z
dC1xZW11IG9uIHNvbWUKaG9zdDoKCmhvc3QvbGliL2xpYmdpby0yLjAuc286IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYGdfbW9kdWxlX29wZW5fZnVsbCcKY29sbGVjdDI6IGVycm9yOiBsZCByZXR1
cm5lZCAxIGV4aXQgc3RhdHVzCgpDYW4geW91IGhhdmUgYSBsb29rPwoKQmVzdCByZWdhcmRzLApS
b21haW4KCgo+IAo+IFRob21hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
