Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6965606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HHs+hb4H
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3B0340BD0;
	Fri, 30 Oct 2026 15:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZGNjPQmIzJo; Fri, 30 Oct 2026 15:27:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AF4A640BE8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374033;
	b=D7JFGIfReNf64Hz0gqcFEn7J0V8nLnOAMBsm45V0xRgLecElqSp0JEv1Hu9t9tYvvyhv
	 UmiNAeJ+xuijlxJGpl9fcIYcJJA4YlJcwgqDl3IO0oUuELzeEtQz8FUjd6FPGkqGjDKmI
	 F8aogmtqmyNYJsfp71tYtNhb+r73wFPGeTNJTaXEcnM+Sp1YaleechTnb1IbqKfBx7ir6
	 6+Ih4bU2oFFsJHc/XFWD7ilWckyltNoM9xj+zh0Sxqo4oBhHJvb4tlT1DzS7PQh3EUQrR
	 0eIH3AU+qdPs5dr2Ypg6G38f7pCh49cXlFUAuCV2IoTVKo61tsaRwSjwHjsvORWhCPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374033;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Mh32AIJEQ/7G9MRbQvcX3kW2o7yjfk3dqWADNI1sqeQ=;
	b=DAS8cII1cmv0UMXpdqUosTMX7p2llsjcdPeohSHYeqt4YvGSpdUUDHkX6+1w98z8FJI7
	 SQHR6Hiyn3xku8OV/2vwwaHbsFITDfOeqQeuGfw2W5ueiygiTsBxxdjl1KnGPUTmfyAXC
	 7VWkoGBJn7b2ohzfDft9a0XYmKJjsvU37Dzj5zWjJmEwYgW4rG/ez/JhupnBOlxYNayKp
	 SeglLmiypfiyLjmhotHTTKJzpiclegvKXHJWl3gdMQ1n/Jq9Dw8Wh0UsySPFsKK7O0xAP
	 NtnaVI6BZj+v/CZlnhy+nNlvGlQZdDfqj8nJ6Cggtrc0GzOIdaZC4n1ApKs2DCJSGJw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374033;
	bh=Mh32AIJEQ/7G9MRbQvcX3kW2o7yjfk3dqWADNI1sqeQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HHs+hb4HJ30KRPUjt4eneyjUVEpAIbbqyccSoizDvPyV/cvwtT243L2mfhXKyUHBC
	 dRAXsHYE5745aaQvPjCaHgqDqduDWj7dFNh92xaG9nazCc7GnGkjxII0fo2yEiQOLF
	 30ZeR/Ylm4awNev/Xroh28krK2PO7oX2q+wSqG+voM6gvogWQJ9nqIcq7XlYJLuTFu
	 yEWSHpSXwyuC+YmqRaapWFIycUFsWGHgHyiTsCLYU7pVFf6+3aH+NUbUuhxERDg/r9
	 /qZHwY4KQM0cROTb4FRk4oZVB8mUi4tYfiGAgmZIEOSTMjtZbwRraCG7Zzryqpe6Qo
	 JkxxPO3nzwyvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF4A640BE8;
	Fri, 30 Oct 2026 15:27:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8CFBD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA64040530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnB58u6yg-kL for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C44F140211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374000;
 b=MmP2AyYir03LylUT2Jnh4GSyVrXi/Vt0Cv37yWgwmupaay2BFpJvu6jbzehnfhqgRdiB
 vxvrsozCTcJvaWRpcw3i1zLZ4iF8HdWm4if7i7LQohRRWGsMdDMEzLkVBWRbTPCDSDXUq
 +rLLJFq0JAwp5QXIx/0qQMJqlLEJH0mGwHSPsA00Icn8KiDFSmlmM3LaHpvu0pmuy3cvF
 W68nQ1RAD1guci3eJnoXQA8o4P1LWI/K40I/JNNVHssFzOQnwryHluPMfoQhgHIX7BUnv
 cu4GRydiehOiH+ySPyQkrjO3/vX5Zfaf9AWGR3slLk7lC3BNQzhpXFPEgtE6UzLa8lA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374000;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=4io9oVm9rQmOjwdMBM2Lv3eLcC0yDp56CUhCbpwAegM=;
 b=nfrJsdoqvsX1q2yTs5HYM/gP6d+0mNW5WEASvh40M8QdXjV/FEISZiBfuyq2u9v2Ear3
 cJUuw2JjeKFWUhgSjUFj8QBPakviC+NVBdeN0FbYjj5OY3HG/saM85QP3wlJfRI3tMt3K
 HjO7V69xZY7WJJ/oqwAFA1teQyk/zjojGstheAHrLhYCe0KJSu/+cuuNF2Kldd17uvJrd
 91wMzVr+z8xLp+awyQsNMyx9sImGSdKgZ7hUTCJwz5MV7+2uqkPh1zc5fTKgbuEWnD7XZ
 e094kWwVvDcEiKBLTjuuvl6z9faHsgh66W0f1KclJkBu2wT+naAkXvuMwrNX6BVU3fQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TjiSOYaL; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C44F140211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:38 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48e09aa5264so425685f8f.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373997; x=1793978797;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4io9oVm9rQmOjwdMBM2Lv3eLcC0yDp56CUhCbpwAegM=;
 b=TVDRxUBl5e1wOBJOecffxnZ/d9T/UDNBoMUgJo5EgjPPU6Vfdcjb8b9FMH/PlX29O4
 6MXqVmjsGvAno8Bo0xN1wySI0iTg3VKvb2ViouuGR0ik4O8i4YXlsv45kfyPWQ0Tttpo
 tM9H+MavqJUWALqYK6jM5/Wt6Voo7SKIl6LW4IZsPm3lxnFgs/B5W1FBZv8Y7MS7DuZY
 eMkGNtUCwDdT02vIHTdqMYuRw+LVYRZC+DlU6KKwxxOIDSfEp94kv66+JISFNPCKkNPz
 PsMclfhAykcFOO8U7caw7KXiG0tgShCP2ODFwUTNupHQaQbPm1NzSU53H9fdsbAVyibw
 +R5w==
