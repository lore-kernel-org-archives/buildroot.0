Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52983C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 23:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C45D641889;
	Wed, 27 Apr 2022 23:59:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mP-H0DK31jbZ; Wed, 27 Apr 2022 23:59:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 994CA41738;
	Wed, 27 Apr 2022 23:59:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 067171BF275
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 23:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 023B64026F
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 23:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSA3drFb8gAz for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 23:59:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3957740164
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 23:59:39 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id r9so2785053pjo.5
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 16:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sk5HPKxkC4G1ROJVRvVEjklGkI7+QaNYu1vs6MmrzU8=;
 b=IY7eG/Y5TPKsJE2noxEKvVpsGxxbIRHW4gAtxYLFfQs7H4F2qf/Xsrs/KCaESB4Eks
 Pv7++ZhaadYlC8HKs9Z6jTsvoLwgzbGJBY0+eAmli3SaoQ4yaYO4uOTMcFC/DxkOiTOE
 Bdh3yMUP4kYUDveypkMRDDlVloGeC0I4R8Mcca76qjk1UpRSQrO6rndJFnSULlsrwQPu
 MwqdpSZHjxUJcMCP0VDwoDnR6obMa5rOHOciEJoZmpq9kq0SUJ1Der6nGAfNzhzc+i18
 fDKpFc5//CNT7oirQzdWm9ti6u3go3N/PBNpz7m6ZsIkR8hGEIVe8wFO3fHQFmJgO6fK
 fF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sk5HPKxkC4G1ROJVRvVEjklGkI7+QaNYu1vs6MmrzU8=;
 b=SVhoZfLsD6am7+2dxWnIASjSSJqXiUnzT2teOXWXgbf3VA+7vq7Du0/j18DIUTzJyQ
 8IgEi1CO17GhMh/Xu74wWsFMG3u34BlG6Vbleo4IZk5Kh4wAXgpWJ9Eme2J2bR0biXyJ
 CuTzfuX9LDbYVDQv1i+Ierhowy6XcQ69YrPuAbKWWKw0lul937YiNhWf6fJpm9CaFk5S
 wXtWKmUvndn/sAkqj6ivI9Imi9ZrAw2Df8mJ32Xz79ccbfDTqrwM94R0nNuqnUFARAKV
 8bY9BKPtxfuA7SnULbK1fMhj9beR3XbpP0C1s89vEFV6VqFeyt9wTIfJfpQOs7wgDVBb
 4ulg==
X-Gm-Message-State: AOAM532+y9rfHuJYZjNXI3q3w4eiVCNqEep2Q9TLYFsk030W5rO4e9af
 9+BdRp1NY3Bnt0Tr3j3dCt0=
X-Google-Smtp-Source: ABdhPJxnyAVD9JbUKcaCVQ2c6S2qP6zesEoai/TbpZF6qoGh2RWs0IQu+AhhudvWuIIcos/elNio8Q==
X-Received: by 2002:a17:902:d5ce:b0:158:48db:9719 with SMTP id
 g14-20020a170902d5ce00b0015848db9719mr30763416plh.7.1651103978590; 
 Wed, 27 Apr 2022 16:59:38 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:4a48:7132:60ce:33ea:8830?
 ([2600:8802:b00:4a48:7132:60ce:33ea:8830])
 by smtp.gmail.com with ESMTPSA id
 h124-20020a62de82000000b0050d3020bda0sm14770648pfg.195.2022.04.27.16.59.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 16:59:38 -0700 (PDT)
Message-ID: <d84eedcd-6a57-2789-31b9-989c8da8a8e6@gmail.com>
Date: Wed, 27 Apr 2022 16:59:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20220426173211.64840-1-f.fainelli@gmail.com>
 <dc06a171-ed10-eedf-1654-12dd1dd164bb@mind.be>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <dc06a171-ed10-eedf-1654-12dd1dd164bb@mind.be>
Subject: Re: [Buildroot] [PATCH v2 0/2] External GCC12 toolchain support
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
Cc: opendmb@gmail.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 mmayer@broadcom.com, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiA0LzI3LzIwMjIgMTI6MDAgUE0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IAo+
IAo+IE9uIDI2LzA0LzIwMjIgMTk6MzIsIEZsb3JpYW4gRmFpbmVsbGkgd3JvdGU6Cj4+IFRoaXMg
cGF0Y2ggc2VyaWVzIGFsbG93cyB1cyB0byB1c2UgTGluYXJvJ3MgR0NDMTIgc25hcHNob3QgdGhh
dCBjYW4gYmUKPj4gZG93bmxvYWRlZCBmcm9tIGhlcmU6Cj4+Cj4+IGh0dHBzOi8vc25hcHNob3Rz
LmxpbmFyby5vcmcvZ251LXRvb2xjaGFpbi8xMi4wLTIwMjEuMTAtMS9hYXJjaDY0LWxpbnV4LWdu
dS8gCj4+Cj4+Cj4+IENoYW5nZXMgaW4gdjI6Cj4+Cj4+IC0gcmViYXNlZCBhZ2FpbnN0IG1hc3Rl
cgo+Pgo+PiBGbG9yaWFuIEZhaW5lbGxpICgyKToKPj4gwqDCoCB0b29sY2hhaW4vQ29uZmlnLmlu
OiBhZGQgQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfMTIgYmxpbmQgb3B0aW9uCj4+IMKgwqAg
dG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC90b29sY2hhaW4tZXh0ZXJuYWwtY3VzdG9tOiBh
ZGQgZ2NjIDEyCj4+IMKgwqDCoMKgIHZlcnNpb24gc2VsZWN0aW9uCj4gCj4gIMKgU2VyaWVzIGFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCj4gCj4gIMKgSSB3YXMgdGhpbmtpbmcgdGhhdCBpdCB3
b3VsZCBiZSB1c2VmdWwgdG8gYWRkIGFuIG9wdGlvbiAKPiBCUjJfVE9PTENIQUlOX0dDQ19ORVdF
UiBhbmQgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9HQ0NfMTJfUExVUyB0aGF0IAo+IHNlbGVjdHMg
aXQuIFRoYXQgd2F5LCB5b3UgY2FuIHVzZSBuZXdlciBHQ0Mgd2l0aG91dCBjaGFuZ2luZyBCdWls
ZHJvb3QuIAo+IFNhbWUgZm9yIGxpbnV4LWhlYWRlcnMuCj4gCj4gIMKgTm90ZSB0aGF0IHRoZSBi
bGluZCBvcHRpb24gY2FuIHNpbXBseSBiZSBfTkVXRVIsIGJ1dCB0aGUgdXNlci12aXNpYmxlIAo+
IG9wdGlvbiBoYXMgdG8gaGF2ZSB0aGUgdmVyc2lvbiBleHBsaWNpdCBpbiBpdCwgc28gbGVnYWN5
IGhhbmRsaW5nIGNhbiAKPiBmb3JjZSB0aGUgdXNlciB0byB1c2UgdGhlIGNvcnJlY3QgdmVyc2lv
biB3aGVuIEJ1aWxkcm9vdCBpcyB1cGRhdGVkLgoKWWVzLCB0aGF0IG1ha2VzIHNlbnNlIHRvIG1l
LCBJIHdpbGwgc3VibWl0IGEgcGF0Y2ggc2VyaWVzIHVubGVzcyB5b3UgCmhhdmUgc3RhcnRlZCBz
b21ldGhpbmcgYWxyZWFkeS4KLS0gCkZsb3JpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
