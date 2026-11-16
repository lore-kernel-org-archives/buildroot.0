Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E0F606A32F
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j67Twy9Q
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9118360833;
	Mon, 16 Nov 2026 15:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ln-OWmdTmNYV; Mon, 16 Nov 2026 15:39:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A71CE60821
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843580;
	b=lDGbjup6Sf8Hhuuz0UCrKFoidgih6NdLMQIDF86vghdgk8eEe/vKypuPoTjz6n9RFKKg
	 TLQySCDZPz2qfAhKVgXcgxFmnlvOmBLKamS2nMqWLFHwpANhk3wsm4UJVChH4bgVwFWGv
	 ulHFDPLckP/Hrw4F3CFG8/a5mc8/174Gk1eBKeIooFlGEd6ZMsVENtNetUKY6iGPlLPDL
	 gRDi1geLttoAz0zWDIpmiaJ+cyFOKlYcx/aJx0rIVPZn45l7E56fMz1z9PPlcTa/Wrqkc
	 isa7ZJvesGtIE+dvd5dCBFHUChjIB2VL/16jxJcNzS2oa1L2Vp/ASxVUqYseuJO/NQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CHItHJo3dUAOv0TG5yke73+hcTb0YYy0p0fpWvo/54Y=;
	b=M9SnCdxOatL669mI1cEeE4b9w0xU9ido3tjtpxcoGiov7Rz1EYGGo90GE/xpC63pctQk
	 +zjOL7aAmmipnPs3p+rKtaG+TdHBo4FkXQs+xKQGjVYaENu10c0tMsZmai6Hsgn58waRv
	 FHSOoQmT/QKygml3DEhMh1b2chXFtPuNDwDThStZBBDmq9rXNnoTqGoD5+BxGBT3Xr1Ri
	 OzaqiGpBdPv94dNUXWa9qwOZqtYQYJR+/hlViEpji1o1Sjmlr+51t9H2O2p2tqhW1fpVV
	 Zwi3FobPJMR+GUWUul6NTeCztGLSGxFWNYpLRaPW+wS2Bvz0ovQP6jKVKWlLE6bqH2Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843580;
	bh=CHItHJo3dUAOv0TG5yke73+hcTb0YYy0p0fpWvo/54Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j67Twy9QqKtOq7i1Cc1GJiuZf9Ji7lNzmgLK6Xb2yaMfZG+XQWykQNSY6QCyGajtG
	 19Uo4Q3YPAhmyKDWAYmUSQOzuMUY/Q+EJzQdvpEcWnFGXcarOv32GcAATG9yp5xYtl
	 ByqkmIq0//G+mZ2Y4wXTbc3Xa5vxPELj2lQkNdJCNnNASKASmApvCITzDEyZ6Uht9r
	 A2WF1CvrTWtMXsKN4OyIYhtqdowGi9V3ooqptBPfEtEOjVS3Gt3nrdfcnkMM3Z4EuF
	 Mbu82/v20ERYVqxjEQohErhP8tw7Wl1ai3EJFJrWrcs+nWHZfhh6Q7jUH+8gN5LwKi
	 Ci6fl8gmLo4WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A71CE60821;
	Mon, 16 Nov 2026 15:39:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A33382FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 893AE402B0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XT5wQGJYm2Fz for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:39:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 787064009E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 787064009E
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4bb5b8ef642so22493425e9.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:39:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843576; x=1795448376;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XYGPMQmeCTMRXqeGf3h3IHJhpYJdmWV8rc1X0PDO6p4=;
 b=lubyQNyX14JeeMDSwi3Q446PsHUrGqCXRbL/MTgGSI8TQWAaBxOi8iCrqL1z+tdUCW
 5ZJY10PeQORdHTfwwtTNgGp8v5xPfI3I13PtkxWKFOEfbw4e3N2NgdpWRE+u8YC4VWzy
 6nFY9xDNqWYwvHvJMqR7/QWOLGLtJ3wjPDkvIIytZ2bfWOZlHArtBS2FPclwBt9SXjLN
 8LjN0Fdcq8HRu8U5ZcuyI4MNpWlnZxIhsjZEoUEEAS7g7VIWVsWtbrFO9405deVN0AEE
 ke9bvnQkdLBqc5pUIrs6rm0NT/MrduXQ0KhMe3jCmwohmzUkjRVEm5V8ePclVRhaFSI9
 gKpQ==
