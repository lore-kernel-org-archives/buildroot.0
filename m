Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09815606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=C2XF7/Qh
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69BB840547;
	Mon, 16 Nov 2026 15:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECAJWJ7IAVWf; Mon, 16 Nov 2026 15:39:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D5D804074F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843558;
	b=iiNocrT8WNGMsm/K1m7VK1SfzcPeLK/TEmDhdtkYoowgHGP0CbcYIPgy8VTMLeJQvAin
	 1MJB9UrdLlc73SeswmtflXN+K1mXI4eFM6z/fUe/op+mPsJXM8s/QCZdOYTvqT3Uv6+dr
	 +H2CV5IFFZSLc86VX1PhsIbFZlnoiLna+bf3TpTqRLvuX47VGb7dKEMv/627a+foseFkt
	 tIEW88ORqpmVeodJECzZ2qiVG/X+nNmaYB9iN7xnPgH3tAs3YYUyPfGTTqTeOq4HV7hlh
	 EtR/Ez90V4VQIZSn+63SLjQ05gHZbPP8jtTNMwj+AnZMnzMw/lqrT7QWJanfI88trxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843558;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2MqD5Gv5vt0n8gEDRcxHlSi20/I5HYFbWjPOM2LXJyY=;
	b=YKREZsFR/enhP/P0KVjEdzIOknHRSV100N/+H+xec4EpP4b4ZX5W1GYxImfjl93pEJ2R
	 uEgsZlLDMY8Swzjhj0xlV5Gsvh9laLS52cl6UlfRe7z2sStj3WjjR5p7ygrtYsM+bwPGi
	 /OOD4dODGQl9BKuMIxn7bcDaz5ljxqYz420r3MVSPYYfKkyC0TTt7v2uBdH0iA62lG4Gb
	 ABZZms7cdMt1i3Ow+UEFF2nrPtdcgYpV6OHoiyCtbUtc8xzkgpLFOs+PmKNtvwGXQXESE
	 CR9llSOnBJwLdIQSjVBlUJ5jU7uMRC38nvpqTLYkCf7A01gs+a5jZqajnCTp6bXaSyg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843557;
	bh=2MqD5Gv5vt0n8gEDRcxHlSi20/I5HYFbWjPOM2LXJyY=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=C2XF7/QhFezHjDpUjJnsZHPCNTicNj22j+Nqabov6//WFTPXpIkHgPbDfTlljs01I
	 IIdA68iVR2dxhZsOwp6x1VFQQF/GHZ8tZHvKzuK0JimnrxXkVMyA+T4RsSEs4s3cvw
	 brh5/D9DEzGqauNODLmqFSIMSKOgRg/1ZMtDi0I8MPIDgSqsxf+Wx2nejix002VGNd
	 elM4md75XrHIo4DT5BFgfCxcgZk1mpwc+xu6Ue3rOkxv8Xpv+3gIk/u5V3dA7ydSO6
	 sedaH5K9p7Ps8I5AOWzoODjgtjgA2CWh9cWITQD3Oe5pVsTWA2HXRDX5WSJPGp68oQ
	 A21qYU/TWL0Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5D804074F;
	Mon, 16 Nov 2026 15:39:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FD42109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65DD640282
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rRg70kR-VSg for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:39:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 53ECB4009E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53ECB4009E
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:14 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so29869995e9.2
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843553; x=1795448353;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DCPisAGp9exLUqcCBb0opFcu8D5Ox9vVJH7ZUzAZNjI=;
 b=emQ8oaTrwW8dYJGoPg3k+L4PALE2Ax39PUr2PG+sZZAIydn/DK47YdLlusE4O2/Glx
 IbCueT146Hj2V9L9kEswwbGkXekd2rNRvx+pTE2pE4e2ZoJ12tqunUCIc3MU7nBViPXz
 UpCdDYDBJc73GPmu14Iybfrcg0KoI6adHu2TdQDSAVR4cdN/jacc916IXveB68wVmCf+
 UieNdGF1AzSlA7tLp3xSD1jmuIEvzvkIf1vCBB+Jick2jnlaQuAsbVK5nA9RZTvjA8GV
 BlUdyb6Af4UYFkStODrBpJ7uN+B6SxhrppqoA2X4YUKeWckqqaJnYnEuBknvwBpOawSq
 thbA==
X-Gm-Message-State: APuU4Z+MPRc1yWi61UExizHHtrWcADs1IX9YXWVrUcSO9fXPVKNmgVHD
 +VuAgHXMJb0xXaIpnDsSMM8b4ABGkwq2pUhkGjb7c56PeXL6IFMJAlCeHhFaK0B18uOBt8GOnRi
 /nn3jHI8=
