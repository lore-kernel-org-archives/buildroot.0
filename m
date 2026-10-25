Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240ED606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XVeIFLQk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Jlibst0h
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0C31606A0;
	Sun, 25 Oct 2026 22:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sO50i2PQcuVH; Sun, 25 Oct 2026 22:13:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2E0A060645
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966388;
	b=pFsyK9p94/b8OjO7gpZ10JQAgSH0MtFy4DiyXHR2N/imfnVsdZnyrEXMtFHRPKtvC7il
	 bGGIOAYugsKneVZY/SgbxwC6k3wlePfKrZhJ3sGFO2RdwkrkOZmW8XbkgHcWOwQZ+KzF7
	 LG4DKBkuc8qp/gsJnhm1xsrEP+uh5ZrpdMK8kPnCw9npzszWtHhO1k45fFzZYUoR2kCbT
	 ZW9e4s9xU50o3Cy/yMqpgfhmypUjRyMcx53ypANneZgHKQxnV4D7zOugPHc+CMPctUMxJ
	 3WuFaSsvUxxVbWoQnuzwmJ7D7kz/OTyIutScfHeLY1dp5kAd9B0BsRVDA4Jgzt6vGPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966388;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cvMPq6LPKld7WLExIVEBerh9ISDl+BwH11LyN1A+EHE=;
	b=ZkBMocDExYzE0yru7a2hkKwpmxmXsc9wGNcjQnGZ196dz4wox1uolkK1F5s7pdtsS1yi
	 csKnIBerbjjXqM9i+BPlM6CKooii7OCNDEZX9Pqzkypn3hRO1cKuiBPaVE3y0EyzUnvYX
	 Gzy4v6ks8dUSaKFnxvq5c23CJBGZwNkYUb4Nmth3elfbUfXwRufnFWLzB66vxvab00/C4
	 yDTxqOjCzKISTeABQ1HamDnUQ6uhBpGp+vzP+ND++FsNJauZt1P9insH4oJIljTfwwwhe
	 fVmZdYAyuqHLE2ey+E9vaoNt3YGXmrDtNJacdxcFIT4FQptMzQaTrqAN3qC+9MhUh/w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Jlibst0h;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966388;
	bh=cvMPq6LPKld7WLExIVEBerh9ISDl+BwH11LyN1A+EHE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XVeIFLQkCWkCvv6IXHcYauivxGSM8qOodggCgRxHf+fpz2rD0ABi7EfcG3rVHVByy
	 JJ8klE+ZVP64Dp2IcDvgdTOoaMzZ0NoENtXS1mJ1stIMsGr8RsPSe+uXqd6weSnpyP
	 0/BkkfOlvj+3lhbULWZGjmEK56baXMIcQ2xaJ/nY9vVjWYzbj98GakgVEq0kHqz8xk
	 i4Igz7XaC6cEBVobbUZXjbYqnUVNt9rOUx+TdKTsNUhdPOEPVt+ThR+hb4nI5ewsku
	 ov1gWmiOAZKRb71RdrQ53WzBUKk1IjeAZb5WbuJ0EqWjtR1XjgX5P48HJ0roHwH2FI
	 xCcvNmRGkga7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E0A060645;
	Sun, 25 Oct 2026 22:13:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02369279
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC31B60645
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEVohsoWFAZP for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:13:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F0BCB60626
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966385;
 b=tVIXKKx5Rd2qIMkv1Gtd64A/NCYg+VieAA1Y0MTROTjUBv9rQtb/06fLAlTRLW6y8qVO
 74dVv3YCbzwjTBE8GL+B2zkVfIyb5Ca1j05Clc3Tw5e5iOvJIhPofp6PT5B+ngIAsZuiz
 9mNvscvW0xQaMX2dALWiUjGkjlUw63p5f1/C1BmKju9x+easykSWW0TSIQtNgLHwVdZ0Y
 oA+6rrqC8ZUD7nmLmRQdrZYzGZSjTo18D2bCFb5Xjv9YNPz4fi9Of2z/7TUGBBRlVKtxT
 wtV6qY49GMZ9qAPtsX1sPX4OpzkK/jABR270y07zQ2IS7jYOcJ9JBdslNRdomWK/9Og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966385;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=hV8yhnXHmXWDomLORnD/kRFqVsSUR7SmerHA1M1hpjc=;
 b=BKLgDdLjblxOlmQqChjbCXMYaXI4OMcq00RvRKG1jVSz8JpqzEre8kDzjoqV3J3OhfcL
 RmiDJzsn4cDRenGQB8v7WOUHIK8zJ6sdqyHk+CqALavoB7sENj6l9V6hc6OfosCLNcZqo
 plq4r9jcEwlY7yJ+toV9vyUj+ktU1Sf/Ekt4Ct1a7S3rWsVxEgv0bBXcc2C7pz1i3PljW
 tDClQn1dQniwgRwIYMDr+pUfaONKdQSRjbKpfzcxoso+kcZtKEZ5iZHAVHSPDcutiXo6m
 1V1aEgFmteR/pjWj58jfmh4ktIdlViUacMSALJJAbXmbyLfGKVSjJDUazykNj7NSRSQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Jlibst0h; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Jlibst0h
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0BCB60626
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966086;
 bh=hV8yhnXHmXWDomLORnD/kRFqVsSUR7SmerHA1M1hpjc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Jlibst0hwIkgD+/2qoMt59Z3kKd/GfPOubK7bp7Uk0fKq4ooZndopLB/GGhM2u3+0
 JATvXn27O/ynvhOoRc9Bcry01SBQ3JsLxVjXfkHV9OnK1+Eeef4iqW39ZRxZxebf/j
 3zFNT52EqdjK5QhWlYU89mfmqXmLuTA5c4CstCqpOOzYyxsijZqyQa8uMQx+fQVsKY
 A7cJWEnSOKRTjz0PUywyCsnj7eeI9r1KzualRLYmEVHjpd99vUnGTmzhNQSCrAoBF7
 TKh57VonI+fG+opG3Z0+ra91v4x9+kiaBi8Oj2XrbpOmMmYsGHItEHbSm8JXcIWDL+
 e5VApfDeoKFaA==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 9qoKC0kK0yE1sFDRwd7sJ4MM+4kiDjtAyWqG6OpQEYbKuKOEMFBnuJAwppDd85jIqiMyzjeDouJ
 bfT7R/erbXXPzHnWRw6w7Mgb7efIhGPJN1TGNTfKtAvK+tPmDMO0+EVYaThLU6ieaL+LzMJvp4/
 Z4Rv7twUcbE+MZIW1exOFQOaw+kjvmmhcy3NqAHnDlSz06T7P6kSvXabdloVSar3BdDV5cwO/uU
 xBmTeChYmt4qqa08MPd0AWVhLVQteeHdOSNRPFA+DroVgCNnnBD7Ma0coAhvFBclMv7TAksxeAl
 bk3BnleSUY6ITK0xKLWpViwNdaHG+ntM72/UPhMylbi8rQpI/HCa7M4hE3hFP8R6Dx0ScYpuBaW
 7NT+xDnvsLGGan3Rh1ceRb85S/NrOncPws97EOrF3Ne51He5s8sPj3kli/1jryYaETlaQa6GmGy
 rB/qDTj470EmxTmpluu+FKP9NttY/PjWuHIUhA5cl4XMSqNjBJlWTpRrguXUj9cD8RHY2CHJ6+6
 TJ0a7bGOXRaxZTzhJreLq2fJxzKP/bZddb6x/XXU2Ulx7lD7UzCsg+sxUDQ3Oey9wWr28x9uEQw
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80DD2A4C6AAB;
 Sun, 25 Oct 2026 23:08:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NE-000000001fP-39sr;
 Sun, 25 Oct 2026 22:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:16 +0100