X-Gm-Message-State: AFq9FYJSG8eI2lcToSL9VN8tzf/IJJEb3SPOiezR3bVQ5VP+hcUk8rrn
 5m5vMJ1sr+ZJjlaYGufsCplTr8ewBKbE2sLmLurEvTXvSv7m0lDKkLoDrE1ilUOpLO13033LRgm
 ctQyG+64=
X-Gm-Gg: AYBFou0AqPWHLhz6+VbQO70xGt8c54NNCWqRodvNxp3yWHFhz58kj+WxxMEy9DokCE4
 4GSRj3SnHsDFjhdEhst1YMT+Y3sEQpS9LG30d1cfDQGObJwu5DSyhZYpEY4rm+8OyeR0g6tdlYz
 yV1aGe/UOqDZQ7F5N9Tjnn5CrgvB9hcnE0BdYsNKvYtt32DzqrynbTy5+K+G59Y1FkJCFg2sWAM
 YfB36UuQGj8wL3L/NW6Je72ODzxcSyeuV2PkyF/CdVfeG6jT+XM5uGnjxQUY+chtfR7jcOw9AB9
 QcfNBJBfp5nVt3c/V35yZPInwHo/2Mj5vXdUHksLHhq+9ERQJQVo3WnYgPZAWLjAuC2uO3llFxA
 7CoDmY4aJUnkl3o5twJB+TNjs6wghF1p9XKQYDxfj8PUXIhJsUtZWMpKUlYXCHXORbSbIW/9WxB
 TeA/IXsJng2aEWicOipq+s6WbljvJ8x5rOiQlFsfohC3kiXtva0IRQauR9gRiIAYkinWDedhy1q
 YmWiCeXJUXCMw+EHVeapyusb7XXtvdxxq4VEPF750J4qmbILbaVQpyOvjmEuvLrTdbGzrGSkI88
 fM7vqB1fTLwrUTntmHyzFGFg4tj2Knep93T2lqq93CusoEH76wyACWjdUnMMqUu3pXX6x/zA
X-Received: by 2002:a05:6000:2610:b0:48e:3647:c35d with SMTP id
 ffacd0b85a97d-48e6e2fcdfcmr7227712f8f.21.1793373997093; 
 Fri, 30 Oct 2026 08:26:37 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm3794215f8f.45.2026.10.30.08.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:36 -0700 (PDT)
To: buildroot@buildroot.org,
	Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:33 +0100