X-Gm-Gg: AYBFou23kVK56aBQgEQn3EKBEPyxcDcmZG4ZJp7892w9cnp+idCqm2IhDb1R+cgt93f
 Gun5lMa3zn/oHJi83pczLFSHWf+Yr4RrxlUkGExGn7h7T3yRcr6/HXHQasBUoF2nrE8ADRv5SPd
 +MAW88Fjwr+dmcHJjxbMFD1FdtC9MiINVBU4p9gPoIthgwJcyE51EXC8YJy7CtXsCs2UQqipBrX
 IyLmUbL4cfwD2Md+d/3r9Y8PI0HPrBZr6LgivNi5f6dmQyqIEzG+1eVx2pLIQaycyVfcX3aqQJt
 DIOFRBV3cNn95sIjcdIk+/b2aPulSP8fd71Erp04ESCUvTRTLfkbF87R3myaC7orOKXVAKs66P8
 K0ObLcJzkjL5ALrpsH57Std6cvvhPxgbqu/YXw0K8MySkNijHxescoU7KC1EhBjqoK+rSoqpdIY
 B40vOSa2COk+eUz1VsLNhNNrgrZPmSLrvViQHh5VYn7XgbuzeuBDVqOYhFLcqabbdzeXv+rkMdh
 mTQEbpwEICNC6GZHsR/4HsHvxAFP/7D//ow8Srf7RnkTqfGr4fkbZTN5eC5BIKJjS32J42n1NgU
 iaOkwdXkpivNPyvuQr9Xrb9nUmppX6dOTTeGqr2OE0U18Ch0lgpp
X-Received: by 2002:a05:600c:8b65:b0:4bb:6a5a:783d with SMTP id
 5b1f17b1804b1-4bb6a5a795dmr100195015e9.18.1794843553176; 
 Mon, 16 Nov 2026 07:39:13 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e47sm18992881f8f.14.2026.11.16.07.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:39:12 -0800 (PST)
To: buildroot@buildroot.org,
 =?utf-8?b?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:10 +0100
