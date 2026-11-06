Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB24B606A332
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=odZjOYS2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE32581DF0;
	Fri,  6 Nov 2026 16:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 40DGkOrJask7; Fri,  6 Nov 2026 16:10:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AE65981D72
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981419;
	b=ZTgqyzr17uIDgRmUuMj+hV7nTki6LYfAsIc1C+0Dj8/XWGyHp5hqMqHu28Fb5GsKl19z
	 Dhhu56LCW3BwIwIxKpv7lAnSM9DFxV6S/WpmaDl+S6/F9Oiw+w+S7+bSz0sx/YPDD4zDB
	 U//GDfxD+zyynvZpYqPRmlTntcVrSY9wGmbvjbl+DVRcTCX4jntmganKvQCzSFyct60po
	 uRpffkeTm3317RAtxRPaJrwhHcq/aL4cbUPNc+FvO9atUDrR6+iqTdLcgW7eHe/DRfMEw
	 n7YPVga1dVoMUbNydExwa0bMYFN06S7OC5vx+Aa2TVwBkAjaNadv5E/RXDjPYu+Rt8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981419;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kuWlhsRAlLuTcljjCf5FDcp8qJbWVXV6ecErNL29RIQ=;
	b=SpnGTdOpw1j58wVjfFhCH5lf4qTGt3X+oZfbqcjwt5rLOdnd100D3w3oELBDZ37su8cn
	 YIr2BkKi+PdaKD1PeZf76AzlkObAaNIQqKYgMMlkNDv0bEl1/cJmxxrA1zWLfKdpSyAAE
	 KnMe1HDpUJP+ZY8vk35HA7jTUXQCu7+2wJK3chWtVR+69FQYnRJuLFm1UhNUc+y0SrtZx
	 nGO02zqJp9S6jypAKDSUaxktLqGcvBEmTv0hSnMMJzF6dvpvvS9sC9PIKXhP9QhXDAdDl
	 GUaJemn9idYAZFNGniUoN+qG4DpuJqsoR1pBNU+AHowZEwiFLNxwN65ecyWighAJhvA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981419;
	bh=kuWlhsRAlLuTcljjCf5FDcp8qJbWVXV6ecErNL29RIQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=odZjOYS2ejEJfj2jHZyLP53ZDSH9cO9uSBgRZ6SGVY0fh3DsZTEAjTlzwfupZzqhf
	 ihhSTb10J+LnlD7sARQ/tezfz6hwzNuRGOlp/RhEnAvjCZR+cPdOA01m3oNPK44nus
	 /uHSCS1Es7gE3duJbQIaEjV+feaYOcmpTZaNC8VsGx0VnfGZ/bh3KH7szUiRlfppX/
	 wmwlTfsNQ4n10V8NiDiItQIIoK1zg0XoS16XKRNpeUNO6a8heya9lMfs9INaK1zCPN
	 18qhGNBLKTO3NLbmdOkNIC7U+gvqgaqnY+N709a1VamQ6yRz79eT53ZUFIcyvNZWwF
	 BF/1gzoUkoLSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE65981D72;
	Fri,  6 Nov 2026 16:10:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DDD64B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0351681DEE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ijokddv-0JVW for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:10:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B828F81DA0
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B828F81DA0
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:15 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so7116355e9.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981413; x=1794586213;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=c4qvFWCBcWAVbI0FFmBlfaRHma4YkVd1MCR0zxZ8R3c=;
 b=uNZoKbmfCWs8F4AtGsVurLW3AfbJ1Xv4ruPEG4LEkgHqE0lCd7j247syIZzAH9ZMbe
 oEYtZNoWN70rmJXLxCkU2s8H8/kLtCJwHlZcDqyw6qH/lCiLtQbP929Z7+dL8uiIaJCb
 lapcuVKqXpRuHFsLc2wKnPFDN/HhJ7mPWXvaajIbKw51d1LZF2ias+xd8kSbtsM4GUVX
 yTxTuckbXdhx07VcrnTA/HKx09qo4ZMkZzDERJvm5av5EZ5OJYR2SpKPD17o1dNcV3tY
 rXcX9jxSfg3vaaQ7eBWRNR5HUZce4eHh/IKGvDt3vFoWBTkGf9okliQ62DXJgyyNeKya
 3YnQ==
X-Gm-Message-State: APuU4Z8yBt3LcpLW9xwJnz3+50+DTHs4XI/oilS8y8s84dJ3F2hcArxq
 hVoJEjl7OdCQXOByNCu2Zh00F94GZsxpU0yczFN0Ky5VfE9qbWnuQ8TQybuJUcH67LzP+1RyaZo
 OR9tsu7c=