Message-ID: <20261030152635.1906276-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016123321.7165-2-flaviu.nistor@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 2/2] support/testing: add snappy test
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gQWRkIGEgc2ltcGxlIHRlc3QgY2FzZSB0aGF0IGltcG9ydHMgdGhlIG1v
ZHVsZSBhbmQgZG9lcyBhIHNpbXBsZSBjb21wcmVzcwo+IGRlY29tcHJlc3Mgcm91dGluZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBGbGF2aXUgTmlzdG9yIDxmbGF2aXUubmlzdG9yQGdtYWlsLmNvbT4K
CkFwcGxpZWQgdG8gMjAyNS4wMi54LCAyMDI2LjA4LnguIFRoYW5rcwoKPiAtLS0KPiBDaGFuZ2Vz
IGluIHY1Ogo+IC0gVXNlIGRlZmF1bHQgYXJtdjUgZm9yIHRoZSB0ZXN0IHNpbmNlIGNyYW1qYW0g
ZG9lcyBub3QgZmFpbCB0byBydW4gb24gMzItYml0Cj4gYXJjaGl0ZWN0dXJlcyBvbiB2ZXJzaW9u
IDIuMTQuMCBvbiB3aGljaCBweXRob24tc25hcHB5IGRlcGVuZHMgb24uIAo+IC0gTGluayB0byB2
NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYxMDAyMTAzMTQ0LjEzOTE0LTMtZmxh
dml1Lm5pc3RvckBnbWFpbC5jb20vCj4gCj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCj4gIC4uLi90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2Uvc2FtcGxlX3B5dGhvbl9zbmFwcHkucHkgICB8ICA1ICsrKysrCj4gIHN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3NuYXBweS5weSB8IDEzICsrKysrKysrKysrKysK
PiAgMyBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3NuYXBweS5weQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9w
eXRob25fc25hcHB5LnB5Cj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJT
Cj4gaW5kZXggMjc3M2YwNzc2YS4uOTk5NDYzMGM2ZiAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJT
Cj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0xMTQ3LDYgKzExNDcsOCBAQCBGOglzdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9weXJvdXRlMi5weQo+ICBOOglGbGF2aXUg
TmlzdG9yIDxmbGF2aXUubmlzdG9yQGdtYWlsLmNvbT4KPiAgRjoJcGFja2FnZS9weXRob24tY3Jh
bWphbS8KPiAgRjoJcGFja2FnZS9weXRob24tc25hcHB5Lwo+ICtGOglzdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zbmFwcHkucHkKPiArRjoJc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zbmFwcHkucHkKPiAgCj4gIE46CUZsw6F2aW8g
VGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgo+ICBGOgljb25maWdzL2Fz
dXNfdGlua2VyLXNfcmszMjg4X2RlZmNvbmZpZwo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3NuYXBweS5weSBiL3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc25hcHB5LnB5Cj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi44NDJhNGU5OGU1Cj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc25hcHB5LnB5
Cj4gQEAgLTAsMCArMSw1IEBACj4gK2ltcG9ydCBzbmFwcHkKPiArCj4gK3BheWxvYWQgPSBiIkJ1
aWxkcm9vdCBweXRob24tc25hcHB5IHJ1bnRpbWUgdGVzdFxuIgo+ICtjb21wcmVzc2VkID0gc25h
cHB5LmNvbXByZXNzKHBheWxvYWQpCj4gK2RlY29tcHJlc3NlZCA9IHNuYXBweS51bmNvbXByZXNz
KGNvbXByZXNzZWQpCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3RfcHl0aG9uX3NuYXBweS5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfcHl0aG9uX3NuYXBweS5weQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMC4uMWMwN2RkYzFlOAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zbmFwcHkucHkKPiBAQCAtMCwwICsxLDEzIEBACj4g
K2ltcG9ydCBvcwo+ICsKPiArZnJvbSB0ZXN0cy5wYWNrYWdlLnRlc3RfcHl0aG9uIGltcG9ydCBU
ZXN0UHl0aG9uUGFja2FnZUJhc2UKPiArCj4gKwo+ICtjbGFzcyBUZXN0UHl0aG9uUHkzU25hcHB5
KFRlc3RQeXRob25QYWNrYWdlQmFzZSk6Cj4gKyAgICBfX3Rlc3RfXyA9IFRydWUKPiArICAgIGNv
bmZpZyA9IFRlc3RQeXRob25QYWNrYWdlQmFzZS5jb25maWcgKyBcCj4gKyAgICAgICAgIiIiCj4g
KyAgICAgICAgQlIyX1BBQ0tBR0VfUFlUSE9OMz15Cj4gKyAgICAgICAgQlIyX1BBQ0tBR0VfUFlU
SE9OX1NOQVBQWT15Cj4gKyAgICAgICAgIiIiCj4gKyAgICBzYW1wbGVfc2NyaXB0cyA9IFsidGVz
dHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3NuYXBweS5weSJdCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
