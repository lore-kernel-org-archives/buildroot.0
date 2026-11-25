Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF46B606A326
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 06:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fltB0Vli;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v1XijTlh
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A16CF80CEE;
	Wed, 25 Nov 2026 06:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqdLuq_LrJjs; Wed, 25 Nov 2026 06:00:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7A85C80D35
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795586429;
	b=KOxuMz57Tk7ia6gIp4lLf4/Bw4ggQ77SUwwGmgSr3ZJG5KyZJZKPykCUeZVOVrxaF4jl
	 bmX7i/ZUzPnWpPFKn3sX5HWGD4r47nK9oCgOTrYRO87e1glwoI83CIdwaeXxxXrXnWQN1
	 GxONIR0mCE3VXyWBuWXqp8Owxl5ECq1fcRvWmTgzU0s3UImmxVtfbRFyA9tk4bsPjEArL
	 DLe1st5h80fqrnJpNyCkiVFMRgA86Kv9QABrjkY8qbIz8TSI+qscHfzwt1KGfrgbdWKdB
	 mMgK6RPGKPUbwINUpxHUzjqNS+a6mPbMON76FnbtOwoJUIWHFDltU5G+GkOvxzcwlVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795586429;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:From:To:Cc:Date:In-Reply-To:References:
	 User-Agent:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=b8zlwj2hqhdVgEzJpFJF+ipYw3MqhOYT7342UL+qa+s=;
	b=WsOruCmLT46TxhILGvli52Pt3xuD+ItAR3itysyoa2mBes8QYNHEknm8zgWkmDQ+1tJc
	 AE6naf501eS4nDGVI0v+JMUa+s+oUYjuCdBqahQV5RXYopzxQdQQvYlmtAEQ6Jq8bShL6
	 ET1DeEB1df1vl6p6w81IOgqNzmxta07r7rCv8C37WwH7PDhExHkwcShokJ1YNLcWvp5/E
	 k7pcSVB5HTXCG7CepnUq7KB1HeVXChYB9lqe9gg+fBhQ9pCMoXMyfL+P75aGRTRqos9p1
	 4MC9ODU9ZJLL8oZ2XcVU272uN7dYupH1fD5wMm0CXSymquVtGZ3t2kfwlmGBul7XocA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795586429;
	bh=b8zlwj2hqhdVgEzJpFJF+ipYw3MqhOYT7342UL+qa+s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fltB0VliVAgh9/MZUQxQE8g9AWQ1a4gLTrOF9gtpjJK+G4Jq4upxtYMY1I/U7n1Rq
	 5H3mO0UpZyMF5hw9SZsIj39kxnc/uW+01ZAHfoqzgp51Y0WLUHmJ7hsFEv7bgXT0R3
	 J7FpIZpYwjPliXWJw0Fw6Fu2NhxTzkmpWp7GwP3AoTS+bwFDjUcVg6NmGECS8WX3YO
	 C8jcl3rH9+AgH2Ni11x3JVwlkGz7hoh51qI09YfU/BwEST2iSeKkjuX7CmlpEUnb6c
	 c8sarnVUesCpR5BHQydHPKNUnjQTkrE4WJQR4DqMgdxYCz0SAAIF/ImXHjxM9DwwTQ
	 5YNrf3ZKNELkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A85C80D35;
	Wed, 25 Nov 2026 06:00:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F1612F5
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 06:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 909E540568
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 06:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSP9-Al_lI95 for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 06:00:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A514140557
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=v1XijTlh
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A514140557
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 06:00:26 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso52257375e9.1
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 22:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795586424; x=1796191224; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=xfBUfYk8SiG4ti9BWH8WIhXlMs8M88slx+Db8tyQGR4=;
 b=v1XijTlhdc7+ih3Wys+sDUytBtvECeoegSPjFivWp7Rp3k58qcNF1uVCZhJsyuVqUd
 3yvvDKMVZ16LYK26uJLuHLwxiZLcnUpbahx2gOMQIdM6Pv3e5fzvGfiFwvP3kVPBLTFJ
 lQt/+euzgsqmNmTPA8COorohlFSF+N/7h3cui8V0Gz/Oxi/oOyTMmxxkNwcbqI440Tee
 ZDC6AyPqAf5fL42bU2CygsFNPQYbFLQ4djvXyHexicOk7vpoCChGaKKXmM3BsUcHoW6y
 XJOE8MwC6H4zOlf1E+ZYkNirkTKXtIU5mEyy0IdBGUTp2b3JkbBcXefIW5Mae/9N8QLF
 oL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795586424; x=1796191224;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xfBUfYk8SiG4ti9BWH8WIhXlMs8M88slx+Db8tyQGR4=;
 b=NmzNtdZ/UV42LranL17UiJevwddO/d7m2Lu5E8AQV4e/eX/97wQfNEawjIGWx2v5zH
 bphO3/1Bcg7zTY50vZHxNbV2P/wRoHqgoWWNOCc46mnUHhsjFi8384JTIHVOQEkgTxz8
 hHbPoWCWYcrhJ/ScKtsbWCS2BBRGZPr8LJxp1p7/Zn+d66IjSNA7ETXpaUN1pPc0bOKF
 lo5f/m1lz8qeBcYAM22t0E+aYioPFHKewCvNu4Xxgh5JGjBVol60SIySkL1GV404OSe9
 qSi9PeL0mT4gzn8oxRKRFFlcHl+M6L80/k8ylRDhuIlzhfInk3XqUfSfFfeQgH4P8IGN
 l4xw==
