Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CF5606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZrtQFugj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 332EA4095A;
	Fri, 23 Oct 2026 13:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxhSV6eyqRok; Fri, 23 Oct 2026 13:20:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 42FA2408EE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761620;
	b=iCpEK1tNoSkj6jZxUqEMWGzNqjLXRHPrE3kwifEnjqC8nd1Y1sxD1WusybxWnIqImMR/
	 h9WaAPdduoO9oT21cFvplMmxFcQLF5DPaAFqRFVo9y5mOvVVug39uCdKE0fU4ca/gOw7c
	 3pTsr/IEMn0Ra4jI61npYiwqECJ6Vvf4si+Pwx0gR/eMHOyiSZKLBAXUeWJ0RkVCFbHzm
	 idHk4dJOnOSS62UNzEPNz5V/j+OmmkkBYRU62yb3kwzDa189+xnbLTJRKUUYgNE8uim2S
	 PjlVAeCrRwzRvfmvOabxU8WDgerva4RXDtoWxbNJBKC/eDwyr33DhkUsqApkkQP3PGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761620;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+O8eCmJhD+YY7t6Jj54NUNBpwnxblBTBctdXY84rBCE=;
	b=iaLUg3tQKcoI1rYq7tWoFrx+2hcLIJjqd3n8FxKOtUP68hni/kB4qbQe1WCgE6OjWsfE
	 Xc7iCJF25UvTWUFD0Cg0EQ6wVKbOx9ZqKngdCioWUWLF5b/qwdJsL5rGiZHvyG/wfk1Oz
	 GX+x8iv65QRXkcwvkC2lNXl1PwLHNkMjE/m0/fI+oni1y55DdEJHHml6Fl2GxQmW8U1gH
	 IcKx5urEJu6PGd7V2XPIwsdPQyX+zsXasyuMUX0XlO8bRaxpFlJnnwPoSNvo/w97oK/v0
	 +V8Fdp1GTmVBqYGHKOndipnWgMk5s6GSKIcB7AidMXa86KRTbNmYS+FGsPyBHm8A1fQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761620;
	bh=+O8eCmJhD+YY7t6Jj54NUNBpwnxblBTBctdXY84rBCE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZrtQFugjYzYNuQGdCSJDvJEFGzkbSnQILcIGvF/nOpxAwRIBw5uDYmY+4flLKTBgZ
	 yDppHi4nrZ1WnpUA3ZEaE0ji7wEbKtegxC7wGpdaZpZzA5maSoFzXa+IAzeB1VLIWO
	 DRtthy1VaB9Gn0wUYthSLItQjVoidLjH3M7dXSuJLTzVHg+9OckRVMQqkHeW0gezIT
	 YPKALD38TvQQEHfWkSAC6K3Gy0lzZO9DVTIrPAFKk3CMLtNeSDxOMDkM747RooUmPq
	 86NonQUWZAFyG5GEqo3yit4Ql78+5vpQOPIp57RM2Iv4XAz9r0R9jSgBdFeC6yk1V/
	 +HtJUi2Tc7F2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42FA2408EE;
	Fri, 23 Oct 2026 13:20:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 326903C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17BF2401CC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvtDGy6DKi_5 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:20:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D5ED4400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761617;
 b=rDbJIHZC6lqbI1L6iCOav6NpcMM+EN6QgKpvXFKXvOaSQ4/ZSck70ds2DYFXlFWmKnFf
 dsHfP0a9SxNpzz+Jh/GMGBP8bPxDIgRo1do7G4OGzVSe+HjRPIQWIo3kCdvd33pNVKNkX
 fcZVGb2zclnJM45NK/STgm3s0hCWZiSMJ6kvcpJCSE+K5/k7Wht6zp3YLLlmMDetht3y8
 c9xiLjlLT/LpBnHq5FMjuyk6/M39m8s8TwenI5wYWPmwJr36fUZ7btEIoyJ3CL8lxW9H0
 8MV4xj4j0QDByYF2Z+Byn6VpprrgyQzuQoKfEUg0ngwwqQ2VCXlWMxVcxT9MLhjiwbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761617;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=aNNfg7xOpbdruajrGiBl63MxFBY/qrVxVOHmrskQ7e4=;
 b=VFx39f529tqAGh0ZELKCPxzHroyazIb50fjP6owLBhgCIti3waOhrBZt1PiwktJzd3qk
 y5DfZTYNFqOz58H84kpSNrFSdDxk/jyAvzIulxDZfdpyWzuyaadWlbSCTmbrfN7CZJoeD
 Y5LXQ2ZPJPvEcQDoS4YdQuKXDf8Mu+4p5yTJXqY0BIgjUlioZCD5Sx/TlZftGc0+eYlyd
 P982Q3HdcEdmBBQKEO4usmjKiajC56fhcr3nItg/6J+KbHSJKRW4aH53Bv3t5odkThEPG
 sHfRkfEKjsv9pBI8jttc+E9Hk/N9fHtdUVqPTgWDMoSQeJTt/jMdc3tBbNBig1zfVqA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AK0csQ0G; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5ED4400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:16 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a20b122af8so7656505e9.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761614; x=1793366414;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=aNNfg7xOpbdruajrGiBl63MxFBY/qrVxVOHmrskQ7e4=;
 b=jC/zW9G1dKIA185iJ114yO8GmpW0L9Sn3ehrEWJtaeAqMb3QUr+3AJbqYFeAifbnjN
 Pe6gFPj3mq+Lv4xyYu8J1BAVMGTnvhB+kI5R18iIi6Bnk0G3qEPUNGdnwPk5a8C/bLxP
 /SIUiUW1s4DIYz0QwVyG2WbCMyKTNyIa3y0mUI7nTZ4lZhS+5uP+wlFamhuuZq3/eXZ4
 QlM0VlJu0VJ1vfuX5FeeaDMlA6RFuZpRsQyOCUlO7TcP14gGirOYGwmM/opXVkXzFMeA
 PVFLtRD5+ZKcvDaAPHji5OXB0RCna2+aGkEUGvndDRmHu8UqZmz31wdLBtP6B1EeZ/A1
 /s7g==