X-Gm-Message-State: APuU4Z9VlXIKgz+Bm1MFgdj2ek8c9JWPHVJEHXzYJGzARpCwUOtGbgyc
 e51VMlToIFxxwxRyfm1qp1Y3xRnxoIkF576MwsnFT9B9MigCwjELlzNdsRkk/zqTifRdITH0XJ6
 uX2+zNeY=
X-Gm-Gg: AYBFou2Hr2w70KmLaMvzU7zUmkjczZEX1Ye/uIxSh0VbwkhfWTA5kMHFvilzM+hoMWp
 2cskkHEL6811CYSkmhIiOH0Izln+1yQHF4pLLG6oCXVIqOHhxiuyroPfH6imlZWBCrRuQwcfMcy
 YUfQ7gxLJy3EJ3KpjMr6r+4av8uDjsb92TJ9b+9kBObZFtAJ9iSWdyiRzVQQCkkZ84CtT86wM33
 EBN5DnADISzUeeHtkzCGENnynOF0pMryzqIyqsb1lYuv3+O35BeqPrz1iTDFrfjRDxEDjxnDbzC
 OVc/FMLC4lV5HYCWGmvkNeUyoYeNMrDhwk5KVQSVhuhkXqc2EkZxGWEYNnmLgUtm2IsUOOVdEfO
 iwnQ7K4hsQYH4tD4E9mzpt8o1TdqCRt00KWnXmv6rmdUno+8uX0OYYEb+v3VqMlM9nbj4ilQUcu
 Qm2e92BcEpUY0j8jw2P8+K59c4eG5nkHDXRhxPVMDR1KiFr7JUnpNpPH4EGmAv93+rCDcVLKnzq
 bIpkghZ2GGL9WhrccRwWrdD/prVTuO1AlDu2CucwD5IADkE0bTU7ozsGN3xuAQgtrCm0IKEbKak
 GqDCadVHojZZoyOvrSQaNRGIvR6p03Y=
X-Received: by 2002:a05:600c:1c0e:b0:4bb:6f45:2a79 with SMTP id
 5b1f17b1804b1-4bb6f452d4fmr102503135e9.22.1794843576336; 
 Mon, 16 Nov 2026 07:39:36 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb5b4a3fcdsm268911875e9.0.2026.11.16.07.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:39:35 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:33 +0100
Message-ID: <20261116153934.725469-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102195514.3967-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.10.0
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

