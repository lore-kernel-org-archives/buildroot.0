Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EA4606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 20:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rlDJtZeY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BjSATtY6
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B496605EC;
	Mon, 26 Oct 2026 20:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqthMK_AFg8q; Mon, 26 Oct 2026 20:45:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3DEC8605ED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793047558;
	b=cWcmrUKY8UQgEQt9LS3cJtyi7gki5kWXYpaVOYrQNooZZd9kjkYUdM/T2oWytk7Goi3j
	 4+dsPXRDKM/7r2ZRmTSHt3Vr+ZziAZC6I70geYymRTrCAwvvb4wNHS73IIcoWmoJAAx8J
	 3cL+sP9cQCFVzyrWSRi6/okyOPnh08+Hu+LD2/VplcwW7Cg/pJi6ASYJyJDdND/Vrq9dC
	 M8YodgOzgmpYDHN/ngrawhC1sIUr689Z223mKPL9YZyQqPQ8Ackfvpl9G8Z+uJK+801Zk
	 HSJrbXlOPvqEPyRUwsLKoUUuNNGWHbvHdzHF9b7nC+9NfIJpqQ4DI6/HKZhHr5+4NhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793047558;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:From:To:Cc:Date:In-Reply-To:References:
	 User-Agent:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=2h08kysmbXHmjYFqoEI5K99uxZxGwlSVGDjyVFVbMEM=;
	b=ihqqW4Xy57UuCDubFau7KExhXOPxRYyt9fK8hg333quFxDzU+6CZvqA/+98sCiKjobUx
	 BUk2qSIEIi3SfJqid2CiCNhl3wZHLiBcuVDoEn5yXRTVsIVggyWTg5BWX2XRoQezoqi/t
	 QS21EjFGYzubeiMbRDeVTI+1bod2j/GqmD+ltaoNem8vD5h/fBJMB7/3ng/NClrf+4lFP
	 vxO2ufO6Z+xjbWXPfGVrBxvRP2vxp8AM/a3zrESXKWG08y8wEWSdz9uHGc9c/hD7ZkkgT
	 RS3KSdsA76ES0X2pqNL/U6hii8UvABuBQcTNBP6wYwqqg9tFLyoy2oByCQjZj8NeMOQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793047558;
	bh=2h08kysmbXHmjYFqoEI5K99uxZxGwlSVGDjyVFVbMEM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rlDJtZeYWuNqjSseDzETTLR0SsN5FuaAQHVq9TNSmUOMDjiNsVmVuhlWtxfZGU70w
	 Nx94BJTriuKntme5jDvnEDslYrz/6QsElv7w5QRXbXPcH6US0zhmCkN3DfAbiSDQ2p
	 n3uxQKLCRKw/F/VnPV7xrziHPw0lAGTinrlDwR8koCp+w1QUSVDR1V1jxDj/nkxGmk
	 DanlzACW4SMYj72SpUTRiZPjo7q2Y40POEuCo75fqP5e55gBH0rdge2cO3s84s0T8Z
	 6oZKku7nbbHE+zG3WlNH4LPWNftjf9eoVEhCTNr6zCLNFUl4sl5efws3QfTgTSBhqd
	 +cvB1edZyAzRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DEC8605ED;
	Mon, 26 Oct 2026 20:45:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A494235
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70B6C4055A
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Hr1Hi2to7CD for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 20:45:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0021940552
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793047555;
 b=Zjfw/0So/lYQCEYpH1x76hJHvtE5xNvIgEXn6acUxS6a9ddmE4HdnhBQuTM5KhnRrftE
 XikobP9TaWnKB/zc+FR3BcgkXw+fLUaFzhyzbQSelMcc/k1zxfPtM9CG8qMQjXu20ed+d
 TDmJU03JgnTJ14IigpwTodI4BvgmzwdWtZfI9wN/X2CzB541PSHw92HVR9ATh61qec/uY
 bmfmBUiz05BKHQ3JM/WzyBvaM22GE8AmuMsoEv3xJs4XiCQYQ+WPGila+UuxmDzy25+bo
 bS0AmYR8hBwJlnf5x/Q5pdBC+GVXeKYLQU3lMcF/zyYjaeyvuUr//ObyNxnXZSjCBNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793047555;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
 From:To:Cc:Date:In-Reply-To:References:Content-Type:
 Content-Transfer-Encoding:User-Agent:MIME-Version;
 bh=I0TiUtD7cz2BfI8PrmMRxXkEgtFAjFvtpVNGDG5Befk=;
 b=NPu0eJ1hdSPoF5gjTDFelclVBvq+OYPwXXbw1eVjk6ZOZ2RbXI5C0hI4Wv3G/FnzBHdq
 TxHdexbj4gqT0uGAeS2w10dEBwJbv0FEzV2yXLMTz1UZRvBOZNsE3JrMJrti/7d2g5f+M
 sG+m8U964Nxggn6cBaDTSL72S9mIABxV1l/aWLMC10AJLbuuZ/g8c8ypi6p01iwHxVXSX
 JNnGzrnL5iJgq0jIdGH/Pjx6LAiyLbshsQfw35lmZIwGGbQJgqRyDlVRgpm5vWTEKEvsT
 lIigSbUT2cZ+UUWVUWtnXb9TW0gbX2EFNNLb/wApH381QUKLaqDfftKst4vjbqvR5BA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=BjSATtY6; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=BjSATtY6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0021940552
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:45:53 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so18062775e9.2
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 13:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793047551; x=1793652351; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=I0TiUtD7cz2BfI8PrmMRxXkEgtFAjFvtpVNGDG5Befk=;
 b=BjSATtY621nN8xgjoEMqVmKpSFcy5/sLRDlH0WBDqm87tdFGOiiEt6IkcZYEwgDeNQ
 6l8s0XY1CQbRcjONkAMBXN8iuc9DpsJqh8JIQeaYo8UC4Y0WBLEmJmekz5Ggfhen9wHz
 N4X6GoOo26t6XELtb0T41UFzGDcShMtjfxNBaCgGgGN6NDhDA6Ayh25M2aohMKE78EEh
 6GWImoegbBiZQt8yi/wvQQqIbtUVTCCaPeqJ0iBdbZONtZei1Jcc6On280Es3cD7HJ3O
 fmWCtxk/SR3+XGje2K3PARvf6+vr1iCcpZrgjsPsdl8fPS8h4idhBbYRhxciMhJ1giVW
 wHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793047551; x=1793652351;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=I0TiUtD7cz2BfI8PrmMRxXkEgtFAjFvtpVNGDG5Befk=;
 b=pt2VjG6OyUARMP2Xdl0s/qAlbzXbBCaV0CZ3x7bTpyVYGAYg4GYWSdkJv2hZup+Ure
 Wr4EZiJDZlEkLHr4rj9y0nXZmJSZhusvl3ake+olFC09uzjooIMrYJiFZdzuEl+VaFNI
 t8G7yoLdAYHGOx4WcDI+ksGfacX4wEnXvnZCbA7Mjok53mJJ4adHbiXpgPSlzBG/tVOw
 XjuWSMbzAoYUiyRM8Spb2J4kjoQK10AW28aWEH5sCRkkXbd9n1fceAJiHHtASmbJ44rT
 0lrZM9+PFhFYc7rF7J3p5J+a+tPNHuGT1ilVmOg6BGko9ayehjZGYeMgA15tupMOS7e1
 s8fQ==