X-Gm-Message-State: AFq9FYLORDmJtOxarGQFw4juuFJWoR8Zy4VLSN2Xb8v+t96Hs+pmMvlv
 5zBlxKDUrzHS2Mbs/LSccz8aIilOPz68DB4g1BZMwgTOR4T/DxuaOwot9OTh0GpAYkGlW0sO5Mv
 mBJS3UP8=
X-Gm-Gg: AYBFou0lBZH1Uutk6/5C8wEfzWeoLVdq8vfN3mg4fxCoQKof0DQ2DPJ/yTsUf3/k9c3
 fVW8LX8GJ4lkGf+74jXhKW1IWSQp2UyaO/74MybOwEv4M4aWnocczT/Lc0YPdPtgadN/V9bQRzm
 sfVBLTLBf1Z/MM41UPxnMDi/SDncsjQgA31QFl7a0RFWVFZRstKEMn4Ikw4uL1d5b7D1gdy9xwf
 ZjGA0r1FPrNXpSeXXR3dPchbiz/VfpN9V9na6Xs/RKpksUUWjG7twRJgW4m1YDbiMHD3TKM/NE2
 7B+yEAd4S6XiEA9uzgXySMmDitOQ5mPa3TDuZ9xr4O/69Zi9EkaQDeK3HXeixYuIJBsxtDDwYZL
 REVBuK4KRjJjDikIoocir6diY0StWYEDTtEXLBx8e9LHJrLyQhXqWU6nQ3UBcZTP99IBb/+CwXr
 9Km5JDaPK3TciBXr3yb+Idy8IRKPMOSHBkxNAl8IwyqUjuvhWaFJZK+a2COhXoeSutxbSQHFy6p
 vsMqmZFHsZwgs/69gDvCUQime9zXMMwQHAUkP/M06cGN+9aPpdrG8jcHhzxGtyqF3w0CaGYBVsw
 8BNI
