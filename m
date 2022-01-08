Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABC9C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90219813BB;
	Sat,  8 Jan 2022 15:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jQLJ5HSBPlEC; Sat,  8 Jan 2022 15:19:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07A2C813A1;
	Sat,  8 Jan 2022 15:19:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55A6E1BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4418640897
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2d0NZhxoGrw0 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:19:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62B1F40252
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:19:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h10so7029285wrb.1
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rUXCT9MvmDgP8UtsgYe8r2MeZ79K6sUs639jpslGHE0=;
 b=r/bEyIdHvg1/uDqr2RcxcL2M0akmZLdtUxi5OKWAhp0Lqe5GZmppweTGoNNHU1SjJo
 c3ILwPDY05fqJrlK4ItrUU2Uv28h4KA2aG6oGvr1qAqrO13O9xPJRyahVyG3dNo4mdsn
 anA2GKflk2Z6PtOjhei+VKwkSIL1z7PBJnm02tlIFjHmDGy3WGjqc5fdRd8kWBgvCfhE
 T2EuoOiR2c4cCkql9sNeu0USs7D8zxp/n4j3RaBSNCzgDCco+FgbAP06DS71oxH5BPuZ
 T7DxehPzHmVwwroROkoAdpzhOztgQvJPgF6MG9qRNm3hu0w/UsaEj9+EnFYihOeARWJz
 rDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rUXCT9MvmDgP8UtsgYe8r2MeZ79K6sUs639jpslGHE0=;
 b=l59KFm8+fKzkNeYrELNO2lyklmffkcRcc6j+ZB1WV3YH0v6IiSRG+L21w5h2+/gSx0
 YfgZOzUK6Lq4haYr9w669YXzeQrjHs78Vj3Roouf1rBGYaGsr/XgiSYCxw+61pYL4Zrj
 cGNQzqbxsHGCHo5EeaCx+RVcvzX5uysDCaVCuq9wYdO6T9sWVpTvnb7SnhOovZY7EQeM
 5oM1aA0fOpKeZsUVXjdJwbuN0ps648LH6WRKce0QdAGT1D0lhTLiqHKtdccLDCn+NJ3q
 OeIDFx79SobQ+nzUObAYI+VIdKz+1Rvw7ikiWv3FOLBo8pQV5zXmuwEmwJ+607l8ncnk
 y6wg==
X-Gm-Message-State: AOAM5322z3fRTvffMEuoYbm2/FDY+6cLgTf20QwjnQ25inJI0X8oqzwX
 C6K1oY3scuDXarcXVoAf/byJgQ==
X-Google-Smtp-Source: ABdhPJyafkF6uSU+xpz/oAaQZCsJB+UXFLOUfgiUXxmspxsV/sRawCjrKRXu8EpRnTjvAVISoOMHkg==
X-Received: by 2002:a05:6000:1842:: with SMTP id
 c2mr1941173wri.482.1641655185384; 
 Sat, 08 Jan 2022 07:19:45 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id i6sm2050746wrf.79.2022.01.08.07.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:19:45 -0800 (PST)
Message-ID: <67705a4b-cf84-ef2d-f073-4ea0a497902a@smile.fr>
Date: Sat, 8 Jan 2022 16:19:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Norbert Lange <nolange79@gmail.com>
References: <20201126144722.502163-1-nolange79@gmail.com>
 <c4ba627e-921f-396b-3ae4-685e7da39f5e@smile.fr>
 <195311e2-38dc-53ee-80b8-09dca52320a0@smile.fr>
 <CADYdroNFGP8qThLZ3FDxU8Bm8JN56nBvmsbcpnBLbF444OKi0A@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CADYdroNFGP8qThLZ3FDxU8Bm8JN56nBvmsbcpnBLbF444OKi0A@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/systemd: invoke
 systemd-tmpfilesd on final image
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
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>,
 =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDgvMDEvMjAyMiDDoCAxNTo0NCwgTm9yYmVydCBMYW5nZSBhIMOpY3JpdMKgOgo+IEFtIFNh
LiwgOC4gSmFuLiAyMDIyIHVtIDE0OjQyIFVociBzY2hyaWViIFJvbWFpbiBOYW91ciA8cm9tYWlu
Lm5hb3VyQHNtaWxlLmZyPjoKPj4KPj4gSGVsbG8gTm9yYmVydCwKPj4KPj4+PiArIwo+Pj4+ICsj
IFsxXSAtIGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvaXNzdWVzLzE2MTgzCj4+
Pgo+Pj4gSXQgc2VlbXMgdGhhdCBzeXN0ZW1kIG5vdyBpbmNsdWRlIHdoYXQgeW91IG5lZWQgc2lu
Y2UgdmVyc2lvbiAyNDkgY29udGFpbmluZyB0aGUKPj4+IGNvbW1pdCBbMV0uCj4+Pgo+Pj4gVGhl
IGZha2Vyb290X3RtcGZpbGVzLnNoIHNjcmlwdCBzZWVtcyBub3QgbmVjZWVzYXJ5IGFueW1vcmUu
Cj4gCj4gSXQgaXMsIHRoaXMgcGFydGljdWxhciBjaGFuZ2UgZGlkICpub3QqIGdldCB1cHN0cmVh
bWVkLCBzZWUgWzFdLgo+IFJ1bnRpbWUgc3BlY2lmaWVycyBtaWdodCBsZWFrCj4gdG8gcGxhY2Vz
IHRoZXkgc2hvdWxkIG5vdCwgdGhlIHNjcmlwdCBpcyBuZWNlc3NhcnkgdG8gZmlsdGVyIG91dCB0
aG9zZQo+IGRhbmdlcm91cyBzcGVjcy4KPiBTb21lIGRpc2N1c3Npb24gd2FzIGF0IFsyXS4KCk9r
LCBjYW4geW91IHJlc3BpbiB0aGlzIHBhdGNoIHdpdGggYXQgbGVhc3QgYW4gdXBkYXRlZCBjb21t
ZW50IGluIHRoZSBzY3JpcHQuCldlIGFyZSBub3cgdXNpbmcgc3lzdGVtZCAyNTAuMSBhbmQgdGhl
IGlzc3VlIGluIHRoZSBjb21tZW50IGhhcyBiZWVuIGNsb3NlZCBieQp1cHN0cmVhbS4KCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiAKPj4+Cj4+PiBbMV0KPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9z
eXN0ZW1kL3N5c3RlbWQvY29tbWl0L2RlNjFhMDRiMTg4ZjgxYTg1Y2RiNWM2NGRkYjQ5ODdkY2Q5
ZDMwZDMKPj4KPj4gSSBoYXZlIG1hcmtlZCB0aGlzIHBhdGNoIGFzICJDaGFuZ2VzIFJlcXVlc3Rl
ZCIuCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gUm9tYWluCj4+Cj4+Pgo+Pj4gQmVzdCByZWdhcmRz
LAo+Pj4gUm9tYWluCj4+Pgo+Pj4KPiAKPiBOb3JiZXJ0Cj4gCj4gWzFdIC0gaHR0cHM6Ly9naXRo
dWIuY29tL3N5c3RlbWQvc3lzdGVtZC9wdWxsLzE2MTg3Cj4gWzJdIC0gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMC1KdW5lLzU4NzQxNC5odG1sCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
