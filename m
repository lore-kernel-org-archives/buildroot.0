Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49D1606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nimujOk9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=OG4n6ShJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FB1260687;
	Sun, 25 Oct 2026 22:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAq1M3A48atp; Sun, 25 Oct 2026 22:12:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9D6D6606A0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966362;
	b=ohU3ulKN7/x2T8AonwP2BXCBtKhwiSvQmGa8gBUvce5zv1kccyslMaIIhE9bXN10gnJJ
	 JBZn18+vIWU4zaRT23JRuLjdtFbq08gDIj89jGTU5mrRCR4k2tWSb1nMMVICQ/r9Ns9bT
	 7l4ObJ/Aa5Ct6uDxRPeA35AZ7AnNezEbLozv/cwgg3XQxkq5dzMtz4DCFMFMdnJV7f1Yj
	 ugUmuWWbE6O7uPauM08+8u08NeATKndYnSNuU8qlvcWirmosfduJb2RutG/zSQhy36ebD
	 fI/VfCp6PMAHS3Qu8dDjSA5mi53wgu4TOoWgEn1WG4JOkxcT+pwmycb42WlvzQSPpLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966362;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5+CC0lWDZ5eVxi3vcccvmFrQq15/kAapF+ahdbYMwVo=;
	b=M95G6Kj7n6zHszYmCqwPv2wwibupfQcj4/AWMA8MXyAt6PpEV799TldNOTXTbfaq+MiP
	 1K6YHBZ6c0icBfVwfg4HYhgcR6Xcy7qnScG0HUlC3F5TwNIofPcWHR4QVpt/3oox++oWP
	 UTiV4Tr09jNNYkOPwic2dIA/aWStIy/ioBw/dIngcLdakpej3h2dm9cw+myGbIdb7NPFQ
	 fs1uCdHG2qFJqnXkn+fwgoEaYBZOpRHhg/UMV29NeImTLfVYvlU4iJkooGVf1VbACovbv
	 RlF74baXFx1vHcU9GX3TOqh4mH4xwC8wfrwiH+wrICIUE260fPJv7V7sJRHBxbJKX5A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=OG4n6ShJ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966362;
	bh=5+CC0lWDZ5eVxi3vcccvmFrQq15/kAapF+ahdbYMwVo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nimujOk9UDK1sjm+CZOIoeDXU62H6FqclOyF1XAKmNsdS4cxYz4u05Pc/Z5ah0hx1
	 kk74VgI2/zp0NRCZ/KvmIwgP0qbBKFgrc0kZQLTk3SuA0ClprSfCWkDwgOKZDi5fRs
	 Nzi9j6Fa65JWGg6AY2NtXZq/PBAa57OUqTFb1AKXza4GChAkWrV47Pr+Nppkuyuhv+
	 5jH0VM0KpRyQBJuDUeX3jZWfU8ppVjj8TiPupqMQBFLvBXWaTgzII+dKZF8Q3igm66
	 e4PzWS4gTUtcZFz9tyumtBvKY7w8bweaoq/NPd7ztwYLhKGMS7/posHskJRuI4loWA
	 C21RI4Fk66QYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D6D6606A0;
	Sun, 25 Oct 2026 22:12:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74127334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71E2F606A0
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRi7zlWYTd8C for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:12:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8442E60626
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966360;
 b=H54QpKjQmlg8+n/rGud+ljnVIOYAGPnigigYZe0JgMgYu5HSIBco0+N1T4BlfWLIUIqd
 9Op7bPNCP14IBDRKc4wniT+V2hCcHd7viPvXOH3iJu1xbx5r2nY3kzvh6YMUAgKGu73Im
 R/uR0hywmaklgzpiBw9AZvVUD9OyHUPDr3FWVnc/1mz4AbN36B5Sg/i1mMFzgGCErQbDp
 qaDwZ933xsfu7DHvLR28QFEi1BUwjOqvXqZ4usBazZhuY+CAsfRDoXXUKarxtgseAipjL
 QQHBpOMQ2egFaE3dtnGnE/ZHpy7eFL4U9BrzLW5fyOikjrozVIa7dcvklsvmf8EtFFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966360;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=PdYb+jGmDysVjVFgCDsJ6L5aKpiBaRwvGjLW7OR9B4g=;
 b=b7ArtY53yycH6HafquKNRyigny9Q8JohIyYxi48zMoewxeSJAw3TXzzu4rTkO6zOfhDY
 XikVXoOotUVJhyUEsKray7wm8uYDcJh3WgvgWLz6rBrRDJzZO1jxVCS/QW3YcyViuh7ez
 eot2MK2DCb0UP/oq7yS0jHvJYw5TWCrOIMTfJkrqEi8yPQncHnD9K450d1eBjiLbROaa4
 e/mhaaeK5FZvpiMreSJsud6RSwD4SzNMDAOsn8cJJkXw+oQSwrJ4MIEU8/aQgvfCQAOaO
 dcgqEhkOdrv9avBAO3DH/a8fV7Q7riQcfiJNcsRIj0xBomENltqAgdqzsopPkjVSIJw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OG4n6ShJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OG4n6ShJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8442E60626
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966086;
 bh=PdYb+jGmDysVjVFgCDsJ6L5aKpiBaRwvGjLW7OR9B4g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OG4n6ShJ6y2zwZgl5Q2xm83qdm+nc6/gop1tt3ky3mudaL1f9DFZInFxfrpgxH78l
 Vd6fGsRd6CWGOE5j71Qq9HHEpLcKzkJtWRwlxM3/Nw1UezouiRBwpg29OV4o2csUcM
 iMZp+bWX9jfpjWm1quZFCnRVOMgaA2Iu7VRTmhYhfevU+0cOOjZlze+6e5cUB7z0Bu
 YYZlUpmVtMti57ZWqirWB1xkhNQXbeDbE3zdK5MeRDSkCbCQwZNXhZURUSuK0mWCgv
 yO+mJ+j2Evf7cYEDDcKYXcRutWBIRvVSWJZj9aDPPoapwUG5VuTP9IUyDJQDl7zea/
 18te68cItHHnQ==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 KxJUfTLDlkLu3oARDlQx34cwAZELTUkMkzwCuLZBIloGbDlPwOIatwnlKoCZiy940olgRJ+Jv2Z
 CzXLI6UcT0FDI2F/cmypWfI3FwopkOpLzgdsjmlzCGTVZLQNRw5ytk7B9+7WU3FINBOnTZTCOOI
 8vSM4WywivWE7BXyA7liL1/Q3tpR13bo5MNnBcir50cv2amL8sBoAeCUdsP/2mL8HRItrESg2zz
 YcMWNdGxskWtMSOMlbb+GkoHc7QK9VHBRq4+OrPrZRacJwGFdzbCf7f3VHKgbqYBn7yzScrdJFn
 9VZnrk6QlU0PCojhPAbcL0fsaiqdS+eTLcK559Us7ogvCsQW7UUgzOUgVZFsnfG0lQGLUxpDm2X
 AzN2fro8YZS9/1lZGJcPXXF7OlAJEpR7l1w0cARltPzOo52JzC5Hk74vCmJeE3O3ij+ejx/BIKB
 ykVsjFh8lr225ZtFSPghF9/fGtuPEmIuIJuiNTaI75Cnadli7ADn/923s6WVv863aNz8LjPGtzX
 c+L70mkqqYLUyha7jsCTWfq8xKtTRPuPrgF7LPFQFn4EUDnO09H6mn+Cl1VQKLGKe6Pr/siS4II
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 23A4DA4C6AA6;
 Sun, 25 Oct 2026 23:08:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NE-000000001fP-2XBa;
 Sun, 25 Oct 2026 22:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:14 +0100
