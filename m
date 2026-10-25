Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79524606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i7FDC6gN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=tvbSC8a6
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5788D606A0;
	Sun, 25 Oct 2026 22:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AXXNVZ3ck0Fv; Sun, 25 Oct 2026 22:13:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7681A60645
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966399;
	b=SQuOh9zYNHJ98RsIJ7PiUrLGYe7AY7L0VJzNhUhJJ+NdwSESQ+hwmAaNbWlPTQLbzYF0
	 kfQeywx33YQPF7HpTwnYQJRiTMqmxa/kW6FhZ5meHIl4Rgx0RkZTyuh0qlZpyxQ0mIW5g
	 owUZErjW7SNxowcEnD0vZ+WFQV8+E0sktfWZucgKvQGuumUnh8gz8xGM0+G5UQ1/hVJsY
	 QIz0Wji6ciC+QJuxjJVVa26+7ZZHiV1JOM2ZUA61wGO/n0Z+gfiVuOkIuofglI3BdY0+i
	 vxkQ7rPlWQ3ukLsLZQs+IoSTBx2KJYlI+Q5hliLVhtjrig9tUOdzLt+wKxIZMv67jWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966399;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H3rq4pzTIpyC/PXTIr/DoOFH2YmBcl39qPVNpys1sVw=;
	b=FjlOmWeCr1HJ3vzumoI0H/Ua7gqAbOEJGlD3nfN1SoSpGKs57wM/XOsMq1cn2Vm5gnjM
	 SsnfVc1muOXXpZEcWGGiUvIh9vWj4LyYgy8Hr0P8SAZKf7lsdEh9Dc7Fi4rvaolSefq0Y
	 I2LYmqWNQCV/2QhRncoYi68f2Le6snpJavup12xpiuPId15VQ5K54pqQ1pZJqRVxBuFIX
	 uwFLSttP+qQWZp0HHfQDkHwa3pIfpnfsxeNEYKYv9mBa6Evexz+VfA5djks1zWPzTu5f1
	 u57B/o09YbfBcD5mwblAifjzYGHnG6izaV3zu06fIpbMc6oyqrnHQTYHzL+b1Hrxelw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=tvbSC8a6;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966399;
	bh=H3rq4pzTIpyC/PXTIr/DoOFH2YmBcl39qPVNpys1sVw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i7FDC6gNEm8gTFL+wNAmNtG4DdwtdMHm5mQ4T20OXKmgZGW/0QhbFVKkX/6cf6vhV
	 /qgN4ObWRmxB6FZHDskMfVQs+fHipcebjoW5dAQGZBJpweOIQUxwXsmlvvjioBjhBq
	 WOybn4wGFFXcUrL4qKvPh+KF1l4P+7hjNRQw46g22r8kMgQrhB6fioyRHRMKVy+1qI
	 wJVQljEmDzL1yQzUJogzJ9dz4INYxTzXUNdQizge9dyk9GFwjuzC5azRCva6zcy/pK
	 DFZUTjnh84ag2NQBdl225wyZw9PDiponMrqJfnS+nABOkWrziHFCA1e72XXP7ZAPpj
	 zRuuBJC9NDC4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7681A60645;
	Sun, 25 Oct 2026 22:13:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 923C1334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 789F060645
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sq5x5mvLmDKz for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:13:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 997EC60626
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966397;
 b=oBPTcbzktslWwQRCUcxiNg6dRdZJLqu5HCg3GpsQ8fJOpywlozOdbr4H84D0ypYdkgGd
 KbMlXGn+bskI8PyQllkaHmcsyrbSFW7V24sX9NBqMelSmleXdR53mgNwRbDXw8jVmFiMZ
 plXXPVJrbBUqlFluI1qORtaWQGb0w4MLTCGk7W/xDnB2v0wQXn5yJkrs0jf9E47Jug6un
 gDY4XfuBfDmCwQv308M03x57kpKYyD1Q2tGAcXIMSQ4iNs8DQRfzpmwJzwSkbMoSO0Agx
 fOdmzCXDrc3GbfH1vyA5sLde3h6LDFuzW+JEoQ3278QUvsoWDXYD/LWJCCq+/F7nfjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966397;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=YqjNL9VOOK4GxHJkAn1wXULfe/iVg235PVWZp5P1pfc=;
 b=lu6PVASUqIzu0WVx7dG5V51qDBvfsmPPGZZ8mak18+2bU2LArOKqVVJ7hyGYauV1cX5m
 Rn77vhgLqWWobZQrE/aNSDeplryixXAtGuqMiA0yXKG/wkwRUHA8EVbisKPs6ZIkMSiHx
 IiExULQSKAX7FV8LI6PviOWZLz4wcHJ5N35XaSYCTB3ESTO7ajugSI4K83G7zCsudd2Bi
 6HMZE+Z9p4+FS0cJfa+pTBPZtO/L9SmF2WW+NRIMNlv0yxT2aPbZJ++67LKvD5ffjHyzm
 c7Z36P36XlPTw9tEF19GH0MhzMf1njfSQrgSx3tDMHxWMnQUun82aZ6LgqfYM96Cljw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tvbSC8a6; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=tvbSC8a6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 997EC60626
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966086;
 bh=YqjNL9VOOK4GxHJkAn1wXULfe/iVg235PVWZp5P1pfc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tvbSC8a6adFF80e9uAJcNT1mdSf+vNbslJkbbzOGnb1YOwhU6yXnVpUoFk89Y4PY4
 qfwYk0drjSMPumwkKrBV5FbF9Q/loxOLEEvdmNdV/Ezk7UIdDwwdL69dQ1RWiu9dEg
 iwRjp9yogUQQAIDo6ujTnx6fNyDYR0GPs3SphCQXAfPxISr3upBN7lZpITXzAd02mJ
 CxebCl39tEU7owCa+H3xgwIommzwNbA3B3KOM0+FIOJcAe4t2CHdq+vcfxURyOT4Tv
 nGTqxLx5cBczPPInR1o7qe9Be62RocAhgwRBEecQaEilAbwIJIQPmO0T+vZXuYdngR
 B4vJNX+oUMnVg==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 nYQsu1gClB9HGxsMyDzjFiNmnfaXRnPcj2O6iiVvNKlYhQx2IIqQIlmW2/qoO3m2IAzC34sSL75
 23kvTuuVorune1JSEJy+ciJMBjXpJdVT5EoAryaYMmlvbOBc1PJKZLLDTghP4jHV/cgfES9J6GO
 UUmQr12TRdRE59ebRkjut3LoZ8VmZUZTNl1DOvDg8S6xO45qQAcAZMgg9u8+YmGfNeIUwBqIZXU
 MyCPNTJZsBaKcZYxK+EFPVMLk1yyzEq46tTGp5Maz/ssxoWRE3+XuXJuYRXhlSoFGhUBMFUsD/4
 ZIzYUTEo8yeatSKoi1KIQc4ysF4nYKhSNOXJ1DY4hJX0dkN8nrMyn9Wg2e+1oGy9NOAnqnNq5Ma
 Y2s7SPpMb+ivg8N4RlREYop1Oqtyvo0MJxWidqoF6qWmrdz1ukE9ajdChK31xmycst4b1PUZjMp
 4OpbiooAV/705eAOMPECTdN/b0PNKQrvi5GhG1ikCLDsn0qpvonf9sNQECAgmsbgtC7DdajL5h0
 1kZkJby9M30K4BeQEG50zSDuvyew3Kk/qyyruN1kbGEaeKJU3YiJxw41CKSHMMeaId1RRuPca1a
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AD060A4C6AB2;
 Sun, 25 Oct 2026 23:08:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NE-000000001fP-3VUD;
 Sun, 25 Oct 2026 22:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:17 +0100
