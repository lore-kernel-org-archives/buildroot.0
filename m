Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFF760A2626
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 21:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j6YhL9Di;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DD6LzgTT
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76A1B40945;
	Tue, 10 Nov 2026 21:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQrvcCPQs6yE; Tue, 10 Nov 2026 21:56:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 85DE640501
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794347771;
	b=P6ABzF+qmgE1UYfbJ3M7rd7YlI3BUHL5WXiQ5EiUgRu0Ek6LK1ZyD8uCKMx1msLRYeuP
	 4YwVi5zyDAfqd+9nCzimUOlCuglD9LXsbeo3y+5YSuN86jcWdzRl0wKnOyTWCmf6HWsEI
	 WPc4kAXK5+8guU4FswR6j9TmpeLHJD4nKpVLc0JdYX0Aw3XsSwo3Hla/mhFTZzTEtLD62
	 NsS4c0Jsub5BPECg2MBtBtHZB80RDigKnCvpIgG/Im4tgk8TGFc7/qpvvmzyO1EXTtWrm
	 dLVDvNAF47OQW+UwOZaFGJpovjMfJXPjTPbJ+Q1SiP9Y9o9fih8zsxSUxwCam85+aqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794347771;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=MJXkDn2Xgt2/BxMJLnaIiSdbh92nl9jHF9GBs2RFLO4=;
	b=CvIqQNvFBDiJpZIHi0Hp3Wwy2lDgVXLyNOpHyMvtNeSl0gFfyoh4OVGDfmmoumlbaXw/
	 hBBZWyhNcWxKYR0V85DBTfh415KfH1045KLKDQv5tyXxUQcw72nkS1l7DkiOlcEB4rJfw
	 bqhr/2kPAILTGwSU9S95oTvwSuceAwbVgAPKyXWrlt6eT7LS0yqsOldGhMF4Hep3YA9YE
	 oN3Su4CHISPLr6zqCaQasTfozHUtt2fd5WTvYiegkXw9XIxn4FlUiyIqn9wsL6LKA3ZFM
	 pU8T3iMF8g04Xq5mydlKfFAxTcc0MsOqzXFSYnR7KMn5ZP0D4AYqEvr+2K8VehQm9nA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794347771;
	bh=MJXkDn2Xgt2/BxMJLnaIiSdbh92nl9jHF9GBs2RFLO4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j6YhL9DiWofnGoSA2LZTMGaU1dtxXqJ8NfQDMe4aC0CpXYM0/IureCVG8Xp04mag6
	 DmSqYjoB68FKy053+YR3R6IxVrADJLb61Gmfl9PbPmJqDs+dPCjHHUVAMGM/6gtdcB
	 9JUCVXFLcs0u5GL6OUkE0o83a7Y0TgwDapn/PLozxdIXV1PzbANzWRvigN2iG8W7hF
	 4aVIRSUv7gpGtMz0n4LsMW61ZMfc+E0gWhyA4jOAnfdl1mTshN1t5jkbU9IoA5yQlH
	 26sGQCvjjzD+9+ZKlOfiqWHExiDObabpOxCmSqJEVCV8EEIbiOydRP0S+9gJRAz5nS
	 4+A/Kveinnt7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85DE640501;
	Tue, 10 Nov 2026 21:56:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87B161FC
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CA01605E3
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3hc6PObk_nW for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 21:56:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4FFA860AD1
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=DD6LzgTT
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FFA860AD1
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:05 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-497614c95f0so1360793f8f.1
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 13:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794347764; x=1794952564; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=U9zjxBBR90bUDni4D9dQX7oyaq9lbsWBA4EYsBTlnb4=;
 b=DD6LzgTTNbhB2lzpuvHaIG/N7YNx9tFrka212RYvGI0gqhJYo9+zlf+65TsPP1HuSv
 zlmm4QTOX3YbMVAiVql7KTTzBk2xdqae2jsIDvMXXvsTjn2oo/M0GkIVLJgBNp8gJZ3p
 thtfWi2EmEVU/ArNOzWo1LSslpMD49nbSkjrWD9plzEAUd1E7R2MOOzFr7YpibWuvBl+
 8gBf/h00duJEOlmOWqasjKaCqSo/ArHrxpEtTZ81o50wYfmI969dC3dUHJ1CG6bAonbV
 YTprWNWqmKwzCT00bOlZEpKZTaKBu1a7mTEWVN6/m2EumLQvC85GhpMwYCi6GzU83OHs
 mjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794347764; x=1794952564;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=U9zjxBBR90bUDni4D9dQX7oyaq9lbsWBA4EYsBTlnb4=;
 b=0fIxWH4qDuD91pmHEn60eQGkQX7NhzDCcRPRBF2LYoR6131SsRTXbXhdHA8BPioLej
 xYVdE5PwUg4gZC8VzGyo2hFuA8Ijz4l7pGzPB1cLdU9vH3OANYz9CE9dLywsuDTK5XUM
 GsZhJqky1tve4B2s/NG88J5gbz+MOLkZzHYFpvkYU+NDwml8omSxzWBhw7bXU1TM30t5
 deDsju/qJrdqfDoCuzTyA5O15aMowSCR8DutRn5U2onxO1GQ2YBwVgyz7GbN4vAuJvmo
 lgT9yMWN2SOy9Ktj2IZi4YiD4KpwNqJEgwmEvuSOON5tDO/S11MEkjBOjX0krn/Ul673
 PGIw==