Message-ID: <20261116153911.725228-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029215007.1788801-3-raphael.melotte@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for, 2025.02.x,
 2026.08.x 3/4] package/mupdf: add upstream security fix for
 CVE-2026-40505
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwu
bWVsb3R0ZUBtaW5kLmJlPgoKQXBwbGllZCB0byAyMDI1LjAyLnguIFRoYW5rcwoKPiAtLS0KPiAg
Li4ub24tdC1wcmludC1yYXctZm9udC1uYW1lLXRvLXRlcm1pbmFsLnBhdGNoIHwgMjggKysrKysr
KysrKysrKysrKysrKwo+ICBwYWNrYWdlL211cGRmL211cGRmLm1rICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMyArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbXVwZGYvMDAwNC1idWctNzA5MTA4LWRvbi10LXByaW50
LXJhdy1mb250LW5hbWUtdG8tdGVybWluYWwucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9tdXBkZi8wMDA0LWJ1Zy03MDkxMDgtZG9uLXQtcHJpbnQtcmF3LWZvbnQtbmFtZS10by10ZXJt
aW5hbC5wYXRjaCBiL3BhY2thZ2UvbXVwZGYvMDAwNC1idWctNzA5MTA4LWRvbi10LXByaW50LXJh
dy1mb250LW5hbWUtdG8tdGVybWluYWwucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAuLmQ5MWZkZjQ5ZjAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2Fn
ZS9tdXBkZi8wMDA0LWJ1Zy03MDkxMDgtZG9uLXQtcHJpbnQtcmF3LWZvbnQtbmFtZS10by10ZXJt
aW5hbC5wYXRjaAo+IEBAIC0wLDAgKzEsMjggQEAKPiArRnJvbSBjMTljODJlNDZhZmZlOGQ0MDcw
ZjU1MTRhM2EzMDcyNThmOWRmYmQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBU
b3IgQW5kZXJzc29uIDx0b3IuYW5kZXJzc29uQGFydGlmZXguY29tPgo+ICtEYXRlOiBNb24sIDkg
RmViIDIwMjYgMTc6NDQ6MDUgKzAxMDAKPiArU3ViamVjdDogW1BBVENIXSBCdWcgNzA5MTA4OiBE
b24ndCBwcmludCByYXcgZm9udCBuYW1lIHRvIHRlcm1pbmFsLgo+ICsKPiArVXNlICVxIHRvIGZv
cm1hdCB0aGUgZm9udCBuYW1lIGFzIGEgcXVvdGVkIHN0cmluZy4KPiArCj4gKyhjaGVycnkgcGlj
a2VkIGZyb20gY29tbWl0IDBmMTdkNzg5ZmU4YzI5YjQxZTQ3NjYzYmU4MjUxNGFhY2EzYTRkZmIp
Cj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vQXJ0aWZleFNvZnR3YXJlL211cGRmL2Nv
bW1pdC8wZjE3ZDc4OWZlOGMyOWI0MWU0NzY2M2JlODI1MTRhYWNhM2E0ZGZiCj4gK0NWRTogQ1ZF
LTIwMjYtNDA1MDUKPiArU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwu
bWVsb3R0ZUBtaW5kLmJlPgo+ICstLS0KPiArIHNvdXJjZS90b29scy9wZGZpbmZvLmMgfCAyICst
Cj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiArCj4g
K2RpZmYgLS1naXQgYS9zb3VyY2UvdG9vbHMvcGRmaW5mby5jIGIvc291cmNlL3Rvb2xzL3BkZmlu
Zm8uYwo+ICtpbmRleCBiYzRjMDdlZGMuLmFiNGU2NjMwMSAxMDA2NDQKPiArLS0tIGEvc291cmNl
L3Rvb2xzL3BkZmluZm8uYwo+ICsrKysgYi9zb3VyY2UvdG9vbHMvcGRmaW5mby5jCj4gK0BAIC03
MTcsNyArNzE3LDcgQEAgcHJpbnRpbmZvKGZ6X2NvbnRleHQgKmN0eCwgZ2xvYmFscyAqZ2xvLCBj
aGFyICpmaWxlbmFtZSwgaW50IHNob3csIGludCBwYWdlKQo+ICsgCQlmel93cml0ZV9wcmludGYo
Y3R4LCBvdXQsICJGb250cyAoJWQpOlxuIiwgZ2xvLT5mb250cyk7Cj4gKyAJCWZvciAoaSA9IDA7
IGkgPCBnbG8tPmZvbnRzOyBpKyspCj4gKyAJCXsKPiArLQkJCWZ6X3dyaXRlX3ByaW50ZihjdHgs
IG91dCwgUEFHRV9GTVRfenUgIiVzICclcycgJXMlcyglZCAwIFIpXG4iLAo+ICsrCQkJZnpfd3Jp
dGVfcHJpbnRmKGN0eCwgb3V0LCBQQUdFX0ZNVF96dSAiJXMgJXEgJXMlcyglZCAwIFIpXG4iLAo+
ICsgCQkJCWdsby0+Zm9udFtpXS5wYWdlLAo+ICsgCQkJCXBkZl90b19udW0oY3R4LCBnbG8tPmZv
bnRbaV0ucGFnZXJlZiksCj4gKyAJCQkJcGRmX3RvX25hbWUoY3R4LCBnbG8tPmZvbnRbaV0udS5m
b250LnN1YnR5cGUpLAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL211cGRmL211cGRmLm1rIGIvcGFj
a2FnZS9tdXBkZi9tdXBkZi5tawo+IGluZGV4IDc2ZTVkYjlmNmQuLmFjOTA5NWEyZmIgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9tdXBkZi9tdXBkZi5tawo+ICsrKyBiL3BhY2thZ2UvbXVwZGYvbXVw
ZGYubWsKPiBAQCAtMzYsNiArMzYsOSBAQCBNVVBERl9JR05PUkVfQ1ZFUyArPSBDVkUtMjAyNS00
NjIwNgo+ICAjIDAwMDMtYnVnLTcwODg0MC11c2UtaXRlcmF0aW9uLWZvci12YWx1ZS1mcm9tLWlu
aGVyaXRhYmxlLXByb3BlcnR5LnBhdGNoCj4gIE1VUERGX0lHTk9SRV9DVkVTICs9IENWRS0yMDI1
LTcxMzgyCj4gIAo+ICsjIDAwMDQtYnVnLTcwOTEwOC1kb24tdC1wcmludC1yYXctZm9udC1uYW1l
LXRvLXRlcm1pbmFsLnBhdGNoCj4gK01VUERGX0lHTk9SRV9DVkVTICs9IENWRS0yMDI2LTQwNTA1
Cj4gKwo+ICAjIG11cGRmIGRvZXNuJ3QgdXNlIENGTEFHUyBhbmQgTElCUyBidXQgWENGTEFHUyBh
bmQgWExJQlMgaW5zdGVhZC4KPiAgIyB3aXRoIFVTRV9TWVNURU1fTElCUyBpdCB3aWxsIHRyeSB0
byB1c2Ugc3lzdGVtIGxpYnJhcmllcyBpbnN0ZWFkIG9mIHRoZSBidW5kbGVkIG9uZXMuCj4gIE1V
UERGX01BS0VfRU5WID0gJChUQVJHRVRfTUFLRV9FTlYpICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRT
KSBcCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
