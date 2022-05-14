Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67C8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 15:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 415EB4047D;
	Sat, 14 May 2022 15:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YUkFSvD5OohQ; Sat, 14 May 2022 15:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC25140356;
	Sat, 14 May 2022 15:17:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70CCF1BF2F8
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 15:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6673540168
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 15:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t8OwsUVMHFO8 for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 15:17:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D921400A6
 for <buildroot@buildroot.org>; Sat, 14 May 2022 15:17:16 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a5so11112640wrp.7
 for <buildroot@buildroot.org>; Sat, 14 May 2022 08:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=usrCjSfqUIo8iu1zbCpMjyaIdrtQLfDqyMBxoIuJTms=;
 b=iTNXBSqJGVvRRsHq81XjrtyHzQH6D1xoXzNEDmVpq05Rmu5LZsy7rp1icxbvsUZBq+
 Bq84kzs44qJj7k+umd75aLot76g6LH4YPZE+rrVIeZAGIUUIO9XnTyLxWFKNXkBpetDP
 Cu7fnPfth6GCg7QmpinkM5PHsUi8fhP0V/gfU+WDG62VR2++tG3HVwuN4CNaCRPsdZK1
 Z05Iu32crJfU1k09ysueevHN25HT0ri3a86GJLXORKKh19r1HYWcW3qLlMHhhHKr+AlS
 BQseHtogw3KdqGvqiDlyRPBKlh67f0xDseEwBeWUdwdZLeSlNaTOAP7c2L3zmLJcvGQB
 B0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=usrCjSfqUIo8iu1zbCpMjyaIdrtQLfDqyMBxoIuJTms=;
 b=W40kt85kiTnyTf7Xhm5a2UYpMc7/Q57nolrkP5h3PnVTPQKHsbwqLcsgcVp/cwGI8h
 6nH1dtzrbXwcVCkEuIPQdf4ykfhEXHO3HYR8x1ftFk/SUwDjCVte5FpYSvUikgTcSUee
 UwAX+6+1DcVw4z2FB2ncWh8gmmQhTK0jZdYdaLcU00wsiQg/O7QCCpkQLWp+AmteUtcM
 hLHZod90m9dE4TTy2syxD4DavnTbce4vy44DMxwFJQMW2Jr0QZbbkqfILO+LzK0BrsdN
 RQ3+8FpQaYcgO7l9aLl72ec1mp+E09+J+u2KX42lVqSjl1w3iyxTUtX91zG5rATWQu0F
 hwEw==
X-Gm-Message-State: AOAM530dbTIHWl/h3PWa9b2AygfRuMGN1+yf1tFyghuPyZqo2PnwyEIL
 rm+RLkbWjr1RsOSMvNQxU48=
X-Google-Smtp-Source: ABdhPJyNis9Fz9h3ii2Dm0jN18Wz38XxCL3ab2LkZ6hMuuBF0kZeti3W2wn5pw2UO/HboytP5dUKqg==
X-Received: by 2002:adf:fa42:0:b0:20a:e8d6:58b8 with SMTP id
 y2-20020adffa42000000b0020ae8d658b8mr7984416wrr.64.1652541434165; 
 Sat, 14 May 2022 08:17:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 u13-20020adfa18d000000b0020c5253d913sm4730003wru.95.2022.05.14.08.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 08:17:13 -0700 (PDT)