X-Gm-Message-State: APuU4Z+1LQnKdelYn6F2v/u+mZZsjeI0gphkQiRoZHKALUEIq+m77GCQ
 4ELByNkmosSpoWL8xg/Fu09n9kwQcSooPZlironRV5tlQQeTJdehZumujLZJ6w==
X-Gm-Gg: AYBFou3mbBK1j+e8oD2+Bho/FOoHR/ZML7HWaJAO/X1TVhOmRBMSllexkeFnvEf0TM+
 CebTAqaWcStt7Y+plwhywAlR7WckQzLoCnAcg6fSfsGrn9FFg8Y+F8BBdxh2UpP/unhow2XxG+o
 NlI70N9GoDz3+iz9dntFmBpuCeX/N/rAUiXfGTzM5jGiQB9M+zWkB1eU3Cc77LS3Gy6hxZlbBqA
 yX3In+f0Zy2ZSXD5SoMw0YZG64ufuFVaIZTl/kmD1aqCFCkrw8fTMsLIRSO0pEvRirE8V3428te
 9V/qdIY6thCAg3awiITxlp0LOFNsgbyq4BLWzZGqeRpoTjKCATNFj60gB0uyXoiMyTkigO3dQ0A
 rU5q4VGFLFxJuZNq9y+jIxij4yfFawHwIvDsb+rQd+CWWkQeGpVBnhJtpLAJxPnl4+ZX2e64d+y
 yIU7jrxCV3/64K+NosqFH/sUY9MmT4OFsd3MibXUOgbUHMI/1tFwJYeaS1N4Lkw6AaM2BVWgLHq
 E6BLzglthuxF4u0/C57X7FppTjCOVA+PAvpjIQha56PFXO7L6yuKsrSjZJHy4mze/QCBmI/XWL9
 iYgdaIF8avYS0kUAyWsbtA6pwzdWioy+jTKHKlua0uEzozKvJSf2
X-Received: by 2002:a05:6000:26c1:b0:492:9630:6a71 with SMTP id
 ffacd0b85a97d-499c434b779mr473934f8f.1.1794347763933; 
 Tue, 10 Nov 2026 13:56:03 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49836b8eb11sm7767889f8f.57.2026.11.10.13.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 13:56:03 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 10 Nov 2026 22:55:56 +0100
