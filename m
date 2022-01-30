Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA90C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 16:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED0F883F22;
	Sun, 30 Jan 2022 16:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mdf8op1m6zfa; Sun, 30 Jan 2022 16:36:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FE1383F26;
	Sun, 30 Jan 2022 16:36:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4B201BF59C
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 16:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88886408A8
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 16:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wMkEIv5M0Yie for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 16:36:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4561540606
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 16:36:43 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 d138-20020a1c1d90000000b0034e043aaac7so9442214wmd.5
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 08:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z2y7EiI7M0iq8RHx5Ufuu60jvhTl2EkIIhOE0UTYKw0=;
 b=fXbip4XLz6ONK3B6U1kRkZTOHK2dFguTbz32lN0zxLIOXUN9SWui3aMOhmPuMRqbSZ
 qYkZYe6+CWTVEoRUxBvR0WqZPQf9wlkqBltl+dhU9JGx6qaChtx3Ijp2xWiW8gdOuldC
 14BQJylg/MuJ98czA8YRHtpW/dakMVAclFmQH7IDipbD5AF4aZx3pL3dBtrwSCHlPhf6
 JEUMGLk8AJJqLkUb/UMhD3F3E6etPIPcb0qSDOSBtN7AHEcDcQhoJUQs2ZF0N9DQarqi
 JobYgyf6Oy+vB40O8Co/Qai7LqSs4OuSPBAqTDYW2agl7doBSDZuWLvfz7vPPLIOHCCw
 opYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z2y7EiI7M0iq8RHx5Ufuu60jvhTl2EkIIhOE0UTYKw0=;
 b=nnUnrDX1GlMPiFi9BOIIKGwcRepGmOKS58EeoE2HKisZcTkh4rKYyuwJnDv412kST0
 PbDuf1oyWXWGt6+DVgSchNV4dMgm/TWJBVvKbY1V83mMssxIf/58M+LGU+XC4ZHQsyM4
 ZOa5/ndsi5LrW2HsGAAgpsl7YPQXteJCcRAKg3L2lPswUKZkPhZV+N7JWdCgg7HLR+dG
 b3g8dQ+Dw96uYgZcNr/v4IsbrOEqI5tveJHXCUq43w9E8q/jcOXkqu3WGFZk6aVXizHt
 hYo2OveqVBuXmb2dIazWhD3x70PMjl/45pph1yCbe1G+E8I/MdTpuH6rZblQjTyvugF9
 iv4Q==
X-Gm-Message-State: AOAM532WcdAfFfc8cNKKuMIM41ENEgZB5XwW/i+uqcdORUUhZgiQtAqE
 xuWRUg4KCOblPptvcLjY30E=
X-Google-Smtp-Source: ABdhPJwBsamKxjI5ulKv+RxDc1K8jf+oGfCxoFjNudEyRydUzuyyWJlQXcF0pQSu96+5eMuj3foHlQ==
X-Received: by 2002:a05:600c:308:: with SMTP id
 q8mr15388022wmd.118.1643560601393; 
 Sun, 30 Jan 2022 08:36:41 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id c10sm9427141wrq.11.2022.01.30.08.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 08:36:40 -0800 (PST)
