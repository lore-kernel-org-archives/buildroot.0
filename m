Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D251606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HHAhyLTi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=pS9J4Nxn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67C818164B;
	Fri, 23 Oct 2026 18:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3jkxj9Gzn2L; Fri, 23 Oct 2026 18:28:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6B39481669
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792780107;
	b=J3scezOEga2PhqWu1Z+mRMbmRowlzV6TAr6X54ekK6E/BiBZsegQIXCfqCLosUIJBG69
	 YWGGVMaKHhyOajSsLF6VE8PvzvHy9sGT5vmzBs74caE+zt+yHbv1ncro4Is15jwX/194v
	 AzMUpnrxVUU7O6nxXpyPOUUeQRK0j0L8BKfV1qN1Gp6hxR3iw0/lAqPC5ZCQkMs8f2+r7
	 5ub3JqUrtr3ZpzkwA+EvzMpu+TFhb5io5z+itsf2vjbr35LOqrO8u+yZqsWV8Div69RYh
	 JhZpaSLUZdSTKtjIuS5duuxg/O0pLBg5DTuUIY5MyM8f3LTFB2tcod3KOdb+QZJD7dQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792780107;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aNiOPNLbtJS9nkA+LMmz5fyGJUGrqenXZS3ZDCnL1ZY=;
	b=h80jqLHWW5nbAu2/zYzB499LbsVb9K2h9EK+Wlq5l2Ot9kGp97QO5h+zcR0wX5yq8xjZ
	 5Nap4yJ/Qu7f3M2/6+hIoCg0SN66FBfo3Iw3pi4v8Ddo6cM1a38n09vK8R/vr/OwEGGkF
	 R2OQ/iK5naVH+TLLNCkho+llnA08L2AGq9LXczNE20oWFeS78x0ZwkDTIDz40qG9WZnaM
	 oNHze78IwfYaHdrrgEPqGVKEDe0smsMGIQ97KdpWTKSnvMqEn+akresskAhe/GL2IaOOD
	 Oy2EY1iPjXHEt9CTpRhX2kL/mTSEui17faowBTeF7tLe8zS+j1KyCI0jLCto8z15MTA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=pS9J4Nxn;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792780107;
	bh=aNiOPNLbtJS9nkA+LMmz5fyGJUGrqenXZS3ZDCnL1ZY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HHAhyLTiXG1WxeaDH15OhleJihyaRpJ+zSY5Wyf8B0bEVh38WDBc8WvdGnLI241dx
	 mL4tEBxkbHhbPd66Sgk3Sy5pUulhNWHS2LJrHXEROwDNubmiLhgeMJizW79P5I7/nC
	 tD7cBalA2iaaWLsZ+iLSGGO9aN412KchNS/pgJATE+scIpcKnMXgNAcsbR0kJlCWVS
	 FoYTnfBqGUBNUl9rtC8f4QOwlPaEpYv1hMGniSjBq0RZ+oWZnQhZlatPP6D3f3693O
	 2Dwfc/Ii/dKVTOeQHTxbEbH3WqpzniAyj68iq5pdKLq+helfMS4tDXkYijv7edjIhJ
	 tbtzqUe7zhe+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B39481669;
	Fri, 23 Oct 2026 18:28:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CFAD12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2370A81669
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhfBq8rLcHdl for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:28:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2D3C98164B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792780105;
 b=Nx4183Ta3ITsG/+g3MB7mR8lEn//rNtPMQfgiSaSksQQm/UlOSMYGsX6EyPXg4ln+um0
 kv3TCiQsrSRvn/kMpNEKYzQy+UobB35mmLC8j7stFha/aRSKlFSfr1nBIqDWmqW4JqREW
 UsM0NY/zDv10H73k1OSdRBh8gH7idNuSkg8mPE0XpjWBqcjX1nsVnhjOFfERxHw0nfqkp
 mxQ6W9q+M8yOt05WNan3cIcUIx5s4lG45J9QYvr5+OnORvZbNN8Kq+nM9DO/A77vhn4f8
 0EAN62kaz7tU76p9vCsrYpidZKRky+OhV3uD2bdaKNwqzcT65a+hq08JPN4kP/01H7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792780105;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZtB/DsTohihnnW/7LAb5Ckaeabkc19Haep+Jgfvvhl8=;
 b=op9rqIQjj51TdYfzPR2s5J/vkYFIxyNHweZKGaxoewcGyKwEjUayQSmiLfr0YooQGR0u
 YC2Fl3d18h/z50/iqTldl9yggDp5qj0xVA8Rgb1tKpi7GHAZ1UcP91FeS215vA2HHk0yS
 zgMEDlepRAsioxxaV1MozDZYmx4nW+TouWMi1kNACBQTUV6iYoXNKEHXBOqpkEREK6kBC
 RRzhYkkv3Sl3P0xzW6PpGAa6STzvwKhSrfJYD9tGhPdo5OJHq41P5QZBFbXOHYVNHxQGF
 MG3qH4fXjwEgxS1+/Je5HiakVRtYKzTxkr9O2lNt8Qw8o89sPYjDptgNUTOEV/TYmug==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pS9J4Nxn; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pS9J4Nxn
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D3C98164B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792780086;
 bh=ZtB/DsTohihnnW/7LAb5Ckaeabkc19Haep+Jgfvvhl8=;
 h=From:To:Cc:Subject:Date:From;
 b=pS9J4Nxn9L17eU/jEQU6YcIDhcvODxbA8yVIJipphFyG6xbRd+8S4SeecH8M+cPfY
 8L9YXsA+pfv/MFkWtJBQm/tJHwy9MizoXmJF8kgYF3ca+rvedVmOHRbAt4MVYdbmER
 diRcdp187XDAnJ2O4yGNHDtepX8NFLDrg5Kg1Vr0GaObwa1CdJaTVQ/uEeD1zNyeQv
 2nTLRxJbHnyd9qpN6CQFK/Fe7aQLCCP/2KaJmwZq7/gmebXEhc7xZugwRee4w0rwX4
 u+B7YkCSsgniQ74MjUR0HNMKINHancV7yG+6X02LPYkgzOQC6GIqu/Z0nzZhry7gJx
 dazrwTivRWPSA==
