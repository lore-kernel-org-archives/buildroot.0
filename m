Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80437606AC12
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VmaBn7Ds
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 588988119D;
	Wed,  4 Nov 2026 22:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0IV8beQCGqb; Wed,  4 Nov 2026 22:19:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 649F981062
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793830770;
	b=SK+FN5To7sl4DcEpK4vCvkU+yBn3zcXUbtn3MT+vWZ8U/rm/EQSh/RLI1WUrKBbJu7/t
	 Qu3uL2/EjGD6P4SvVjlBOdQwZHrSgfdsse+1QQpkf9qD8rFKVuZCQOkZRwZ1SEeNuD4nX
	 W8pgWnCM+wppfCYDrctRTx5FgFRVQkVKgcaLnSP9llpuws4Xcg8PS+xNsF/f00H7eGu8A
	 O5jNyKyTowOxo+wDdNCHEFNWSJCrY9oHrPf7bD8w2bCgHzCYfiHToiln+fDVu+Sv4ZtpT
	 ceosr+7z9CZI6CuLaytXIuyiLFm/c1wP+9TxXEQt+jRxMVBsTXMyfl33xE1PAZA+VTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793830770;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nkg0WigXWb6B+NZ0PJZp2NBmY8K/BJpaxWgZY6VML08=;
	b=TCSJoIRogGbKAAot9hWNrDSqL+ZOiZWunTLCxg/oTPpNm9jYLlOQWBSvUHH45oeSJPZK
	 36bdWWZG+W0oLpPphpKxGy9mwjT8R6h9MntiyrazcBzepun6/KiRW+f4i/yuQjWHYpuXV
	 5ggIUF+Dx8mynUmTTUpRTKBE3wKB1lsSp2RwAR3E+csmwhcEXFuzHLHkfw86GMm4guwUK
	 6VUY/W/kpnoyI2IYMsequDWp5AeIdFY8NobKpi9iT5/9EdJuOobrYvcTKt5/xoBRM0zT4
	 c34Ht/PgV69WTdGGyAIR7/9giaNp1DXXo4IEBdot1a3EZg4jnZrfgXylULEywqnJ7tw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793830770;
	bh=nkg0WigXWb6B+NZ0PJZp2NBmY8K/BJpaxWgZY6VML08=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VmaBn7DsYleAcW6wlwEvU/GG43iGdu5m/xJbyQQW4Wbr9X4Hm15JHPOgywDBhRSEM
	 ZxEN6pMkmTOO94P6Q9k2o/gdHdHPLPIJWzIpYhdbMsbeul6u/oBMW7Aj5NsB5jabIA
	 lZJtvjT7uYa96TZjLOixssixIITMsMfTUs6SzHcLrMoxe2eKeSsrLHOcILstrJ4D+i
	 lqfWdNTyATwoE7VFoYV1U8T+RDM+x/A+7ZOVa+30t48+1a33b0hp/lwV0TyB1LZvAe
	 Eds0cdLw0z2TrjZzdHtQ5VHJIvbgYQzwu7eknKaUqQSKjPRvKerLL4iaF0BUHQ/ZPh
	 /9YEfF2R7gXvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 649F981062;
	Wed,  4 Nov 2026 22:19:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F6A5B00
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60C84607D5
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5onXpyhaAUSd for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:19:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 36D1A6078E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36D1A6078E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:19:26 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6b2237b596cso2527924a12.0
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 14:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793830764; x=1794435564;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HOPEwwNF/0wua0VWZy4iL8NGfOccWWqqISVC1w6GlzA=;
 b=jWFIl6sahBNKFl9xh/JMC4YUsBOI223CNOSNEwHJcK9RQXl4spqUZj3Ip9Ghn6IMBr
 cu0t7RtN5FgZqfrbDFiQJ/NLNOFJyWf4/ePBInt7ZFpEOrBaPnF94OUKQNysbPQMPWTK
 WQEqp5V6lRJKXpeaVAa3et/YF1zM5OLD5ff7mRW3vb5bsRhlbUou6V9PrA3B0Ktiz9YB
 Vbl7wtwwpQr4xr7D4ZL5PWCRNZrzrb0H6MyjOuq4ZCRBCiwt2PQOb9PrMMruJRC7fLEH
 7Kvu608OIqFeFOXkH5H/F032KU4wP1z0Ybe9ybKvx2MPs6pbVlHchCOFYr8ZxH/i8mvj
 Zh+w==
X-Gm-Message-State: APuU4Z9enpByJQXun9LhqmalyYnOFNBDP63bMmhX7seKydeluKWfZsko
 3AwqnNPSdK39q8oAImdoWX+DTiynSoXaxsTEvhrya53t08vUmY7IfU8tk9n6HiT4lIScWKMRD12
 fgz2kYGpmTWIbmC4GtJ9Wav57KmhKQ+Mwj9Bk