Message-ID: <16915492-655d-8a28-1eb3-a0dfdf119713@gmail.com>
Date: Sat, 14 May 2022 17:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220513202855.752024-1-fontaine.fabrice@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220513202855.752024-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/alchemy: add host-pkgconf
 dependency
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
Cc: =?UTF-8?Q?Herv=c3=a9_Codina?= <herve.codina@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwKCkxlIDEzLzA1LzIwMjIgw6AgMjI6MjgsIEZhYnJpY2UgRm9udGFpbmUg
YSDDqWNyaXTCoDoKPiBob3N0LXBrZ2NvbmYgaXMgYSBtYW5kYXRvcnkgZGVwZW5kZW5jeSBzaW5j
ZSB0aGUgYWRkaXRpb24gb2YgdGhlIHBhY2thZ2UKPiBpbiBjb21taXQgN2YxZjNmODc4NjhmYTMz
MzgzM2RiYmE5ZjRmMDdhZGMzMzhiMzRlZCByZXN1bHRpbmcgaW4gdGhlCj4gZm9sbG93aW5nIHVs
b2cgYnVpbGQgZmFpbHVyZToKPiAKPiAvaG9tZS9idWlsZHJvb3QvYXV0b2J1aWxkL3J1bi9pbnN0
YW5jZS0wL291dHB1dC0xL3Blci1wYWNrYWdlL3Vsb2cvaG9zdC9vcHQvYWxjaGVteS9jaGVjay5t
azozNjogKioqICdwa2ctY29uZmlnJyBpcyByZXF1aXJlZC4gIFN0b3AuCj4gCj4gQW4gb3RoZXIg
b3B0aW9uIHdvdWxkIGJlIHRvIHNldCBUQVJHRVRfT1MgdG8gYmFyZW1ldGFsIGJ1dCBpdCBjb3Vs
ZCBoYXZlCj4gdW5leHBlY3RlZCBzaWRlLWVmZmVjdHMgc3VjaCBhcyByZW1vdmluZyAtZlBJQyBm
b3IgYXJtIHRhcmdldHMKPiAKPiBGaXhlczoKPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5vcmcvcmVzdWx0cy9jNzMxZmUwZTliZGJmY2UwODIzZjljNDg2NDFmMWVkNzEwZmE2MTI1CgpB
bHNvIGZpeGVzOgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9q
b2JzLzI0MjkwMTM1NTUKCj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9u
dGFpbmUuZmFicmljZUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21h
aW4ubmFvdXJAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+ICBwYWNr
YWdlL2FsY2hlbXkvYWxjaGVteS5tayB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hbGNoZW15
L2FsY2hlbXkubWsgYi9wYWNrYWdlL2FsY2hlbXkvYWxjaGVteS5tawo+IGluZGV4IDE4Y2RkMGE2
NDUuLjEwZDEwNjhhYzQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9hbGNoZW15L2FsY2hlbXkubWsK
PiArKysgYi9wYWNrYWdlL2FsY2hlbXkvYWxjaGVteS5tawo+IEBAIC04LDcgKzgsNyBAQCBBTENI
RU1ZX1ZFUlNJT04gPSBkOTViM2MzOGNkMzc4MTRhMWI5OGQwYmJmODEzZGU3YWRhYWVjZmJjCj4g
IEFMQ0hFTVlfU0lURSA9ICQoY2FsbCBnaXRodWIsUGFycm90LURldmVsb3BlcnMsYWxjaGVteSwk
KEFMQ0hFTVlfVkVSU0lPTikpCj4gIEFMQ0hFTVlfTElDRU5TRSA9IEJTRC0zLUNsYXVzZSAoQWxj
aGVteSksIEdQTC0yLjAgKGtjb25maWcpCj4gIEFMQ0hFTVlfTElDRU5TRV9GSUxFUyA9IENPUFlJ
TkcgUkVBRE1FCj4gLUhPU1RfQUxDSEVNWV9ERVBFTkRFTkNJRVMgPSBob3N0LXB5dGhvbjMKPiAr
SE9TVF9BTENIRU1ZX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBob3N0LXB5dGhvbjMKPiAg
Cj4gIEFMQ0hFTVlfSE9NRSA9ICQoSE9TVF9ESVIpL29wdC9hbGNoZW15Cj4gIEFMQ0hFTVlfU0RL
X0JBU0VESVIgPSAkKFNUQUdJTkdfRElSKS91c3IvbGliL2FsY2hlbXkvc2RrCj4gQEAgLTM1LDYg
KzM1LDcgQEAgQUxDSEVNWV9UQVJHRVRfRU5WID0gXAo+ICAJQUxDSEVNWV9IT01FPSQoQUxDSEVN
WV9IT01FKSBcCj4gIAlBTENIRU1ZX1dPUktTUEFDRV9ESVI9IiQoQEQpIiBcCj4gIAlBTENIRU1Z
X1RBUkdFVF9PVVQ9YWxjaGVteS1vdXQgXAo+ICsJUEtHQ09ORklHX0JJTj0kKFBLR19DT05GSUdf
SE9TVF9CSU5BUlkpIFwKPiAgCVRBUkdFVF9PUz1saW51eCBcCj4gIAlUQVJHRVRfT1NfRkxBVk9V
Uj1idWlsZHJvb3QgXAo+ICAJVEFSR0VUX0NST1NTPSIkKFRBUkdFVF9DUk9TUykiIFwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