X-Gm-Gg: AYBFou0oO3AwmpP4ikaKQc9wjlKJvJPUYZMb1jOiG8I4Kj7BqziVxTc/7uT3TXJEp/Y
 6M7dRq0Xzei19wtq2feluxvjn+1krWHMbuERqT8wxEMAPNxBFGrhYixdXFna/VDq8MKnvwKUhOq
 bliXJjB9V3RE7ud4iLZj7M/Y47+nbdbJxSN0e7RP+BL9WfjHTyWSAIuDFwFiE1/icVOEwFJcd9d
 LVe52dv78BSsi6676dCMQ3YO95r/AYqgx6qP+6hE6YkxfYVYnDaMcG6v4P1emIofF7lW+s19X3u
 xAKrqPsIQskCbrSuRS/rNrrNMJF9W9ZgbWv48C0V8HrrA69bxjh39/ZNL7oeHHFnL0xeuWiBgvV
 T6gsbnp6NJvUMcrl4CepKpduOpnrWUPIkiRJhskj0VOgNbAQ4ghjRji/EXuj24f6AyFLb+NhKGL
 C+UdrFmlb9wCsE3NCi4Sv+ByA72wQxYjqTKv8NoTF7DJQfDuwt1LNQVgDllG63d9PR7OofcxUAJ
 FMlwYh4fG7FQBVO9v6R2Mq3V1qb7mLZnG0ERa5uudnmm9AinpYthuFIDS+PI4C/AdyZQ/b8NPyX
 0X/T6RmirjvoHU4lkoojYD/p0aHHg5w=
X-Received: by 2002:a05:600c:314f:b0:4ac:aae6:6400 with SMTP id
 5b1f17b1804b1-4b6dddee0e3mr52952675e9.13.1793981413453; 
 Fri, 06 Nov 2026 08:10:13 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b76cbd0846sm3972485e9.3.2026.11.06.08.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:10:12 -0800 (PST)