Message-ID: <20261110215557.2248804-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
References: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] boot/at91bootstrap3: drop the patch for
 3.10.3
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tm8gZGVmY29uZmlnIHVzZXMgQVQ5MUJvb3RzdHJhcCAzLjEwLjMgYW55bW9yZTogdGhlIGJ1aWxk
IGZpeCBmb3IKR0NDIDE1IGlzIGNhcnJpZWQgZm9yIDMuMTAuNCwgdGhlIDMueCB2ZXJzaW9uIG9m
IHRoZSBwYWNrYWdlLgoKU2lnbmVkLW9mZi1ieTogQW5nZWxvIENvbXBhZ251Y2NpIDxhbmdlbG8u
Y29tcGFnbnVjY2lAZ21haWwuY29tPgotLS0KIC4uLmNvbmRpdGlvbmFsbHktZGVmaW5lLWJvb2wt
ZmFsc2UtYW5kLS5wYXRjaCB8IDQ3IC0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA0NyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBib290L2F0OTFib290c3RyYXAz
L3YzLjEwLjMvMDAwMS1pbmNsdWRlLXR5cGVzLmgtY29uZGl0aW9uYWxseS1kZWZpbmUtYm9vbC1m
YWxzZS1hbmQtLnBhdGNoCgpkaWZmIC0tZ2l0IGEvYm9vdC9hdDkxYm9vdHN0cmFwMy92My4xMC4z
LzAwMDEtaW5jbHVkZS10eXBlcy5oLWNvbmRpdGlvbmFsbHktZGVmaW5lLWJvb2wtZmFsc2UtYW5k
LS5wYXRjaCBiL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvdjMuMTAuMy8wMDAxLWluY2x1ZGUtdHlwZXMu
aC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2gKZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDM1MmMxYzBhNDMuLjAwMDAwMDAwMDAKLS0tIGEvYm9vdC9hdDkx
Ym9vdHN0cmFwMy92My4xMC4zLzAwMDEtaW5jbHVkZS10eXBlcy5oLWNvbmRpdGlvbmFsbHktZGVm
aW5lLWJvb2wtZmFsc2UtYW5kLS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQ3ICswLDAgQEAK
LUZyb20gOTA4YzY1Njc4ODY3NTY1YTkzNGVhNWE5NjdiZmU3ZTIwNGQxY2NhZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKLUZyb206IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZy
PgotRGF0ZTogV2VkLCAyNSBKdW4gMjAyNSAxMToxMzo0MyArMDIwMAotU3ViamVjdDogW1BBVENI
XSBpbmNsdWRlL3R5cGVzLmg6IGNvbmRpdGlvbmFsbHkgZGVmaW5lIGJvb2wsIGZhbHNlIGFuZCB0
cnVlCi1NSU1FLVZlcnNpb246IDEuMAotQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0
PVVURi04Ci1Db250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Ci0KLWluY2x1ZGUvdHlwZXMu
aCB0eXBlZGVmcyDigJhib29s4oCZIGFuZCBtYWNyby1kZWZpbmVzIOKAmGZhbHNl4oCZIGFuZCDi
gJh0cnVl4oCZLgotSG93ZXZlciwgc2luY2UgQzIzLCB0aGVzZSBhcmUgcHJlZGVmaW5lIGtleXdv
cmRzLiBBcyBDMjMgaXMgdGhlIGRlZmF1bHQKLUMgZGlhbGVjdCBmb3IgR0NDIDE1LCBidWlsZGlu
ZyB3aXRoIHRoaXMgY29tcGlsZXIgZmFpbHMgd2l0aDoKLQotICAgIGluY2x1ZGUvdHlwZXMuaDoy
MzoyMzogZXJyb3I6IOKAmGJvb2zigJkgY2Fubm90IGJlIGRlZmluZWQgdmlhIOKAmHR5cGVkZWbi
gJkKLSAgICAgICAyMyB8IHR5cGVkZWYgdW5zaWduZWQgY2hhciBib29sOwotICAgICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn4KLSAgICBpbmNsdWRlL3R5cGVzLmg6MjM6MjM6IG5v
dGU6IOKAmGJvb2zigJkgaXMgYSBrZXl3b3JkIHdpdGgg4oCYLXN0ZD1jMjPigJkgb253YXJkcwot
Ci1GaXggdGhpcyBidWlsZCBmYWlsdXJlIGJ5IG9ubHkgZGVmaW5pbmcg4oCYYm9vbOKAmSwg4oCY
ZmFsc2XigJkgYW5kIOKAmHRydWXigJkgb24gQwotZGlhbGVjdHMgb2xkZXIgdGhhbiBDMjMuCi0K
LVVwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vbGludXg0c2FtL2F0OTFib290c3RyYXAvcHVs
bC8xODgKLVtFZGdhcjogYmFja3BvcnQgdG8gdjMuMTAuM10KLQotU2lnbmVkLW9mZi1ieTogRWRn
YXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+Ci0tLS0KLSBpbmNsdWRlL3R5cGVzLmgg
fCAzICsrKwotIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdHlwZXMuaCBiL2luY2x1ZGUvdHlwZXMuaAotaW5kZXggMTI0NmE0ZGYuLjJjMWE0
MWNmIDEwMDY0NAotLS0tIGEvaW5jbHVkZS90eXBlcy5oCi0rKysgYi9pbmNsdWRlL3R5cGVzLmgK
LUBAIC00Miw4ICs0MiwxMSBAQCB0eXBlZGVmIHNpZ25lZCBsb25nIGxvbmcgczY0OwotIHR5cGVk
ZWYgdW5zaWduZWQgbG9uZyBzaXplX3Q7Ci0gdHlwZWRlZiBzaWduZWQgbG9uZyBzc2l6ZV90Owot
IAotKy8qIGJvb2wsIGZhbHNlIGFuZCB0cnVlIGFyZSBwcmVkZWZpbmVkIHNpbmNlIEMyMy4gKi8K
LSsjaWYgX19TVERDX1ZFUlNJT05fXyA8IDIwMjMxMUwKLSB0eXBlZGVmIHVuc2lnbmVkIGNoYXIg
Ym9vbDsKLSAjZGVmaW5lIGZhbHNlCTBVCi0gI2RlZmluZSB0cnVlCTFVCi0rI2VuZGlmCi0gCi0g
I2VuZGlmIC8qIFRZUEVTX0hfICovCi0tLSAKLTIuNDMuMAotCi0tIAoyLjUzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
