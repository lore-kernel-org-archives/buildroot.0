Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428C9606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=N+mP5rmj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B8FA40B17;
	Thu, 19 Nov 2026 14:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JeuIelpPTHm; Thu, 19 Nov 2026 14:47:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 999CA40AA1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795099624;
	b=tg/7Slo5NB/TNpmdgt+KnmlkrBlv/Muy+8Gv/ngRT8EiJfqdGkNh9MJ+O/r5BRwN3DR6
	 obdYs6PeaBX9xOp5V6j228CK0zmg4ecmlY70QRhk5gvQHQfe2hPYo22oivLLtODqF7Gv6
	 70tOTvLI6cX1Ji7VCx84dSUkFQCNU2vPqbAS4oEfY/cbGmG6uRPWvOqG1lhlpygeIcuFT
	 Xu+LfxR/sra/8SROQKGj0BMhQs9lRUD52EoYP+fU+PlOQ39wgPv7IZmRfwqQPv1GnA8uL
	 Oh+9her3Jz2ymBSqb9Ii8tDagPbZHPgZNAe9PFORVVUFb1ZIVDw5yjDjZeH5wfOk9Ig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795099624;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=COugCC2cNzZ4+QROcz8wtggtpdvwYGQTpmrX9nEphj4=;
	b=VGrUik4KAEESuZUgaVk4HwsYZiaotlNT15JO5PfT5QXyIssXKY0bukZgXLnSDW/B3Zc/
	 GXEKkVT6DOHXAJlZhlTh0g3QVzYyJtQUHinfrxp4OaEuJIenhgTmJKa3awcuyO8rimxv9
	 6O0JamfqYZC1mw6dawLy9Mbussnx03AXqUhw/sGyK7b3HhK1OSZZGQDvfPuChm8bUe5fn
	 0SEiHjJqD66fmdgJP3i55h/LuSt5EkHeDzSjwenOCHR4Tr4G14b2kDiWlu7kLXIYkWrZ7
	 ZhyTu/a8RTSA+PD86I+tEhi5B81CWMZ4rnnlXHyjNY//K9jydA+yYkActwXNjQGZ6hQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795099624;
	bh=COugCC2cNzZ4+QROcz8wtggtpdvwYGQTpmrX9nEphj4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N+mP5rmjmnsqxoXhyUkMVBVP5OGcFVZ7j8fPpRYzZev/R2hml04caHwNJ2w56604C
	 uVdL3V48YrwOOiPgGS/NyvBwOFZLGzMCar5hb/v70pwQTmyTC2RD9+UmdW1obhvMEU
	 jDGcfOMu3Mhwv/jovrHWZeax3NVOayFEKESo5E9gYsXB4iSO4nyGJhmPRa7VE9uOpa
	 ok5UlL6DDubRKzWh0HyiXdfHgPp2cVmPeunfrUMGeavp3YsKvbtg7PFYSdzm95Uq+d
	 vNd/1Tuq+yO18gPbrI8Vz983ZCoBqnj88lER+X3KTUlTYE4YJqZ0LWZY6xPqJ7Xoae
	 nvvTdR1aPparA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 999CA40AA1;
	Thu, 19 Nov 2026 14:47:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB6052FB
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCE1560D7B
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atggUk0OVPku for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 14:47:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 11A1D6066A
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11A1D6066A
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:47:01 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso2139403f8f.2
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 06:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795099619; x=1795704419;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YX0UcWagl2Y4KerM27pS3GrKib4iUnJsL/DI7sKEhZc=;
 b=1b27Q1vI6eZSybZrMtaUO+CYJ374Mzlrjn4Z6my2U9Cz6Q/0x71BdLtUMx/kkVsHNP
 EbBR7PEYxRza1ubyncIPH0qxUjNDme0ApERrZveZwN7w4GEI9tYb4Xe79W+BBixObaJp
 +Ca4ow4fMXK0N1VkrdqdyZrMdes+5kLl0cZ4J366ksS3+zwIU3BG6+PKEuJEHI3/qftt
 7eyS55ctAVc8b6gOsKRK9J/tbd0slPMLa8oaU1/e0uzIbcpZ+L9fxdSj5mM8W7ErtEKh
 hLtgcCw4lZy2mUAKmyoOGqa7j3NRU1HnFNQmWvEKvGbd0jXL9CGr0knBRVWv95qZ8+O5
 mGvQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFlJcxBZeXkIz7VZzXr/vXqB4xw6DVI6SuutaXwcPa0u1P4rovdJup9qlH+Es69Ew5fK9Jh4z6h54k=@buildroot.org