X-Gm-Gg: AYBFou3FvobBV5qHka/ZJo9iwZoT9qoBsJzt9N/G/RUChuBKfFfv59j0dx3zhzw2j9f
 Ro2lu2cGxxkBmRxFFMTNa7OnMgNkvkihHJd7kjuKKrBR9HaQuScpRYVUPBeVvpxo9Urg7dEWGdx
 VWxZugKJpC/iPFpZmgrrxLLbjDzfQZAzrbY3ihSLDfm6a6ElJSdkan/ZkRDNU5865GY/KrZ8N2o
 DeDAZ/QQ60H0ROLJBxnCYt+nLzoTaZLP6v0/OPVT5ELdwJAEwgWl8htysMrZoh83SBzsbfHnabn
 YYCeTgK8dpCIJOc1+mpuhlxiKkAnpRv+NAdlVaVJlJ+PRh44ryn5bUHsV+WqT6xJKqEqf0pMR/T
 WGVpHxqNrbnpM66hneTlfQjQWibm3kaJs+o5IQg==
X-Received: by 2002:a05:6402:52c3:b0:6b3:c0f2:eccc with SMTP id
 4fb4d7f45d1cf-6b4d487abd0mr12117224a12.27.1793830764177; Wed, 04 Nov 2026
 14:19:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103064034.3913314-1-yegorslists@googlemail.com>
 <auuiaUH0JJ20VZWV@windsurf>
In-Reply-To: <auuiaUH0JJ20VZWV@windsurf>
Date: Wed, 4 Nov 2026 23:19:49 +0100
X-Gm-Features: AclHuK9sVZnK-yAuDT6PLt-7t_6Qu6YKzhHgsFY_RUkSo6wLdJ9esIMQQ5T3sss
Message-ID: <CAGm1_kt3BhEuM3H2rRUQYiFmU2+HrsCQdajzCe6whEXwrBkmAw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/file: bump to version 5.48
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVGhvbWFzLAoKT24gV2VkLCBOb3YgNCwgMjAyNiBhdCAxMDoyNOKAr1BNIFRob21hcyBQZXRh
enpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBO
b3YgMDMsIDIwMjYgYXQgMDc6NDA6MzRBTSArMDEwMCwgWWVnb3IgWWVmcmVtb3YgdmlhIGJ1aWxk
cm9vdCB3cm90ZToKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9maWxlL2ZpbGUvYmxvYi9GSUxFNV80
OC9DaGFuZ2VMb2cKPiA+Cj4gPiA1LjQ4IGFkZHMgTGFuZGxvY2sgc2FuZGJveGluZywgd2hpY2gg
aXMgZW5hYmxlZCB3aGVuIHRoZSB0b29sY2hhaW4KPiA+IHByb3ZpZGVzIGxpbnV4L2xhbmRsb2Nr
LmggYW5kIHNraXBwZWQgYXQgcnVudGltZSBvbiBrZXJuZWxzIHdpdGhvdXQKPiA+IExhbmRsb2Nr
IHN1cHBvcnQuCj4gPgo+ID4gQWRkIHR3byBwYXRjaGVzIGZpeGluZyB0aGUgc2VjY29tcCBidWls
ZCwgYnJva2VuIGJ5IHRoZSBuZXcgc3lzY2FsbAo+ID4gcnVsZXMgaW4gNS40ODoKPiA+Cj4gPiAt
IHdpdGggbXVzbCwgd2hlcmUgcHJlYWQ2NCBpcyBhIG1hY3JvIG9uY2Ugc2VjY29tcC5jIGluY2x1
ZGVzCj4gPiAgIDx1bmlzdGQuaD47Cj4gPiAtIHdpdGgga2VybmVsIGhlYWRlcnMgb2xkZXIgdGhh
biA1LjksIHdoaWNoIGxhY2sgb3BlbmF0MiwgZmFjY2Vzc2F0Mgo+ID4gICBvciBjbG9zZV9yYW5n
ZS4KPiA+Cj4gPiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTUtNQo+ID4gU2lnbmVk
LW9mZi1ieTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgo+Cj4g
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcyEKPgo+IEkgY29udGludWUgdG8gYmUgYW1hemVkIHRo
YXQga2V5IG9wZW4tc29mdHdhcmUgbGlrZSBmaWxlIGhhcyBhIHdlYnNpdGUKPiBsaWtlIHRoaXM6
IGh0dHBzOi8vYXN0cm9uLmNvbS8sIG5vIEdpdCByZXBvc2l0b3J5LCBubyBtYWlsaW5nIGxpc3Qs
IG5vCj4gbm90aGluZy4uLgoKWW91J3JlIHJpZ2h0LiBUaGF0J3MgdmVyeSBvZGQuIFRoZXkgc2Vl
bSB0byB1c2UgQ1ZTOgpodHRwczovL2dpdGh1Yi5jb20vZmlsZS9maWxlCgpZZWdvcgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
