Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075DE606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 06:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y5g5rmnU
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB72780D8D;
	Wed,  4 Nov 2026 06:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EW4HtzXShXGv; Wed,  4 Nov 2026 06:35:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BCDA580D6F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793774105;
	b=TTjwpV4BvWGxAB1koEhO+K0R08MirQf+223ONbwucc3foJ7zStFYgLf8Eg/iNUOtzgPU
	 j1PEEwi31bDf0dCDQycS3ZZZSyEWiJyG+CrLpKtBiuexbxRsZuZx6Fv41chpm3SfhPjkM
	 8vTkaDTLEwb7MvSm6M5VBloJoUxR2EAegTZGKc+d8OwIFp2VDlY43tbfY6OGegF8cWhbq
	 kiBN1QzRpT/RCMSh3LX/oL3PwESsbnHJTvZruxMZbOd/QYBE7SUKiAyfkz8bbbPVAnoZa
	 IpLXnlZ7MOqVq6n9sm2MJxnvC99joBpdA2Awldy0RX3yvDM2zRuX+aTuyi5SxMKAshg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793774105;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gBF/xqnmbygBNsfAou6DDVJ03yHsWWljv8K8sWKpPIM=;
	b=nokVmbeJulYsXmp3P04BE4irKUzSjTXmb45jIqfFHn9hwyDF3r6iGiOXHVKT4S5+Plvd
	 dahWld+AZCDd7DxEDJE3pYmtjIowsRLaExP6KQupxmQYMFgionFgR1M9lCN1T0QB9H1QL
	 oDSZl9mDBPF8sNSBG/Xp3Nubt2lrQ+5RUQOi00fBpxlpy4pq+wdioole/w+u4zaoj8Xa9
	 zP+2tlXY797R+URactLI8Agtfm51x2ZNhaAVvxxQbsA0TrYs6y6dDCuh1f7Vbr+UbPMCF
	 Qg1qC2kXLiF5thR7odNzSqtCMCpg6WHzPRTKdoXKsK9xpJWf0GudVvKNyVdA+YNZjqw==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793774105;
	bh=gBF/xqnmbygBNsfAou6DDVJ03yHsWWljv8K8sWKpPIM=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y5g5rmnUaq+YxxKo9hyujoE1EStz+evXJOirHP+dFOueqPPYvwetntbi7ex+Cxu14
	 H4sODeo5p8VbwbschLzS/gCw0rBvNascQ7NoLPA23yVAp16zHnxneWQuTC18xtvCAg
	 wVIzVtRNeVjjADy13LDyf+NsIXxe7su1MtklP/OHV1l5mtM9F5YGRf3coqH2g0GHOc
	 SYV2JiEE7uPq0rPGHqRlTpsyDsnRakxblEFM96yVuX860i0kdku56EW0Rflq+gpzBD
	 w3Q2jovDsLBCUeuzRVKiTDH1M1pi4drtEbyWZdFZg7eKp3FgSh5nydvYdtUgRBOKKh
	 rmnNF6zJMGmEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCDA580D6F;
	Wed,  4 Nov 2026 06:35:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B31B932
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 06:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38A0460686
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 06:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTo-yZpO0ex6 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 06:35:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CB7456067A
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1793774103;
 b=odyC1BVe2HPksmt1M5CyKHwL005nu7s9ofnpUOW4Ggu8Y+7G6SMYYkSMwJcWfvo3dO71
 u4V075TbVx8Rgh63PaSomKVFGwuKQycyOuljc4cOnuper+D5VFInCfjGL+zmdl+89wGq8
 yLql3O0OGtJAodHXyiB3axgMjaQvtS1q28M0Aomx2K3mWY+dSlajvssFF2HdDhA2ilNv7
 phWrj1Ywa9ffgbw/MzdAxjR/iHggm2+bE2jkO7KSBzWe40JhaOvHTjGn1m5tJBcQn4z1N
 uJUElLBHCvhxzGjY5LfabABULsgzQh32ifjkRnxSmpJ/9HCr98h4uP0HeVVodraqdOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793774103;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=XDpc+MmgqmBsLzM1tnZm/v1DrzDohV/U5jKzPs1/CDQ=;
 b=pCAeuHcgAHYjwB5g/PziA8jEgGnmHVTyfosvCNA3ClKUkFiWlODGC2NIu4/ihMcOIWIc
 aLDa1cMEMpdvzbnmHFAYBErL/iGgktm5rNl8nbdC/zT2BUbrgA/lUKPpYcI2M9FLYy9pN
 OZc3ZY4pkt3GQkpOhKBMUjdjbiU4XyUagI+dC3sFgs5BTaV7Cai8WWhS/43YWUeNrSvbF
 OUnmKI3xe5J5y5E0VAfujeGo4Mt0e22ek038mr8Ii4Hw1KoCvN82+ZgKt4X8bYQIVitN5
 LSY+3IfHV0F/vONL/IVDa7+be2y4hsxmwoLoOXKn74ebFpWyhjQE//2woftGhEas43A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=ILoGsAjh; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:20::531"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB7456067A
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 06:35:02 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6afafc89b48so425171a12.2
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 22:35:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793774100; cv=none;
 d=google.com; s=arc-20260327;
 b=R1cnwivhKlAuTayCLseWZJdlSVUshCtfTspEdlpXsRnmr9RzuzYRDtofvk2PQJvoKa
 /t51fj/7Y/TmZhoXYlXgQ3i9ewsUM4pAMRyPgGEBQ/jwHIQkD299/vkm9rS+TELdVbea
 f4ErBMsVK5bTVd14m3i0U5XwgRKkb9NJZsEQ5UMkmA4bxy7DgP/pGF9R5F5C1K3d/gXE
 Buw2fzcygVF12eiVhNyXW4JI+dSdxXcogzruplnxmXR3ohkfROmcESAkg5fO74jj25nQ
 lRsa6LxnrIGWxTKamym8fl4MUJQkXrAznQd6U1ruxUhvauG7fLpkDm92S14F/BtvLDDQ
 RO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=XDpc+MmgqmBsLzM1tnZm/v1DrzDohV/U5jKzPs1/CDQ=;
 fh=wbwJD5pmUeT2rqwnHMgjcx+9Rig+UXZc1KeGPyIunDM=;
 b=hxBESabRHlSR3yfRCIbqyc0GzsGy717aHDsCGCjSJp/FK2AZziO2Sz7XPm2SqJVmfo
 0zt2NPdjsWSx9hB8PIegDSH2vW98nUer76TwS5ZcVnlrksoWVpYjY38wjsd8o6bWcJOy
 hlQweRTdVfvD2MC+6tkTNeXksS59F0ij5rdMABHEK0ZmYe0SNEm8liWV8DLA2yuKhZH+
 QTKq/5zHp7uG6MNX/ImnMI9DUWAKks0oCrZKBt9KSAnvhN+fOiDBvJcienvnyRHGYdFA
 y+jaW0Ye6/zfwi2WH48nKSxIOKUnXhSUF+mU9WCkA39JzKGMfYXA7z7HyO5/6TBAja+R
 HGwQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793774100; x=1794378900;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XDpc+MmgqmBsLzM1tnZm/v1DrzDohV/U5jKzPs1/CDQ=;
 b=UzoJJkcUJA9qTyTxc/yGqlNOFp/gzHCNL/b0CuiSBptDryeoNZLyI2Mbp7gJIR0leY
 EzBBHQXywmB1jXARcirgMwPX/Iesj41VETdYkYCte4qIWwLUkQJK0TlrBWg3w/xFlB2Z
 ZMjcDqIl+eCDUHj/RZ5+g05wlNWXzUrcmaH9AI0aNc/ElrKzV5q5NonyvWK1OivTfAvu
 mFqQaL63XLbLMmrjgWhlDT42cJdWTYZxjLZX12N+8NQR5qWA7Om8ps65KT6zENIYe+IC
 X5t15dKMyrUqCVWNsEVnoYU1JPksBBLPiuBLbBvQdYPetH4jQRVYG5DRISI+jIV9vCv8
 3Ogg==