X-Gm-Message-State: APuU4Z8hzSkZ0bovQ1YMfbSdyl1ez5THQiSQ1P8M9kEVVjgLePjWBPQM
 CSI1igIJzikXoNF1cuYuGxAfCTSI9vPTHPiaV/tqlpSvT9yFhcKE/D/7iKhhN7llun8=
X-Gm-Gg: AZFdTZeol4TIYDeu03Yty/rVkpR3l+p+xgMcSP4uM9VjggWsbOjp+r6YRYxNZgMpr8n
 ghlcrCpjHkUVlvaufUDf1Y/sV4pHBjUEWA71Wnnto7tux87T+tD6JIVjPVf62jdGcOlXcS9Q7T1
 zRt0XndKrGmT3vVybG5Tj9IA6fKEvEjcQkD0mAqClliMWWvINTdr5HrL9ScgywKApOCFND608F3
 BPyLt4vAHKrnAOh6I9PXZl/CzjiJAdARCpn6JE9o1ttvPTvbA8JR6veIwYQvIEPs8jvDBp+3Nrr
 1AfhS4W/C/xamzenln2UmuOqnhz1RRcYRAUx5lsxTkEjFvj4BydFFtx9CsQbHPkLShT44M3Alwv
 SMNHAkvdbFHYPbsrwag0MXhxATZeaa30OppyEZqJUQAFOnJMIFr6bEfMqMgdKY94lRJcsBJOu5W
 HkrO72qIfHxBDwQGWp5rKRzikWXCdlsatetFYFeWi59axYYb3jMTERhpJpaAUDe+smheX06fREr
 A3z9R7jv7nbl0h0vgyZq7ndvc/uUSyXRC3CUqNqVev1fKmagnRd85dlq06VOTQQMZiXt4Cl3YiY
 FUmPU/6cUKb13fbfbKLVEQ==
X-Received: by 2002:adf:e003:0:20b0:48d:f996:1814 with SMTP id
 ffacd0b85a97d-4a63beaa10cmr9851505f8f.57.1795099619357; 
 Thu, 19 Nov 2026 06:46:59 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b10b1ebsm5716f8f.33.2026.11.19.06.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 06:46:59 -0800 (PST)