SW4gcmVwbHkgb2Y6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0L2Jsb2Iv
Ul8yXzEwXzAvZXhwYXQvQ2hhbmdlcwo+IGh0dHBzOi8vYmxvZy5oYXJ0d29yay5vcmcvcG9zdHMv
ZXhwYXQtMi0xMC0wLXJlbGVhc2VkLwo+IAo+IFRoZSBmb3VyIGZpeGVkIHNlY3VyaXR5IGlzc3Vl
cyBhcmU6Cj4gCj4gQ1ZFLTIwMjYtMTEzMzUxIOKAlCBEZW5pYWwgb2Ygc2VydmljZSB3aXRoIFhN
TF9QYXJzZXJSZXNldAo+IENWRS0yMDI2LTExNTUwNiDigJQgRGVuaWFsIG9mIHNlcnZpY2UgZnJv
bSB2YXJpYXRpb25zIG9mIGJpbGxpb24gbGF1Z2hzCj4gICAgICAgICAgICAgICAgICAgYXR0YWNr
cyBhbmQgcGFyYW1ldGVyIGxhdWdocyBhdHRhY2tzCj4gQ1ZFLTIwMjYtMTE3NjEwIOKAlCBEZW5p
YWwgb2Ygc2VydmljZSBvciBtb3JlIGZyb20gaXNzdWVzIHdpdGggaW5pdGlhbAo+ICAgICAgICAg
ICAgICAgICAgIG5vbi1maW5hbCBlbXB0eSBzdWJwYXJzZXIgcGFyc2UgY2FsbHMKPiBDVkUtMjAy
Ni0xMTgzNzAg4oCUIFNpZ25lZCBpbnRlZ2VyIG92ZXJmbG93IGluIGZ1bmN0aW9uIHN0b3JlQXR0
cwo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgpBcHBs
aWVkIHRvIDIwMjUuMDIueCwgMjAyNi4wOC54LiBUaGFua3MKCj4gLS0tCj4gR2l0bGFiIHBpcGVs
aW5lcyBwYXNzZWQ6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2JrdWhscy9idWlsZHJvb3QvLS9jb21t
aXRzLzM0OTFhZTM5NmRmZDcyMjE5NzNmMjUxNWJkMjdjNDkxYTE5NTAwY2EKPiAKPiAgcGFja2Fn
ZS9leHBhdC9leHBhdC5oYXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvZXhwYXQvZXhwYXQubWsgICB8
IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZXhwYXQvZXhwYXQuaGFzaCBiL3BhY2thZ2UvZXhw
YXQvZXhwYXQuaGFzaAo+IGluZGV4IDQxNzc4ZmM1MzYuLmU4OTM5ZmQzOGEgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9leHBhdC9leHBhdC5oYXNoCj4gKysrIGIvcGFja2FnZS9leHBhdC9leHBhdC5o
YXNoCj4gQEAgLTEsNCArMSw0IEBACj4gLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vbGliZXhw
YXQvbGliZXhwYXQvcmVsZWFzZXMvdGFnL1JfMl85XzAKPiAtc2hhMjU2ICAxZTYzNzE4NjJjYzMx
OTk5YjM2OGMzYjg5YjQ5OTk0ZjA2NzdlMWJhYjVmMWIyYjg1YWUzNzQxZjVkODAzMDUxICBleHBh
dC0yLjkuMC50YXIueHoKPiArIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9saWJleHBhdC9saWJl
eHBhdC9yZWxlYXNlcy90YWcvUl8yXzEwXzAKPiArc2hhMjU2ICBjNjI0YmEyOTk4ZmM2NWRmMTE2
M2E0OTY0MWZmM2Y5YWI3MzEzOGIxMTY0MWQ5MmM4NmJlZTBmYjAxYjFiYzdmICBleHBhdC0yLjEw
LjAudGFyLnh6Cj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gIHNoYTI1NiAgMzFiMTVkZTgyYWEx
OWE4NDUxNTYxNjlhMTdhNTQ4OGJmNTk3ZTU2MWIyYzMxOGQxNTllZDU4MzEzOWIyNWU4NyAgQ09Q
WUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2V4cGF0L2V4cGF0Lm1rIGIvcGFja2FnZS9leHBh
dC9leHBhdC5tawo+IGluZGV4IGJlNWQ4YWUwYjguLjIzYTYzNWU1ZDQgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9leHBhdC9leHBhdC5tawo+ICsrKyBiL3BhY2thZ2UvZXhwYXQvZXhwYXQubWsKPiBA
QCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtRVhQ
QVRfVkVSU0lPTiA9IDIuOS4wCj4gK0VYUEFUX1ZFUlNJT04gPSAyLjEwLjAKPiAgRVhQQVRfU0lU
RSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9saWJleHBhdC9saWJleHBhdC9yZWxlYXNlcy9kb3dubG9h
ZC9SXyQoc3Vic3QgLixfLCQoRVhQQVRfVkVSU0lPTikpCj4gIEVYUEFUX1NPVVJDRSA9IGV4cGF0
LSQoRVhQQVRfVkVSU0lPTikudGFyLnh6Cj4gIEVYUEFUX0lOU1RBTExfU1RBR0lORyA9IFlFUwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