Message-ID: <20261025220723.1332924-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 28/34] package/containerd: bump to v2.3.6
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKVXBkYXRlIGNvbnRhaW5lcmQg
dG8gdGhlIGxhdGVzdCBwYXRjaCByZWxlYXNlIGZyb20gdGhlIDIuMy54IGJyYW5jaC4KUmVsZWFz
ZXMgdjIuMy41IGFuZCB2Mi4zLjYgZml4IHRoZSBmb2xsb3dpbmcgc2VjdXJpdHkgaXNzdWVzOgoK
KiBDVkUtMjAyNi01MzQ5NTogbm9kZS1sZXZlbCBEb1MgdGhyb3VnaCB1bmJvdW5kZWQgSS9PIGRy
YWluaW5nIGluCiAgQ1JJIEV4ZWNTeW5jCiogQ1ZFLTIwMjYtOTU4Mzg6IERvUyBkdXJpbmcgaW1h
Z2UgdW5wYWNrIHRocm91Z2ggcmVwZWF0ZWQgb3BhcXVlCiAgd2hpdGVvdXRzCiogQ1ZFLTIwMjYt
NTM0OTM6IERvUyBkdXJpbmcgaW1hZ2UgcHVsbCB0aHJvdWdoIGEgY3JhZnRlZCBPQ0kgaW5kZXgK
ICBncmFwaAoKQ2hhbmdlbG9nczoKKiBodHRwczovL2dpdGh1Yi5jb20vY29udGFpbmVyZC9jb250
YWluZXJkL3JlbGVhc2VzL3RhZy92Mi4zLjQKKiBodHRwczovL2dpdGh1Yi5jb20vY29udGFpbmVy
ZC9jb250YWluZXJkL3JlbGVhc2VzL3RhZy92Mi4zLjUKKiBodHRwczovL2dpdGh1Yi5jb20vY29u
dGFpbmVyZC9jb250YWluZXJkL3JlbGVhc2VzL3RhZy92Mi4zLjYKClNpZ25lZC1vZmYtYnk6IEph
biDEjGVybcOhayA8c2Fpcm9uQHNhaXJvbi5jej4KW0Jlcm5kOiByZW1vdmVkICJzZWN1cml0eSIg
ZnJvbSBzdWJqZWN0XQpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0
PgotLS0KIHBhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLmhhc2ggfCAyICstCiBwYWNrYWdl
L2NvbnRhaW5lcmQvY29udGFpbmVyZC5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9jb250YWlu
ZXJkL2NvbnRhaW5lcmQuaGFzaCBiL3BhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLmhhc2gK
aW5kZXggNTFkMTU5ZjdhNy4uMGVjMmM2MDg3NCAxMDA2NDQKLS0tIGEvcGFja2FnZS9jb250YWlu
ZXJkL2NvbnRhaW5lcmQuaGFzaAorKysgYi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5o
YXNoCkBAIC0xLDMgKzEsMyBAQAogIyBDb21wdXRlZCBsb2NhbGx5Ci1zaGEyNTYgIGZjZmYyMDk2
ZWYyMGYxYmMxZDkzOWJjNTVhOGI4MzFlYTNlZmFjZTU3NDQ2M2ZkN2RjNzcwYjMzZmZlMzE3YjIg
IGNvbnRhaW5lcmQtMi4zLjMtZ28yLnRhci5negorc2hhMjU2ICBiNGI0MDdjNjRlMTFhMjI1NDli
MTRjNDc4NTdhYzBlMDJlOWY0N2Y4Y2ZjMjg5MjRlOWFhMDRhMGFkY2FhODgzICBjb250YWluZXJk
LTIuMy42LWdvMi50YXIuZ3oKIHNoYTI1NiAgNGJiZTNiODg1ZThjZDE5MDdhYjRjZjlhNDFlODYy
ZTc0ZTI0YjU0MjIyOTdhNGYyZmU1MjRlNmEzMGFkYTJiNCAgTElDRU5TRQpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQubWsgYi9wYWNrYWdlL2NvbnRhaW5lcmQvY29u
dGFpbmVyZC5tawppbmRleCA2Y2I4NDE0Mjk3Li5jYzY5YjEwMmIyIDEwMDY0NAotLS0gYS9wYWNr
YWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5taworKysgYi9wYWNrYWdlL2NvbnRhaW5lcmQvY29u
dGFpbmVyZC5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAK
LUNPTlRBSU5FUkRfVkVSU0lPTiA9IDIuMy4zCitDT05UQUlORVJEX1ZFUlNJT04gPSAyLjMuNgog
Q09OVEFJTkVSRF9TSVRFID0gJChjYWxsIGdpdGh1Yixjb250YWluZXJkLGNvbnRhaW5lcmQsdiQo
Q09OVEFJTkVSRF9WRVJTSU9OKSkKIENPTlRBSU5FUkRfTElDRU5TRSA9IEFwYWNoZS0yLjAKIENP
TlRBSU5FUkRfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLS0gCjIuNDcuMwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