X-Gm-Message-State: APuU4Z9bqiOmhqpPRER5FVcRJEFUwDSh8JpfsvxCtj8lDC9pmkpgihh3
 hwCsI6B2ynm+vNpmqnlKGPWNkMlBI1qXzNYiiv6752hBOPaiKbac4zvFpZ9gHt6gDbt0QFR65ht
 hUrc8AMHGNbFFIerxs4zOM4FHvuqCykc5Yg==
X-Gm-Gg: AYBFou0aJZgOXw7neNda/r4EBLmQwRw44Lw4E+oeQvWdyGPb0BhBIzg+7zxpNgkCHU5
 mv45lb6ucvQtG47m2u64MO/DJA9hw1iDgnN/5eMYDeaUYfC5VmEhlN0TITezNKGLepqwWvd2J1+
 grZT6nchVN58E0hUvRSoBTFssGJyUBOMeMAG7aX8mB5NnETEBCRgD2hsSqC+Uziv0ub8rFzmkEA
 eKvNES4nWg1Gt7L9t7PgvXcbtDw2/BZpKVGT5Ey67CBYKbCpOz+uzKfs5FAOJiGw86o4K5RUWU9
 arR5wcZ7Z3tdDPvtEJPskkkIsa8Ze9KJhVxUcWI4OkWJlF95KzvRXxYIGu0Fbe+Eq+IMro01gmB
 4VQPbz/AeIFjbWe7seWyXywu5qW6x4ZUYkUUtpw==
