Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEF4606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=s84s2clr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=iehLetoD
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29C6660640;
	Sun, 25 Oct 2026 22:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIBOxLr8xWwR; Sun, 25 Oct 2026 22:10:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 451BC60613
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966203;
	b=Pvt2MEwjY89seXS/zuNvce1XdBNQ2cawPmP+rUhGDPLBCCtnxXy1Dk52dGhyVJEffsKQ
	 EJfBeT/Sxk6CkfCwcXEuizAxXc1IFj/T0nvHG2itBG0i04iavEVJ8M02FjIX6v7Mzfh3C
	 bVO6AzLfKzO2nTz6JOXtF2GKAjBhO1KyMcKFc7lpm/9ZyNrorp/0eKiI28GYtX252d10B
	 3piiz+c8gVJ/kw2KHGGBunOEZfOqM4WVlS/JF9XeO0uIvMM+sK2MHTKT5PMR2eIPyQRH2
	 t7294zHN3wBqNMj5UZpJIzPq63yN12pgFr0xVVavaNnKUoIGjUs29LJn4Rq6yij4nMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966203;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=X00aXgbi3Y90/pl7o2vlxnYM7n04mwga9zUwgQC0r+w=;
	b=hXc2fqhuEPeOZRRhaFR1nSErgUDrw1g4J4FBZQWJclOAJp69qyn4KwD/1qs4mCNCu/sA
	 ztTIwfmAfcN7pSI4AL5Cz5FLeBXSUjYgEXyG3NeIB3mIZ3WXu2+pG+AjC2trTrO0qwIem
	 /y8l/JDfo/qkUfT4qhqvhAs8r0zisXUlLXeECYjGOniUp2MYZFqqsNz+h1qNskli3Kyyx
	 TDX9t55ajbOfaW0aWyq75vcQJ/b6ztWk51KO1x2+k4ac3KMCl6qWy8X1uBXxl/epW3GzZ
	 eQ2JmH/TKCYJc9HyrIBE/IygoCB/6Co/HaWyEm/pD6+inBpipTPK1+W313Xqn8zIqkQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966203;
	bh=X00aXgbi3Y90/pl7o2vlxnYM7n04mwga9zUwgQC0r+w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s84s2clroxaVT4ekTVHC35ffcjtwWAXI+BpRPzr1Z7hGYftZgNuuFN/myYYec7XG3
	 m2QnoSfWh0E0ho+uEi4uETdWwiUqvez20ljk/huKmkQeQLZeG7Hut3I6zuTXroKoFT
	 qZ31YZdKK+EfCL79Y3tgGTKhnmuU8bXECcm9yVruHeSe40qzs7vZ6jwudWQfrwY0nq
	 lUfZphRJExfL23/7/1qiuiCvBaNLjK+Aa6HShWO0qlAqBpyDX0qvMIKqAZIOVxB/vF
	 4ZuMTDX/hd+9tBfpoHLO1McwzMxCgk6hOFhTuWr7zOlJPLERE9mhUo/116MSNh2zZQ
	 LQgFjkUxuJ6VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 451BC60613;
	Sun, 25 Oct 2026 22:10:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA27A334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABF614009C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yVNU49TTUM8 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:10:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9D8F840057
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966202;
 b=M5ZYrFK0W4q1Xqvon5dY2IvgUIuNnYIL/knwLTufP5tbRnF4yl/zCUVO2ZlMvzRn+anz
 +wBWNRVpkLP7pkYeTd61ixPCdA1Unx04YR7okCOMIt4Y9T2demj5B4W8Rswxv/F5Hneqn
 CTMWfeYWRIOOqOiKgjRHXuUQTlOvADuIqJJQOkeJD9IL+iPKY4ErSH9t5gVexKCQilOv2
 2uU9g2yy5nW3k/KTAq+itiDI4iCTupa4+P+H0d0Pf617TNL9BOMhiv3MsGHOQZtPC+87J
 yD5j0ldZixLzoT6r6A+5H18vdqJoElu3GgbQhtyJXJxLno4qUPukZgLPhrAJjqj/5AA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966202;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=AWB/X1Hc+x0NysjfKYAL5t7RFEnQoleivPR+5ktiVzY=;
 b=gXHnRD+9AwSca5rQSUdioJuEVicQi4v3DKN+OXWAC5yLwOZoWKOp8PjNqSC9/xuW+yGD
 PIkn1J6iK5wfPJdjlcM9nLHGvJfr7pqtLOj5vdCQhvxu/dw4Jt4XNx8dw7tN4vY6ad9Os
 u5A6P9gati5wJ4LHCbOthzuHrnytMiEH/5hTumkLi8tX8mxywVlWd91acLm/K3tSG/t6G
 jeWqG1UW4q5DV9HGv4n1ApAFG3YU8u8+EqUUg35+C2a4cK73q01w1C5uOhvDmB/LQehWu
 0rIRR1jK/a/iCfBgVuH8S47OFq1R0pyIJp+3meQbRc8o2pi4g3D1YK42E/gR+1OjIfw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=iehLetoD; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=iehLetoD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D8F840057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966083;
 bh=AWB/X1Hc+x0NysjfKYAL5t7RFEnQoleivPR+5ktiVzY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=iehLetoDr4vtdtdBbhffBpjYB1r5qtGWZV78lNTy16Kji0bCfwwOJtMm+r5th5/Tw
 1R8EtSyZd8VAaEDdLJh5pkQ4HK8EWMIKX1FBLg1eeK/nmQ6l6qPJ3+6ZBKWtF+FleM
 lZmY+keHSGnj1Ka4KHCW0XdrCITTyI93a0OUbeR7lb9NT0oTMyOe11l4WqfdT8gLnd
 Xf3nwK8IsOqCDp7O6wb8x5Vw9JzcFXwCMrnJ1q4uuqEUGVici9anmQVHVZTCVWI1YL
 brb9UnVQTMIIYCdwIsRe/Q8K7UFTl3Z3tTRTw3fsy4or3ehYVHcuW2X1f7ffharABI
 s6djZrvvMY2bg==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 22s0I84DJPqOwdl+lGGy7lwlt0F+LLisVRX1Ohp3MK6upNP1pI6UzWv2E51ud9K+HYWBAz6Ued7
 pxGrg1PXLgujeFfiEKl0ASPDQ104MLpwGBN+0NDf4FFyRoZPmYNkQGrnLjm8EZOkCLsMWQjug6W
 MYWqt88ie4j7R0Ndo9SzZ4IEG0ZuTBr6OPYMtQJ4zivoEtLZV+B0DMubYWosBonRZ9rmkkaknuE
 JwkU77DlpkiwI20UdLgSIeLImJQA1FmGyA7uF0DiTC8OeKlyS92WnQ+Mb8nF8YR2K5IoueQB6rn
 LNu51cLIYJf7iR7OilfJiVvjNWN1WjWwLb6lxH+wz6HweYJFwXQot2MusS/re0h8RIOU2jRn2ke
 36eT19aMw6JSxmelzI1Hndzt1UJ3hE3HdfctpMIe9ebsyJseKxG+mRaTdmlu7s3q103hIJaoLXg
 JhfDVJSAcE0P5eAdgXn5AwLwB+EVuG7PJZkjSrriIZnJ9yrcMV8oTYrzpBMn/K/7NuxBjvM4KRO
 xTniaiiwC7Dm9KznFja80aNbSA1oLGu4K37RrlWnoz9bEzLkjywmDUsVPOjMtm8aHttJOW6OEwV
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E560CA4C6A5B;
 Sun, 25 Oct 2026 23:08:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6ND-000000001fP-2sOi;
 Sun, 25 Oct 2026 22:07:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:01 +0100