X-KAS-Sym: v3:f51bdf72230551df:kZkUq7hvg90k++6t9SDZmjK9WWYBNrm69ZcGWHMMbytNz
 WVRpibTtnkZrvwASS0GMKUK64BjTYuIJrXvSXqS8fhpX0+J4aXrPkA3he0z/ibtOL8OGqTwUi85
 fl69307keWLZRbiAptPQwMoPJz4Mx9KYqtfHtBQlna/u0X56x0sTcCCnhbh/u/DQWhaLbkaXSJw
 Gi4Ih49u/QctdUA+mJDvmMcUfCb2QtbTmKRqYCYr/AkDM7FHfnSWRJhXMgOmMj8kkNyLPu0Ok+h
 EGikXgLdqKjnEm063cfu5kryGcLtI3m+qa6B+S1UDw9uI44oB6EOeU8Jr08Za10l+UrdbuAQ==:
 eBEnwIR4mpEDzbtQxGcz5HXQD8glB6XzuGhxzGkINOqjDKNKCqBZVMh0kh9ZzxcB66q3AfzevAK
 p9OsfE2KzNnjZzi70qS7bjOcmDL/xO276Brsajj4yBGCvWrSt4n9jl3LeSDHEC2edFMHbTBJPRG
 U+EVF2CEkpOi65pxGe8Ie0Rmx/qUnmimSp28qxJt7fcstzyMdAFfprNXCBEFLx/VBkikicOhFzS
 KV/aHcyEpaOXhI9JN51/MitUy3mter5kdxKh+ZflyxvbZsqnKhRFa1+cBFrh4TSZmOycGxe2SMW
 gz65DOIaLWSOt4QXSarZ4PQf4wXW0CPLxKUgjFhf+CUsfh8dhW/t6gYQO8WatLK9M6qFbs3Dfgr
 1K8snxAklFKdiLHjig6VF80MtePnddxXbHztw4gZpYhhtYyXeONosV7pmTLryOMEDCz5++LQ7C2
 GAYvMlmuBoP8ZED4i+gbcXAMqFk4xRAo68tdSLgA6/896CrALMl33YhQkf/A0n5fBMgXqa5m4yW
 KlkzXiWtSFN/89llfTub7sVwl/4NTxG3A7CqXhkHYh+kExBSQ==
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22F7BA4C693E;
 Fri, 23 Oct 2026 20:28:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49410)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKJzp-000000001mv-0WAR;
 Fri, 23 Oct 2026 18:28:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 20:28:03 +0200