X-Gm-Message-State: AFq9FYK8vUkWapGEvVq3IdLtZV/LAnIJtxo38nGcY79GvaPR7nEsTNPS
 yWqu8XvsKXfCs5aWcf48sauSdkVeV+cyaBSUs02iLFrSfSuJrcSzPPtkDNLAwCMK
X-Gm-Gg: AYBFou3mco/9YWd0kkumiXcmMOm6xzVsdCJRx0LYAIBv8UzQp9lY6pj0V1563RJm1Yp
 9YX5KNWr8nCE4ThylfEGYerhvsEplidas1TsSFXxtY34C7Zz7zmCTNvorLvTudTn2FY/m7/olQR
 qmFpf4pEnzUl0zsgMfoMG2dUcZVhZw4aow0aqKFm6WH7R5cIoaBtLV/j2r0XrKG4EdpTTg7rIuL
 scG94VMsn/EV807lZ1/2lAjOwaFv0kf4eNbIPhP6HBrHH763GxqbK35jfbmEjrRF3mn0rnaH+Hn
 C6CnvuL8uyIp2CKcX8gsO24w/u48BH1e4OzAFvea4runYR2URgAJOsexTrgE8ii7Vf0XlULslR+
 todpWlkUc7jkGERAz8bnPemzIq4eltkV9Y2obirSmmp4RF5H9Y8ty6LB+tV6+LtGmpgm91XKM0r
 yTiokwWCKMVu2pugUE2vLB5pnslfdfQvFx9Pf6Zb4C4eUw+gm9IK+k2JKHRYJLXrmXt974Wfz2u
 Cjc+wgxhoC3JzSuoYqa9g6CcgVIQPM48SRYiZJomQbCTyUjx4tDvhMf5/4MzluDcl4ugvOxMJbw
 Fonq8vHnANxSewDD7DhPR4LuexaoinuF5dg=
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1a:a116 with SMTP id
 5b1f17b1804b1-4a35aae5c48mr163800205e9.0.1793047551359; 
 Mon, 26 Oct 2026 13:45:51 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a0bb112sm237082715e9.8.2026.10.26.13.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 13:45:50 -0700 (PDT)