Message-ID: <20261025220723.1332924-28-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 27/34] package/docker-engine: bump version to
 v29.7.2
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKUmVsZWFzZSBub3RlczoKKiBo
dHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjk3MgoKU2ln
bmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvZG9ja2VyLWVuZ2lu
ZS9kb2NrZXItZW5naW5lLmhhc2ggfCAyICstCiBwYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2Vy
LWVuZ2luZS5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1l
bmdpbmUuaGFzaCBiL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLmhhc2gKaW5k
ZXggYjFhYzVjZDVkZS4uMGEyMWU4YTk5OSAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5n
aW5lL2RvY2tlci1lbmdpbmUuaGFzaAorKysgYi9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2Vy
LWVuZ2luZS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1
NiAgOGI2NGFmYjc1NjIzNDdkMmNlOWYxMDI3ZTMyNmNlOWE0NWM4ZjQxYTQ4NjEwNmNlMjAzNGY3
ZWIxYWJlMGUwZiAgZG9ja2VyLWVuZ2luZS0yOS42LjItZ28yLnRhci5negorc2hhMjU2ICAzYTkz
YTg4YmZmNDFmZmE2ZjRkY2E5ZjRlZDlmYzA1ZTdmZGIwOGUwZjkwMTRjZjFkODE3N2Y4NWVjYmMw
NjgzICBkb2NrZXItZW5naW5lLTI5LjcuMi1nbzIudGFyLmd6CiBzaGEyNTYgIDdjODc4NzMyOTFm
Mjg5NzEzYWM1ZGY0OGIxZjIwMTBlYjY5NjM3NTJiYmQ2YjUzMDQxNmFiOTlmYzM3OTE0YTggIExJ
Q0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLm1r
IGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKaW5kZXggZmE3OGE5NmFi
Yy4uYjFlMWEzNDU3OCAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1l
bmdpbmUubWsKKysrIGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKQEAg
LTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1ET0NLRVJfRU5HSU5F
X1ZFUlNJT04gPSAyOS42LjIKK0RPQ0tFUl9FTkdJTkVfVkVSU0lPTiA9IDI5LjcuMgogRE9DS0VS
X0VOR0lORV9TSVRFID0gJChjYWxsIGdpdGh1Yixtb2J5LG1vYnksZG9ja2VyLXYkKERPQ0tFUl9F
TkdJTkVfVkVSU0lPTikpCiAKIERPQ0tFUl9FTkdJTkVfTElDRU5TRSA9IEFwYWNoZS0yLjAKLS0g
CjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