Message-ID: <20261023182805.474759-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/2] package/exiv2: fix uClibc-ng build without
 fenv
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QnVpbGRyb290IGNvbW1pdCA5NDAxM2MzYTk1YTg0OWI2YThkOGRiNTMyMWY5YmZlYTRjMzg5YjEw
IGJ1bXBlZCB0aGUKcGFja2FnZSB3aGljaCBpbmNsdWRlZCB1cHN0cmVhbSBjb21taXQKaHR0cHM6
Ly9naXRodWIuY29tL0V4aXYyL2V4aXYyL2NvbW1pdC9lYmU4NWU3ZTg3MmU2Zjc0M2Q2MjY3ZTQw
NjY2MGY1MDI4N2JmNGJjCnRoYXQgY2F1c2VzIGJ1aWxkIGVycm9ycyBvbiBzb21lIGFyY2hzIHdp
dGggdUNsaWJjLW5nLgoKVGhlIGJ1aWxkIGVycm9yIHdhcyBkZXRlY3RlZCBieSB0aGUgR2l0bGFi
IGF1dG9idWlsZGVycyBhbmQgY2FuIGJlCnJlcHJvZHVjZWQgd2l0aCB0aGlzIGRlZmNvbmZpZzoK
CkJSMl94dGVuc2E9eQpCUjJfWFRFTlNBX0NVU1RPTT15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUw9
eQpCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fWFRFTlNBX0xYNjBfVUNMSUJDX1NUQUJM
RT15CkJSMl9QQUNLQUdFX0VYSVYyPXkKClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJu
ZEBrdWhscy5uZXQ+Ci0tLQogLi4uc2VJbnQ2NC13aXRoLXRvb2xjaGFpbnMtbGFja2luZy1mZW52
LnBhdGNoIHwgNjcgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY3IGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2V4aXYyLzAwMDEtRml4LWJ1aWxk
LW9mLXBhcnNlSW50NjQtd2l0aC10b29sY2hhaW5zLWxhY2tpbmctZmVudi5wYXRjaAoKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvZXhpdjIvMDAwMS1GaXgtYnVpbGQtb2YtcGFyc2VJbnQ2NC13aXRoLXRv
b2xjaGFpbnMtbGFja2luZy1mZW52LnBhdGNoIGIvcGFja2FnZS9leGl2Mi8wMDAxLUZpeC1idWls
ZC1vZi1wYXJzZUludDY0LXdpdGgtdG9vbGNoYWlucy1sYWNraW5nLWZlbnYucGF0Y2gKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMmE5ZTc0N2Q3ZQotLS0gL2Rldi9udWxs
CisrKyBiL3BhY2thZ2UvZXhpdjIvMDAwMS1GaXgtYnVpbGQtb2YtcGFyc2VJbnQ2NC13aXRoLXRv
b2xjaGFpbnMtbGFja2luZy1mZW52LnBhdGNoCkBAIC0wLDAgKzEsNjcgQEAKK0Zyb20gMWRmNzAx
MWU4OGQyM2I4ZjFkZGU3NjYxNzE5YWYyYzE0ZjNhNGM2MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb206IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CitEYXRlOiBGcmksIDIzIE9j
dCAyMDI2IDE5OjI4OjUxICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIEZpeCBidWlsZCBvZiBwYXJz
ZUludDY0KCkgd2l0aCB0b29sY2hhaW5zIGxhY2tpbmcgZmVudgorIGZ1bmN0aW9ucworTUlNRS1W
ZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29u
dGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCit1Q2xpYmMtbmcgc3VwcG9ydHMgQzk5IEZs
b2F0aW5nLXBvaW50IG9uIGEgcmVzdHJpY3RlZCBzZXQgb2YgcGxhdGZvcm1zOgoraHR0cHM6Ly9n
aXRodWIuY29tL3dieC1naXRodWIvdWNsaWJjLW5nL2Jsb2IvdjEuMC41OS9leHRyYS9Db25maWdz
L0NvbmZpZy5pbi5hcmNoI0wxNjMKKworY2F1c2luZyBidWlsZCBlcnJvcnMgb24gdGhlIG90aGVy
IHN1cHBvcnRlZCBwbGF0Zm9ybXM6CisKKy9idWlsZHMvYmt1aGxzL2J1aWxkcm9vdC9ici10ZXN0
LXBrZy9ib290bGluLW9wZW5yaXNjLXVjbGliYy9idWlsZC9leGl2Mi0wLjI4Ljkvc3JjL3R5cGVz
LmNwcDoKKyBJbiBmdW5jdGlvbiDigJhpbnQ2NF90IEV4aXYyOjpwYXJzZUludDY0KGNvbnN0IHN0
ZDo6c3RyaW5nJiwgYm9vbCYp4oCZOgorL2J1aWxkcy9ia3VobHMvYnVpbGRyb290L2JyLXRlc3Qt
cGtnL2Jvb3RsaW4tb3BlbnJpc2MtdWNsaWJjL2J1aWxkL2V4aXYyLTAuMjguOS9zcmMvdHlwZXMu
Y3BwOjU1MDoxMDoKKyBlcnJvcjog4oCYZmVjbGVhcmV4Y2VwdOKAmSBpcyBub3QgYSBtZW1iZXIg
b2Yg4oCYc3Rk4oCZCisKKy9idWlsZHMvYmt1aGxzL2J1aWxkcm9vdC9ici10ZXN0LXBrZy9ib290
bGluLXBvd2VycGMtZTUwMG1jLXVjbGliYy9idWlsZC9leGl2Mi0wLjI4Ljkvc3JjL3R5cGVzLmNw
cDoKKyBJbiBmdW5jdGlvbiDigJhpbnQ2NF90IEV4aXYyOjpwYXJzZUludDY0KGNvbnN0IHN0ZDo6
c3RyaW5nJiwgYm9vbCYp4oCZOgorL2J1aWxkcy9ia3VobHMvYnVpbGRyb290L2JyLXRlc3QtcGtn
L2Jvb3RsaW4tcG93ZXJwYy1lNTAwbWMtdWNsaWJjL2J1aWxkL2V4aXYyLTAuMjguOS9zcmMvdHlw
ZXMuY3BwOjU1MDoxMDoKKyBlcnJvcjog4oCYZmVjbGVhcmV4Y2VwdOKAmSBpcyBub3QgYSBtZW1i
ZXIgb2Yg4oCYc3Rk4oCZCisKKy9idWlsZHMvYmt1aGxzL2J1aWxkcm9vdC9ici10ZXN0LXBrZy9i
b290bGluLXh0ZW5zYS11Y2xpYmMvYnVpbGQvZXhpdjItMC4yOC45L3NyYy90eXBlcy5jcHA6Cisg
SW4gZnVuY3Rpb24g4oCYaW50NjRfdCBFeGl2Mjo6cGFyc2VJbnQ2NChjb25zdCBzdGQ6OnN0cmlu
ZyYsIGJvb2wmKeKAmToKKy9idWlsZHMvYmt1aGxzL2J1aWxkcm9vdC9ici10ZXN0LXBrZy9ib290
bGluLXh0ZW5zYS11Y2xpYmMvYnVpbGQvZXhpdjItMC4yOC45L3NyYy90eXBlcy5jcHA6NTUwOjEw
OgorIGVycm9yOiDigJhmZWNsZWFyZXhjZXB04oCZIGlzIG5vdCBhIG1lbWJlciBvZiDigJhzdGTi
gJkKKworVG8gZml4IHRoZSBwcm9ibGVtIHRoZSBvbGQgY29kZSBwYXRoIHdoaWNoIHdhcyByZW1v
dmVkIHdpdGggY29tbWl0CitodHRwczovL2dpdGh1Yi5jb20vRXhpdjIvZXhpdjIvY29tbWl0L2Vi
ZTg1ZTdlODcyZTZmNzQzZDYyNjdlNDA2NjYwZjUwMjg3YmY0YmMKK2lzIHJlc3RvcmVkIGFuZCBn
dWFyZGVkIHdpdGggaWZkZWYuCisKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vRXhpdjIv
ZXhpdjIvcHVsbC85NTQ5CisKK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhs
cy5uZXQ+CistLS0KKyBzcmMvdHlwZXMuY3BwIHwgNiArKysrKysKKyAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCisKK2RpZmYgLS1naXQgYS9zcmMvdHlwZXMuY3BwIGIvc3JjL3R5cGVz
LmNwcAoraW5kZXggNDI4ZGI4N2QyLi41MzU0OTkzMjYgMTAwNjQ0CistLS0gYS9zcmMvdHlwZXMu
Y3BwCisrKysgYi9zcmMvdHlwZXMuY3BwCitAQCAtNTg2LDYgKzU4Niw3IEBAIGludDY0X3QgcGFy
c2VJbnQ2NChjb25zdCBzdGQ6OnN0cmluZyYgcywgYm9vbCYgb2spIHsKKyAgIGlmIChvaykKKyAg
ICAgcmV0dXJuIHJldDsKKyAKKysjaWZkZWYgRkVfQUxMX0VYQ0VQVAorICAgYXV0byBkID0gc3Ry
aW5nVG88ZG91YmxlPihzLCBvayk7CisgICBpZiAob2spIHsKKyAgICAgc3RkOjpmZWNsZWFyZXhj
ZXB0KEZFX0FMTF9FWENFUFQpOworQEAgLTU5NSw2ICs1OTYsMTEgQEAgaW50NjRfdCBwYXJzZUlu
dDY0KGNvbnN0IHN0ZDo6c3RyaW5nJiBzLCBib29sJiBvaykgeworICAgICAgIHJldHVybiBzdGF0
aWNfY2FzdDxpbnQ2NF90PihsbCk7CisgICAgIH0KKyAgIH0KKysjZWxzZQorKyAgYXV0byBmID0g
c3RyaW5nVG88ZmxvYXQ+KHMsIG9rKTsKKysgIGlmIChvaykKKysgICAgcmV0dXJuIHN0YXRpY19j
YXN0PGludDY0X3Q+KGYpOworKyNlbmRpZgorIAorICAgYXV0byBbciwgc3RdID0gc3RyaW5nVG88
UmF0aW9uYWw+KHMsIG9rKTsKKyAgIGlmIChvaykgeworLS0gCisyLjQ3LjMKKwotLSAKMi40Ny4z
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