X-Received: by 2002:a05:600c:4f50:b0:4a1:d73d:4137 with SMTP id
 5b1f17b1804b1-4a211f11586mr39466305e9.28.1792761614376; 
 Fri, 23 Oct 2026 06:20:14 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e38063e62sm4701860f8f.57.2026.10.23.06.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:20:13 -0700 (PDT)
To: buildroot@buildroot.org,
	Peter Korsgaard <peter@korsgaard.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:20:09 +0200
Message-ID: <20261023132011.1606747-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014200935.3354206-1-peter@korsgaard.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libglib2: security bump to version
 2.88.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gTm8gQ1ZFcyBzcGVjaWZpZWQsIGJ1dCBORVdTIHN0YXRlczoKPiAKPiAh
NTM5NCBCYWNrcG9ydCB2YXJpb3VzIHNlY3VyaXR5IGZpeGVzIHRvIGdsaWItMi04OAo+IGh0dHBz
Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9nbGliLy0vbWVyZ2VfcmVxdWVzdHMvNTM5NAo+IAo+
IEFuZCBhIG51bWJlciBvZiBvdGhlciBidWdmaXhlczoKPiAKPiAqIEJ1Z3MgZml4ZWQ6Cj4gICAt
ICM0MDExIGdpby90ZXN0cy9zZXJ2aWNlczogSW5zdGFsbGVkIHNlcnZpY2UgZmlsZSBjb250YWlu
cyBidWlsZCBwYXRoIGFmdGVyCj4gICAgICE1MjU5IChKYWlwYXVsIENoZWVybmFtKQo+ICAgLSAj
NDAyMCDigJhUTFMgY2FsbGJhY2sgbm90IGludm9rZWTigJkgZXJyb3Igb24gbXN5czItY2xhbmc2
NCBDSSBqb2IgKEx1Y2EgQmFjY2kpCj4gICAtICE1MjYyIEJhY2twb3J0ICE1MjYxIOKAnGdpby90
ZXN0cy9zZXJ2aWNlczogRml4IGluc3RhbGxlZCBzZXJ2aWNlIGZpbGUKPiAgICAgY29udGFpbmlu
ZyBidWlsZCBwYXRo4oCdIHRvIGdsaWItMi04OAo+ICAgLSAhNTI3MyBCYWNrcG9ydCAhNTI2NiDi
gJxkb2NzOiBGaXggZ2lvIGdpLWRvY2dlbiBkb2NzX3VybOKAnSB0byBnbGliLTItODgKPiAgIC0g
ITUyODUgQmFja3BvcnQgITUyODMg4oCcZ2NvbnN0cnVjdG9yOiBSZWZlcmVuY2UgX3Rsc191c2Vk
IGFsc28gb24gR0NDLCBDTGFuZ+KAnQo+ICAgICB0byBnbGliLTItODgKPiAgIC0gITUzMjMgQmFj
a3BvcnQgITUzMTEg4oCcZml4OiBoYW5kbGUgbG9uZyBmaWxlbmFtZXMgaW4gdHJhc2ggYnkgdHJ1
bmNhdGluZyBmcm9tCj4gICAgIGZyb2504oCdIHRvIGdsaWItMi04OAo+ICAgLSAhNTM3OSBVcGRh
dGUgTm9yd2VnaWFuIE55bm9yc2sgdHJhbnNsYXRpb24KPiAgIC0gITUzOTQgQmFja3BvcnQgdmFy
aW91cyBzZWN1cml0eSBmaXhlcyB0byBnbGliLTItODgKPiAKPiAqIFRyYW5zbGF0aW9uIHVwZGF0
ZXM6Cj4gICAtIE5vcndlZ2lhbiBOeW5vcnNrIChSb3ktTWFnbmUgTW8pCj4gCj4gaHR0cHM6Ly9n
aXRsYWIuZ25vbWUub3JnL0dOT01FL2dsaWIvLS9ibG9iLzIuODguMy9ORVdTP3JlZl90eXBlPXRh
Z3MKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5j
b20+CgpBcHBsaWVkIHRvIDIwMjYuMDgueC4gVGhhbmtzCgo+IC0tLQo+ICBwYWNrYWdlL2xpYmds
aWIyL2xpYmdsaWIyLmhhc2ggfCA0ICsrLS0KPiAgcGFja2FnZS9saWJnbGliMi9saWJnbGliMi5t
ayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJnbGliMi9saWJnbGliMi5oYXNoIGIv
cGFja2FnZS9saWJnbGliMi9saWJnbGliMi5oYXNoCj4gaW5kZXggODk3MGVmNzRlMy4uOTViZjRk
MzE3OSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLmhhc2gKPiArKysg
Yi9wYWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAtIyBo
dHRwczovL2Rvd25sb2FkLmdub21lLm9yZy9zb3VyY2VzL2dsaWIvMi44OC9nbGliLTIuODguMy5z
aGEyNTZzdW0KPiAtc2hhMjU2ICBhYjI0ZDI0ZTY5OGRmYTFlNDA4YjdiY2RiNTA4ZjRhYWZjOTA2
MTg1YThiOGNlNzJmZGY3OWJiYmRjOWIzODNiICBnbGliLTIuODguMy50YXIueHoKPiArIyBodHRw
czovL2Rvd25sb2FkLmdub21lLm9yZy9zb3VyY2VzL2dsaWIvMi44OC9nbGliLTIuODguNC5zaGEy
NTZzdW0KPiArc2hhMjU2ICAyNWZkMTY5ZjNiMmY5MWZlMjM5MWFkMjk3ODgzY2UwZmNmMzBjNjlm
Yzc4OWZmZDFjOTY3MmQxMzMyYjFjNWE4ICBnbGliLTIuODguNC50YXIueHoKPiAgIyBMaWNlbnNl
IGZpbGVzLCBsb2NhbGx5IGNhbGN1bGF0ZWQKPiAgc2hhMjU2ICBmYTZmMzY2MzBiYjFlMGM1NzFk
MzRiMmJiZGYxODhkMDg0OTVjOWRiZjU4ZjI4Y2FjMTEyZjMwM2ZjMWY1OGZiICBDT1BZSU5HCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIubWsgYi9wYWNrYWdlL2xpYmds
aWIyL2xpYmdsaWIyLm1rCj4gaW5kZXggYmZlNDkyMDI5MS4uNDVhYTg5NGI4MSAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLm1rCj4gKysrIGIvcGFja2FnZS9saWJnbGli
Mi9saWJnbGliMi5tawo+IEBAIC01LDcgKzUsNyBAQAo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+ICAKPiAgTElCR0xJQjJfVkVSU0lPTl9NQUpPUiA9IDIuODgKPiAtTElCR0xJQjJfVkVSU0lP
TiA9ICQoTElCR0xJQjJfVkVSU0lPTl9NQUpPUikuMwo+ICtMSUJHTElCMl9WRVJTSU9OID0gJChM
SUJHTElCMl9WRVJTSU9OX01BSk9SKS40Cj4gIExJQkdMSUIyX1NPVVJDRSA9IGdsaWItJChMSUJH
TElCMl9WRVJTSU9OKS50YXIueHoKPiAgTElCR0xJQjJfU0lURSA9IGh0dHBzOi8vZG93bmxvYWQu
Z25vbWUub3JnL3NvdXJjZXMvZ2xpYi8kKExJQkdMSUIyX1ZFUlNJT05fTUFKT1IpCj4gIExJQkdM
SUIyX0xJQ0VOU0UgPSBMR1BMLTIuMSsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