To: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:10:09 +0100
Message-ID: <20261106161010.607518-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 01/14] package/boost: fix asio.hpp
 compile errors with gcc >= 15
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gVGhpcyBjb21taXQgdW5pbnRlbnRpb25hbGx5IGZpeGVkIGEgY29tcGls
ZSBlcnJvciB3aGVuIHByb2dyYW1zCj4gaW5jbHVkZSB0aGUgYXNpby5ocHAgaGVhZGVyIHdpdGgg
Z2NjIHZlcnNpb25zID49IDE1Lgo+IAo+IGBgYAo+IEluIGZ1bmN0aW9uIOKAmHZvaWQqIG1lbWNw
eSh2b2lkKiwgY29uc3Qgdm9pZCosIHNpemVfdCnigJksCj4gCj4gaW5saW5lZCBmcm9tIOKAmHN0
YXRpYyBib29zdDo6YXNpbzo6aXA6OmJhc2ljX3Jlc29sdmVyX3Jlc3VsdHM8SW50ZXJuZXRQcm90
b2NvbD4KPiAgICAgYm9vc3Q6OmFzaW86OmlwOjpiYXNpY19yZXNvbHZlcl9yZXN1bHRzPEludGVy
bmV0UHJvdG9jb2w+OjpjcmVhdGUoYm9vc3Q6OmFzaW86OmRldGFpbDo6YWRkcmluZm9fdHlwZSos
Cj4gICAgIGNvbnN0IHN0ZDo6c3RyaW5nJiwgY29uc3Qgc3RkOjpzdHJpbmcmKSBbd2l0aCBJbnRl
cm5ldFByb3RvY29sID0gYm9vc3Q6OmFzaW86OmlwOjp0Y3Bd4oCZCj4gICAgIGF0IC91c3IvaW5j
bHVkZS9ib29zdC9hc2lvL2lwL2Jhc2ljX3Jlc29sdmVyX3Jlc3VsdHMuaHBwOjE0NzoxNToKPiAK
PiAvdXNyL2luY2x1ZGUvYml0cy9zdHJpbmdfZm9ydGlmaWVkLmg6Mjk6MzM6Cj4gICAgIGVycm9y
OiDigJh2b2lkKiBfX2J1aWx0aW5fX19tZW1jcHlfY2hrKHZvaWQqLCBjb25zdCB2b2lkKiwgdW5z
aWduZWQgaW50LCB1bnNpZ25lZCBpbnQp4oCZCj4gICAgIGZvcm1pbmcgb2Zmc2V0IFsyOCwgMTI4
XSBpcyBvdXQgb2YgdGhlIGJvdW5kcyBbMCwgMjhdIG9mIG9iamVjdCDigJhlbmRwb2ludOKAmSB3
aXRoIHR5cGUKPiAgICAg4oCYYm9vc3Q6OmFzaW86OmlwOjp0Y3A6OmVuZHBvaW504oCZIHtha2Eg
4oCYYm9vc3Q6OmFzaW86OmlwOjpiYXNpY19lbmRwb2ludDxib29zdDo6YXNpbzo6aXA6OnRjcD7i
gJl9Cj4gICAgIFstV2Vycm9yPWFycmF5LWJvdW5kcz1dCj4gYGBgCj4gCj4gQmFja3BvcnQgVVJM
OiBodHRwczovL2dpdGh1Yi5jb20vYm9vc3RvcmcvYXNpby9jb21taXQvYjI0NzhhOWJhOWVkNzZk
N2M4NTg0MTllM2Y2NzdjYzQ1NDU5MWQ0NQo+IAo+IEZpeGVzOiBOb25lIHJlcG9ydGVkCj4gU2ln
bmVkLW9mZi1ieTogQWRhbSBEdXNrZXR0IDxhZGFtLmR1c2tldHRAYW1hcnVsYXNvbHV0aW9ucy5j
b20+CgpBcHBsaWVkIHRvIDIwMjYuMDgueC4gVGhhbmtzCgo+IC0tLQo+ICAuLi4wMDItcmVtb3Zl
LUZPUlRJRllfU09VUkNFLXdvcmthcm91bmQucGF0Y2ggfCA3NSArKysrKysrKysrKysrKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL2Jvb3N0LzAwMDItcmVtb3ZlLUZPUlRJRllfU09VUkNFLXdvcmthcm91bmQucGF0
Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ib29zdC8wMDAyLXJlbW92ZS1GT1JUSUZZX1NP
VVJDRS13b3JrYXJvdW5kLnBhdGNoIGIvcGFja2FnZS9ib29zdC8wMDAyLXJlbW92ZS1GT1JUSUZZ
X1NPVVJDRS13b3JrYXJvdW5kLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwLi5kMDQ0YjYyNjc2Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvYm9v
c3QvMDAwMi1yZW1vdmUtRk9SVElGWV9TT1VSQ0Utd29ya2Fyb3VuZC5wYXRjaAo+IEBAIC0wLDAg
KzEsNzUgQEAKPiArRnJvbSBiM2Q4N2RhNWY4N2UyOTA3ZWQwMDRlZGYxYzcyYWQzOTQyZmYxMTY1
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBDaHJpc3RvcGhlciBLb2hsaG9mZiA8
Y2hyaXNAa29obGhvZmYuY29tPgo+ICtEYXRlOiBXZWQsIDUgQXVnIDIwMjYgMTY6MDc6MTkgKzAy
MDAKPiArU3ViamVjdDogW1BBVENIXSBSZW1vdmUgX0ZPUlRJRllfU09VUkNFIHdvcmthcm91bmQu
Cj4gKwo+ICtUaGlzIGNvbW1pdCB1bmludGVudGlvbmFsbHkgZml4ZWQgYSBjb21waWxlIGVycm9y
IHdoZW4gcHJvZ3JhbXMKPiAraW5jbHVkZSB0aGUgYXNpby5ocHAgaGVhZGVyIHdpdGggZ2NjIHZl
cnNpb25zID49IDE1Lgo+ICsKPiArYGBgCj4gK0luIGZ1bmN0aW9uIOKAmHZvaWQqIG1lbWNweSh2
b2lkKiwgY29uc3Qgdm9pZCosIHNpemVfdCnigJksCj4gKwo+ICtpbmxpbmVkIGZyb20g4oCYc3Rh
dGljIGJvb3N0Ojphc2lvOjppcDo6YmFzaWNfcmVzb2x2ZXJfcmVzdWx0czxJbnRlcm5ldFByb3Rv
Y29sPgo+ICsgICAgYm9vc3Q6OmFzaW86OmlwOjpiYXNpY19yZXNvbHZlcl9yZXN1bHRzPEludGVy
bmV0UHJvdG9jb2w+OjpjcmVhdGUoYm9vc3Q6OmFzaW86OmRldGFpbDo6YWRkcmluZm9fdHlwZSos
Cj4gKyAgICBjb25zdCBzdGQ6OnN0cmluZyYsIGNvbnN0IHN0ZDo6c3RyaW5nJikgW3dpdGggSW50
ZXJuZXRQcm90b2NvbCA9IGJvb3N0Ojphc2lvOjppcDo6dGNwXeKAmQo+ICsgICAgYXQgL3Vzci9p
bmNsdWRlL2Jvb3N0L2FzaW8vaXAvYmFzaWNfcmVzb2x2ZXJfcmVzdWx0cy5ocHA6MTQ3OjE1Ogo+
ICsKPiArL3Vzci9pbmNsdWRlL2JpdHMvc3RyaW5nX2ZvcnRpZmllZC5oOjI5OjMzOgo+ICsgICAg
ZXJyb3I6IOKAmHZvaWQqIF9fYnVpbHRpbl9fX21lbWNweV9jaGsodm9pZCosIGNvbnN0IHZvaWQq
LCB1bnNpZ25lZCBpbnQsIHVuc2lnbmVkIGludCnigJkKPiArICAgIGZvcm1pbmcgb2Zmc2V0IFsy
OCwgMTI4XSBpcyBvdXQgb2YgdGhlIGJvdW5kcyBbMCwgMjhdIG9mIG9iamVjdCDigJhlbmRwb2lu
dOKAmSB3aXRoIHR5cGUKPiArICAgIOKAmGJvb3N0Ojphc2lvOjppcDo6dGNwOjplbmRwb2ludOKA
mSB7YWthIOKAmGJvb3N0Ojphc2lvOjppcDo6YmFzaWNfZW5kcG9pbnQ8Ym9vc3Q6OmFzaW86Omlw
Ojp0Y3A+4oCZfQo+ICsgICAgWy1XZXJyb3I9YXJyYXktYm91bmRzPV0KPiArYGBgCj4gKwo+ICsK
PiArT3JpZ2luYWwgcGF0Y2ggY29tbWl0IG1lc3NhZ2U6Cj4gK2BgYAo+ICtUaGUgcHJldmlvdXMg
d29ya2Fyb3VuZCBmb3IgX0ZPUlRJRllfU09VUkNFIHdhcm5pbmdzIGluY3JlYXNlZCB0aGUgc2l6
ZQo+ICtvZiBhbGwgSVAgZW5kcG9pbnQgb2JqZWN0cy4gSW5zdGVhZCwgdHJ5IGZpeGluZyB0aGUg
d2FybmluZyBhdCB0aGUgcG9pbnQKPiArd2hlcmUgaXQgb2NjdXJzLCBieSBsaW1pdGluZyB0aGUg
bGVuZ3RoIG1lbWNweS1lZCB3aGlsZSBwcm9jZXNzaW5nIHRoZQo+ICthZGRyaW5mbyByZXN1bHRz
IGZyb20gZ2V0YWRkcmluZm8uCj4gK2BgYAo+ICsKPiArVXBzdHJlYW06IEJhY2twb3J0IFtodHRw
czovL2dpdGh1Yi5jb20vYm9vc3RvcmcvYXNpby9jb21taXQvYjI0NzhhOWJhOWVkNzZkN2M4NTg0
MTllM2Y2NzdjYzQ1NDU5MWQ0NV0KPiArU2lnbmVkLW9mZi1ieTogQWRhbSBEdXNrZXR0IDxhZGFt
LmR1c2tldHRAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gK1NpZ25lZC1vZmYtYnk6IENocmlzdG9w
aGVyIEtvaGxob2ZmIDxjaHJpc0Brb2hsaG9mZi5jb20+Cj4gKy0tLQo+ICsgYm9vc3QvYXNpby9p
cC9iYXNpY19yZXNvbHZlcl9yZXN1bHRzLmhwcCB8IDIyICsrKysrKysrKysrKysrLS0tLS0tLS0K
PiArIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ICsK
PiArZGlmZiAtLWdpdCBhL2Jvb3N0L2FzaW8vaXAvYmFzaWNfcmVzb2x2ZXJfcmVzdWx0cy5ocHAg
Yi9ib29zdC9hc2lvL2lwL2Jhc2ljX3Jlc29sdmVyX3Jlc3VsdHMuaHBwCj4gK2luZGV4IDAxMjc0
NzNlMi4uODdmYTNmYWRmIDEwMDY0NAo+ICstLS0gYS9ib29zdC9hc2lvL2lwL2Jhc2ljX3Jlc29s
dmVyX3Jlc3VsdHMuaHBwCj4gKysrKyBiL2Jvb3N0L2FzaW8vaXAvYmFzaWNfcmVzb2x2ZXJfcmVz
dWx0cy5ocHAKPiArQEAgLTE0MSwxNCArMTQxLDIwIEBAIHB1YmxpYzoKPiArICAgICAgIGlmIChh
ZGRyZXNzX2luZm8tPmFpX2ZhbWlseSA9PSBCT09TVF9BU0lPX09TX0RFRihBRl9JTkVUKQo+ICsg
ICAgICAgICAgIHx8IGFkZHJlc3NfaW5mby0+YWlfZmFtaWx5ID09IEJPT1NUX0FTSU9fT1NfREVG
KEFGX0lORVQ2KSkKPiArICAgICAgIHsKPiArLSAgICAgICAgdXNpbmcgbmFtZXNwYWNlIHN0ZDsg
Ly8gRm9yIG1lbWNweS4KPiArLSAgICAgICAgdHlwZW5hbWUgSW50ZXJuZXRQcm90b2NvbDo6ZW5k
cG9pbnQgZW5kcG9pbnQ7Cj4gKy0gICAgICAgIGVuZHBvaW50LnJlc2l6ZShzdGF0aWNfY2FzdDxz
dGQ6OnNpemVfdD4oYWRkcmVzc19pbmZvLT5haV9hZGRybGVuKSk7Cj4gKy0gICAgICAgIG1lbWNw
eShlbmRwb2ludC5kYXRhKCksIGFkZHJlc3NfaW5mby0+YWlfYWRkciwKPiArLSAgICAgICAgICAg
IGFkZHJlc3NfaW5mby0+YWlfYWRkcmxlbik7Cj4gKy0gICAgICAgIHJlc3VsdHMudmFsdWVzXy0+
cHVzaF9iYWNrKAo+ICstICAgICAgICAgICAgYmFzaWNfcmVzb2x2ZXJfZW50cnk8SW50ZXJuZXRQ
cm90b2NvbD4oZW5kcG9pbnQsCj4gKy0gICAgICAgICAgICAgIGFjdHVhbF9ob3N0X25hbWUsIHNl
cnZpY2VfbmFtZSkpOwo+ICsrICAgICAgICBjb25zdCBzdGQ6OnNpemVfdCBleHBlY3RlZF9zaXpl
ID0KPiArKyAgICAgICAgICBhZGRyZXNzX2luZm8tPmFpX2ZhbWlseSA9PSBCT09TVF9BU0lPX09T
X0RFRihBRl9JTkVUKQo+ICsrICAgICAgICAgICAgPyBzaXplb2YoYm9vc3Q6OmFzaW86OmRldGFp
bDo6c29ja2FkZHJfaW40X3R5cGUpCj4gKysgICAgICAgICAgICA6IHNpemVvZihib29zdDo6YXNp
bzo6ZGV0YWlsOjpzb2NrYWRkcl9pbjZfdHlwZSk7Cj4gKysgICAgICAgIGlmIChhZGRyZXNzX2lu
Zm8tPmFpX2FkZHJsZW4gPj0gZXhwZWN0ZWRfc2l6ZSkKPiArKyAgICAgICAgewo+ICsrICAgICAg
ICAgIHVzaW5nIG5hbWVzcGFjZSBzdGQ7IC8vIEZvciBtZW1jcHkuCj4gKysgICAgICAgICAgdHlw
ZW5hbWUgSW50ZXJuZXRQcm90b2NvbDo6ZW5kcG9pbnQgZW5kcG9pbnQ7Cj4gKysgICAgICAgICAg
ZW5kcG9pbnQucmVzaXplKGV4cGVjdGVkX3NpemUpOwo+ICsrICAgICAgICAgIG1lbWNweShlbmRw
b2ludC5kYXRhKCksIGFkZHJlc3NfaW5mby0+YWlfYWRkciwgZXhwZWN0ZWRfc2l6ZSk7Cj4gKysg
ICAgICAgICAgcmVzdWx0cy52YWx1ZXNfLT5wdXNoX2JhY2soCj4gKysgICAgICAgICAgICAgIGJh
c2ljX3Jlc29sdmVyX2VudHJ5PEludGVybmV0UHJvdG9jb2w+KGVuZHBvaW50LAo+ICsrICAgICAg
ICAgICAgICAgIGFjdHVhbF9ob3N0X25hbWUsIHNlcnZpY2VfbmFtZSkpOwo+ICsrICAgICAgICB9
Cj4gKyAgICAgICB9Cj4gKyAgICAgICBhZGRyZXNzX2luZm8gPSBhZGRyZXNzX2luZm8tPmFpX25l
eHQ7Cj4gKyAgICAgfQo+ICstLSAKPiArMi41NS4wCj4gKwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