Message-ID: <114f25cd-b392-fbde-ce20-eef87447f1c0@gmail.com>
Date: Sun, 30 Jan 2022 17:36:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Joachim Wiberg <troglobit@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101225906.2341845-1-fontaine.fabrice@gmail.com>
 <87bl0t1a9o.fsf@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <87bl0t1a9o.fsf@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: bump to version 4.0.11
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
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwgSm9hY2hpbSwgQWxsLAoKTGUgMDMvMDEvMjAyMiDDoCAwOTo0MSwgSm9h
Y2hpbSBXaWJlcmcgYSDDqWNyaXTCoDoKPiBPbiBTYXQsIEphbiAwMSwgMjAyMiBhdCAyMzo1OSwg
RmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+PiBU
aGUgTFhDIDQuMCBicmFuY2ggaXMgc3VwcG9ydGVkIHVudGlsIEp1bmUgMjAyNS4KPj4gT25seSBi
dWdmaXhlcyBhbmQgc2VjdXJpdGl5IGlzc3VlcyBnZXQgaW5jbHVkZWQgaW50byB0aGUgc3RhYmxl
IGJ1Z2ZpeAo+PiByZWxlYXNlcywgc28gaXQncyBhbHdheXMgc2FmZSBhbmQgcmVjb21tZW5kZWQg
dG8ga2VlcCB1cCBhbmQgcnVuIHRoZQo+PiBsYXRlc3QgYnVnZml4IHJlbGVhc2UuCgpXZWxsIGl0
IGFsc28gaW5jbHVkZXMgbmV3IGZlYXR1cmVzIHNpbmNlIHRoaXMgdmVyc2lvbiBidW1wIGJyZWFr
IGx4YyB3aXRoIGFsbAprZXJuZWwgPCA1LjYgZHVlIHRvIHRoZSBicm9rZW4gZmFsbCBiYWNrIHdo
ZW4gdGhlIG5ldyBtb3VudCBBUEkgaXMgbm90IHN1cHBvcnRlZC4KCldlIGhhdmUgYSB0ZXN0IGZv
ciBseGMgdXNpbmcgYSBrZXJuZWwgNC4xOSB0aGF0IHRyaWdnZXIgdGhpcyBpc3N1ZSBbMV0uCgpT
ZWUgbHhjLmxvZzoKCihrZXJuZWwgNS41KQpERUJVRyBjb25mIC0gY29uZi5jOmx4Y19zZXR1cF9k
ZXZwdHNfY2hpbGQ6MTY4MiAtIE5vIG5ldyBkZXZwdHMgaW5zdGFuY2Ugd2lsbCBiZQptb3VudGVk
IHNpbmNlIG5vIHB0cyBkZXZpY2VzIGFyZSByZXF1aXJlZApseGMtc3RhcnQgbHhjX2lwZXJmMyAg
REVCVUcgY29uZiAtIGNvbmYuYzpseGNfc2V0dXBfZGV2X2NvbnNvbGU6MTk2NiAtIENsZWFyZWQK
YWxsICgwKSBtb3VudHMgZnJvbSAiL2Rldi9jb25zb2xlIgpseGMtc3RhcnQgbHhjX2lwZXJmMyAg
RVJST1IgbW91bnRfdXRpbHMgLSBtb3VudF91dGlscy5jOm1vdW50X2F0OjY2MSAtIE5vIHN1Y2gK
ZmlsZSBvciBkaXJlY3RvcnkgLSBGYWlsZWQgdG8gbW91bnQgIi9wcm9jL3NlbGYvZmQvNDQiIHRv
ICIvcHJvYy9zZWxmL2ZkLzQzIgpseGMtc3RhcnQgbHhjX2lwZXJmMyAgRVJST1IgY29uZiAtIGNv
bmYuYzpseGNfc2V0dXBfZGV2X2NvbnNvbGU6MTk4OCAtIE5vIHN1Y2gKZmlsZSBvciBkaXJlY3Rv
cnkgLSBGYWlsZWQgdG8gbW91bnQgIjEwKC9kZXYvcHRzLzApIiBvbiAiNDMiCmx4Yy1zdGFydCBs
eGNfaXBlcmYzICBFUlJPUiBjb25mIC0gY29uZi5jOmx4Y19zZXR1cF9jb25zb2xlOjIxNDMgLSBO
byBzdWNoIGZpbGUKb3IgZGlyZWN0b3J5IC0gRmFpbGVkIHRvIHNldHVwIGNvbnNvbGUKCihrZXJu
ZWwgNS42KQpseGMtc3RhcnQgbHhjX2lwZXJmMyAgVFJBQ0UgbW91bnRfdXRpbHMgLSBtb3VudF91
dGlscy5jOmNhbl91c2VfbW91bnRfYXBpOjU4MiAtCktlcm5lbCBzdXBwb3J0cyBtb3VudCBhcGkK
bHhjLXN0YXJ0IGx4Y19pcGVyZjMgIFRSQUNFIG1vdW50X3V0aWxzIC0gbW91bnRfdXRpbHMuYzpt
b3ZlX2RldGFjaGVkX21vdW50OjMyOAotIEF0dGFjaCBkZXRhY2hlZCBtb3VudCA0NSB0byBmaWxl
c3lzdGVtIGF0IDQzCmx4Yy1zdGFydCBseGNfaXBlcmYzICBUUkFDRSBjb25mIC0gY29uZi5jOmx4
Y19zZXR1cF9kZXZfY29uc29sZToxOTkwIC0gU2V0dXAKY29uc29sZSAiL2Rldi9wdHMvMCIKClsx
XSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzIwMDY3
OTg5OTgKClRoaXMgaXNzdWUgaXMgbm90IHlldCBmaXhlZCBpbiBseGMgc3RhYmxlLTQuMCBicmFu
Y2guCgpDYW4geW91IGhhdmUgYSBsb29rPwoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+Pgo+PiBo
dHRwczovL2Rpc2N1c3MubGludXhjb250YWluZXJzLm9yZy90L2x4Yy00LTAtMTEtaGFzLWJlZW4t
cmVsZWFzZWQvMTI0MjcKPj4KPj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9u
dGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEpvYWNoaW0gV2liZXJn
IDx0cm9nbG9iaXRAZ21haWwuY29tPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