Message-ID: <20261025220723.1332924-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 25/34] package/containerd: bump version to v2.3.3
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

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKVXBkYXRlIGNvbnRhaW5lcmQg
dG8gdGhlIGxhdGVzdCBzdGFibGUgcmVsZWFzZSBmcm9tIHRoZSAyLjMueCBicmFuY2gsCndoaWNo
IGlzIGFuIExUUy4KCkNoYW5nZWxvZ3M6CiogaHR0cHM6Ly9naXRodWIuY29tL2NvbnRhaW5lcmQv
Y29udGFpbmVyZC9yZWxlYXNlcy90YWcvdjIuMy4wCiogaHR0cHM6Ly9naXRodWIuY29tL2NvbnRh
aW5lcmQvY29udGFpbmVyZC9yZWxlYXNlcy90YWcvdjIuMy4xCiogaHR0cHM6Ly9naXRodWIuY29t
L2NvbnRhaW5lcmQvY29udGFpbmVyZC9yZWxlYXNlcy90YWcvdjIuMy4yCiogaHR0cHM6Ly9naXRo
dWIuY29tL2NvbnRhaW5lcmQvY29udGFpbmVyZC9yZWxlYXNlcy90YWcvdjIuMy4zCgpTaWduZWQt
b2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+ClNpZ25lZC1vZmYtYnk6IEJl
cm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQogcGFja2FnZS9jb250YWluZXJkL2NvbnRh
aW5lcmQuaGFzaCB8IDIgKy0KIHBhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLm1rICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5oYXNoIGIvcGFja2FnZS9j
b250YWluZXJkL2NvbnRhaW5lcmQuaGFzaAppbmRleCA0MDg4NTY4MjMwLi41MWQxNTlmN2E3IDEw
MDY0NAotLS0gYS9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5oYXNoCisrKyBiL3BhY2th
Z2UvY29udGFpbmVyZC9jb250YWluZXJkLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIENvbXB1dGVk
IGxvY2FsbHkKLXNoYTI1NiAgOTg5OTJkMmQyYTY1MmJjZmFlZjAxODZkMjE4YzVmZjI1NGJhOTdl
YTFkZDczNDI1ZmUyOWJlNzAzNmIzYWMzNSAgY29udGFpbmVyZC0yLjIuNi1nbzIudGFyLmd6Citz
aGEyNTYgIGZjZmYyMDk2ZWYyMGYxYmMxZDkzOWJjNTVhOGI4MzFlYTNlZmFjZTU3NDQ2M2ZkN2Rj
NzcwYjMzZmZlMzE3YjIgIGNvbnRhaW5lcmQtMi4zLjMtZ28yLnRhci5negogc2hhMjU2ICA0YmJl
M2I4ODVlOGNkMTkwN2FiNGNmOWE0MWU4NjJlNzRlMjRiNTQyMjI5N2E0ZjJmZTUyNGU2YTMwYWRh
MmI0ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5t
ayBiL3BhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLm1rCmluZGV4IDAxNjIwZWIxNDcuLjZj
Yjg0MTQyOTcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLm1rCisr
KyBiL3BhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLm1rCkBAIC00LDcgKzQsNyBAQAogIwog
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotQ09OVEFJTkVSRF9WRVJTSU9OID0gMi4yLjYKK0NP
TlRBSU5FUkRfVkVSU0lPTiA9IDIuMy4zCiBDT05UQUlORVJEX1NJVEUgPSAkKGNhbGwgZ2l0aHVi
LGNvbnRhaW5lcmQsY29udGFpbmVyZCx2JChDT05UQUlORVJEX1ZFUlNJT04pKQogQ09OVEFJTkVS
RF9MSUNFTlNFID0gQXBhY2hlLTIuMAogQ09OVEFJTkVSRF9MSUNFTlNFX0ZJTEVTID0gTElDRU5T
RQotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