X-Received: by 2002:a05:6402:d0d:b0:6b4:1d53:5185 with SMTP id
 4fb4d7f45d1cf-6b4d467ca70mr10804937a12.16.1793774100183; Tue, 03 Nov 2026
 22:35:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103224946.2883070-1-yegorslists@googlemail.com>
In-Reply-To: <20261103224946.2883070-1-yegorslists@googlemail.com>
Date: Wed, 4 Nov 2026 07:35:26 +0100
X-Gm-Features: AclHuK9Kckr5WfuuBxsKmJaF8-j0w-7jQFb2WcrpJm_IaEwpCF9DYJnF1iB0Piw
Message-ID: <CAGm1_kubshPJLV6SE3YKY7yS=g_C8w2KF=w2_ZPewWGSdt2qBg@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [Buildroot] [PATCH] package/fio: fix build with libnfs and
 without gnutls
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQWxsLAoKT24gVHVlLCBOb3YgMywgMjAyNiBhdCAxMTo0OeKAr1BNIFllZ29yIFllZnJlbW92
Cjx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBTaW5jZSB2ZXJzaW9uIDMu
NDIsIGZpbydzIGNvbmZpZ3VyZSBzY3JpcHQgcmVxdWlyZXMgZ251dGxzIGFzIHNvb24gYXMKPiBs
aWJuZnMgPj0gNi4wLjAgaXMgZm91bmQsIGFuZCBmYWlscyBvdGhlcndpc2U6Cj4KPiAgIEVSUk9S
OiBVc2VyIHJlcXVlc3RlZCBmZWF0dXJlIGdudXRscwo+ICAgRVJST1I6IFRoYXQgZmVhdHVyZSBu
ZWVkcyBnbnV0bHMgKHJlcXVpcmVkIGZvciBsaWJuZnMgPj0gNi4wLjApIGluc3RhbGxlZAo+ICAg
RVJST1I6IGNvbmZpZ3VyZSB3YXMgbm90IGFibGUgdG8gZmluZCBpdAo+Cj4gSG93ZXZlciwgZ251
dGxzIGlzIGFuIG9wdGlvbmFsIGRlcGVuZGVuY3kgb2YgbGlibmZzLCBvbmx5IG5lZWRlZCB3aGVu
Cj4gbGlibmZzIGlzIGJ1aWx0IHdpdGggVExTIHN1cHBvcnQsIGFuZCBsaWJuZnMgNy4wLjEgYWxy
ZWFkeSBsaXN0cyBpdCBpbgo+IHRoZSBMaWJzIG9mIGl0cyBwa2ctY29uZmlnIGZpbGUgaW4gdGhh
dCBjYXNlLiBXaXRob3V0IEJSMl9QQUNLQUdFX0dOVVRMUywKPiBsaWJuZnMgZG9lcyBub3QgdXNl
IGdudXRscyBhdCBhbGwuCj4KPiBBZGQgYSBwYXRjaCwgc3VibWl0dGVkIHVwc3RyZWFtLCB0aGF0
IGtlZXBzIGxpbmtpbmcgd2l0aCBnbnV0bHMgd2hlbgo+IGl0IGlzIGF2YWlsYWJsZSwgYnV0IG5v
IGxvbmdlciBmYWlscyB3aXRob3V0IGl0Lgo+Cj4gVGhpcyBpc3N1ZSBoYXMgYmVlbiBwcmVzZW50
IHNpbmNlIGNvbW1pdCAyMTUxMzNjMGZjMjggKCJwYWNrYWdlL2ZpbzoKPiBidW1wIHZlcnNpb24g
dG8gMy40MSIpLCBhcyBmaW8gMy40MSBzdGFydGVkIHBhc3NpbmcgZ251dGxzIHRvCj4gcGtnLWNv
bmZpZyB0b2dldGhlciB3aXRoIGxpYm5mczogd2l0aG91dCBnbnV0bHMsIGl0IGdvdCBubyBsaWJu
ZnMKPiBmbGFncyBhdCBhbGwgYW5kIGZhaWxlZCB0byBsaW5rIHdpdGggdW5kZWZpbmVkIHJlZmVy
ZW5jZXMgdG8gdGhlIG5mc18qCj4gZnVuY3Rpb25zLiBmaW8gMy40MiwgZnJvbSBjb21taXQgNzIy
YzJmMzBhYzRlICgicGFja2FnZS9maW86IGJ1bXAKPiB2ZXJzaW9uIHRvIDMuNDIiKSwgdHVybmVk
IHRoaXMgaW50byB0aGUgY29uZmlndXJlIGVycm9yIGFib3ZlLiBJdAo+IHRoZXJlZm9yZSBhZmZl
Y3RzIDIwMjUuMTEgYW5kIGxhdGVyOiAyMDI2LjA4LnggaGFzIGZpbyAzLjQyIGFuZCB0aGUKPiBj
b25maWd1cmUgZXJyb3IsIHdoaWxlIDIwMjUuMTEueCwgMjAyNi4wMi54IGFuZCAyMDI2LjA1Lngg
aGF2ZSBmaW8KPiAzLjQxIGFuZCB0aGUgbGluayBmYWlsdXJlLgo+Cj4gRml4ZXM6Cj4gaHR0cHM6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2RjYWI1MDc5Zjk2MDQzNGE4ZjU0ZmY5
OTFhYTg3OWE2ZGQwZTRiM2MKPgo+IEZpeGVzOiAyMTUxMzNjMGZjMjgxOWYwNTlmYmIzNTA3MWFi
MmUwOTg3ZjUxMDdkICgicGFja2FnZS9maW86IGJ1bXAgdmVyc2lvbiB0byAzLjQxIikKPiBBc3Np
c3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTUtNQo+IFNpZ25lZC1vZmYtYnk6IFllZ29yIFll
ZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiAtLS0KPiAgLi4uZ3VyZS1kb24t
dC1yZXF1aXJlLWdudXRscy1mb3ItbGlibmZzLnBhdGNoIHwgNTUgKysrKysrKysrKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9maW8vMDAwMi1jb25maWd1cmUtZG9uLXQtcmVxdWlyZS1nbnV0bHMtZm9yLWxp
Ym5mcy5wYXRjaAo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmlvLzAwMDItY29uZmlndXJlLWRv
bi10LXJlcXVpcmUtZ251dGxzLWZvci1saWJuZnMucGF0Y2ggYi9wYWNrYWdlL2Zpby8wMDAyLWNv
bmZpZ3VyZS1kb24tdC1yZXF1aXJlLWdudXRscy1mb3ItbGlibmZzLnBhdGNoCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4yYmQ3YjU5NTFiCj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL3BhY2thZ2UvZmlvLzAwMDItY29uZmlndXJlLWRvbi10LXJlcXVpcmUtZ251dGxz
LWZvci1saWJuZnMucGF0Y2gKPiBAQCAtMCwwICsxLDU1IEBACj4gK0Zyb20gZGRhZGUwMzNlYzhl
NTM3NmQ2MzI3NTE5NDgzNmMyZDBmZTUzNTMyMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAr
RnJvbTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgo+ICtEYXRl
OiBUdWUsIDMgTm92IDIwMjYgMjM6MzQ6MzkgKzAxMDAKPiArU3ViamVjdDogW1BBVENIXSBjb25m
aWd1cmU6IGRvbid0IHJlcXVpcmUgZ251dGxzIGZvciBsaWJuZnMKPiArCj4gK2dudXRscyBpcyBh
biBvcHRpb25hbCBkZXBlbmRlbmN5IG9mIGxpYm5mcyA+PSA2LjAuMCwgb25seSBuZWVkZWQgd2hl
bgo+ICtsaWJuZnMgaXMgYnVpbHQgd2l0aCBUTFMgc3VwcG9ydC4gU2luY2UgY29tbWl0IGNlYWRk
OTI1ICgiY29uZmlndXJlOgo+ICtjb25kaXRpb25hbGx5IGFkZCBnbnV0bHMgZm9yIGxpYm5mcyA+
PSA2LjAuMCIpLCBjb25maWd1cmUgZmFpbHMgd2hlbgo+ICtsaWJuZnMgaXMgZm91bmQgYnV0IGdu
dXRscyBpcyBub3QsIGFsdGhvdWdoIHN1Y2ggYSBsaWJuZnMgZG9lcyBub3QgdXNlCj4gK2dudXRs
cyBhdCBhbGw6Cj4gKwo+ICsgIEVSUk9SOiBVc2VyIHJlcXVlc3RlZCBmZWF0dXJlIGdudXRscwo+
ICsgIEVSUk9SOiBUaGF0IGZlYXR1cmUgbmVlZHMgZ251dGxzIChyZXF1aXJlZCBmb3IgbGlibmZz
ID49IDYuMC4wKSBpbnN0YWxsZWQKPiArICBFUlJPUjogY29uZmlndXJlIHdhcyBub3QgYWJsZSB0
byBmaW5kIGl0Cj4gKwo+ICtSZWNlbnQgbGlibmZzIHZlcnNpb25zIGFscmVhZHkgbGlzdCBnbnV0
bHMgaW4gdGhlIExpYnMgb2YgdGhlaXIKPiArcGtnLWNvbmZpZyBmaWxlIHdoZW4gYnVpbHQgd2l0
aCBUTFMgc3VwcG9ydC4gS2VlcCBhZGRpbmcgZ251dGxzIHdoZW4KPiAraXQgaXMgYXZhaWxhYmxl
LCBmb3IgbGlibmZzIHZlcnNpb25zIHRoYXQgZG8gbm90LCBidXQgZG9uJ3QgZmFpbCBvcgo+ICtk
aXNhYmxlIHRoZSBORlMgZW5naW5lIHdpdGhvdXQgaXQuCj4gKwo+ICtBc3Npc3RlZC1ieTogQ2xh
dWRlOmNsYXVkZS1vcHVzLTUtNQo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2F4Ym9l
L2Zpby9wdWxsLzIxNzMKClRoZSBmaW8gbWFpbnRhaW5lciBnYXZlIGEgZmVlZGJhY2suIEknbGwg
c2VuZCB2MiB3aGVuIHRoZSByZXdvcmsgaXMgdGhyb3VnaC4KClllZ29yCgo+ICtTaWduZWQtb2Zm
LWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gKy0tLQo+
ICsgY29uZmlndXJlIHwgNyArKystLS0tCj4gKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZSBiL2NvbmZp
Z3VyZQo+ICtpbmRleCA2NjRjZTI5OS4uMWEwOWZhNDYgMTAwNzU1Cj4gKy0tLSBhL2NvbmZpZ3Vy
ZQo+ICsrKysgYi9jb25maWd1cmUKPiArQEAgLTIzOTYsNyArMjM5Niw5IEBAIGlmIHRlc3QgIiRs
aWJuZnMiICE9ICJubyIgOyB0aGVuCj4gKyAgICAgbGlibmZzX2NmbGFncz0kKHBrZy1jb25maWcg
LS1jZmxhZ3MgbGlibmZzKQo+ICsgICAgIGxpYm5mc19saWJzPSQocGtnLWNvbmZpZyAtLWxpYnMg
bGlibmZzKQo+ICsKPiArLSAgICAjIGxpYm5mcyA+PSA2LjAuMCByZXF1aXJlcyBnbnV0bHMgZm9y
IFRMUyBzdXBwb3J0Cj4gKysgICAgIyBsaWJuZnMgPj0gNi4wLjAgbWF5IGJlIGJ1aWx0IHdpdGgg
VExTIHN1cHBvcnQgdXNpbmcgZ251dGxzLAo+ICsrICAgICMgYnV0IGdudXRscyBpcyBvcHRpb25h
bCwgYW5kIHNvbWUgbGlibmZzIHZlcnNpb25zIGRvIG5vdCBsaXN0IGl0IGluCj4gKysgICAgIyB0
aGVpciBwa2ctY29uZmlnIGZpbGUuIExpbmsgd2l0aCBnbnV0bHMgaWYgaXQgaXMgYXZhaWxhYmxl
Lgo+ICsgICAgIGxpYm5mc192ZXJzaW9uPSQocGtnLWNvbmZpZyAtLW1vZHZlcnNpb24gbGlibmZz
IDI+L2Rldi9udWxsKQo+ICsgICAgIGlmIHRlc3QgLW4gIiRsaWJuZnNfdmVyc2lvbiIgOyB0aGVu
Cj4gKyAgICAgICBsaWJuZnNfbWFqb3I9JChlY2hvICRsaWJuZnNfdmVyc2lvbiB8IGN1dCAtZC4g
LWYxKQo+ICtAQCAtMjQwNCw5ICsyNDA2LDYgQEAgaWYgdGVzdCAiJGxpYm5mcyIgIT0gIm5vIiA7
IHRoZW4KPiArICAgICAgICAgaWYgJChwa2ctY29uZmlnIGdudXRscyA+IC9kZXYvbnVsbCAyPiYx
KTsgdGhlbgo+ICsgICAgICAgICAgIGxpYm5mc19jZmxhZ3M9IiRsaWJuZnNfY2ZsYWdzICQocGtn
LWNvbmZpZyAtLWNmbGFncyBnbnV0bHMpIgo+ICsgICAgICAgICAgIGxpYm5mc19saWJzPSIkbGli
bmZzX2xpYnMgJChwa2ctY29uZmlnIC0tbGlicyBnbnV0bHMpIgo+ICstICAgICAgICBlbHNlCj4g
Ky0gICAgICAgICAgZmVhdHVyZV9ub3RfZm91bmQgImdudXRscyIgImdudXRscyAocmVxdWlyZWQg
Zm9yIGxpYm5mcyA+PSA2LjAuMCkiCj4gKy0gICAgICAgICAgbGlibmZzPSJubyIKPiArICAgICAg
ICAgZmkKPiArICAgICAgIGZpCj4gKyAgICAgZmkKPiArLS0KPiArMi4zNC4xCj4gKwo+IC0tCj4g
Mi4zNC4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