To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Nov 2026 15:46:57 +0100
Message-ID: <20261119144658.313119-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261029201652.1748886-1-raphael.melotte@mind.be>
References: <20261029201652.1748886-1-raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] utils/bump-stable-kernel-versions: only
 move existing headers directories
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gU2luY2UgY29tbWl0IGJkNjMzZmU1YjQ3ODU0MzVkNzgyMjI1MWQwMjI4
OTA4MmEwZDFiNWUKPiAoInV0aWxzL2J1bXAtc3RhYmxlLWtlcm5lbC12ZXJzaW9uczogdXBkYXRl
IGZvciBzcGxpdCBoYXNoIGZpbGUiKSwgdGhlCj4gc2NyaXB0IHVuY29uZGl0aW9uYWxseSByZW5h
bWVzIHBhY2thZ2UvbGludXgtaGVhZGVycy88b2xkX3ZlcnNpb24+IHRvCj4gcGFja2FnZS9saW51
eC1oZWFkZXJzLzxuZXdfdmVyc2lvbj4gd2hlbiBpdCBidW1wcyBhIGtlcm5lbCB2ZXJzaW9uLgo+
IAo+IFRoZXNlIHZlcnNpb24tbnVtYmVyZWQgZGlyZWN0b3JpZXMgb25seSBleGlzdCBzaW5jZSB0
aGUgaGFzaCBmaWxlcyB3ZXJlCj4gc3BsaXQgaW4gY29tbWl0IDBlM2RkYzlkYzg1ZTI5Y2QwMDMz
OGNjNzllYTRiZTFkNjM0YTc1YmEuIE9uIGJyYW5jaGVzCj4gd2l0aG91dCB0aGlzIHNwbGl0LCBz
dWNoIGFzIDIwMjUuMDIueCwgdGhlIGhhc2hlcyBhcmUgaW4gYSBzaW5nbGUKPiBsaW51eC9saW51
eC5oYXNoIGZpbGUgYW5kIHRoZSBkaXJlY3RvcnkgZG9lcyBub3QgZXhpc3QsIHNvICdnaXQgbXYn
Cj4gZmFpbHM6Cj4gCj4gICBmYXRhbDogYmFkIHNvdXJjZSwgc291cmNlPXBhY2thZ2UvbGludXgt
aGVhZGVycy82LjEyLjExMiwgZGVzdGluYXRpb249cGFja2FnZS9saW51eC1oZWFkZXJzLzYuMTIu
MTE0Cj4gCj4gQXMgdGhlIHNjcmlwdCBydW5zIHdpdGggJ3NldCAtZScsIGl0IHRoZW4gc3RvcHMg
aGFsZndheSwgbGVhdmluZyB0aGUKPiBDb25maWcuaW4gZmlsZXMgdXBkYXRlZCBidXQgdGhlIGhh
c2ggZmlsZSB1bmNoYW5nZWQuCj4gCj4gT25seSByZW5hbWUgdGhlIGRpcmVjdG9yeSB3aGVuIGl0
IGV4aXN0cywgYXMgaXMgYWxyZWFkeSBkb25lIGZvciB0aGUKPiBsaW51eC88b2xkX3ZlcnNpb24+
IGRpcmVjdG9yeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFl
bC5tZWxvdHRlQG1pbmQuYmU+CgpBY2tlZC1CeTogVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFs
ZUBtaW5kLmJlPgoKPiAtLS0KPiAgdXRpbHMvYnVtcC1zdGFibGUta2VybmVsLXZlcnNpb25zIHwg
NCArKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvdXRpbHMvYnVtcC1zdGFibGUta2VybmVsLXZlcnNpb25zIGIvdXRp
bHMvYnVtcC1zdGFibGUta2VybmVsLXZlcnNpb25zCj4gaW5kZXggYjAyYjg1NGQ5NS4uOGI5M2Zm
ZTllYyAxMDA3NTUKPiAtLS0gYS91dGlscy9idW1wLXN0YWJsZS1rZXJuZWwtdmVyc2lvbnMKPiAr
KysgYi91dGlscy9idW1wLXN0YWJsZS1rZXJuZWwtdmVyc2lvbnMKPiBAQCAtNzksNyArNzksOSBA
QCB1cGRhdGVfbGludXhfaGFzaCgpIHsKPiAgICAgICAgICAgICAgICAgIGVjaG8gIj4+PiBVcGRh
dGluZyB2ZXJzaW9uIGZyb20gJHtvbGRfdmVyc2lvbn0gdG8gJHtuZXdfdmVyc2lvbn0gaW4gQ29u
ZmlnLmluIGZpbGVzIgo+ICAgICAgICAgICAgICAgICAgc2VkIC1FaSAicy9cdGRlZmF1bHQgXCIk
e29sZF92ZXJzaW9ufVwiKFtcdCBdKylpZiAvXHRkZWZhdWx0IFwiJHtuZXdfdmVyc2lvbn1cIlwx
aWYgLyIgXAo+ICAgICAgICAgICAgICAgICAgICAgIHBhY2thZ2UvbGludXgtaGVhZGVycy9Db25m
aWcuaW4uaG9zdCBsaW51eC9Db25maWcuaW4KPiAtICAgICAgICAgICAgICAgIGdpdCBtdiBwYWNr
YWdlL2xpbnV4LWhlYWRlcnMvIiR7b2xkX3ZlcnNpb259IiBwYWNrYWdlL2xpbnV4LWhlYWRlcnMv
IiR7bmV3X3ZlcnNpb259Igo+ICsgICAgICAgICAgICAgICAgaWYgWyAtZCBwYWNrYWdlL2xpbnV4
LWhlYWRlcnMvIiR7b2xkX3ZlcnNpb259IiBdOyB0aGVuCj4gKyAgICAgICAgICAgICAgICAgICAg
Z2l0IG12IHBhY2thZ2UvbGludXgtaGVhZGVycy8iJHtvbGRfdmVyc2lvbn0iIHBhY2thZ2UvbGlu
dXgtaGVhZGVycy8iJHtuZXdfdmVyc2lvbn0iCj4gKyAgICAgICAgICAgICAgICBmaQo+ICAgICAg
ICAgICAgICAgICAgaWYgWyAtZCBsaW51eC8iJHtvbGRfdmVyc2lvbn0iIF07IHRoZW4KPiAgICAg
ICAgICAgICAgICAgICAgICBnaXQgbXYgbGludXgvIiR7b2xkX3ZlcnNpb259IiBsaW51eC8iJHtu
ZXdfdmVyc2lvbn0iCj4gICAgICAgICAgICAgICAgICBmaQo+IC0tIAo+IDIuNTQuMAo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