Message-ID: <20261025220723.1332924-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 12/34] package/docker-cli: bump version to
 v29.2.1
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKUmVsZWFzZSBub3RlczoKKiBo
dHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjkyMQoKU2ln
bmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvZG9ja2VyLWNsaS9k
b2NrZXItY2xpLmhhc2ggfCAyICstCiBwYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5tayAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaCBiL3BhY2th
Z2UvZG9ja2VyLWNsaS9kb2NrZXItY2xpLmhhc2gKaW5kZXggODg3YTg5MmI4OC4uYzY0YTBmMmE1
ZCAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaAorKysgYi9w
YWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2Nh
bGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgZmEzYmExODVkZjRmMTlkMzVkMzU0OTYyZGVkMjUyY2Q1
YmJkMTlkNzk1ZDcyMDdjMGVkZGNiMTM3MmE3MDc3OSAgZG9ja2VyLWNsaS0yOS4xLjMtZ28yLnRh
ci5negorc2hhMjU2ICAzM2E1YzkyMTk4YTJlNTdhNjAxMmM2Zjc5MzhkNjljNzJhZGY3NTE1ODRi
YzBjOThkOGQ5MWU1NTViMWM4ZjBhICBkb2NrZXItY2xpLTI5LjIuMS1nbzIudGFyLmd6CiBzaGEy
NTYgIDJkODFlYTA2MDgyNTAwNmZjOGYzZmUyOGFhNWRjMGZmZWI4MGZhZjMyNWI2MTJjOTU1MjI5
MTU3YjhjMTBkYzAgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9ja2VyLWNsaS9kb2Nr
ZXItY2xpLm1rIGIvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsKaW5kZXggNzNhM2I5
MzkwYi4uNTJlMGU2MTE3NiAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1j
bGkubWsKKysrIGIvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsKQEAgLTQsNyArNCw3
IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1ET0NLRVJfQ0xJX1ZFUlNJT04gPSAy
OS4xLjMKK0RPQ0tFUl9DTElfVkVSU0lPTiA9IDI5LjIuMQogRE9DS0VSX0NMSV9TSVRFID0gJChj
YWxsIGdpdGh1Yixkb2NrZXIsY2xpLHYkKERPQ0tFUl9DTElfVkVSU0lPTikpCiAKIERPQ0tFUl9D
TElfTElDRU5TRSA9IEFwYWNoZS0yLjAKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