X-Gm-Message-State: APuU4Z+bbg7C9afxExIsl+Z5PT1STxGG/7ff+zkY7/J6JA+ccERZbKU2
 DPulwq26sNumwfzMaWT9mBtUwyUW4i19zG5fGjNmmedj0vSLq4OIV1ZyF6qlWA==
X-Gm-Gg: AZFdTZdMiNSA1h8H6mZxUJgwfx9rrXiQaUFlrhMzLOBuT6dwlETVunDo8cdNHQ84XN5
 vzEW26GcYuxUvSKn2Ln0VNY8/BIhbsXJCUTmL1XfRSD8am7NhalvjYSJHxkvRJFVMnqWiQ8rIPD
 6+syRoJRhjgY3RoiJJJ0Gnd1Sw5NoGQ6RgcEP3mSwZU6kPBkTSYhdKBA+nkvhy5Kacm8vnaU61M
 Sg1JB32YN9pGkrZyQuhbkjiefGb4xUooqNNpjz8wmfaJQdE9u+S7TV0hj+AmZMUJ1w/vFR3gL8V
 gKmRxSxuGEJAopUO9KAItTis/fS4bgS0eN9q3/4PtPhD10tqpOQ2Nv6Mni1v0JqKwgX1uqFJ52n
 l0a3a6sB12zy+wamzodrPPawmnO1ZjryYIH5GWiALCzEUgg2aanG7BaWBuWWCAXijv/h5+3bHt0
 71NssngaxJ2NCtv/GWdoKuucROpPofqnKkyyeonWCVhmA5VRZGTFnnEO2BBIB73SdIVDKYR3Piq
 DZSLLjFGSGpcoMQWckDhKoRHFqdAo0UnowChElNgrzobza5WzAa2q5BAXmeccbvPB+bVa5OC+AP
 PqjdvQFQBfgOdy2nQecacOudZrL7H1/PZv2GlFNBinm6n9VjqL2fHuPhi9UUgR0BTv0RB68+ozy
 e5wg0xwt9
X-Received: by 2002:a05:600c:5251:b0:4a1:f8cb:7d70 with SMTP id
 5b1f17b1804b1-4bb8881e837mr316353345e9.24.1795586423678; 
 Tue, 24 Nov 2026 22:00:23 -0800 (PST)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67fe75sm36674991f8f.24.2026.11.24.22.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 22:00:22 -0800 (PST)
Message-ID: <b7455942f989cf0d40296019e4a4088e13d6e374.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org
Date: Wed, 25 Nov 2026 07:00:19 +0100
In-Reply-To: <b5b2070359ca015495294076e65ccd08@umbiko.net>
References: <20261122004653.3725606-1-alexander.sverdlin@gmail.com>
 <20261122004653.3725606-2-alexander.sverdlin@gmail.com>
 <b5b2070359ca015495294076e65ccd08@umbiko.net>
User-Agent: Evolution 3.62.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 2/2] DEVELOPERS: Alexander Sverdlin and
 Andreas Ziegler take care of syslinux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQW5kcmVhcywKCnRoYW5rcyBmb3IgbG9va2luZyBpbnRvIHRoaXMhCgpPbiBXZWQsIDIwMjYt
MTEtMjUgYXQgMDQ6NTEgKzAwMDAsIEFuZHJlYXMgWmllZ2xlciB3cm90ZToKPiA+IEBAIC0xMzMs
OCArMTMzLDEwIEBAIE46CUFsZWtzYW5kciBNYWthcm92IAo+ID4gPGFsZWtzYW5kci5vLm1ha2Fy
b3ZAZ21haWwuY29tPgo+ID4gwqAgRjoJcGFja2FnZS9saWJlc3QvCj4gPiAKPiA+IMKgIE46CUFs
ZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4KPiA+ICtGOgli
b290L3N5c2xpbnV4Lwo+ID4gwqAgRjoJcGFja2FnZS9taW5pLXNubXBkLwo+ID4gwqAgRjoJcGFj
a2FnZS9uZXR3b3JrLW1hbmFnZXItcHB0cC8KPiAKPiBZb3VyIHZlcnNpb24gb2YgREVWRUxPUEVS
UyBoYXMgb25lIGFkZGl0aW9uYWwgbGluZSB3aGljaCBpcyBub3QgKHlldCkgaW4gCj4gbWFzdGVy
IG9yIG5leHQuIFRoZSBwYXRjaCBkb2VzIG5vdCBhcHBseSB3aXRob3V0IG1vZGlmaWNhdGlvbi4K
CkluZGVlZCwgSSBtZXNzZWQgdGhpcyB1cCwgc29ycnkhCkknbGwgcmUtc3BpbiEKCj4gPiArRjoJ
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9zeXNsaW51eC5weQo+ID4gCj4gPiDCoCBO
OglBbGV4YW5kZXIgVmFybmluIDxmZW5peGsxOUBtYWlsLnJ1Pgo+ID4gwqAgRjoJcGFja2FnZS9s
aWJsb2c0Yy1sb2NhbHRpbWUvCgpwdy1ib3Q6IGNyCgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