Message-ID: <e34f4a3f8aaee192923e3ecdde4a287a1cfaabda.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>
Date: Mon, 26 Oct 2026 21:45:35 +0100
In-Reply-To: <at5oC97YlhN98HHS@windsurf>
References: <20261024220915.2813680-1-alexander.sverdlin@gmail.com>
 <at5oC97YlhN98HHS@windsurf>
User-Agent: Evolution 3.60.2 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] boot/syslinux: Bump to 6.04-pre2
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVGhvbWFzLAoKT24gU3VuLCAyMDI2LTEwLTI1IGF0IDIxOjM2ICswMTAwLCBUaG9tYXMgUGV0
YXp6b25pIHdyb3RlOgo+IE9uIFN1biwgT2N0IDI1LCAyMDI2IGF0IDEyOjA4OjQ0QU0gKzAyMDAs
IEFsZXhhbmRlciBTdmVyZGxpbiB3cm90ZToKPiA+IFRoZSByZXZpc2lvbiB0byBidWlsZCBjb21l
cyBmcm9tIEFyY2hsaW51eCBzeXNsaW51eCBwYWNrYWdlLCB0aGUgYXJjaGl2ZQo+ID4gZnJvbSBk
ZWJpYW4gKHRvIHNhdmUgdGltZSBmb3IgZ2l0IGNsb25lKS4KPiA+IAo+ID4gQWRkIHBhdGNoIGZp
eGluZyBwYXNzaW5nICZsb2FkX2Vycm9yX2J1ZiB0byBzZXRqbXAoKS9sb25nam1wKCksIHJlamVj
dGVkCj4gPiBzaW5jZSBnY2MgMTQgbWFkZSAtV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzIGFu
IGVycm9yIGJ5IGRlZmF1bHQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTdmVy
ZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4KPiAKPiBEb2VzIGl0IG1ha2Ugc2Vu
c2UgdG8ga2VlcCBzeXNsaW51eD8gRXZlbiBXaWtpcGVkaWEgc2F5cyBpdCdzCj4gImRpc2NvbnRp
bnVlZCIuIERvIHlvdSBzdGlsbCB1c2UgaXQ/CgpJJ2xsIGJlIGZpbmUgaGF2aW5nIGl0IGRvd25z
dHJlYW0uIEkganVzdCB0aG91Z2h0LCB0aGVyZSBpcyBzdGlsbCBhbgppbnRlcmVzdCBbMV0gaW4g
dGhpcyB1cGRhdGUgOy0pCgo+IFdoYXQgYWJvdXQgYWxsIHRoZSBwYXRjaGVzIHlvdSBhcmUgZHJv
cHBpbmcsIGFyZSB0aGV5IGFsbCAidXBzdHJlYW0iPwo+IFdlIHVzdWFsbHkgbGlrZSB0byBoYXZl
IHNvbWUgY2xhcmlmaWNhdGlvbiBpbiB0aGUgY29tbWl0IGxvZyBvbiB3aHkKPiBwYXRjaGVzIGFy
ZSBkcm9wcGVkLgoKU29ycnksIHllcywgYWxsIHRoZSBkcm9wcGVkIGFyZSAiYWxyZWFkeSBhcHBs
aWVkIiwgSSB3aWxsIG1lbnRpb24gdGhpcwppbiB0aGUgY29tbWl0IG1lc3NhZ2UgaWYgeW91J2xs
IGhhdmUgaW50ZXJlc3QgaW4gaXQuCgo+ID4gZGlmZiAtLWdpdCBhL2Jvb3Qvc3lzbGludXgvMDAw
MS1lZmktbWFpbi5jLWZpeC1qbXBfYnVmLXBhc3NpbmcucGF0Y2ggYi9ib290L3N5c2xpbnV4LzAw
MDEtZWZpLW1haW4uYy1maXgtam1wX2J1Zi1wYXNzaW5nLnBhdGNoCj4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uM2JhYWJjMmIyZQo+ID4gLS0tIC9kZXYvbnVs
bAo+ID4gKysrIGIvYm9vdC9zeXNsaW51eC8wMDAxLWVmaS1tYWluLmMtZml4LWptcF9idWYtcGFz
c2luZy5wYXRjaAo+ID4gQEAgLTAsMCArMSwzNCBAQAo+ID4gK0Zyb206IEFsZXhhbmRlciBTdmVy
ZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4KPiA+ICtTdWJqZWN0OiBbUEFUQ0hd
IGVmaS9tYWluLmM6IHBhc3Mgam1wX2J1ZiBkaXJlY3RseSB0byBzZXRqbXAoKS9sb25nam1wKCkK
PiA+ICsKPiA+ICtnbnUtZWZpJ3Mgam1wX2J1ZiBpcyBhIG9uZS1lbGVtZW50IGFycmF5LCBzbyBs
b2FkX2Vycm9yX2J1ZiBhbHJlYWR5IGRlY2F5cwo+ID4gK3RvIHRoZSBlbGVtZW50IHBvaW50ZXIg
c2V0am1wKCkvbG9uZ2ptcCgpIGV4cGVjdC4gUGFzc2luZyAmbG9hZF9lcnJvcl9idWYKPiA+ICto
YW5kcyBvdmVyIGEgcG9pbnRlci10by1hcnJheSBpbnN0ZWFkLCByZWplY3RlZCBzaW5jZSBnY2Mg
MTQgbWFkZQo+ID4gKy1XaW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXMgYW4gZXJyb3IgYnkgZGVm
YXVsdC4KPiA+ICsKPiA+ICtVcHN0cmVhbTogTi9BLCBkZWFkCj4gPiArU2lnbmVkLW9mZi1ieTog
QWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgo+ID4gKy0t
LQo+ID4gKyBlZmkvbWFpbi5jIHwgNCArKy0tCj4gPiArIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiArCj4gPiArZGlmZiAtLWdpdCBhL2VmaS9tYWlu
LmMgYi9lZmkvbWFpbi5jCj4gPiArLS0tIGEvZWZpL21haW4uYwo+ID4gKysrKyBiL2VmaS9tYWlu
LmMKPiA+ICtAQCAtMTg0LDcgKzE4NCw3IEBAIF9fZXhwb3J0IHZvaWQgbG9jYWxfYm9vdCh1aW50
MTZfdCBheCkKPiA+ICvCoMKgwqDCoMKgICogSW5mb3JtIHRoZSBmaXJtd2FyZSB0aGF0IHdlIGZh
aWxlZCB0byBleGVjdXRlIGNvcnJlY3RseSwgd2hpY2gKPiA+ICvCoMKgwqDCoMKgICogd2lsbCB0
cmlnZ2VyIHRoZSBuZXh0IGVudHJ5IGluIHRoZSBFRkkgQm9vdCBNYW5hZ2VyIGxpc3QuCj4gPiAr
wqDCoMKgwqDCoCAqLwo+ID4gKy3CoMKgwqAgbG9uZ2ptcCgmbG9hZF9lcnJvcl9idWYsIDEpOwo+
ID4gKyvCoMKgwqAgbG9uZ2ptcChsb2FkX2Vycm9yX2J1ZiwgMSk7Cj4gCj4gQXJlIHlvdSBzdXJl
IHRoaXMgaXMgdGhlIHJpZ2h0IGZpeC4uLgoKSXQgaXMgY29uZnVzaW5nLCBidXQgaW5kZWVkLCB0
aGlzIGhhcyBiZWVuIGNoYW5nZWQgYmFjayBhbmQgZm9ydGggaW4gdGhlCnN5c2xpbnV4IGl0c2Vs
ZiBhbmQgYmVjYXVzZSBvZiB0aGUgZmFjdCB0aGF0IGJ1aWxkcm9vdCBidWlsZHMgc3lzbGludXgK
YWdhaW5zdCBidWlsZHJvb3QgZ251ZWZpIHBhY2thZ2UuCgo+ID4gZGlmZiAtLWdpdCBhL2Jvb3Qv
c3lzbGludXgvMDAyNC1lZmktbWFpbi5jLWZpeC1pbmNvcnJlY3QtdHlwZS1vZi1sb2FkX2Vycm9y
X2J1Zi5wYXRjaCBiL2Jvb3Qvc3lzbGludXgvMDAyNC1lZmktbWFpbi5jLWZpeC1pbmNvcnJlY3Qt
dHlwZS1vZi1sb2FkX2Vycm9yX2J1Zi5wYXRjaAo+ID4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
Cj4gPiBpbmRleCA5ZjYxNzQ1YTYxLi4wMDAwMDAwMDAwCj4gPiAtLS0gYS9ib290L3N5c2xpbnV4
LzAwMjQtZWZpLW1haW4uYy1maXgtaW5jb3JyZWN0LXR5cGUtb2YtbG9hZF9lcnJvcl9idWYucGF0
Y2gKPiA+ICsrKyAvZGV2L251bGwKPiA+IEBAIC0xLDQ4ICswLDAgQEAKPiA+IC1Gcm9tIGNiYzhh
OGUyNWMzNTQ4NzcxZGU1Mjk0ZjVhMWVhZWY2YmZlOWI1ZGEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCj4gPiAtRnJvbTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGlu
LmNvbT4KPiA+IC1EYXRlOiBTYXQsIDE4IEphbiAyMDI1IDE3OjAzOjE2ICswMTAwCj4gPiAtU3Vi
amVjdDogW1BBVENIXSBlZmkvbWFpbi5jOiBmaXggaW5jb3JyZWN0IHR5cGUgb2YgbG9hZF9lcnJv
cl9idWYKPiA+IC1NSU1FLVZlcnNpb246IDEuMAo+ID4gLUNvbnRlbnQtVHlwZTogdGV4dC9wbGFp
bjsgY2hhcnNldD1VVEYtOAo+ID4gLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiA+
IC0KPiA+IC1sb2FkX2Vycm9yX2J1ZiBpcyB1c2VkIGFzIGFyZ3VtZW50IG9mIHNldGptcCgpL2xv
bmdqbXAoKSwgc28gaXQgc2hvdWxkCj4gPiAtYmUgYSAiam1wX2J1ZiIsIG5vdCBhICJqbXBfYnVm
ICoiLiBBY2NvcmRpbmcgdG8gdGhlIHNldGptcC9sb25nam1wIG1hbgo+ID4gLXBhZ2U6Cj4gPiAt
Cj4gPiAtwqDCoMKgwqDCoMKgIGludCBzZXRqbXAoam1wX2J1ZiBlbnYpOwo+ID4gLcKgwqDCoMKg
wqDCoCBpbnQgc2lnc2V0am1wKHNpZ2ptcF9idWYgZW52LCBpbnQgc2F2ZXNpZ3MpOwo+ID4gLQo+
ID4gLUZpeGVzIGJ1aWxkIGlzc3VlIHdpdGggR0NDID49IDE0Ogo+ID4gLQo+ID4gLWVmaS9tYWlu
LmM6MTMyOToyMTogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMSBvZiDigJhzZXRqbXDigJkgZnJv
bSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVz
XQo+ID4gLSAxMzI5IHzCoMKgwqDCoMKgwqDCoMKgIGlmICghc2V0am1wKGxvYWRfZXJyb3JfYnVm
KSkKPiA+IC3CoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIF5+fn5+fn5+fn5+fn5+Cj4gPiAtwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4gPiAtwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgPGFub255bW91cz4gKCopWzFdCj4gPiAteDg2
XzY0LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVkZS9lZmkvZWZpc2V0am1w
Lmg6NzoyOTogbm90ZTogZXhwZWN0ZWQg4oCYc3RydWN0IDxhbm9ueW1vdXM+ICrigJkgYnV0IGFy
Z3VtZW50IGlzIG9mIHR5cGUg4oCYc3RydWN0IDxhbm9ueW1vdXM+ICgqKVsxXeKAmQo+ID4gLcKg
wqDCoCA3IHwgZXh0ZXJuIFVJTlROIHNldGptcChqbXBfYnVmIGVudikgX19hdHRyaWJ1dGVfXygo
cmV0dXJuc190d2ljZSkpOwo+ID4gLcKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfn5+fn5+fn5efn4KPiA+IC0KPiA+IC1VcHN0cmVhbTogTi9BIGRl
YWQKPiA+IC1TaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25p
QGJvb3RsaW4uY29tPgo+ID4gLS0tLQo+ID4gLSBlZmkvbWFpbi5jIHwgMiArLQo+ID4gLSAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IC0KPiA+IC1kaWZm
IC0tZ2l0IGEvZWZpL21haW4uYyBiL2VmaS9tYWluLmMKPiA+IC1pbmRleCA3ZGM3YmNhNy4uMDQ1
ZGFlNTYgMTAwNjQ0Cj4gPiAtLS0tIGEvZWZpL21haW4uYwo+ID4gLSsrKyBiL2VmaS9tYWluLmMK
PiA+IC1AQCAtMzAsNyArMzAsNyBAQCB1aW50MzJfdCB0aW1lcl9pcnE7Cj4gPiAtIF9fZXhwb3J0
IHVpbnQ4X3QgS2JkTWFwWzI1Nl07Cj4gPiAtIGNoYXIgYXV4X3NlZ1syNTZdOwo+ID4gLSAKPiA+
IC0tc3RhdGljIGptcF9idWYgKmxvYWRfZXJyb3JfYnVmOwo+ID4gLStzdGF0aWMgam1wX2J1ZiBs
b2FkX2Vycm9yX2J1ZjsKPiAKPiBBbmQgbm90IHRoaXMgb25lLCB0aGF0IHlvdSBhcmUgcmVtb3Zp
bmc/CgpTbyB0aGUgcGF0Y2ggMjQgaGFzIHBhcnRpYWxseSByZXZlcnRlZCB0aGUgcGF0Y2ggNywg
dGhlIGxhdHRlciBpcyBhbHJlYWR5IG1lcmdlZAp1cHN0cmVhbSwgYnV0IGluIGRpZmZlcmVudCBm
b3JtICgyMmQzMmMxNWVhOTYKIlVwZGF0ZSB0aGUgbG9uZ2p1bXAgY2FsbHMgdG8gZml0IHRoZSBu
ZXcgZGVjbGFyYXRpb24iKS4KClVsdGltYXRlbHksIHBhdGNoIDcgZG9lc24ndCBhcHBseSwgcGF0
Y2ggMjQgZG9lc24ndCBhcHBseSBiZWNhdXNlIHBhdGNoCjcgZG9lc24ndCBhcHBseSwgYnV0IGV2
ZW4gaWYgdGhleSB3b3VsZCBib3RoIGFwcGx5LCB0aGUgbmV0IHJlc3VsdCB3aWxsCmJlIGV4YWN0
bHkgd2hhdCA2LjA0LXByZTIgaGFzIHVwc3RyZWFtLiBBbmQgaXQncyBub3QgYnVpbGRhYmxlIGFn
YWluc3QgdGhlCmJ1aWxkcm9vdCBnbnVlZmkgcGFja2FnZS4KClsxXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvYXE2Mngzb3ZBVW9jX0xtbkB3aW5kc3VyZi8KCi0tIApBbGV4YW5kZXIgU3Zl
cmRsaW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
